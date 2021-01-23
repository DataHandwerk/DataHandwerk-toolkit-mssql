
-- Alter View Index_union
CREATE VIEW [repo].[Index_union]
AS
--
SELECT
       [index_guid]
     , [parent_RepoObject_guid]
     , [index_name]
     , [is_index_unique]
     , [is_index_primary_key]
     , [referenced_index_guid] = NULL
     , [is_index_disabled]
     , [is_index_real] = CAST(1 AS BIT)
FROM
     repo_sys.Index__real_unique
UNION ALL
SELECT
       [index_guid]
     , [parent_RepoObject_guid]
     , [index_name]
     , [is_index_unique]
     , [is_index_primary_key]
     , [referenced_index_guid]
     , [is_index_disabled]
     , [is_index_real] = CAST(0 AS BIT)
FROM
     repo.Index__virtual