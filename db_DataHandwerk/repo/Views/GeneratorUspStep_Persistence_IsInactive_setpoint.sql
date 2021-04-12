
CREATE VIEW [repo].[GeneratorUspStep_Persistence_IsInactive_setpoint]
AS
WITH ro_u
AS (
 SELECT [u].[id] AS [usp_id]
  , [u].[usp_schema]
  , [u].[usp_name]
  , [ro].[is_persistence_check_duplicate_per_pk]
  , [ro].[is_persistence_check_for_empty_source]
  , [ro].[is_persistence_delete_missing]
  , [ro].[is_persistence_delete_changed]
  , [ro].[is_persistence_insert]
  , [ro].[is_persistence_truncate]
  , [ro].[is_persistence_update_changed]
  , [ro_s].[pk_index_guid] AS [source_pk_index_guid]
 FROM repo.RepoObject_gross AS ro
 INNER JOIN repo.GeneratorUsp AS u
  ON ro.RepoObject_schema_name = u.usp_schema
   AND ro.usp_persistence_name = u.usp_name
 LEFT JOIN repo.RepoObject_gross AS ro_s
  ON ro_s.[RepoObject_guid] = ro.[persistence_source_RepoObject_guid]
 )
SELECT
 --check for empty source
 [usp_id]
 , [Number] = 100
 , [is_inactive] = CASE [is_persistence_check_for_empty_source]
  WHEN 1
   THEN 0
  ELSE 1
  END
 , [source_pk_index_guid] -- required only for debugging
FROM ro_u

UNION ALL

SELECT
 --check duplicate per PK
 --also check existing PK
 [usp_id]
 , [Number] = 300
 , [is_inactive] = CASE 
  WHEN [is_persistence_check_duplicate_per_pk] = 1
   AND NOT ([source_pk_index_guid] IS NULL)
   THEN 0
  ELSE 1
  END
 , [source_pk_index_guid]
FROM ro_u

UNION ALL

SELECT
 --truncate persistence target
 [usp_id]
 , [Number] = 400
 , [is_inactive] = CASE [is_persistence_truncate]
  WHEN 1
   THEN 0
  ELSE 1
  END
 , [source_pk_index_guid]
FROM ro_u

UNION ALL

SELECT
 --delete persistence target missing in source
 --also do not delete if truncate, because there is nothing to delete after truncate
 --also check existing PK
 [usp_id]
 , [Number] = 500
 , [is_inactive] = CASE 
  WHEN [is_persistence_truncate] = 1
   OR [is_persistence_delete_missing] = 0
   OR [source_pk_index_guid] IS NULL
   THEN 1
  ELSE 0
  END
 , [source_pk_index_guid]
FROM ro_u

UNION ALL

SELECT
 --delete persistence target changed
 --also do not delete if truncate, because there is nothing to delete after truncate
 --also check existing PK
 [usp_id]
 , [Number] = 550
 , [is_inactive] = CASE 
  WHEN [is_persistence_truncate] = 1
   OR [is_persistence_delete_changed] = 0
   OR [source_pk_index_guid] IS NULL
   THEN 1
  ELSE 0
  END
 , [source_pk_index_guid]
FROM ro_u

UNION ALL

SELECT
 --update changed
 --also du not update after deleting changed or after truncate, because there is nothing to update
 --also check existing PK
 [usp_id]
 , [Number] = 600
 , [is_inactive] = CASE 
  WHEN [is_persistence_truncate] = 1
   OR [is_persistence_delete_changed] = 1
   OR [is_persistence_update_changed] = 0
   OR [source_pk_index_guid] IS NULL
   THEN 1
  ELSE 0
  END
 , [source_pk_index_guid]
FROM ro_u

UNION ALL

SELECT
 --insert missing
 --don't do this, if 'insert all' (in case of truncate)
 --also check existing PK
 [usp_id]
 , [Number] = 700
 , [is_inactive] = CASE 
  WHEN [is_persistence_insert] = 1
   AND NOT [is_persistence_truncate] = 1
   AND NOT ([source_pk_index_guid] IS NULL)
   THEN 0
  ELSE 1
  END
 , [source_pk_index_guid]
FROM ro_u

UNION ALL

SELECT
 --insert all
 --only in combination with truncate
 --possible enhancement: maybe some delete all is required, if truncate is not possible?
 [usp_id]
 , [Number] = 800
 , [is_inactive] = CASE 
  WHEN [is_persistence_truncate] = 1
   AND [is_persistence_insert] = 1
   THEN 0
  ELSE 1
  END
 , [source_pk_index_guid]
FROM ro_u
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7f90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Persistence_IsInactive_setpoint';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fdf67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Persistence_IsInactive_setpoint', @level2type = N'COLUMN', @level2name = N'usp_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fef67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Persistence_IsInactive_setpoint', @level2type = N'COLUMN', @level2name = N'Number';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fff67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Persistence_IsInactive_setpoint', @level2type = N'COLUMN', @level2name = N'is_inactive';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f630c24a-759b-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Persistence_IsInactive_setpoint', @level2type = N'COLUMN', @level2name = N'source_pk_index_guid';

