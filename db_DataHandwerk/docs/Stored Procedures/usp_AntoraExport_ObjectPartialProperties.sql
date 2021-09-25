﻿/*
code of this procedure is managed in the dhw repository. Do not modify manually.
Use [uspgenerator].[GeneratorUsp], [uspgenerator].[GeneratorUspParameter], [uspgenerator].[GeneratorUspStep], [uspgenerator].[GeneratorUsp_SqlUsp]
*/
CREATE   PROCEDURE [docs].[usp_AntoraExport_ObjectPartialProperties]
@outputDir NVARCHAR(1000) = NULL /* example: 'D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\ */
,@isTrustedConnection BIT = 1 /* specify whether you are connecting to the SQL instance with a trusted connection (Windows Authentication) or not */
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
 , @parameter_01 = @outputDir
 , @parameter_02 = @isTrustedConnection
 , @parameter_03 = @userName
 , @parameter_04 = @password
--
PRINT '[docs].[usp_AntoraExport_ObjectPartialProperties]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":110,"Name":"configure database connection","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":0}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',31,';',110,';',NULL);

DECLARE @instanceName NVARCHAR(500) = @@servername --example: 'ACER-F17\SQL2019', '.\SQL2019', localhost\SQL2019
DECLARE @databaseName NVARCHAR(128) = DB_NAME()
DECLARE @TrustedUserPassword NVARCHAR(1000)

IF @isTrustedConnection = 1
 SET @TrustedUserPassword = ' -T'
ELSE
 SET @TrustedUserPassword = ' -U ' + @userName + ' -P ' + @password

