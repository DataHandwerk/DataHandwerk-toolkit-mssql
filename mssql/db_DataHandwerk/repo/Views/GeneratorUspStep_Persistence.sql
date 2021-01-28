

CREATE VIEW [repo].[GeneratorUspStep_Persistence]
AS
SELECT
 --
 [usp_id] = [gu].[id]
 , [Number] = 100
 , [Parent_Number] = NULL
 , [Name] = 'check for empty source'
 , [has_logging] = 0
 , [is_condition] = 1
 , [is_inactive] = 0
 , [is_SubProcedure] = 0
 , [Statement] = '--check for empty source
 (SELECT count(*) FROM ' + [ro].[persistence_source_SysObject_fullname] + ') = 0'
 , [log_source_object] = [ro].[persistence_source_SysObject_fullname]
 , [log_target_object] = CAST(NULL AS NVARCHAR(261))
 , [log_flag_InsertUpdateDelete] = ''
 --
 , [gu].[usp_fullname]
 , [ro].[RepoObject_guid]
FROM repo.RepoObject_gross AS ro
INNER JOIN repo.GeneratorUsp AS gu
 ON ro.RepoObject_schema_name = gu.usp_schema
  AND ro.usp_persistence_name = gu.usp_name

UNION ALL

SELECT
 --
 [usp_id] = [gu].[id]
 , [Number] = 110
 , [Parent_Number] = 100
 , [Name] = 'ERROR 50110: persistence source is empty'
 , [has_logging] = 0
 , [is_condition] = 0
 , [is_inactive] = 0
 , [is_SubProcedure] = 0
 , [Statement] = ' THROW 50110
  , ''persistence source is empty: ' + [ro].[persistence_source_SysObject_fullname] + '''
  , 1;
'
 , [log_source_object] = CAST(NULL AS NVARCHAR(261))
 , [log_target_object] = CAST(NULL AS NVARCHAR(261))
 , [log_flag_InsertUpdateDelete] = ''
 --
 , [gu].[usp_fullname]
 , [ro].[RepoObject_guid]
FROM repo.RepoObject_gross AS ro
INNER JOIN repo.GeneratorUsp AS gu
 ON ro.RepoObject_schema_name = gu.usp_schema
  AND ro.usp_persistence_name = gu.usp_name

UNION ALL

SELECT
 --
 [usp_id] = [gu].[id]
 , [Number] = 300
 , [Parent_Number] = NULL
 , [Name] = 'check duplicate per PK'
 , [has_logging] = 0
 , [is_condition] = 1
 , [is_inactive] = 0
 , [is_SubProcedure] = 0
 , [Statement] = '--check duplicate per PK
 EXISTS(SELECT TOP 1 1 FROM ' + [ro].[persistence_source_SysObject_fullname] + ' GROUP BY ' + [i].[ColumnList] + ' HAVING COUNT(*) > 1)'
 , [log_source_object] = [ro].[persistence_source_SysObject_fullname]
 , [log_target_object] = CAST(NULL AS NVARCHAR(261))
 , [log_flag_InsertUpdateDelete] = ''
 --
 , [gu].[usp_fullname]
 , [ro].[RepoObject_guid]
FROM repo.RepoObject_gross AS ro
INNER JOIN repo.GeneratorUsp AS gu
 ON ro.RepoObject_schema_name = gu.usp_schema
  AND ro.usp_persistence_name = gu.usp_name
--INNER JOIN because step 300 should be created only when PK exists in persistence_source
INNER JOIN repo.RepoObject_gross AS ro_s
 ON ro_s.[RepoObject_guid] = ro.[persistence_source_RepoObject_guid]
INNER JOIN [repo].[Index_ColumList] AS i
 ON i.[index_guid] = ro_s.[pk_index_guid]

UNION ALL

SELECT
 --we create 310 also, if 300 not exist, it will not be used in this case
 [usp_id] = [gu].[id]
 , [Number] = 310
 , [Parent_Number] = 300
 , [Name] = 'ERROR 50310: persistence source PK not unique'
 , [has_logging] = 0
 , [is_condition] = 0
 , [is_inactive] = 0
 , [is_SubProcedure] = 0
 , [Statement] = ' THROW 50310
  , ''persistence source PK not unique: ' + [ro].[persistence_source_SysObject_fullname] + '; ' + [i].[ColumnList] + '''
  , 1;
