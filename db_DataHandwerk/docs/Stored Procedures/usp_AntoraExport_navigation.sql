﻿/*
code of this procedure is managed in the dhw repository. Do not modify manually.
Use [uspgenerator].[GeneratorUsp], [uspgenerator].[GeneratorUspParameter], [uspgenerator].[GeneratorUspStep], [uspgenerator].[GeneratorUsp_SqlUsp]
*/
CREATE   PROCEDURE [docs].[usp_AntoraExport_navigation]
@isTrustedConnection BIT = 1 /* specify whether you are connecting to the SQL instance with a trusted connection (Windows Authentication) or not */
,@userName NVARCHAR(250) = 'loginName' /* If isTrustedConnection is set to 0 then you will need to add username and password for connecting to the SQL Server instance */
,@password NVARCHAR(250) = 'password'
,
----keep the code between logging parameters and "START" unchanged!
---- parameters, used for logging; you don't need to care about them, but you can use them, wenn calling from SSIS or in your workflow to log the context of the procedure call
  @execution_instance_guid UNIQUEIDENTIFIER = NULL --SSIS system variable ExecutionInstanceGUID could be used, any other unique guid is also fine. If NULL, then NEWID() is used to create one
, @ssis_execution_id BIGINT = NULL --only SSIS system variable ServerExecutionID should be used, or any other consistent number system, do not mix different number systems
, @sub_execution_id INT = NULL --in case you log some sub_executions, for example in SSIS loops or sub packages
, @parent_execution_log_id BIGINT = NULL --in case a sup procedure is called, the @current_execution_log_id of the parent procedure should be propagated here. It allowes call stack analyzing
AS
BEGIN
DECLARE
 --
   @current_execution_log_id BIGINT --this variable should be filled only once per procedure call, it contains the first logging call for the step 'start'.
 , @current_execution_guid UNIQUEIDENTIFIER = NEWID() --a unique guid for any procedure call. It should be propagated to sub procedures using "@parent_execution_log_id = @current_execution_log_id"
 , @source_object NVARCHAR(261) = NULL --use it like '[schema].[object]', this allows data flow vizualizatiuon (include square brackets)
 , @target_object NVARCHAR(261) = NULL --use it like '[schema].[object]', this allows data flow vizualizatiuon (include square brackets)
 , @proc_id INT = @@procid
 , @proc_schema_name NVARCHAR(128) = OBJECT_SCHEMA_NAME(@@procid) --schema ande name of the current procedure should be automatically logged
 , @proc_name NVARCHAR(128) = OBJECT_NAME(@@procid)               --schema ande name of the current procedure should be automatically logged
 , @event_info NVARCHAR(MAX)
 , @step_id INT = 0
 , @step_name NVARCHAR(1000) = NULL
 , @rows INT

--[event_info] get's only the information about the "outer" calling process
--wenn the procedure calls sub procedures, the [event_info] will not change
SET @event_info = (
  SELECT TOP 1 [event_info]
  FROM sys.dm_exec_input_buffer(@@spid, CURRENT_REQUEST_ID())
  ORDER BY [event_info]
  )

IF @execution_instance_guid IS NULL
 SET @execution_instance_guid = NEWID();
--
--SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = 'start'
SET @source_object = NULL
SET @target_object = NULL

EXEC logs.usp_ExecutionLog_insert
 --these parameters should be the same for all logging execution
   @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @parent_execution_log_id
 , @current_execution_guid = @current_execution_guid
 , @proc_id = @proc_id
 , @proc_schema_name = @proc_schema_name
 , @proc_name = @proc_name
 , @event_info = @event_info
 --the following parameters are individual for each call
 , @step_id = @step_id --@step_id should be incremented before each call
 , @step_name = @step_name --assign individual step names for each call
 --only the "start" step should return the log id into @current_execution_log_id
 --all other calls should not overwrite @current_execution_log_id
 , @execution_log_id = @current_execution_log_id OUTPUT
----you can log the content of your own parameters, do this only in the start-step
----data type is sql_variant
 , @parameter_01 = @isTrustedConnection
 , @parameter_02 = @userName
 , @parameter_03 = @password
--
PRINT '[docs].[usp_AntoraExport_navigation]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":110,"Name":"configure database connection","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":0}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',28,';',110,';',NULL);

DECLARE @instanceName NVARCHAR(500) = @@servername --example: 'ACER-F17\SQL2019', '.\SQL2019', localhost\SQL2019
DECLARE @databaseName NVARCHAR(128) = DB_NAME()
DECLARE @TrustedUserPassword NVARCHAR(1000)

