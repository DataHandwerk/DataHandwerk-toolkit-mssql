﻿/*
code of this procedure is managed in the dhw repository. Do not modify manually.
Use [uspgenerator].[GeneratorUsp], [uspgenerator].[GeneratorUspParameter], [uspgenerator].[GeneratorUspStep], [uspgenerator].[GeneratorUsp_SqlUsp]
*/
CREATE   PROCEDURE [docs].[usp_AntoraExport_ObjectPuml]
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
PRINT '[docs].[usp_AntoraExport_ObjectPuml]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":110,"Name":"configure database connection","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":0}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',32,';',110,';',NULL);

DECLARE @instanceName NVARCHAR(500) = @@servername --example: 'ACER-F17\SQL2019', '.\SQL2019', localhost\SQL2019
DECLARE @databaseName NVARCHAR(128) = DB_NAME()
DECLARE @TrustedUserPassword NVARCHAR(1000)

IF @isTrustedConnection = 1
 SET @TrustedUserPassword = ' -T'
ELSE
 SET @TrustedUserPassword = ' -U ' + @userName + ' -P ' + @password

/*{"ReportUspStep":[{"Number":210,"Name":"declare variables","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":0}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',32,';',210,';',NULL);

DECLARE @command NVARCHAR(4000)
DECLARE @cultures_name NVARCHAR(10)
DECLARE @Object_fullname2 NVARCHAR(257)
DECLARE @SchemaName NVARCHAR(128)

/*{"ReportUspStep":[{"Number":330,"Name":"[docs].[usp_PERSIST_RepoObject_Plantuml_Entity_T]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [docs].[usp_PERSIST_RepoObject_Plantuml_Entity_T]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":340,"Name":"[docs].[usp_PERSIST_RepoObject_Plantuml_T]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [docs].[usp_PERSIST_RepoObject_Plantuml_T]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":410,"Name":"export puml from [docs].[RepoObject_Plantuml_T]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[docs].[RepoObject_Plantuml_T]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',32,';',410,';',NULL);

Declare db_cursor Cursor Local Fast_Forward For
Select
    cultures_name
  , RepoObject_fullname2
From
    docs.RepoObject_OutputFilter
Where
    is_external = 0
Order By
    cultures_name
  , RepoObject_fullname

Open db_cursor

Fetch Next From db_cursor
Into
    @cultures_name
  , @Object_fullname2

While @@Fetch_Status = 0
Begin
    Set @command
        = 'bcp "SELECT [PlantumlEntity_1_1_ColRef] FROM [docs].[RepoObject_Plantuml_T] WITH (READUNCOMMITTED) where [RepoObject_fullname2] = '''
          --
          + @Object_fullname2
          --
          + ''' AND cultures_name = ''' + @cultures_name
          --
          + '''" queryout "'
          --
          + docs.fs_AntoraModuleFolder ( @cultures_name )
          + '\partials\puml\entity_1_1_colref\' + docs.fs_cleanStringForFilename ( @Object_fullname2 ) + '.puml"'
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
        = 'bcp "SELECT [PlantumlEntity_1_1_FkRef] FROM [docs].[RepoObject_Plantuml_T] WITH (READUNCOMMITTED) where [RepoObject_fullname2] = '''
          --
          + @Object_fullname2
          --
          + ''' AND cultures_name = ''' + @cultures_name
          --
          + '''" queryout "'
          --
          + docs.fs_AntoraModuleFolder ( @cultures_name )
          + '\partials\puml\entity_1_1_fk\' + docs.fs_cleanStringForFilename ( @Object_fullname2 ) + '.puml"'
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
        = 'bcp "SELECT [PlantumlEntity_1_1_ObjectRef] FROM [docs].[RepoObject_Plantuml_T] WITH (READUNCOMMITTED) where [RepoObject_fullname2] = '''
          --
          + @Object_fullname2
          --
          + ''' AND cultures_name = ''' + @cultures_name
          --
          + '''" queryout "'
          --
          + docs.fs_AntoraModuleFolder ( @cultures_name )
          + '\partials\puml\entity_1_1_objectref\' + docs.fs_cleanStringForFilename ( @Object_fullname2 ) + '.puml"'
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

    If
    (
        Select config.fs_get_parameter_value ( 'sync enable', 'dwh' )
    ) = 1
    Begin
        Set @command
            = 'bcp "SELECT [PlantumlEntity_0_30_ObjectRef] FROM [docs].[RepoObject_Plantuml_T] WITH (READUNCOMMITTED) where [RepoObject_fullname2] = '''
              --
              + @Object_fullname2
              --
              + ''' AND cultures_name = ''' + @cultures_name
              --
              + '''" queryout "'
              --
              + docs.fs_AntoraModuleFolder ( @cultures_name )
              + '\partials\puml\entity_0_30_objectref\' + docs.fs_cleanStringForFilename ( @Object_fullname2 ) + '.puml"'
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
            = 'bcp "SELECT [PlantumlEntity_30_0_ObjectRef] FROM [docs].[RepoObject_Plantuml_T] WITH (READUNCOMMITTED) where [RepoObject_fullname2] = '''
              --
              + @Object_fullname2
              --
              + ''' AND cultures_name = ''' + @cultures_name
              --
              + '''" queryout "'
              --
              + docs.fs_AntoraModuleFolder ( @cultures_name )
              + '\partials\puml\entity_30_0_objectref\' + docs.fs_cleanStringForFilename ( @Object_fullname2 ) + '.puml"'
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
    End

    Fetch Next From db_cursor
    Into
        @cultures_name
      , @Object_fullname2
End

Close db_cursor
Deallocate db_cursor

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'export puml from [docs].[RepoObject_Plantuml_T]'
SET @source_object = '[docs].[RepoObject_Plantuml_T]'
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

/*{"ReportUspStep":[{"Number":420,"Name":"export FROM [docs].[RepoObject_Plantuml_Entity_T]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[docs].[RepoObject_Plantuml_Entity_T]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',32,';',420,';',NULL);

Declare db_cursor Cursor Local Fast_Forward For
Select
    cultures_name
  , RepoObject_fullname2
From
    docs.RepoObject_OutputFilter
Where
    is_external = 0
Order By
    cultures_name
  , RepoObject_fullname

Open db_cursor

Fetch Next From db_cursor
Into
    @cultures_name
  , @Object_fullname2

While @@Fetch_Status = 0
Begin
    Set @command
        = 'bcp "SELECT docs.fs_PumlHeaderTopToBottom () + [RepoObject_Puml] FROM [docs].[RepoObject_Plantuml_Entity_T] WITH (READUNCOMMITTED) where [RepoObject_fullname2] = '''
          + @Object_fullname2
          --
          + ''' AND cultures_name = ''' + @cultures_name
          --
          + '''" queryout "'
          --
          + docs.fs_AntoraModuleFolder ( @cultures_name )
          + '\partials\puml\entity\' + docs.fs_cleanStringForFilename ( @Object_fullname2 ) + '.puml"'
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
        = 'bcp "SELECT docs.fs_PumlHeaderTopToBottom () + [RepoObject_PumlOnlyPK] FROM [docs].[RepoObject_Plantuml_Entity_T] WITH (READUNCOMMITTED) where [RepoObject_fullname2] = '''
          + @Object_fullname2
          --
          + ''' AND cultures_name = ''' + @cultures_name
          --
          + '''" queryout "'
          --
          + docs.fs_AntoraModuleFolder ( @cultures_name )
          + '\partials\puml\entity_pk\' + docs.fs_cleanStringForFilename ( @Object_fullname2 ) + '.puml"'
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
        = 'bcp "SELECT docs.fs_PumlHeaderTopToBottom () + [RepoObject_PumlOnlyPkOrIndex] FROM [docs].[RepoObject_Plantuml_Entity_T] WITH (READUNCOMMITTED) where [RepoObject_fullname2] = '''
          + @Object_fullname2
          --
          + ''' AND cultures_name = ''' + @cultures_name
          --
          + '''" queryout "'
          --
          + docs.fs_AntoraModuleFolder ( @cultures_name )
          + '\partials\puml\entity_pk_or_index\' + docs.fs_cleanStringForFilename ( @Object_fullname2 ) + '.puml"'
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
        = 'bcp "SELECT docs.fs_PumlHeaderTopToBottom () + [RepoObject_PumlOnlyPkOrNotHidden] FROM [docs].[RepoObject_Plantuml_Entity_T] WITH (READUNCOMMITTED) where [RepoObject_fullname2] = '''
          + @Object_fullname2
          --
          + ''' AND cultures_name = ''' + @cultures_name
          --
          + '''" queryout "'
          --
          + docs.fs_AntoraModuleFolder ( @cultures_name )
          + '\partials\puml\entity_pk_or_nothidden\' + docs.fs_cleanStringForFilename ( @Object_fullname2 ) + '.puml"'
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

    Fetch Next From db_cursor
    Into
        @cultures_name
      , @Object_fullname2
End

Close db_cursor
Deallocate db_cursor

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'export FROM [docs].[RepoObject_Plantuml_Entity_T]'
SET @source_object = '[docs].[RepoObject_Plantuml_Entity_T]'
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

/*{"ReportUspStep":[{"Number":425,"Name":"export FROM [docs].[Schema_puml] [PumlSchemaSsasEr]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[docs].[Schema_puml]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',32,';',425,';',NULL);

Declare db_cursor Cursor Local Fast_Forward For
Select
    cultures_name
  , RepoSchema_name
From
    docs.Schema_puml
Where
    is_ssas = 1
Order By
    cultures_name
  , RepoSchema_name

Open db_cursor

Fetch Next From db_cursor
Into
    @cultures_name
  , @SchemaName

While @@Fetch_Status = 0
Begin
    --Dynamically construct the BCP command
    --
    Set @command
        = 'bcp "SELECT [PumlSchemaSsasEr] FROM [docs].[Schema_puml] WITH (READUNCOMMITTED) where [RepoSchema_name] = '''
          --
          + @SchemaName
          --
          + ''' AND cultures_name = ''' + @cultures_name
          --
          + '''" queryout "'
          --
          + docs.fs_AntoraModuleFolder ( @cultures_name )
          + '\partials\puml\schema_ssas_er\' + docs.fs_cleanStringForFilename ( @SchemaName ) + '.puml"'
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

    Fetch Next From db_cursor
    Into
        @cultures_name
      , @SchemaName
End

Close db_cursor
Deallocate db_cursor

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'export FROM [docs].[Schema_puml] [PumlSchemaSsasEr]'
SET @source_object = '[docs].[Schema_puml]'
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
Go

--Execute sys_dwh.sp_addextendedproperty    @name = N'RepoObject_guid'
--  , @value = 'f40b29c2-e595-eb11-84f4-a81e8446d5b0'
--  , @level0type = N'SCHEMA'
--  , @level0name = N'docs'
--  , @level1type = N'PROCEDURE'
--  , @level1name = N'usp_AntoraExport_ObjectPuml';
--Go

--Execute sys_dwh.sp_addextendedproperty    @name = N'UspParameters'
--  , @value = N'@outputDir NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\entity_1_1_colref\ */
--,@outputDir2 NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\entity_1_1_objectref\ */
--,@outputDir3 NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\entity_1_1_fk\ */
--,@outputDir4 NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\entity_0_30_objectref\ */
--,@outputDir5 NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\entity_30_0_objectref\ */
--,@outputDir6 NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\schema_ssas_er\ */
--,@outputDir7 NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\schema_ssas_er\ */
--,@outputDir8 NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\schema_ssas_er\ */
--,@outputDir9 NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\schema_ssas_er\ */
--,@outputDir10 NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\schema_ssas_er\ */
--,@isTrustedConnection BIT = 1 /* specify whether you are connecting to the SQL instance with a trusted connection (Windows Authentication) or not */
--,@userName NVARCHAR(250) = ''loginName'' /* If isTrustedConnection is set to 0 then you will need to add username and password for connecting to the SQL Server instance */
--,@password NVARCHAR(250) = ''password'''
--  , @level0type = N'SCHEMA'
--  , @level0name = N'docs'
--  , @level1type = N'PROCEDURE'
--  , @level1name = N'usp_AntoraExport_ObjectPuml';
--Go

--Execute sys_dwh.sp_addextendedproperty    @name = N'ReferencedObjectList'
--  , @value = N'* [config].[fs_get_parameter_value]
--* [docs].[RepoObject_OutputFilter]
--* [docs].[usp_PERSIST_RepoObject_Plantuml_Entity_T]
--* [docs].[usp_PERSIST_RepoObject_Plantuml_T]
--* [logs].[usp_ExecutionLog_insert]
--* [repo].[RepoSchema]'
--  , @level0type = N'SCHEMA'
--  , @level0name = N'docs'
--  , @level1type = N'PROCEDURE'
--  , @level1name = N'usp_AntoraExport_ObjectPuml';
--Go

--Execute sys_dwh.sp_addextendedproperty    @name = N'MS_Description'
--  , @value = N'* the documentation contains diagrams. These diagrams are defined using https://plantuml.com/[plantUML]
--** export procedure: xref:docs.usp_AntoraExport_ObjectPuml.adoc[]
--** individual diagrams per object are exported into (AntoraModuleFolder)``/``(AntoraModuleName)``/partials/puml/``

--include::partial$docsnippet/antora-export-prerequisites.adoc[]'
--  , @level0type = N'SCHEMA'
--  , @level0name = N'docs'
--  , @level1type = N'PROCEDURE'
--  , @level1name = N'usp_AntoraExport_ObjectPuml';
--Go

--Execute sys_dwh.sp_addextendedproperty    @name = N'ExampleUsage'
--  , @value = N'EXEC [docs].[usp_AntoraExport_ObjectPuml]'
--  , @level0type = N'SCHEMA'
--  , @level0name = N'docs'
--  , @level1type = N'PROCEDURE'
--  , @level1name = N'usp_AntoraExport_ObjectPuml';
--Go

--Execute sys_dwh.sp_addextendedproperty    @name = N'AntoraReferencingList'
--  , @value = N'* xref:docs.usp_AntoraExport.adoc[]'
--  , @level0type = N'SCHEMA'
--  , @level0name = N'docs'
--  , @level1type = N'PROCEDURE'
--  , @level1name = N'usp_AntoraExport_ObjectPuml';
--Go

--Execute sys_dwh.sp_addextendedproperty    @name = N'AntoraReferencedList'
--  , @value = N'* xref:config.fs_get_parameter_value.adoc[]
--* xref:docs.RepoObject_OutputFilter.adoc[]
--* xref:docs.usp_PERSIST_RepoObject_Plantuml_Entity_T.adoc[]
--* xref:docs.usp_PERSIST_RepoObject_Plantuml_T.adoc[]
--* xref:logs.usp_ExecutionLog_insert.adoc[]
--* xref:repo.RepoSchema.adoc[]'
--  , @level0type = N'SCHEMA'
--  , @level0name = N'docs'
--  , @level1type = N'PROCEDURE'
--  , @level1name = N'usp_AntoraExport_ObjectPuml';
--Go

--Execute sys_dwh.sp_addextendedproperty    @name = N'AdocUspSteps'
--  , @value = N'.Steps in [docs].[usp_AntoraExport_ObjectPuml]
--[cols="d,15a,d"]
--|===
--|Number|Name (Action, Source, Target)|Parent

--|110
--|
--*configure database connection*


--|

--|120
--|
--*configure outputDirs*


--|

--|210
--|
--*declare variables*


--|

--|330
--|
--*[docs].[usp_PERSIST_RepoObject_Plantuml_Entity_T]*

--* `EXEC [docs].[usp_PERSIST_RepoObject_Plantuml_Entity_T]`

--|

--|340
--|
--*[docs].[usp_PERSIST_RepoObject_Plantuml_T]*

--* `EXEC [docs].[usp_PERSIST_RepoObject_Plantuml_T]`

--|

--|430
--|
--*export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_1_1_FkRef]*

--* u
--* [docs].[RepoObject_Plantuml_T]

--|

--|500
--|
--*(select config.fs_get_parameter_value ( ''sync enable'', ''dwh'' )) = 1*

--* `IF (select config.fs_get_parameter_value ( ''sync enable'', ''dwh'' )) = 1`

--|

--|510
--|
--*export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_0_30_ObjectRef]*

--* u
--* [docs].[RepoObject_Plantuml_T]

--|500

--|520
--|
--*export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_30_0_ObjectRef]*

--* u
--* [docs].[RepoObject_Plantuml_T]

--|510

--|530
--|
--*export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_1_1_ObjectRef]*

--* u
--* [docs].[RepoObject_Plantuml_T]

--|520

--|540
--|
--*export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_1_1_ColRef]*

--* u
--* [docs].[RepoObject_Plantuml_T]

--|530

--|610
--|
--*export FROM [docs].[Schema_puml] [PumlSchemaSsasEr]*

--* u
--* [docs].[Schema_puml]

--|

--|710
--|
--*export FROM [docs].[RepoObject_Plantuml_Entity_T] [RepoObject_Puml]*

--* u
--* [docs].[RepoObject_Plantuml_Entity_T]

--|

--|720
--|
--*export FROM [docs].[RepoObject_Plantuml_Entity_T] [RepoObject_PumlOnlyPK]*

--* u
--* [docs].[RepoObject_Plantuml_Entity_T]

--|

--|730
--|
--*export FROM [docs].[RepoObject_Plantuml_Entity_T] [RepoObject_PumlOnlyPkOrIndex]*

--* u
--* [docs].[RepoObject_Plantuml_Entity_T]

--|

--|740
--|
--*export FROM [docs].[RepoObject_Plantuml_Entity_T] [RepoObject_PumlOnlyPkOrNotHidden]*

--* u
--* [docs].[RepoObject_Plantuml_Entity_T]

--|
--|===
--'
--  , @level0type = N'SCHEMA'
--  , @level0name = N'docs'
--  , @level1type = N'PROCEDURE'
--  , @level1name = N'usp_AntoraExport_ObjectPuml';
--Go

--Execute sys_dwh.sp_addextendedproperty    @name = N'is_ssas'
--  , @value = N'0'
--  , @level0type = N'SCHEMA'
--  , @level0name = N'docs'
--  , @level1type = N'PROCEDURE'
--  , @level1name = N'usp_AntoraExport_ObjectPuml';
--Go

--Execute sys_dwh.sp_addextendedproperty    @name = N'is_repo_managed'
--  , @value = N'0'
--  , @level0type = N'SCHEMA'
--  , @level0name = N'docs'
--  , @level1type = N'PROCEDURE'
--  , @level1name = N'usp_AntoraExport_ObjectPuml';

GO
EXECUTE sp_addextendedproperty @name = N'UspParameters', @value = N'@outputDir NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\entity_1_1_colref\ */
,@outputDir2 NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\entity_1_1_objectref\ */
,@outputDir3 NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\entity_1_1_fk\ */
,@outputDir4 NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\entity_0_30_objectref\ */
,@outputDir5 NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\entity_30_0_objectref\ */
,@outputDir6 NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\schema_ssas_er\ */
,@outputDir7 NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\schema_ssas_er\ */
,@outputDir8 NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\schema_ssas_er\ */
,@outputDir9 NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\schema_ssas_er\ */
,@outputDir10 NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\schema_ssas_er\ */
,@isTrustedConnection BIT = 1 /* specify whether you are connecting to the SQL instance with a trusted connection (Windows Authentication) or not */
,@userName NVARCHAR(250) = ''loginName'' /* If isTrustedConnection is set to 0 then you will need to add username and password for connecting to the SQL Server instance */
,@password NVARCHAR(250) = ''password''', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPuml';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'f40b29c2-e595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPuml';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[fs_get_parameter_value]
* [docs].[RepoObject_OutputFilter]
* [docs].[usp_PERSIST_RepoObject_Plantuml_Entity_T]
* [docs].[usp_PERSIST_RepoObject_Plantuml_T]
* [logs].[usp_ExecutionLog_insert]
* [repo].[RepoSchema]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPuml';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'* the documentation contains diagrams. These diagrams are defined using https://plantuml.com/[plantUML]
** export procedure: xref:docs.usp_AntoraExport_ObjectPuml.adoc[]
** individual diagrams per object are exported into (AntoraModuleFolder)``/``(AntoraModuleName)``/partials/puml/``