/*{"ReportUspStep":[{"Number":120,"Name":"configure outputDir","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":0}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',31,';',120,';',NULL);

SET @outputDir = ISNULL(@outputDir, (
   SELECT [config].[fs_get_parameter_value]('AntoraComponentFolder', '') + '\modules\' + [config].[fs_get_parameter_value]('AntoraModule', '') + '\'
   ) + 'partials\')

/*{"ReportUspStep":[{"Number":210,"Name":"declare variables","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":0}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',31,';',210,';',NULL);

DECLARE @command NVARCHAR(4000);
DECLARE @Object_fullname NVARCHAR(261);
DECLARE @Object_fullname2 NVARCHAR(257);


/*{"ReportUspStep":[{"Number":310,"Name":"[docs].[usp_PERSIST_RepoObject_IndexList_T]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [docs].[usp_PERSIST_RepoObject_IndexList_T]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":320,"Name":"[docs].[usp_PERSIST_RepoObject_ColumnList_T]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [docs].[usp_PERSIST_RepoObject_ColumnList_T]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":330,"Name":"[docs].[usp_PERSIST_RepoObject_Adoc_T]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [docs].[usp_PERSIST_RepoObject_Adoc_T]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":410,"Name":"export FROM [docs].[RepoObject_Adoc_T]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[docs].[RepoObject_Adoc_T]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',31,';',410,';',NULL);

Declare db_cursor Cursor Local Fast_Forward For
Select
    RepoObject_fullname
  , RepoObject_fullname2
From
    docs.RepoObject_OutputFilter
Where
    is_external = 0
Order By
    RepoObject_fullname

Open db_cursor

Fetch Next From db_cursor
Into
    @Object_fullname
  , @Object_fullname2

While @@Fetch_Status = 0
Begin
    --Dynamically construct the BCP command
    --
    --bcp "SELECT [AdocContent] FROM [docs].[RepoObject_Adoc_T] WITH (READUNCOMMITTED) where [RepoObject_fullname] = '[config].[type]'" queryout D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\pages\[config].[type].adoc -S localhost\sql2019 -d dhw_self -c -T
    --
    Set @command
        = 'bcp "SELECT [AdocContent] FROM [docs].[RepoObject_Adoc_T] WITH (READUNCOMMITTED) where [RepoObject_fullname] = '''
          --
          + @Object_fullname
          --
          + '''" queryout "' + @outputDir + @Object_fullname2 + '.adoc"'
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
        @Object_fullname
      , @Object_fullname2
End

Close db_cursor
Deallocate db_cursor

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'export FROM [docs].[RepoObject_Adoc_T]'
SET @source_object = '[docs].[RepoObject_Adoc_T]'
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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ea5bf6c2-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPartialProperties';


GO
EXECUTE sp_addextendedproperty @name = N'UspParameters', @value = N'@outputDir NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\ */
,@isTrustedConnection BIT = 1 /* specify whether you are connecting to the SQL instance with a trusted connection (Windows Authentication) or not */
,@userName NVARCHAR(250) = ''loginName'' /* If isTrustedConnection is set to 0 then you will need to add username and password for connecting to the SQL Server instance */
,@password NVARCHAR(250) = ''password''', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPartialProperties';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[fs_get_parameter_value]
* [docs].[RepoObject_OutputFilter]
* [docs].[usp_PERSIST_RepoObject_Adoc_T]
* [docs].[usp_PERSIST_RepoObject_ColumnList_T]
* [docs].[usp_PERSIST_RepoObject_IndexList_T]
* [logs].[usp_ExecutionLog_insert]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPartialProperties';




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'* the individual content per object is exported as ''partial'' into (AntoraModuleFolder)``/``(AntoraModuleName)``/partials/schemaname.objectname.adoc``
** export procedure: xref:docs.usp_AntoraExport_ObjectPartialProperties.adoc[]
** all properties from xref:property.RepoObjectProperty.adoc[] are exported with a `tag` per property
** some additional `tag` are exported
** the exported content is defined in xref:docs.RepoObject_Adoc.adoc[]

include::partial$docsnippet/antora-export-prerequisites.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPartialProperties';








GO
EXECUTE sp_addextendedproperty @name = N'ExampleUsage', @value = N'EXEC [docs].[usp_AntoraExport_ObjectPartialProperties]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPartialProperties';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.usp_AntoraExport.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPartialProperties';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.fs_get_parameter_value.adoc[]
* xref:docs.RepoObject_OutputFilter.adoc[]
* xref:docs.usp_PERSIST_RepoObject_Adoc_T.adoc[]
* xref:docs.usp_PERSIST_RepoObject_ColumnList_T.adoc[]
* xref:docs.usp_PERSIST_RepoObject_IndexList_T.adoc[]
* xref:logs.usp_ExecutionLog_insert.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPartialProperties';




GO
EXECUTE sp_addextendedproperty @name = N'AdocUspSteps', @value = N'.Steps in [docs].[usp_AntoraExport_ObjectPartialProperties]
[cols="d,15a,d"]
|===
|Number|Name (Action, Source, Target)|Parent

|110
|
*configure database connection*



.Statement
[%collapsible]
=====
[source,sql]
----
DECLARE @instanceName NVARCHAR(500) = @@servername --example: ''ACER-F17\SQL2019'', ''.\SQL2019'', localhost\SQL2019
DECLARE @databaseName NVARCHAR(128) = DB_NAME()
DECLARE @TrustedUserPassword NVARCHAR(1000)

IF @isTrustedConnection = 1
 SET @TrustedUserPassword = '' -T''
ELSE
 SET @TrustedUserPassword = '' -U '' + @userName + '' -P '' + @password
----
=====

|


|120
|
*configure outputDir*



.Statement
[%collapsible]
=====
[source,sql]
----
SET @outputDir = ISNULL(@outputDir, (
   SELECT [config].[fs_get_parameter_value](''AntoraComponentFolder'', '''') + ''\modules\'' + [config].[fs_get_parameter_value](''AntoraModule'', '''') + ''\''
   ) + ''partials\'')
----
=====

|


|210
|
*declare variables*



.Statement
[%collapsible]
=====
[source,sql]
----
DECLARE @command NVARCHAR(4000);
DECLARE @Object_fullname NVARCHAR(261);
DECLARE @Object_fullname2 NVARCHAR(257);

----
=====

|


|310
|
*[docs].[usp_PERSIST_RepoObject_IndexList_T]*

* `EXEC [docs].[usp_PERSIST_RepoObject_IndexList_T]`


.Statement
[%collapsible]
=====
[source,sql]
----
[docs].[usp_PERSIST_RepoObject_IndexList_T]
----
=====

|


|320
|
*[docs].[usp_PERSIST_RepoObject_ColumnList_T]*

* `EXEC [docs].[usp_PERSIST_RepoObject_ColumnList_T]`


.Statement
[%collapsible]
=====
[source,sql]
----
[docs].[usp_PERSIST_RepoObject_ColumnList_T]
----
=====

|


|330
|
*[docs].[usp_PERSIST_RepoObject_Adoc_T]*

* `EXEC [docs].[usp_PERSIST_RepoObject_Adoc_T]`


.Statement
[%collapsible]
=====
[source,sql]
----
[docs].[usp_PERSIST_RepoObject_Adoc_T]
----
=====

|


|410
|
*export FROM [docs].[RepoObject_Adoc_T]*

* u
* [docs].[RepoObject_Adoc_T]


.Statement
[%collapsible]
=====
[source,sql]
----
DECLARE db_cursor CURSOR Local Fast_Forward
FOR
SELECT RepoObject_fullname
 , RepoObject_fullname2
FROM docs.[RepoObject_OutputFilter]
ORDER BY RepoObject_fullname

OPEN db_cursor

FETCH NEXT
FROM db_cursor
INTO @Object_fullname
 , @Object_fullname2

WHILE @@FETCH_STATUS = 0
BEGIN
 --Dynamically construct the BCP command
 --
 --bcp "SELECT [AdocContent] FROM [docs].[RepoObject_Adoc_T] WITH (READUNCOMMITTED) where [RepoObject_fullname] = ''[config].[type]''" queryout D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\pages\[config].[type].adoc -S localhost\sql2019 -d dhw_self -c -T
 --
 SET @command = ''bcp "SELECT [AdocContent] FROM [docs].[RepoObject_Adoc_T] WITH (READUNCOMMITTED) where [RepoObject_fullname] = ''''''
  --
  + @Object_fullname
  --
  + ''''''" queryout "'' + @outputDir + @Object_fullname2 + ''.adoc"''
  --
  + '' -S '' + @instanceName
  --
  + '' -d '' + @databaseName
  --
  + '' -c -C 65001''
  --
  + @TrustedUserPassword

 PRINT @command

 --Execute the BCP command
 EXEC xp_cmdshell @command
  , no_output

 FETCH NEXT
 FROM db_cursor
 INTO @Object_fullname
  , @Object_fullname2
END

CLOSE db_cursor

DEALLOCATE db_cursor

----
=====

|

|===
', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPartialProperties';










GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPartialProperties';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPartialProperties';