IF @isTrustedConnection = 1
 SET @TrustedUserPassword = ' -T'
ELSE
 SET @TrustedUserPassword = ' -U ' + @userName + ' -P ' + @password

/*{"ReportUspStep":[{"Number":210,"Name":"declare variables","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":0}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',28,';',210,';',NULL);

DECLARE @schema_name NVARCHAR(128)
DECLARE @type varchar(2)
DECLARE @command NVARCHAR(4000)
DECLARE @cultures_name NVARCHAR(10)


/*{"ReportUspStep":[{"Number":410,"Name":"export FROM [docs].[AntoraNavListRepoObject_by_schema]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[docs].[AntoraNavListRepoObject_by_schema]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',28,';',410,';',NULL);

Declare page_cursor Cursor Local Fast_Forward For
Select
    cultures_name
  , RepoObject_schema_name
From
    docs.AntoraNavListRepoObject_by_schema
Order By
    cultures_name
  , RepoObject_schema_name

Open page_cursor

Fetch Next From page_cursor
Into
    @cultures_name
  , @schema_name

While @@Fetch_Status = 0
Begin
    Set @command
        = 'bcp "SELECT [nav_list] FROM [docs].[AntoraNavListRepoObject_by_schema] WHERE [RepoObject_schema_name] = '''
          + @schema_name
          --
          + ''' AND cultures_name = ''' + @cultures_name
          --
          + '''" queryout "'
          --
          + docs.fs_AntoraModuleFolder ( @cultures_name )
          + '\partials\navlist\' + 'navlist-schema-' + docs.fs_cleanStringForFilename ( @schema_name ) + '.adoc"'
          --
          + ' -S ' + @instanceName
          --
          + ' -d ' + @databaseName
          --
          + ' -c -C 65001'
          --
          + @TrustedUserPassword

    Print @command

    --Execute the BCP command
    Exec sys.xp_cmdshell @command, no_output

    Fetch Next From page_cursor
    Into
        @cultures_name
      , @schema_name
End

Close page_cursor
Deallocate page_cursor

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'export FROM [docs].[AntoraNavListRepoObject_by_schema]'
SET @source_object = '[docs].[AntoraNavListRepoObject_by_schema]'
SET @target_object = NULL

EXEC logs.usp_ExecutionLog_insert 
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @parent_execution_log_id
 , @current_execution_guid = @current_execution_guid
 , @proc_id = @proc_id
 , @proc_schema_name = @proc_schema_name
 , @proc_name = @proc_name
 , @event_info = @event_info
 , @step_id = @step_id
 , @step_name = @step_name
 , @source_object = @source_object
 , @target_object = @target_object
 , @updated = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":420,"Name":"export FROM [docs].[AntoraNavListRepoObject_by_type]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[docs].[AntoraNavListRepoObject_by_type]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',28,';',420,';',NULL);

Declare page_cursor Cursor Local Fast_Forward For
Select
    cultures_name
  , Trim ( type )
From
    docs.AntoraNavListRepoObject_by_type
Order By
    cultures_name
  , type

Open page_cursor

Fetch Next From page_cursor
Into
    @cultures_name
  , @type

While @@Fetch_Status = 0
Begin
    Set @command
        = 'bcp "SELECT [nav_list] FROM [docs].[AntoraNavListRepoObject_by_type] WHERE [type] = ''' + @type
          --
          + ''' AND cultures_name = ''' + @cultures_name
          --
          + '''" queryout "'
          --
          + docs.fs_AntoraModuleFolder ( @cultures_name )
          + '\partials\navlist\' + 'navlist-type-' + docs.fs_cleanStringForFilename ( @type ) + '.adoc"'
          --
          + ' -S ' + @instanceName
          --
          + ' -d ' + @databaseName
          --
          + ' -c -C 65001'
          --
          + @TrustedUserPassword

    Print @command

    --Execute the BCP command
    Exec sys.xp_cmdshell @command, no_output

    Fetch Next From page_cursor
    Into
        @cultures_name
      , @type
End

Close page_cursor
Deallocate page_cursor

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'export FROM [docs].[AntoraNavListRepoObject_by_type]'
SET @source_object = '[docs].[AntoraNavListRepoObject_by_type]'
SET @target_object = NULL

EXEC logs.usp_ExecutionLog_insert 
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @parent_execution_log_id
 , @current_execution_guid = @current_execution_guid
 , @proc_id = @proc_id
 , @proc_schema_name = @proc_schema_name
 , @proc_name = @proc_name
 , @event_info = @event_info
 , @step_id = @step_id
 , @step_name = @step_name
 , @source_object = @source_object
 , @target_object = @target_object
 , @updated = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":430,"Name":"export FROM [docs].[AntoraNavListRepoObject_by_schema_type]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[docs].[AntoraNavListRepoObject_by_schema_type]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',28,';',430,';',NULL);

Declare page_cursor Cursor Local Fast_Forward For
Select
    cultures_name
  , RepoObject_schema_name
  , Trim ( type )
From
    docs.AntoraNavListRepoObject_by_schema_type
Order By
    cultures_name
  , type

Open page_cursor

Fetch Next From page_cursor
Into
    @cultures_name
  , @schema_name
  , @type

While @@Fetch_Status = 0
Begin
    Set @command
        = 'bcp "SELECT [nav_list] FROM [docs].[AntoraNavListRepoObject_by_schema_type] WHERE [RepoObject_schema_name] = '''
          + @schema_name
          --
          + ''' AND [type] = ''' + @type
          --
          + ''' AND cultures_name = ''' + @cultures_name
          --
          + '''" queryout "'
          --
          + docs.fs_AntoraModuleFolder ( @cultures_name )
          + '\partials\navlist\' + 'navlist-schema-type-' + docs.fs_cleanStringForFilename ( @schema_name ) + '-' + docs.fs_cleanStringForFilename ( @type ) + '.adoc"'
          --
          + ' -S ' + @instanceName
          --
          + ' -d ' + @databaseName
          --
          + ' -c -C 65001'
          --
          + @TrustedUserPassword

    Print @command

    --Execute the BCP command
    Exec sys.xp_cmdshell @command, no_output

    Fetch Next From page_cursor
    Into
        @cultures_name
      , @schema_name
      , @type
End

Close page_cursor
Deallocate page_cursor

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'export FROM [docs].[AntoraNavListRepoObject_by_schema_type]'
SET @source_object = '[docs].[AntoraNavListRepoObject_by_schema_type]'
SET @target_object = NULL

EXEC logs.usp_ExecutionLog_insert 
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @parent_execution_log_id
 , @current_execution_guid = @current_execution_guid
 , @proc_id = @proc_id
 , @proc_schema_name = @proc_schema_name
 , @proc_name = @proc_name
 , @event_info = @event_info
 , @step_id = @step_id
 , @step_name = @step_name
 , @source_object = @source_object
 , @target_object = @target_object
 , @updated = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":510,"Name":"export FROM [docs].[AntoraNavListPage_by_schema]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[docs].[AntoraNavListPage_by_schema]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',28,';',510,';',NULL);

Declare page_cursor Cursor Local Fast_Forward For
Select
    cultures_name
  , RepoObject_schema_name
From
    docs.AntoraNavListRepoObject_by_schema
Order By
    cultures_name
  , RepoObject_schema_name

Open page_cursor

Fetch Next From page_cursor
Into
    @cultures_name
  , @schema_name

While @@Fetch_Status = 0
Begin
    Set @command
        = 'bcp "SELECT [nav_list] FROM [docs].[AntoraNavListPage_by_schema] WHERE [RepoObject_schema_name] = '''
          + @schema_name
          --
          + ''' AND cultures_name = ''' + @cultures_name
          --
          + '''" queryout "'
          --
          + docs.fs_AntoraModuleFolder ( @cultures_name )
          + '\pages\nav\' + 'nav-schema-' + docs.fs_cleanStringForFilename ( @schema_name ) + '.adoc"'
          --
          + ' -S ' + @instanceName
          --
          + ' -d ' + @databaseName
          --
          + ' -c -C 65001'
          --
          + @TrustedUserPassword

    Print @command

    --Execute the BCP command
    Exec sys.xp_cmdshell @command, no_output

    Fetch Next From page_cursor
    Into
        @cultures_name
      , @schema_name
End

Close page_cursor
Deallocate page_cursor

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'export FROM [docs].[AntoraNavListPage_by_schema]'
SET @source_object = '[docs].[AntoraNavListPage_by_schema]'
SET @target_object = NULL

EXEC logs.usp_ExecutionLog_insert 
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @parent_execution_log_id
 , @current_execution_guid = @current_execution_guid
 , @proc_id = @proc_id
 , @proc_schema_name = @proc_schema_name
 , @proc_name = @proc_name
 , @event_info = @event_info
 , @step_id = @step_id
 , @step_name = @step_name
 , @source_object = @source_object
 , @target_object = @target_object
 , @updated = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":520,"Name":"export FROM [docs].[AntoraNavListPage_by_type]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[docs].[AntoraNavListPage_by_type]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',28,';',520,';',NULL);

Declare page_cursor Cursor Local Fast_Forward For
Select
    cultures_name
  , T1.type
From
    docs.AntoraNavListPage_by_type As T1
  , docs.culture
Order By
    cultures_name
  , T1.type

Open page_cursor

Fetch Next From page_cursor
Into
    @cultures_name
  , @type

While @@Fetch_Status = 0
Begin
    Set @command
        = 'bcp "SELECT [nav_list] FROM [docs].[AntoraNavListPage_by_type] WHERE [type] = ''' + @type
          --
          + '''" queryout "'
          --
          + docs.fs_AntoraModuleFolder ( @cultures_name )
          + '\pages\nav\' + 'nav-type-' + docs.fs_cleanStringForFilename ( @type ) + '.adoc"'
          --
          + ' -S ' + @instanceName
          --
          + ' -d ' + @databaseName
          --
          + ' -c -C 65001'
          --
          + @TrustedUserPassword

    Print @command

    --Execute the BCP command
    Exec sys.xp_cmdshell @command, no_output

    Fetch Next From page_cursor
    Into
        @cultures_name
      , @type
End

Close page_cursor
Deallocate page_cursor

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'export FROM [docs].[AntoraNavListPage_by_type]'
SET @source_object = '[docs].[AntoraNavListPage_by_type]'
SET @target_object = NULL

EXEC logs.usp_ExecutionLog_insert 
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @parent_execution_log_id
 , @current_execution_guid = @current_execution_guid
 , @proc_id = @proc_id
 , @proc_schema_name = @proc_schema_name
 , @proc_name = @proc_name
 , @event_info = @event_info
 , @step_id = @step_id
 , @step_name = @step_name
 , @source_object = @source_object
 , @target_object = @target_object
 , @updated = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":610,"Name":"export partial_content FROM [docs].[AntoraPage_ObjectBySchema] and [docs].[AntoraPage_ObjectByType]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[docs].[AntoraPage_ObjectBySchema]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',28,';',610,';',NULL);

/*
--nav-by-schema.adoc

*/
Declare page_cursor Cursor Local Fast_Forward For
Select
    cultures_name