include::partial$docsnippet/antora-export-prerequisites.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPuml';




GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPuml';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPuml';


GO
EXECUTE sp_addextendedproperty @name = N'ExampleUsage', @value = N'EXEC [docs].[usp_AntoraExport_ObjectPuml]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPuml';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.usp_AntoraExport.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPuml';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.fs_get_parameter_value.adoc[]
* xref:docs.RepoObject_OutputFilter.adoc[]
* xref:docs.usp_PERSIST_RepoObject_Plantuml_Entity_T.adoc[]
* xref:docs.usp_PERSIST_RepoObject_Plantuml_T.adoc[]
* xref:logs.usp_ExecutionLog_insert.adoc[]
* xref:repo.RepoSchema.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPuml';


GO
EXECUTE sp_addextendedproperty @name = N'AdocUspSteps', @value = N'.Steps in [docs].[usp_AntoraExport_ObjectPuml]
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

|330
|
*[docs].[usp_PERSIST_RepoObject_Plantuml_Entity_T]*

* `EXEC [docs].[usp_PERSIST_RepoObject_Plantuml_Entity_T]`

|

|340
|
*[docs].[usp_PERSIST_RepoObject_Plantuml_T]*

* `EXEC [docs].[usp_PERSIST_RepoObject_Plantuml_T]`