'
 , [log_source_object] = CAST(NULL AS NVARCHAR(261))
 , [log_target_object] = CAST(NULL AS NVARCHAR(261))
 , [log_flag_InsertUpdateDelete] = ''
 --
 , [gu].[usp_fullname]
 , [ro].[RepoObject_guid]
FROM repo.RepoObject_gross AS ro
INNER JOIN repo.GeneratorUsp AS gu
 ON ro.RepoObject_schema_name = gu.usp_schema
  AND ro.usp_persistence_name = gu.usp_name
--INNER JOIN because step 300 should be created only when PK exists in persistence_source
INNER JOIN repo.RepoObject_gross AS ro_s
 ON ro_s.[RepoObject_guid] = ro.[persistence_source_RepoObject_guid]
INNER JOIN [repo].[Index_ColumList] AS i
 ON i.[index_guid] = ro_s.[pk_index_guid]

UNION ALL

SELECT
 --
 [usp_id] = [gu].[id]
 , [Number] = 400
 , [Parent_Number] = NULL
 , [Name] = 'truncate persistence target'
 , [has_logging] = 1
 , [is_condition] = 0
 , [is_inactive] = 0
 , [is_SubProcedure] = 0
 , [Statement] = '--truncate persistence target
TRUNCATE TABLE ' + [ro].[RepoObject_fullname]
 , [log_source_object] = CAST(NULL AS NVARCHAR(261))
 , [log_target_object] = [ro].[RepoObject_fullname]
 , [log_flag_InsertUpdateDelete] = 'D'
 --
 , [gu].[usp_fullname]
 , [ro].[RepoObject_guid]
FROM repo.RepoObject_gross AS ro
INNER JOIN repo.GeneratorUsp AS gu
 ON ro.RepoObject_schema_name = gu.usp_schema
  AND ro.usp_persistence_name = gu.usp_name

UNION ALL

SELECT
 --
 [usp_id] = [gu].[id]
 , [Number] = 500
 , [Parent_Number] = NULL
 , [Name] = 'delete persistence target missing in source'
 , [has_logging] = 1
 , [is_condition] = 0
 , [is_inactive] = 0
 , [is_SubProcedure] = 0
 , [Statement] = '--delete persistence target missing in source
DELETE T
FROM ' + [ro].[RepoObject_fullname] + ' AS T
WHERE
NOT EXISTS
(SELECT 1 FROM ' + [ro].[persistence_source_SysObject_fullname] + ' AS S
WHERE
' + i.PersistenceWhereColumnList + ')
 '
 , [log_source_object] = [ro].[persistence_source_SysObject_fullname]
 , [log_target_object] = [ro].[RepoObject_fullname]
 , [log_flag_InsertUpdateDelete] = 'D'
 --
 , [gu].[usp_fullname]
 , [ro].[RepoObject_guid]
FROM repo.RepoObject_gross AS ro
INNER JOIN repo.GeneratorUsp AS gu
 ON ro.RepoObject_schema_name = gu.usp_schema
  AND ro.usp_persistence_name = gu.usp_name
--INNER JOIN because step 500 should be created only when PK exists in persistence_source
INNER JOIN repo.RepoObject_gross AS ro_s
 ON ro_s.[RepoObject_guid] = ro.[persistence_source_RepoObject_guid]
INNER JOIN [repo].[Index_ColumList] AS i
 ON i.[index_guid] = ro_s.[pk_index_guid]

UNION ALL

SELECT
 --
 [usp_id] = [gu].[id]
 , [Number] = 550
 , [Parent_Number] = NULL
 , [Name] = 'delete persistence target changed'
 , [has_logging] = 1
 , [is_condition] = 0
 , [is_inactive] = 0
 , [is_SubProcedure] = 0
 , [Statement] = '--delete persistence target changed