From
    docs.culture
Order By
    cultures_name

Open page_cursor

Fetch Next From page_cursor
Into
    @cultures_name

While @@Fetch_Status = 0
Begin
    Set @command
        = 'bcp "SELECT [partial_content] FROM [docs].[AntoraPage_ObjectBySchema]" '
          --
          + ' queryout "'
          --
          + docs.fs_AntoraModuleFolder ( @cultures_name )
          + '\partials\navlist\' + 'nav-by-schema.adoc"'
          --
          + ' -S ' + @instanceName
          --
          + ' -d ' + @databaseName
          --
          + ' -c -C 65001'
          --
          + @TrustedUserPassword

    Print @command

    --Execute the BCP command
    Exec sys.xp_cmdshell @command, no_output

    Set @command
        = 'bcp "SELECT [partial_content] FROM [docs].[AntoraPage_ObjectByType]" '
          --
          + ' queryout "'
          --
          + docs.fs_AntoraModuleFolder ( @cultures_name )
          + '\partials\navlist\' + 'nav-by-type.adoc"'
          --
          + ' -S ' + @instanceName
          --
          + ' -d ' + @databaseName
          --
          + ' -c -C 65001'
          --
          + @TrustedUserPassword

    Print @command

    --Execute the BCP command
    Exec sys.xp_cmdshell @command, no_output

    Set @command
        = 'bcp "SELECT [page_content] FROM [docs].[AntoraPage_ObjectBySchema]" '
          --
          + ' queryout "'
          --
          + docs.fs_AntoraModuleFolder ( @cultures_name )
          + '\pages\nav\' + 'objects-by-schema.adoc"'
          --
          + ' -S ' + @instanceName
          --
          + ' -d ' + @databaseName
          --
          + ' -c -C 65001'
          --
          + @TrustedUserPassword

    Print @command

    --Execute the BCP command
    Exec sys.xp_cmdshell @command, no_output

    Fetch Next From page_cursor
    Into
        @cultures_name
