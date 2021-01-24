CREATE VIEW [repo].[Index_union]
AS
--
SELECT [Index_guid]
 , [parent_RepoObject_guid]
 , [index_name]
 , [is_index_unique]
 , [is_index_primary_key]
 , [referenced_index_guid] = NULL
 , [is_index_disabled]
 , [is_index_real] = CAST(1 AS BIT)
FROM repo_sys.[Index_real_unique]

UNION ALL

SELECT [Index_guid]
 , [parent_RepoObject_guid]
 , [index_name]
 , [is_index_unique]
 , [is_index_primary_key]
 , [referenced_index_guid]
 , [is_index_disabled]
 , [is_index_real] = CAST(0 AS BIT)
FROM repo.[Index_virtual]
