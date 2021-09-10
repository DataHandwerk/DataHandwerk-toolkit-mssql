﻿/*
code of this procedure is managed in the dhw repository. Do not modify manually.
Use [uspgenerator].[GeneratorUsp], [uspgenerator].[GeneratorUspParameter], [uspgenerator].[GeneratorUspStep], [uspgenerator].[GeneratorUsp_SqlUsp]
*/
CREATE   PROCEDURE [repo].[usp_Index_finish]
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
PRINT '[repo].[usp_Index_finish]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":210,"Name":"[repo].[usp_Index_Settings]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [repo].[usp_Index_Settings]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":220,"Name":"DELETE [repo].[Index_virtual] without columns","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[IndexColumn_virtual]","log_target_object":"[repo].[Index_virtual]","log_flag_InsertUpdateDelete":"d"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',15,';',220,';',NULL);

DELETE iv
FROM [repo].[Index_virtual] iv
WHERE NOT EXISTS (
  SELECT 1
  FROM [repo].[IndexColumn_virtual] icv
  WHERE icv.index_guid = iv.index_guid
  )


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'DELETE [repo].[Index_virtual] without columns'
SET @source_object = '[repo].[IndexColumn_virtual]'
SET @target_object = '[repo].[Index_virtual]'

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
 , @deleted = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":410,"Name":"DELETE duplicates by pattern","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[Index_gross]","log_target_object":"[repo].[Index_virtual]","log_flag_InsertUpdateDelete":"d"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',15,';',410,';',NULL);

DELETE iv
FROM [repo].[Index_virtual] [iv]
WHERE EXISTS (
  SELECT 1
  FROM [repo].[Index_gross] AS [ig]
  WHERE [ig].[index_guid] = [iv].[index_guid]
   AND [ig].[RowNumber_PatternPerParentObject] > 1
  )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'DELETE duplicates by pattern'
SET @source_object = '[repo].[Index_gross]'
SET @target_object = '[repo].[Index_virtual]'

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
 , @deleted = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":510,"Name":"SET [IndexSemanticGroup] = [TSource].[IndexSemanticGroup] (via [T1].[referenced_index_guid] = [TSource].[index_guid])","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[Index_Settings]","log_target_object":"[repo].[Index_Settings]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',15,';',510,';',NULL);

/*
ATTENTION:

repo.Index_IndexSemanticGroup.[IndexSemanticGroup] could also be set to NULL where it was assigned before

maybe this should be avoided?

but the strict inheritance is consequent
*/
UPDATE repo.[Index_Settings]
SET [IndexSemanticGroup] = [TSource].[IndexSemanticGroup]
FROM [repo].[Index_virtual] AS [T1]
INNER JOIN [repo].[Index_Settings] AS [TSource]
 ON [T1].[referenced_index_guid] = [TSource].[index_guid]
INNER JOIN [repo].[Index_Settings]
 ON [T1].[index_guid] = [repo].[Index_Settings].[index_guid]
  AND [TSource].[IndexPatternColumnDatatype] = [repo].[Index_Settings].[IndexPatternColumnDatatype]
WHERE ISNULL([repo].[Index_Settings].[IndexSemanticGroup], '') <> ISNULL([TSource].[IndexSemanticGroup], '')


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [IndexSemanticGroup] = [TSource].[IndexSemanticGroup] (via [T1].[referenced_index_guid] = [TSource].[index_guid])'
SET @source_object = '[repo].[Index_Settings]'
SET @target_object = '[repo].[Index_Settings]'

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

