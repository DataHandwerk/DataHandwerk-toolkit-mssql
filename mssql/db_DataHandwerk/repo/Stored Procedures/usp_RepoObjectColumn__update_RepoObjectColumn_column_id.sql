/*
exec repo.usp_RepoObjectColumn__update_RepoObjectColumn_column_id

exec repo.usp_RepoObjectColumn__update_RepoObjectColumn_column_id
@RepoObject_guid = '7E756329-D857-EB11-84D8-A81E8446D5B0'

*/
--if @RepoObject_guid = NULL then all RepoObject will be updated
--@OrderBy is defined by a parameter: 'RepoObjectColumn_column_id_OrderBy'
CREATE PROCEDURE [repo].[usp_RepoObjectColumn__update_RepoObjectColumn_column_id] (@RepoObject_guid UNIQUEIDENTIFIER = NULL)
AS
DECLARE @OrderBy NVARCHAR(1000)
DECLARE @sqlCommand NVARCHAR(4000)

--set @RepoObject_guid = '7E756329-D857-EB11-84D8-A81E8446D5B0'
SET @OrderBy = CAST((
   SELECT [repo].[fs_get_parameter_value]('RepoObjectColumn_column_id_OrderBy', DEFAULT)
   ) AS NVARCHAR(1000))
--'
--[roc].[Repo_is_identity]
--, [roc].[Repo_is_computed]
--, ISNULL([ic].[index_column_id] , 99999) --ensure PK index is sorted before other columns
--, [roc].[Repo_generated_always_type]
--, [roc].[RepoObjectColumn_name]
--'
--	SET @sqlCommand = '
--SELECT
--     [roc].[RepoObjectColumn_guid]
--     ,  [RepoObjectColumn_column_id_setpoint] = ROW_NUMBER() OVER(PARTITION BY [roc].[RepoObject_guid]
--       ORDER BY
--       --
--' + @OrderBy + '
--       --
--       )
--     , [roc].[RepoObjectColumn_column_id]
--     , [roc].[RepoObject_guid]
--     , [roc].[Repo_is_identity]
--     , [roc].[Repo_is_computed]
--     , [ic].[index_column_id]
--     , [ic].[is_index_primary_key]
--     , [roc].[Repo_generated_always_type]
--     , [roc].[SysObjectColumn_column_id]
--     , [roc].[RepoObjectColumn_name]
--FROM
--     [repo].[RepoObjectColumn] AS roc
--     LEFT JOIN
--     [repo].[IndexColumn_union] AS ic
--     ON ic.RepoObjectColumn_guid = roc.RepoObjectColumn_guid
--        AND ic.[is_index_primary_key] = 1
--WHERE
----not [is_query_plan_expression]
--[is_query_plan_expression] IS NULL
----we need the datatype
--AND NOT [Repo_user_type_fullname] IS NULL
--'
--	IF NOT @RepoObject_guid IS NULL
--		SET @sqlCommand = @sqlCommand + '
--AND [roc].[RepoObject_guid] = @RepoObject_guid
--'
SET @sqlCommand = CONCAT (
  '
UPDATE roc
SET [RepoObjectColumn_column_id] = rocg.[RepoObjectColumn_column_id_setpoint]
FROM repo.RepoObjectColumn roc
LEFT JOIN (
 SELECT [roc].[RepoObjectColumn_guid]
  , [RepoObjectColumn_column_id_setpoint] = ROW_NUMBER() OVER (
   PARTITION BY [roc].[RepoObject_guid] ORDER BY
       --
'
  , @OrderBy
  , '
       --
   )
  , [roc].[RepoObjectColumn_column_id]
  , [roc].[RepoObject_guid]
  , [roc].[Repo_is_identity]
  , [roc].[Repo_is_computed]
  , [ic].[index_column_id]
  , [ic].[is_index_primary_key]
  , [roc].[Repo_generated_always_type]
  , [roc].[SysObjectColumn_column_id]
  , [roc].[RepoObjectColumn_name]
 FROM [repo].[RepoObjectColumn] AS roc
 LEFT JOIN [repo].[IndexColumn_union] AS ic
  ON ic.RepoObjectColumn_guid = roc.RepoObjectColumn_guid
   AND ic.[is_index_primary_key] = 1
 WHERE
  --not [is_query_plan_expression]
  [is_query_plan_expression] IS NULL
  --we need the datatype
  AND NOT [roc].[Repo_user_type_fullname] IS NULL
'
  , CASE 
   WHEN NOT @RepoObject_guid IS NULL
    THEN ' AND [roc].[RepoObject_guid] = @RepoObject_guid
'
   END
  , ' ) rocg
 ON rocg.[RepoObjectColumn_guid] = roc.RepoObjectColumn_guid
WHERE rocg.[RepoObjectColumn_column_id_setpoint] <> ISNULL(roc.RepoObjectColumn_column_id, 0)
'
  )

PRINT @sqlCommand

--EXECUTE sp_executesql @sqlCommand
EXECUTE sp_executesql @sqlCommand
 , N'@RepoObject_guid uniqueidentifier'
 , @RepoObject_guid = @RepoObject_guid
