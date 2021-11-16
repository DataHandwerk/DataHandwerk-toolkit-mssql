/*
code of this procedure is managed in the dhw repository. Do not modify manually.
Use [uspgenerator].[GeneratorUsp], [uspgenerator].[GeneratorUspParameter], [uspgenerator].[GeneratorUspStep], [uspgenerator].[GeneratorUsp_SqlUsp]
*/
CREATE   PROCEDURE [repo].[usp_update_Referencing_Count]
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

--
PRINT '[repo].[usp_update_Referencing_Count]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":210,"Name":"SET [RepoObject_Referencing_Count] = [rorc].[Referencing_Count]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[RepoObjectReferencing]","log_target_object":"[repo].[RepoObject]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',19,';',210,';',NULL);

UPDATE repo.RepoObject
SET [RepoObject_Referencing_Count] = [rorc].[Referencing_Count]
FROM [repo].[RepoObject]
LEFT OUTER JOIN (
 SELECT [RepoObject_guid]
  , COUNT(*) AS [Referencing_Count]
 FROM [repo_sys].[RepoObjectReferencing] AS [ror]
 GROUP BY [RepoObject_guid]
 ) AS [rorc]
 ON [repo].[RepoObject].[RepoObject_guid] = [rorc].[RepoObject_guid]
WHERE ISNULL([repo].[RepoObject].[RepoObject_Referencing_Count], 0) <> ISNULL([rorc].[Referencing_Count], 0)

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [RepoObject_Referencing_Count] = [rorc].[Referencing_Count]'
SET @source_object = '[repo_sys].[RepoObjectReferencing]'
SET @target_object = '[repo].[RepoObject]'

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

/*{"ReportUspStep":[{"Number":310,"Name":"SET [Referencing_Count] = [rorc].[Referencing_Count]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo_sys].[RepoObjectReferenced]","log_target_object":"[repo].[RepoObjectColumn]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',19,';',310,';',NULL);

Update
    roc
Set
    [Referencing_Count] = [rorc].[Referencing_Count]
From
    [repo].[RepoObjectColumn] roc
    Left Outer Join
        [repo].[RepoObject]   [ro]
            On
            roc.[RepoObject_guid]        = [ro].[RepoObject_guid]

    Left Outer Join
    (
        Select
            ror.[referenced_schema_name]
          , ror.[referenced_entity_name]
          , ror.[referenced_minor_name]
          , Count ( Distinct ror.[RepoObject_guid] ) As [Referencing_Count]
        From
            [repo_sys].[RepoObjectReferenced]   As [ror]
            Cross Join config.ftv_dwh_database () As dwhdb
        Where
            ror.[referenced_database_name] = dwhdb.dwh_database_name
            Or ror.[referenced_database_name] Is Null
        Group By
            ror.[referenced_schema_name]
          , ror.[referenced_entity_name]
          , ror.[referenced_minor_name]
    )                         As [rorc]
        On
        roc.[SysObjectColumn_name]       = [rorc].[referenced_minor_name]
        And [ro].[SysObject_name]        = [rorc].[referenced_entity_name]
        And [ro].[SysObject_schema_name] = rorc.[referenced_schema_name]
Where
    IsNull ( roc.[Referencing_Count], 0 ) <> IsNull ( [rorc].[Referencing_Count], 0 );

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [Referencing_Count] = [rorc].[Referencing_Count]'
SET @source_object = '[repo_sys].[RepoObjectReferenced]'
SET @target_object = '[repo].[RepoObjectColumn]'

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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a69108f2-739f-eb11-84f8-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_update_Referencing_Count';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[ftv_dwh_database]
* [logs].[usp_ExecutionLog_insert]
* [repo].[RepoObject]
* [repo].[RepoObjectColumn]
* [repo_sys].[RepoObjectReferenced]
* [repo_sys].[RepoObjectReferencing]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_update_Referencing_Count';


GO
EXECUTE sp_addextendedproperty @name = N'ExampleUsage', @value = N'EXEC [repo].[usp_update_Referencing_Count]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_update_Referencing_Count';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.ftv_dwh_database.adoc[]
* xref:logs.usp_ExecutionLog_insert.adoc[]
* xref:repo.RepoObject.adoc[]
* xref:repo.RepoObjectColumn.adoc[]
* xref:repo_sys.RepoObjectReferenced.adoc[]
* xref:repo_sys.RepoObjectReferencing.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_update_Referencing_Count';


GO
EXECUTE sp_addextendedproperty @name = N'AdocUspSteps', @value = N'.Steps in [repo].[usp_update_Referencing_Count]
[cols="d,15a,d"]
|===
|Number|Name (Action, Source, Target)|Parent

|210
|
*SET [RepoObject_Referencing_Count] = [rorc].[Referencing_Count]*

* u
* [repo_sys].[RepoObjectReferencing]
* [repo].[RepoObject]


.Statement
[%collapsible]
=====
[source,sql]
----
UPDATE repo.RepoObject
SET [RepoObject_Referencing_Count] = [rorc].[Referencing_Count]
FROM [repo].[RepoObject]
LEFT OUTER JOIN (
 SELECT [RepoObject_guid]
  , COUNT(*) AS [Referencing_Count]
 FROM [repo_sys].[RepoObjectReferencing] AS [ror]
 GROUP BY [RepoObject_guid]
 ) AS [rorc]
 ON [repo].[RepoObject].[RepoObject_guid] = [rorc].[RepoObject_guid]
WHERE ISNULL([repo].[RepoObject].[RepoObject_Referencing_Count], 0) <> ISNULL([rorc].[Referencing_Count], 0)
----
=====

|


|310
|
*SET [Referencing_Count] = [rorc].[Referencing_Count]*

* u
* [repo_sys].[RepoObjectReferenced]
* [repo].[RepoObjectColumn]


.Statement
[%collapsible]
=====
[source,sql]
----
Update
    roc
Set
    [Referencing_Count] = [rorc].[Referencing_Count]
From
    [repo].[RepoObjectColumn] roc
    Left Outer Join
        [repo].[RepoObject]   [ro]
            On
            roc.[RepoObject_guid]        = [ro].[RepoObject_guid]

    Left Outer Join
    (
        Select
            ror.[referenced_schema_name]
          , ror.[referenced_entity_name]
          , ror.[referenced_minor_name]
          , Count ( Distinct ror.[RepoObject_guid] ) As [Referencing_Count]
        From
            [repo_sys].[RepoObjectReferenced]   As [ror]
            Cross Join config.ftv_dwh_database () As dwhdb
        Where
            ror.[referenced_database_name] = dwhdb.dwh_database_name
            Or ror.[referenced_database_name] Is Null
        Group By
            ror.[referenced_schema_name]
          , ror.[referenced_entity_name]
          , ror.[referenced_minor_name]
    )                         As [rorc]
        On
        roc.[SysObjectColumn_name]       = [rorc].[referenced_minor_name]
        And [ro].[SysObject_name]        = [rorc].[referenced_entity_name]
        And [ro].[SysObject_schema_name] = rorc.[referenced_schema_name]
Where
    IsNull ( roc.[Referencing_Count], 0 ) <> IsNull ( [rorc].[Referencing_Count], 0 );
----
=====

|

|===
', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_update_Referencing_Count';




GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_update_Referencing_Count';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_update_Referencing_Count';