/*{"ReportUspStep":[{"Number":520,"Name":"SET [IndexSemanticGroup] = [TSource].[IndexSemanticGroup] (via [repo].[ForeignKey_Index_guid_union])","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[Index_Settings]","log_target_object":"[repo].[Index_Settings]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',15,';',520,';',NULL);

UPDATE i_s
SET [IndexSemanticGroup] = [TSource].[IndexSemanticGroup]
FROM repo.[Index_Settings] i_s
INNER JOIN [repo].[ForeignKey_Indexes_union_T] fk
 ON fk.[referencing_index_guid] = i_s.[index_guid]
INNER JOIN [repo].[Index_Settings] AS [TSource]
 ON [TSource].[index_guid] = fk.[referenced_index_guid]
WHERE ISNULL(i_s.[IndexSemanticGroup], '') <> ISNULL([TSource].[IndexSemanticGroup], '')

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [IndexSemanticGroup] = [TSource].[IndexSemanticGroup] (via [repo].[ForeignKey_Index_guid_union])'
SET @source_object = '[repo].[Index_Settings]'
SET @target_object = '[repo].[Index_Settings]'

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

/*{"ReportUspStep":[{"Number":610,"Name":"SET [is_index_primary_key] = 1, [is_index_unique] = 1 (propagate PK from [repo].[RepoObject] into [repo].[Index_virtual])","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject]","log_target_object":"[repo].[Index_virtual]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',15,';',610,';',NULL);

/*
PK synchronizing between [repo].[RepoObject].[pk_index_guid] and [repo].[Index_virtual]

PK can be defined in several ways:

* real PK for tables in database
* index can be marked as PK in [repo].[Index_virtual]
* index can be marked as PK by using it in [repo].[RepoObject].[pk_index_guid]

PK could be defined in [repo].[RepoObject].[pk_index_guid] by using an index_guid in an manual process

* first we need to propagate this PK into [repo].[Index_virtual] +
atention, this will propagate only real existing PK from SysObject ("real PK")
* now we could have two or more PK defined in [repo].[Index_virtual]

Attention, PK inheritance sould happen only if there is not yet a PK in [repo].[Index_virtual],
otherwise it could happen that the wrong PK will be enforced


*/
UPDATE iv
SET [is_index_primary_key] = 1
 , [is_index_unique] = 1
FROM [repo].[Index_virtual] [iv]
WHERE [iv].[is_index_primary_key] = 0
 AND EXISTS (
  SELECT [pk_index_guid]
  FROM [repo].[RepoObject] AS [ro]
  WHERE [ro].[RepoObject_guid] = [iv].[parent_RepoObject_guid]
   AND [ro].[pk_index_guid] = [iv].[index_guid]
  )
 --for the same [iv].[parent_RepoObject_guid] no PK should be defined to avoid overwriting
 AND NOT EXISTS (
  SELECT 1
  FROM [repo].[Index_virtual] [iv2]
  WHERE iv2.[is_index_primary_key] = 1
   AND iv2.[parent_RepoObject_guid] = [iv].[parent_RepoObject_guid]
  )


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [is_index_primary_key] = 1, [is_index_unique] = 1 (propagate PK from [repo].[RepoObject] into [repo].[Index_virtual])'
SET @source_object = '[repo].[RepoObject]'
SET @target_object = '[repo].[Index_virtual]'

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

/*{"ReportUspStep":[{"Number":620,"Name":"SET [is_index_primary_key] = 1 (WHERE rop.has_history = 1 and source-index is PK)","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[Index_union]","log_target_object":"[repo].[Index_virtual]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',15,';',620,';',NULL);

/*
persistence:

persistence with [has_history] = 1 require PK

default index inserting doesn't mark inherited index as PK or UK

[repo].[RepoObject_SqlCreateTable] will be invalid for these tables

[source,sql]
------
SELECT iv_p.is_index_primary_key
 , iv_p.is_index_unique
 , iv_s.is_index_primary_key AS is_index_primary_key_s
 , iv_s.is_index_unique AS is_index_unique_s
 , rop.has_history
 , rop.is_persistence
 
 --, ro.RepoObject_fullname
 --, iv_p.index_guid
 --, iv_p.parent_RepoObject_guid
FROM repo.Index_virtual AS iv_p
INNER JOIN repo.RepoObject_persistence AS rop
 ON rop.target_RepoObject_guid = iv_p.parent_RepoObject_guid
INNER JOIN repo.Index_union AS iv_s
 ON iv_p.referenced_index_guid = iv_s.index_guid
--INNER JOIN repo.RepoObject AS ro
-- ON ro.RepoObject_guid = iv_p.parent_RepoObject_guid
------



*/
UPDATE iv_p
SET [is_index_primary_key] = [iv_s].[is_index_primary_key]
 , [is_index_unique] = [iv_s].[is_index_unique]