End

Close page_cursor
Deallocate page_cursor

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'export partial_content FROM [docs].[AntoraPage_ObjectBySchema] and [docs].[AntoraPage_ObjectByType]'
SET @source_object = '[docs].[AntoraPage_ObjectBySchema]'
SET @target_object = NULL

EXEC logs.usp_ExecutionLog_insert 
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @parent_execution_log_id
 , @current_execution_guid = @current_execution_guid
 , @proc_id = @proc_id
 , @proc_schema_name = @proc_schema_name
 , @proc_name = @proc_name
 , @event_info = @event_info
 , @step_id = @step_id
 , @step_name = @step_name
 , @source_object = @source_object
 , @target_object = @target_object
 , @updated = @rows
-- Logging END --

--
--finish your own code here
--keep the code between "END" and the end of the procedure unchanged!
--
--END
--
--SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'end'
SET @source_object = NULL
SET @target_object = NULL

EXEC logs.usp_ExecutionLog_insert
   @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @parent_execution_log_id
 , @current_execution_guid = @current_execution_guid
 , @proc_id = @proc_id
 , @proc_schema_name = @proc_schema_name
 , @proc_name = @proc_name
 , @event_info = @event_info
 , @step_id = @step_id
 , @step_name = @step_name
 , @source_object = @source_object
 , @target_object = @target_object