|

|430
|
*export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_1_1_FkRef]*

* u
* [docs].[RepoObject_Plantuml_T]

|

|500
|
*(select config.fs_get_parameter_value ( ''sync enable'', ''dwh'' )) = 1*

* `IF (select config.fs_get_parameter_value ( ''sync enable'', ''dwh'' )) = 1`

|

|510
|
*export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_0_30_ObjectRef]*

* u
* [docs].[RepoObject_Plantuml_T]

|500

|520
|
*export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_30_0_ObjectRef]*

* u
* [docs].[RepoObject_Plantuml_T]

|510

|530
|
*export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_1_1_ObjectRef]*

* u
* [docs].[RepoObject_Plantuml_T]

|520

|540
|
*export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_1_1_ColRef]*

* u
* [docs].[RepoObject_Plantuml_T]

|530

|610
|
*export FROM [docs].[Schema_puml] [PumlSchemaSsasEr]*

* u
* [docs].[Schema_puml]

|

|710
|
*export FROM [docs].[RepoObject_Plantuml_Entity_T] [RepoObject_Puml]*

* u
* [docs].[RepoObject_Plantuml_Entity_T]

|

|720
|
*export FROM [docs].[RepoObject_Plantuml_Entity_T] [RepoObject_PumlOnlyPK]*

* u
* [docs].[RepoObject_Plantuml_Entity_T]

|

|730
|
*export FROM [docs].[RepoObject_Plantuml_Entity_T] [RepoObject_PumlOnlyPkOrIndex]*

* u
* [docs].[RepoObject_Plantuml_Entity_T]

|

|740
|
*export FROM [docs].[RepoObject_Plantuml_Entity_T] [RepoObject_PumlOnlyPkOrNotHidden]*

* u
* [docs].[RepoObject_Plantuml_Entity_T]

|
|===
', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPuml';