FROM [repo].[Index_virtual] AS [iv_p]
INNER JOIN [repo].[RepoObject_persistence] AS [rop]
 ON [rop].[target_RepoObject_guid] = [iv_p].[parent_RepoObject_guid]
INNER JOIN [repo].[Index_union] AS [iv_s]
 ON [iv_p].[referenced_index_guid] = [iv_s].[index_guid]
WHERE [rop].[has_history] = 1
 AND [iv_p].[is_index_primary_key] = 0
 AND [iv_s].[is_index_primary_key] = 1

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [is_index_primary_key] = 1 (WHERE rop.has_history = 1 and source-index is PK)'
SET @source_object = '[repo].[Index_union]'
SET @target_object = '[repo].[Index_virtual]'

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

/*{"ReportUspStep":[{"Number":710,"Name":"SET [is_create_constraint] = 1 (WHERE persistence has_history = 1)","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[Index_union]","log_target_object":"[repo].[Index_virtual]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',15,';',710,';',NULL);

/*
PK constraint creation needs to be enables in [repo].[Index_Settings]

*/
UPDATE iset
SET [is_create_constraint] = 1
FROM [repo].[Index_Settings] [iset]
WHERE [iset].[is_create_constraint] = 0
 AND EXISTS (
  SELECT 1
  FROM [repo].[Index_union] AS [i]
  INNER JOIN [repo].[RepoObject_persistence] AS [rop]
   ON [rop].[target_RepoObject_guid] = [i].[parent_RepoObject_guid]
  WHERE [rop].[has_history] = 1
   AND [i].[is_index_primary_key] = 1
   AND [i].[index_guid] = [iset].[index_guid]
  )

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [is_create_constraint] = 1 (WHERE persistence has_history = 1)'
SET @source_object = '[repo].[Index_union]'
SET @target_object = '[repo].[Index_virtual]'

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

/*{"ReportUspStep":[{"Number":810,"Name":"SET [is_index_unique] = 1 (each PK is also [is_index_unique])","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[Index_virtual]","log_target_object":"[repo].[Index_virtual]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',15,';',810,';',NULL);

UPDATE iv
SET [is_index_unique] = 1
FROM [repo].[Index_virtual] [iv]
WHERE [iv].[is_index_primary_key] = 1
 AND [iv].[is_index_unique] = 0

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [is_index_unique] = 1 (each PK is also [is_index_unique])'
SET @source_object = '[repo].[Index_virtual]'
SET @target_object = '[repo].[Index_virtual]'

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

/*{"ReportUspStep":[{"Number":920,"Name":"SET [is_index_primary_key] = 0 (where RowNumber_PkPerParentObject > 1)","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject]","log_target_object":"[repo].[Index_virtual]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',15,';',920,';',NULL);

/*
because there could be several PK defined per [parent_RepoObject_guid], this should be corrected

only [repo].[Index_virtual] needs to be corrected because the real PK consistence should be controled by mssql


*/
UPDATE iv
SET [is_index_primary_key] = 0
FROM [repo].[Index_virtual] [iv]
WHERE iv.[is_index_primary_key] = 1
 AND EXISTS (
  SELECT 1
  FROM [repo].[Index_gross] ig
  WHERE ig.[parent_RepoObject_guid] = iv.parent_RepoObject_guid
   AND ig.index_guid = iv.index_guid
   AND RowNumber_PkPerParentObject > 1
  )


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [is_index_primary_key] = 0 (where RowNumber_PkPerParentObject > 1)'
SET @source_object = '[repo].[RepoObject]'
SET @target_object = '[repo].[Index_virtual]'

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

