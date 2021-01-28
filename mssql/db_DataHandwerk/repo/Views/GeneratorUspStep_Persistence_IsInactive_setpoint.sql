CREATE
 

 VIEW [repo].[GeneratorUspStep_Persistence_IsInactive_setpoint]
AS
WITH ro_u
AS (
 SELECT [u].[id] AS [usp_id]
  , [u].[usp_schema]
  , [u].[usp_name]
  , ro.[is_persistence_check_duplicate_per_pk]
  , [ro].[is_persistence_check_for_empty_source]
  , [ro].[is_persistence_delete_missing]
  , [ro].[is_persistence_delete_changed]
  , [ro].[is_persistence_insert]
  , [ro].[is_persistence_truncate]
  , [ro].[is_persistence_update_changed]
 FROM repo.RepoObject_gross AS ro
 INNER JOIN repo.GeneratorUsp AS u
  ON ro.RepoObject_schema_name = u.usp_schema
   AND ro.usp_persistence_name = u.usp_name
 )
SELECT
 --check for empty source
 [usp_id]
 , Number = 100
 , [is_inactive] = CASE [is_persistence_check_for_empty_source]
  WHEN 1
   THEN 0
  ELSE 1
  END
FROM ro_u

UNION ALL

SELECT
 --check duplicate per PK
 [usp_id]
 , Number = 300
 , [is_inactive] = CASE [is_persistence_check_duplicate_per_pk]
  WHEN 1
   THEN 0
  ELSE 1
  END
FROM ro_u

UNION ALL

SELECT
 --truncate persistence target
 [usp_id]
 , Number = 400
 , [is_inactive] = CASE [is_persistence_truncate]
  WHEN 1
   THEN 0
  ELSE 1
  END
FROM ro_u

UNION ALL

SELECT
 --delete persistence target missing in source
 --also do not delete if truncate, because there is nothing to delete after truncate
 [usp_id]
 , Number = 500
 , [is_inactive] = CASE 
  WHEN [is_persistence_truncate] = 1
   OR [is_persistence_delete_missing] = 0
   THEN 1
  ELSE 0
  END
FROM ro_u

UNION ALL

SELECT
 --delete persistence target changed
 --also do not delete if truncate, because there is nothing to delete after truncate
 [usp_id]
 , Number = 550
 , [is_inactive] = CASE 
  WHEN [is_persistence_truncate] = 1
   OR [is_persistence_delete_changed] = 0
   THEN 1
  ELSE 0
  END
FROM ro_u

UNION ALL

SELECT
 --update changed
 --also du not update after deleting changed or after truncate, because there is nothing to update
 [usp_id]
 , Number = 600
 , [is_inactive] = CASE 
  WHEN [is_persistence_truncate] = 1
   OR [is_persistence_delete_changed] = 1
   OR [is_persistence_update_changed] = 0
   THEN 1
  ELSE 0
  END
FROM ro_u

UNION ALL

SELECT
 --insert missing
 [usp_id]
 , Number = 700
 , [is_inactive] = CASE [is_persistence_insert]
  WHEN 1
   THEN 0
  ELSE 1
  END
FROM ro_u