END
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9e8b79d5-b993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_navigation';


GO
EXECUTE sp_addextendedproperty @name = N'UspParameters', @value = N'@outputDirPartNav NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\navlist\'' */
,@outputDirPageNav NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\pages\nav\'' */
,@isTrustedConnection BIT = 1 /* specify whether you are connecting to the SQL instance with a trusted connection (Windows Authentication) or not */
,@userName NVARCHAR(250) = ''loginName'' /* If isTrustedConnection is set to 0 then you will need to add username and password for connecting to the SQL Server instance */
,@password NVARCHAR(250) = ''password''', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_navigation';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[fs_get_parameter_value]
* [configT].[type]
* [docs].[AntoraNavListRepoObject_by_schema]
* [docs].[AntoraNavListRepoObject_by_schema_type]
* [docs].[AntoraNavListRepoObject_by_type]
* [logs].[usp_ExecutionLog_insert]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_navigation';




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'https://antora.org/[Antora] uses https://docs.antora.org/antora/2.3/navigation/files-and-lists/[Navigation Files and Lists]. Content for these files is exported

* check and correct xref:config.Parameter.adoc#column-Parameter_value[config.Parameter.Parameter_value] for (''AntoraModuleFolder'', ''''), a possible parameter is
+
====
D:\Repos\GitHub\MyOrganisation\MyProject-docs\docs\modules
====

include::partial$docsnippet/antora-export-prerequisites.adoc[]
', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_navigation';










GO
EXECUTE sp_addextendedproperty @name = N'ExampleUsage', @value = N'EXEC [docs].[usp_AntoraExport_navigation]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_navigation';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.usp_AntoraExport.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_navigation';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.fs_get_parameter_value.adoc[]
* xref:configT.type.adoc[]
* xref:docs.AntoraNavListRepoObject_by_schema.adoc[]
* xref:docs.AntoraNavListRepoObject_by_schema_type.adoc[]
* xref:docs.AntoraNavListRepoObject_by_type.adoc[]
* xref:logs.usp_ExecutionLog_insert.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_navigation';


GO
EXECUTE sp_addextendedproperty @name = N'AdocUspSteps', @value = N'.Steps in [docs].[usp_AntoraExport_navigation]
[cols="d,15a,d"]
|===
|Number|Name (Action, Source, Target)|Parent

|110
|
*configure database connection*


|

|120
|
*configure outputDirs*


|

|210
|
*declare variables*


|

|410
|
*export FROM [docs].[AntoraNavListRepoObject_by_schema]*

* u
* [docs].[AntoraNavListRepoObject_by_schema]

|

|420
|
*export FROM [docs].[AntoraNavListRepoObject_by_type]*

* u
* [docs].[AntoraNavListRepoObject_by_type]

|

|430
|
*export FROM [docs].[AntoraNavListRepoObject_by_schema_type]*

* u
* [docs].[AntoraNavListRepoObject_by_schema_type]

|

|510
|
*export FROM [docs].[AntoraNavListPage_by_schema]*

* u
* [docs].[AntoraNavListPage_by_schema]

|

|520
|
*export FROM [docs].[AntoraNavListPage_by_type]*

* u
* [docs].[AntoraNavListPage_by_type]

|

|610
|
*export partial_content FROM [docs].[AntoraPage_ObjectBySchema]*

* u
* [docs].[AntoraPage_ObjectBySchema]


--nav-by-schema.adoc

|

|620
|
*export FROM [docs].[AntoraPage_ObjectByType]*

* u
* [docs].[AntoraPage_ObjectByType]


nav-by-type.adoc

|

|710
|
*export page_content FROM [docs].[AntoraPage_ObjectBySchema]*

* u
* [docs].[AntoraPage_ObjectBySchema]


--objects-by-schema.adoc

|
|===
', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_navigation';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_navigation';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_navigation';