/*{"ReportUspStep":[{"Number":930,"Name":"SET [pk_index_guid] = [pk].[index_guid] (WHERE [is_index_primary_key] = 1 and [RowNumber_PkPerParentObject] = 1)","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[Index_gross]","log_target_object":"[repo].[Index_virtual]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',15,';',930,';',NULL);

/*
only one PK per RepoObject is possible

we use some priority in [RowNumber_PkPerParentObject] in case that several PK are defined per RepoObject


*/
UPDATE ro
SET [pk_index_guid] = [pk].[index_guid]
FROM [repo].[RepoObject] [ro]
LEFT JOIN (
 SELECT [index_guid]
  , [parent_RepoObject_guid]
 FROM [repo].[Index_gross] AS [T1]
 WHERE [is_index_primary_key] = 1
  AND [RowNumber_PkPerParentObject] = 1
 ) [pk]
 ON [ro].[RepoObject_guid] = [pk].[parent_RepoObject_guid]
WHERE [ro].[pk_index_guid] <> [pk].[index_guid]
 OR (
  [ro].[pk_index_guid] IS NULL
  AND NOT [pk].[index_guid] IS NULL
  )
 OR (
  NOT [ro].[pk_index_guid] IS NULL
  AND [pk].[index_guid] IS NULL
  )


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [pk_index_guid] = [pk].[index_guid] (WHERE [is_index_primary_key] = 1 and [RowNumber_PkPerParentObject] = 1)'
SET @source_object = '[repo].[Index_gross]'
SET @target_object = '[repo].[Index_virtual]'

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

/*{"ReportUspStep":[{"Number":1010,"Name":"SET [index_name] = [T2].[index_name_new]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[repo].[RepoObject]","log_target_object":"[repo].[Index_virtual]","log_flag_InsertUpdateDelete":"u"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',15,';',1010,';',NULL);

/*
index_name is required, it will be assigned, where it is missing or where [has_managedName] = 1 and it is differenc 

could be problematic, if the ROW_NUMBER() and the assigned name is occupied

maye an attribute is requird, to distinguish between managed named and manually assigned names


*/
UPDATE iv
SET [index_name] = [T2].[index_name_new]
FROM [repo].[Index_virtual] AS [iv]
INNER JOIN (
 SELECT [iv].[index_guid]
  , [index_name_new] = CONCAT (
   CASE 
    WHEN [iv].[is_index_primary_key] = 1
     THEN 'PK'
    WHEN [iv].[is_index_unique] = 1
     THEN 'UK'
    ELSE 'idx'
    END
   , '_'
   , [ro].[RepoObject_name]
   , CASE 
    WHEN [iv].[is_index_primary_key] = 0
     THEN CONCAT (
       '__'
       , ROW_NUMBER() OVER (
        PARTITION BY [iv].[parent_RepoObject_guid] ORDER BY [iv].[index_guid]
        )
       )
    END
   )
 FROM [repo].[Index_virtual] AS [iv]
 INNER JOIN [repo].[RepoObject] AS [ro]
  ON [iv].[parent_RepoObject_guid] = [ro].[RepoObject_guid]
 WHERE [iv].[index_name] IS NULL
  OR [iv].[has_managedName] = 1
 ) [T2]
 ON [T2].[index_guid] = [iv].[index_guid]
WHERE [iv].[index_name] IS NULL
 OR [iv].[index_name] <> [T2].[index_name_new]

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'SET [index_name] = [T2].[index_name_new]'
SET @source_object = '[repo].[RepoObject]'
SET @target_object = '[repo].[Index_virtual]'

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