DELETE T
FROM ' + [ro].[RepoObject_fullname] + ' AS T
INNER JOIN ' + [ro].[persistence_source_SysObject_fullname] + ' AS S
ON
' + i.PersistenceWhereColumnList + '
WHERE
' + ro.[PersistenceCompareColumnList]
 , [log_source_object] = [ro].[persistence_source_SysObject_fullname]
 , [log_target_object] = [ro].[RepoObject_fullname]
 , [log_flag_InsertUpdateDelete] = 'D'
 --
 , [gu].[usp_fullname]
 , [ro].[RepoObject_guid]
FROM repo.RepoObject_gross AS ro
INNER JOIN repo.GeneratorUsp AS gu
 ON ro.RepoObject_schema_name = gu.usp_schema
  AND ro.usp_persistence_name = gu.usp_name
--INNER JOIN because step 500 should be created only when PK exists in persistence_source
INNER JOIN repo.RepoObject_gross AS ro_s
 ON ro_s.[RepoObject_guid] = ro.[persistence_source_RepoObject_guid]
INNER JOIN [repo].[Index_ColumList] AS i
 ON i.[index_guid] = ro_s.[pk_index_guid]

UNION ALL

SELECT
 --
 [usp_id] = [gu].[id]
 , [Number] = 600
 , [Parent_Number] = NULL
 , [Name] = 'update changed'
 , [has_logging] = 1
 , [is_condition] = 0
 , [is_inactive] = 0
 , [is_SubProcedure] = 0
 , [Statement] = '--update changed
UPDATE T
SET
' + ro.[PersistenceUpdateColumnList] + '
FROM ' + [ro].[RepoObject_fullname] + ' AS T
INNER JOIN ' + [ro].[persistence_source_SysObject_fullname] + ' AS S
ON
' + i.PersistenceWhereColumnList + '
WHERE
' + ro.[PersistenceCompareColumnList]
 , [log_source_object] = [ro].[persistence_source_SysObject_fullname]
 , [log_target_object] = [ro].[RepoObject_fullname]
 , [log_flag_InsertUpdateDelete] = 'U'
 --
 , [gu].[usp_fullname]
 , [ro].[RepoObject_guid]
FROM repo.RepoObject_gross AS ro
INNER JOIN repo.GeneratorUsp AS gu
 ON ro.RepoObject_schema_name = gu.usp_schema
  AND ro.usp_persistence_name = gu.usp_name
--INNER JOIN because step 500 should be created only when PK exists in persistence_source
INNER JOIN repo.RepoObject_gross AS ro_s
 ON ro_s.[RepoObject_guid] = ro.[persistence_source_RepoObject_guid]
INNER JOIN [repo].[Index_ColumList] AS i
 ON i.[index_guid] = ro_s.[pk_index_guid]

UNION ALL

SELECT
 --
 [usp_id] = [gu].[id]
 , [Number] = 700
 , [Parent_Number] = NULL
 , [Name] = 'insert missing'
 , [has_logging] = 1
 , [is_condition] = 0
 , [is_inactive] = 0
 , [is_SubProcedure] = 0
 , [Statement] = '--insert missing
INSERT INTO 
 ' + [ro].[RepoObject_fullname] + '
 (
' + ro.[PersistenceInsertColumnList] + ')
SELECT
' + ro.[PersistenceInsertColumnList] + '
FROM ' + [ro].[persistence_source_SysObject_fullname] + ' AS S
WHERE
NOT EXISTS
(SELECT 1
FROM ' + [ro].[RepoObject_fullname] + ' AS T
WHERE
' + i.PersistenceWhereColumnList + ')'
 , [log_source_object] = [ro].[persistence_source_SysObject_fullname]
 , [log_target_object] = [ro].[RepoObject_fullname]
 , [log_flag_InsertUpdateDelete] = 'I'
 --
 , [gu].[usp_fullname]
 , [ro].[RepoObject_guid]
FROM repo.RepoObject_gross AS ro
INNER JOIN repo.GeneratorUsp AS gu
 ON ro.RepoObject_schema_name = gu.usp_schema
  AND ro.usp_persistence_name = gu.usp_name
--INNER JOIN because step 500 should be created only when PK exists in persistence_source
INNER JOIN repo.RepoObject_gross AS ro_s
 ON ro_s.[RepoObject_guid] = ro.[persistence_source_RepoObject_guid]
INNER JOIN [repo].[Index_ColumList] AS i
 ON i.[index_guid] = ro_s.[pk_index_guid]
