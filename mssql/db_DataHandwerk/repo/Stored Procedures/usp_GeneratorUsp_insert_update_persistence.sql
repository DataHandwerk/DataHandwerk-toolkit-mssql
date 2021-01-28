
CREATE PROCEDURE [repo].[usp_GeneratorUsp_insert_update_persistence]
AS
--delete old entries
--ATTENTION, destructive!
--we should delete only usp definitions for persistence!
DELETE u
FROM [repo].[GeneratorUsp] [u]
WHERE LEFT([u].[usp_name], 12) = 'usp_PERSIST_'
 AND NOT EXISTS (
  SELECT 1
  FROM [repo].[RepoObject_gross] AS [ro]
  WHERE [u].[usp_schema] = [ro].[RepoObject_schema_name]
   AND [u].[usp_name] = [ro].[usp_persistence_name]
  )

--insert new entries
INSERT INTO [repo].[GeneratorUsp] (
 [usp_schema]
 , [usp_name]
 , [has_logging]
 )
SELECT [usp_schema] = [RepoObject_schema_name]
 , [usp_name] = [usp_persistence_name]
 , 1
FROM [repo].[RepoObject_gross] AS ro
WHERE [is_persistence] = 1
 AND NOT EXISTS (
  SELECT 1
  FROM [repo].[GeneratorUsp] AS [u]
  WHERE [u].[usp_schema] = [ro].[RepoObject_schema_name]
   AND [u].[usp_name] = [ro].[usp_persistence_name]
  )

--
--do we need parameters?
--I think we don't need them but we will create static procedures
--
--steps
--we will create all possible required steps and later only activate and deaktivate them
--
UPDATE T
SET [Parent_Number] = [S].[Parent_Number]
 , [Name] = [S].[Name]
 , [has_logging] = [S].[has_logging]
 , [is_condition] = [S].[is_condition]
 , [is_SubProcedure] = [S].[is_SubProcedure]
 , [Statement] = [S].[Statement]
 , [log_source_object] = [S].[log_source_object]
 , [log_target_object] = [S].[log_target_object]
 , [log_flag_InsertUpdateDelete] = [S].[log_flag_InsertUpdateDelete]
FROM [repo].[GeneratorUspStep] [T]
LEFT JOIN [repo].[GeneratorUspStep_Persistence] AS [S]
 ON [T].[usp_id] = [S].[usp_id]
  AND [T].[Number] = [S].[Number]
WHERE
 --
 [T].[Parent_Number] <> [S].[Parent_Number]
 OR [T].[Parent_Number] IS NULL
 AND NOT [S].[Parent_Number] IS NULL
 OR NOT [T].[Parent_Number] IS NULL
 AND [S].[Parent_Number] IS NULL
 --
 OR [T].[Name] <> [S].[Name]
 OR [T].[Name] IS NULL
 AND NOT [S].[Name] IS NULL
 OR NOT [T].[Name] IS NULL
 AND [S].[Name] IS NULL
 --
 OR [T].[has_logging] <> [S].[has_logging]
 OR [T].[has_logging] IS NULL
 AND NOT [S].[has_logging] IS NULL
 OR NOT [T].[has_logging] IS NULL
 AND [S].[has_logging] IS NULL
 --
 OR [T].[is_condition] <> [S].[is_condition]
 OR [T].[is_condition] IS NULL
 AND NOT [S].[is_condition] IS NULL
 OR NOT [T].[is_condition] IS NULL
 AND [S].[is_condition] IS NULL
 --
 OR [T].[is_SubProcedure] <> [S].[is_SubProcedure]
 OR [T].[is_SubProcedure] IS NULL
 AND NOT [S].[is_SubProcedure] IS NULL
 OR NOT [T].[is_SubProcedure] IS NULL
 AND [S].[is_SubProcedure] IS NULL
 --
 OR [T].[Statement] <> [S].[Statement]
 OR [T].[Statement] IS NULL
 AND NOT [S].[Statement] IS NULL
 OR NOT [T].[Statement] IS NULL
 AND [S].[Statement] IS NULL
 --
 OR [T].[log_source_object] <> [S].[log_source_object]
 OR [T].[log_source_object] IS NULL
 AND NOT [S].[log_source_object] IS NULL
 OR NOT [T].[log_source_object] IS NULL
 AND [S].[log_source_object] IS NULL
 --
 OR [T].[log_target_object] <> [S].[log_target_object]
 OR [T].[log_target_object] IS NULL
 AND NOT [S].[log_target_object] IS NULL
 OR NOT [T].[log_target_object] IS NULL
 AND [S].[log_target_object] IS NULL
 --
 OR [T].[log_flag_InsertUpdateDelete] <> [S].[log_flag_InsertUpdateDelete]
 OR [T].[log_flag_InsertUpdateDelete] IS NULL
 AND NOT [S].[log_flag_InsertUpdateDelete] IS NULL
 OR NOT [T].[log_flag_InsertUpdateDelete] IS NULL
 AND [S].[log_flag_InsertUpdateDelete] IS NULL

--
--
INSERT INTO [repo].[GeneratorUspStep] (
 [usp_id]
 , [Number]
 , [Parent_Number]
 , [Name]
 , [has_logging]
 , [is_condition]
 , [is_inactive]
 , [is_SubProcedure]
 , [Statement]
 , [log_source_object]
 , [log_target_object]
 , [log_flag_InsertUpdateDelete]
 )
--,[info_01]
--,[info_02]
--,[info_03]
--,[info_04]
--,[info_05]
--,[info_06]
--,[info_07]
--,[info_08]
--,[info_09]
SELECT [usp_id]
 , [Number]
 , [Parent_Number]
 , [Name]
 , [has_logging]
 , [is_condition]
 , [is_inactive]
 , [is_SubProcedure]
 , [Statement]
 , [log_source_object]
 , [log_target_object]
 , [log_flag_InsertUpdateDelete]
FROM [repo].[GeneratorUspStep_Persistence] AS S
WHERE NOT EXISTS (
  SELECT 1
  FROM [repo].[GeneratorUspStep] AS [T]
  WHERE [T].[usp_id] = [S].[usp_id]
   AND [T].[Number] = [S].[Number]
  )

UPDATE step
SET [is_inactive] = [setpoint].[is_inactive]
FROM [repo].[GeneratorUspStep] [step]
INNER JOIN [repo].[GeneratorUspStep_Persistence_IsInactive_setpoint] [setpoint]
 ON [setpoint].[usp_id] = [step].[usp_id]
  AND [setpoint].[Number] = [step].[Number]
WHERE [setpoint].[is_inactive] <> [step].[is_inactive]