/*{"ReportUspStep":[{"Number":3100,"Name":"[repo].[usp_PERSIST_IndexColumn_union_T]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [repo].[usp_PERSIST_IndexColumn_union_T]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":3200,"Name":"[repo].[usp_PERSIST_Index_ColumList_T]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [repo].[usp_PERSIST_Index_ColumList_T]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '39e9a165-9574-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_Index_finish';


GO
EXECUTE sp_addextendedproperty @name = N'UspParameters', @value = NULL, @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_Index_finish';


GO
EXECUTE sp_addextendedproperty @name = N'UspExamples', @value = NULL, @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_Index_finish';


GO
EXECUTE sp_addextendedproperty @name = N'AdocUspSteps', @value = N'.Steps in [repo].[usp_Index_finish]
[cols="5,200,1,100,100,1"]
|===
|Number
|Name
|Condition
|Source
|Target
|Action

|210
|[repo].[usp_Index_Settings]
|0
|
|
|

|220
|DELETE [repo].[Index_virtual] without columns
|0
|[repo].[IndexColumn_virtual]
|[repo].[Index_virtual]
|d

|410
|DELETE duplicates by pattern
|0
|[repo].[Index_gross]
|[repo].[Index_virtual]
|d

|510
|SET [IndexSemanticGroup] = [TSource].[IndexSemanticGroup] (via [T1].[referenced_index_guid] = [TSource].[index_guid])
|0
|[repo].[Index_Settings]
|[repo].[Index_Settings]
|u

|520
|SET [IndexSemanticGroup] = [TSource].[IndexSemanticGroup] (via [repo].[ForeignKey_Index_guid_union])
|0
|[repo].[Index_Settings]
|[repo].[Index_Settings]
|u

|610
|SET [is_index_primary_key] = 1, [is_index_unique] = 1 (propagate PK from [repo].[RepoObject] into [repo].[Index_virtual])
|0
|[repo].[RepoObject]
|[repo].[Index_virtual]
|u

|620
|SET [is_index_primary_key] = 1 (WHERE rop.has_history = 1 and source-index is PK)
|0
|[repo].[Index_union]
|[repo].[Index_virtual]
|u

|710
|SET [is_create_constraint] = 1 (WHERE persistence has_history = 1)
|0
|[repo].[Index_union]
|[repo].[Index_virtual]
|u

|810
|SET [is_index_unique] = 1 (each PK is also [is_index_unique])
|0
|[repo].[Index_virtual]
|[repo].[Index_virtual]
|u

|910
|SET [pk_index_guid] = [pk].[index_guid] (WHERE [is_index_primary_key] = 1 and [RowNumber_PkPerParentObject] = 1)
|0
|[repo].[Index_gross]
|[repo].[Index_virtual]
|u

|920
|SET [is_index_primary_key] = 0 (where it is not a PK in [repo].[RepoObject])
|0
|[repo].[RepoObject]
|[repo].[Index_virtual]
|u

|1010
|SET [index_name] = [T2].[index_name_new]
|0
|[repo].[RepoObject]
|[repo].[Index_virtual]
|u
|===
', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_Index_finish';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [logs].[usp_ExecutionLog_insert]
* [repo].[ForeignKey_Indexes_union_T]
* [repo].[Index_gross]
* [repo].[Index_Settings]
* [repo].[Index_union]
* [repo].[Index_virtual]
* [repo].[IndexColumn_virtual]
* [repo].[RepoObject]
* [repo].[RepoObject_persistence]
* [repo].[usp_Index_Settings]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_Index_finish';




GO
EXECUTE sp_addextendedproperty @name = N'ExampleUsage', @value = N'EXEC [repo].[usp_Index_finish]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_Index_finish';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.usp_Index_ForeignKey.adoc[]
* xref:repo.usp_index_inheritance.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_Index_finish';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:logs.usp_ExecutionLog_insert.adoc[]
* xref:repo.ForeignKey_Indexes_union_T.adoc[]
* xref:repo.Index_gross.adoc[]
* xref:repo.Index_Settings.adoc[]
* xref:repo.Index_union.adoc[]
* xref:repo.Index_virtual.adoc[]
* xref:repo.IndexColumn_virtual.adoc[]
* xref:repo.RepoObject.adoc[]
* xref:repo.RepoObject_persistence.adoc[]
* xref:repo.usp_Index_Settings.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_Index_finish';




GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_Index_finish';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_Index_finish';

