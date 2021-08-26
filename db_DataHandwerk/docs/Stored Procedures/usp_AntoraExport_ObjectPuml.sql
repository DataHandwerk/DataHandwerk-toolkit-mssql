CREATE   PROCEDURE [docs].[usp_AntoraExport_ObjectPuml]
@outputDir NVARCHAR(1000) = NULL /* example: 'D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\entity_1_1_colref\ */
,@outputDir2 NVARCHAR(1000) = NULL /* example: 'D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\entity_1_1_objectref\ */
,@outputDir3 NVARCHAR(1000) = NULL /* example: 'D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\entity_1_1_fk\ */
,@outputDir4 NVARCHAR(1000) = NULL /* example: 'D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\entity_0_30_objectref\ */
,@outputDir5 NVARCHAR(1000) = NULL /* example: 'D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\entity_30_0_objectref\ */
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
 , @parameter_02 = @outputDir2
 , @parameter_03 = @outputDir3
 , @parameter_04 = @outputDir4
 , @parameter_05 = @outputDir5
 , @parameter_06 = @isTrustedConnection
 , @parameter_07 = @userName
 , @parameter_08 = @password
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

/*{"ReportUspStep":[{"Number":120,"Name":"configure outputDirs","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":0}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',32,';',120,';',NULL);

SET @outputDir = ISNULL(@outputDir, (
   SELECT [config].[fs_get_parameter_value]('AntoraModulFolder', '') + '\' + [config].[fs_get_parameter_value]('AntoraModul', '') + '\'
   ) + 'partials\puml\entity_1_1_colref\')
SET @outputDir2 = ISNULL(@outputDir2, (
   SELECT [config].[fs_get_parameter_value]('AntoraModulFolder', '') + '\' + [config].[fs_get_parameter_value]('AntoraModul', '') + '\'
   ) + 'partials\puml\entity_1_1_objectref\')
SET @outputDir3 = ISNULL(@outputDir3, (
   SELECT [config].[fs_get_parameter_value]('AntoraModulFolder', '') + '\' + [config].[fs_get_parameter_value]('AntoraModul', '') + '\'
   ) + 'partials\puml\entity_1_1_fk\')
SET @outputDir4 = ISNULL(@outputDir4, (
   SELECT [config].[fs_get_parameter_value]('AntoraModulFolder', '') + '\' + [config].[fs_get_parameter_value]('AntoraModul', '') + '\'
   ) + 'partials\puml\entity_0_30_objectref\')
SET @outputDir5 = ISNULL(@outputDir5, (
   SELECT [config].[fs_get_parameter_value]('AntoraModulFolder', '') + '\' + [config].[fs_get_parameter_value]('AntoraModul', '') + '\'
   ) + 'partials\puml\entity_30_0_objectref\')

/*{"ReportUspStep":[{"Number":210,"Name":"declare variables","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":0}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',32,';',210,';',NULL);

DECLARE @command NVARCHAR(4000);
DECLARE @Object_fullname NVARCHAR(261);
DECLARE @Object_fullname2 NVARCHAR(257);


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


/*{"ReportUspStep":[{"Number":410,"Name":"export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_1_1_ColRef]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[docs].[RepoObject_Plantuml_T]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',32,';',410,';',NULL);

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
 SET @command = 'bcp "SELECT [PlantumlEntity_1_1_ColRef] FROM [docs].[RepoObject_Plantuml_T] WITH (READUNCOMMITTED) where [RepoObject_fullname2] = '''
  --
  + @Object_fullname2
  --
  + '''" queryout "' + @outputDir + @Object_fullname2 + '.puml"'
  --
  + ' -S ' + @instanceName
  --
  + ' -d ' + @databaseName
  --
  + ' -c -C 65001'
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


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_1_1_ColRef]'
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

/*{"ReportUspStep":[{"Number":420,"Name":"export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_1_1_ObjectRef]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[docs].[RepoObject_Plantuml_T]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',32,';',420,';',NULL);

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
 SET @command = 'bcp "SELECT [PlantumlEntity_1_1_ObjectRef] FROM [docs].[RepoObject_Plantuml_T] WITH (READUNCOMMITTED) where [RepoObject_fullname2] = '''
  --
  + @Object_fullname2
  --
  + '''" queryout "' + @outputDir2 + @Object_fullname2 + '.puml"'
  --
  + ' -S ' + @instanceName
  --
  + ' -d ' + @databaseName
  --
  + ' -c -C 65001'
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


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_1_1_ObjectRef]'
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

/*{"ReportUspStep":[{"Number":430,"Name":"export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_1_1_FkRef]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[docs].[RepoObject_Plantuml_T]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',32,';',430,';',NULL);

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
 SET @command = 'bcp "SELECT [PlantumlEntity_1_1_FkRef] FROM [docs].[RepoObject_Plantuml_T] WITH (READUNCOMMITTED) where [RepoObject_fullname2] = '''
  --
  + @Object_fullname2
  --
  + '''" queryout "' + @outputDir3 + @Object_fullname2 + '.puml"'
  --
  + ' -S ' + @instanceName
  --
  + ' -d ' + @databaseName
  --
  + ' -c -C 65001'
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


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_1_1_FkRef]'
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

/*{"ReportUspStep":[{"Number":440,"Name":"export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_0_30_ObjectRef]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[docs].[RepoObject_Plantuml_T]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',32,';',440,';',NULL);

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
 SET @command = 'bcp "SELECT [PlantumlEntity_0_30_ObjectRef] FROM [docs].[RepoObject_Plantuml_T] WITH (READUNCOMMITTED) where [RepoObject_fullname2] = '''
  --
  + @Object_fullname2
  --
  + '''" queryout "' + @outputDir4 + @Object_fullname2 + '.puml"'
  --
  + ' -S ' + @instanceName
  --
  + ' -d ' + @databaseName
  --
  + ' -c -C 65001'
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


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_0_30_ObjectRef]'
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

/*{"ReportUspStep":[{"Number":450,"Name":"export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_30_0_ObjectRef]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[docs].[RepoObject_Plantuml_T]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',32,';',450,';',NULL);

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
 SET @command = 'bcp "SELECT [PlantumlEntity_30_0_ObjectRef] FROM [docs].[RepoObject_Plantuml_T] WITH (READUNCOMMITTED) where [RepoObject_fullname2] = '''
  --
  + @Object_fullname2
  --
  + '''" queryout "' + @outputDir5 + @Object_fullname2 + '.puml"'
  --
  + ' -S ' + @instanceName
  --
  + ' -d ' + @databaseName
  --
  + ' -c -C 65001'
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


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_30_0_ObjectRef]'
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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f40b29c2-e595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPuml';


GO
EXECUTE sp_addextendedproperty @name = N'UspParameters', @value = N'@outputDir NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\entity_1_1_colref\ */
,@outputDir2 NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\entity_1_1_objectref\ */
,@outputDir3 NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\entity_1_1_fk\ */
,@outputDir4 NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\entity_0_30_objectref\ */
,@outputDir5 NVARCHAR(1000) = NULL /* example: ''D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\puml\entity_30_0_objectref\ */
,@isTrustedConnection BIT = 1 /* specify whether you are connecting to the SQL instance with a trusted connection (Windows Authentication) or not */
,@userName NVARCHAR(250) = ''loginName'' /* If isTrustedConnection is set to 0 then you will need to add username and password for connecting to the SQL Server instance */
,@password NVARCHAR(250) = ''password''', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPuml';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[fs_get_parameter_value]
* [docs].[RepoObject_OutputFilter]
* [docs].[usp_PERSIST_RepoObject_Plantuml_Entity_T]
* [docs].[usp_PERSIST_RepoObject_Plantuml_T]
* [logs].[usp_ExecutionLog_insert]
* [reference].[usp_PERSIST_RepoObject_referenced_level_T]
* [reference].[usp_PERSIST_RepoObject_referencing_level_T]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPuml';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'* the documentation contains diagrams. These diagrams are defined using https://plantuml.com/[plantUML]
** export procedure: xref:docs.usp_AntoraExport_ObjectPuml.adoc[]
** individual diagrams per object are exported into (AntoraDocModulFolder)``partials/puml/``

include::partial$docsnippet/antora-export-prerequisites.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPuml';


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
* xref:reference.usp_PERSIST_RepoObject_referenced_level_T.adoc[]
* xref:reference.usp_PERSIST_RepoObject_referencing_level_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPuml';


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
*configure outputDir, outputDir2, outputDir3, outputDir4, outputDir5*


|

|210
|
*declare variables*


|

|310
|
*[reference].[usp_PERSIST_RepoObject_referenced_level_T]*

* `EXEC [reference].[usp_PERSIST_RepoObject_referenced_level_T]`

|

|320
|
*[reference].[usp_PERSIST_RepoObject_referencing_level_T]*

* `EXEC [reference].[usp_PERSIST_RepoObject_referencing_level_T]`

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

|410
|
*export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_1_1_ColRef]*

* u
* [docs].[RepoObject_Plantuml_T]

|

|420
|
*export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_1_1_ObjectRef]*

* u
* [docs].[RepoObject_Plantuml_T]

|

|430
|
*export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_1_1_FkRef]*

* u
* [docs].[RepoObject_Plantuml_T]

|

|440
|
*export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_0_30_ObjectRef]*

* u
* [docs].[RepoObject_Plantuml_T]

|

|450
|
*export FROM [docs].[RepoObject_Plantuml] [PlantumlEntity_30_0_ObjectRef]*

* u
* [docs].[RepoObject_Plantuml_T]

|
|===
', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_ObjectPuml';

