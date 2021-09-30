/*
code of this procedure is managed in the dhw repository. Do not modify manually.
Use [uspgenerator].[GeneratorUsp], [uspgenerator].[GeneratorUspParameter], [uspgenerator].[GeneratorUspStep], [uspgenerator].[GeneratorUsp_SqlUsp]
*/
CREATE   PROCEDURE [docs].[usp_AntoraExport_ObjectRefCyclic]
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
PRINT '[docs].[usp_AntoraExport_ObjectRefCyclic]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":110,"Name":"configure database connection","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":0}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',69,';',110,';',NULL);

DECLARE @instanceName NVARCHAR(500) = @@servername --example: 'ACER-F17\SQL2019', '.\SQL2019', localhost\SQL2019
DECLARE @databaseName NVARCHAR(128) = DB_NAME()
DECLARE @TrustedUserPassword NVARCHAR(1000)

IF @isTrustedConnection = 1
 SET @TrustedUserPassword = ' -T'
ELSE
 SET @TrustedUserPassword = ' -U ' + @userName + ' -P ' + @password

/*{"ReportUspStep":[{"Number":210,"Name":"declare variables","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":0}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',69,';',210,';',NULL);

DECLARE @command NVARCHAR(4000)
DECLARE @cultures_name NVARCHAR(10)


/*{"ReportUspStep":[{"Number":410,"Name":"export FROM [docs].[ObjectRefCyclic]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[docs].[AntoraPage_IndexSemanticGroup]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',69,';',410,';',NULL);

/*
IndexSemanticGroup.adoc

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
        = 'bcp "SELECT [partial_content] FROM [docs].[ObjectRefCyclic]" '
          --
          + '" queryout "'
          --
          + config.fs_get_parameter_value ( 'AntoraComponentFolder', '' ) + '\modules\'
          + config.fs_get_parameter_value ( 'AntoraModule', '' ) + Iif(@cultures_name <> '', '-', '') + @cultures_name
          + '\pages\other\' + 'ObjectRefCyclic.adoc"'
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
        = 'bcp "SELECT [ObjectRefCyclic_Puml] FROM [docs].[ObjectRefCyclic]" '
          --
          + '" queryout "'
          --
          + config.fs_get_parameter_value ( 'AntoraComponentFolder', '' ) + '\modules\'
          + config.fs_get_parameter_value ( 'AntoraModule', '' ) + Iif(@cultures_name <> '', '-', '') + @cultures_name
          + '\partials\puml\' + 'ObjectRefCyclic.puml"'
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
SET @step_name = 'export FROM [docs].[ObjectRefCyclic]'
SET @source_object = '[docs].[AntoraPage_IndexSemanticGroup]'
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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '88e72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectRefCyclic';


GO
EXECUTE sp_addextendedproperty @name = N'UspParameters', @value = N'@outputDir NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\entity_1_1_colref\ */
,@outputDir2 NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\entity_1_1_objectref\ */
,@isTrustedConnection BIT = 1 /* specify whether you are connecting to the SQL instance with a trusted connection (Windows Authentication) or not */
,@userName NVARCHAR(250) = ''loginName'' /* If isTrustedConnection is set to 0 then you will need to add username and password for connecting to the SQL Server instance */
,@password NVARCHAR(250) = ''password''', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectRefCyclic';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[fs_get_parameter_value]
* [logs].[usp_ExecutionLog_insert]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectRefCyclic';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'export for ObjectRefCyclic', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectRefCyclic';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectRefCyclic';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectRefCyclic';


GO
EXECUTE sp_addextendedproperty @name = N'ExampleUsage', @value = N'EXEC [docs].[usp_AntoraExport_ObjectRefCyclic]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectRefCyclic';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.usp_AntoraExport.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectRefCyclic';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.fs_get_parameter_value.adoc[]
* xref:logs.usp_ExecutionLog_insert.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectRefCyclic';


GO
EXECUTE sp_addextendedproperty @name = N'AdocUspSteps', @value = N'.Steps in [docs].[usp_AntoraExport_ObjectRefCyclic]
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
   ) + ''pages\other\'')
SET @outputDir2 = ISNULL(@outputDir2, (
   SELECT [config].[fs_get_parameter_value](''AntoraComponentFolder'', '''') + ''\modules\'' + [config].[fs_get_parameter_value](''AntoraModule'', '''') + ''\''
   ) + ''partials\puml\'')
   
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
DECLARE @command NVARCHAR(4000)

----
=====

|


|410
|
*export page_content FROM [docs].[ObjectRefCyclic]*

* u
* [docs].[AntoraPage_IndexSemanticGroup]


IndexSemanticGroup.adoc


.Statement
[%collapsible]
=====
[source,sql]
----
SET @command = ''bcp "SELECT [page_content] FROM [docs].[ObjectRefCyclic]"  queryout "'' + @outputDir + ''ObjectRefCyclic.adoc"''
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

----
=====

|


|420
|
*export ObjectRefCyclic_Puml FROM [docs].[ObjectRefCyclic]*

* u
* [docs].[AntoraPage_IndexSemanticGroup]


IndexSemanticGroup.adoc


.Statement
[%collapsible]
=====
[source,sql]
----
SET @command = ''bcp "SELECT [ObjectRefCyclic_Puml] FROM [docs].[ObjectRefCyclic]"  queryout "'' + @outputDir2 + ''ObjectRefCyclic.puml"''
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

----
=====

|

|===
', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectRefCyclic';







