
--contains only PK or UNIQUE
--requirement:
-- - repo.Index_Settings.is_create_constraint = 1
-- - repo.Index_union.is_index_unique = 1
CREATE VIEW [repo].[Index_SqlConstraint_PkUq]
AS
SELECT [i].[index_guid]
 , [i].[parent_RepoObject_guid]
 , [SqlConstraint] = CONCAT (
  'CONSTRAINT '
  --todo missing name?
  , QUOTENAME([i].[index_name])
  , ' '
  , CASE 
   WHEN [i].[is_index_primary_key] = 1
    THEN 'PRIMARY KEY '
   WHEN [i].[is_index_unique] = 1
    THEN 'UNIQUE '
   END
  , CASE [i].[index_type]
   WHEN 1
    THEN 'CLUSTERED '
   WHEN 2
    THEN 'NONCLUSTERED '
   END
  , '('
  , [ColumnList].[ConstraintColumnList]
  , ')'
  )
-- , i.index_name
-- , i.index_type
-- , i.is_index_unique
-- , i.is_index_primary_key
-- --, i.referenced_index_guid
-- , i.is_index_disabled
----, i.is_index_real
----, i_s.is_create_constraint
FROM repo.Index_union AS i
LEFT OUTER JOIN repo.Index_Settings AS i_s
 ON i_s.index_guid = i.index_guid
LEFT OUTER JOIN repo.Index_ColumList AS ColumnList
 ON ColumnList.[index_guid] = i.[index_guid]
WHERE [i_s].[is_create_constraint] = 1
 AND [i].[is_index_unique] = 1
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7190291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_SqlConstraint_PkUq';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '87f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_SqlConstraint_PkUq', @level2type = N'COLUMN', @level2name = N'SqlConstraint';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '86f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_SqlConstraint_PkUq', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '85f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_SqlConstraint_PkUq', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'[repo].[Index_ColumList]
[repo].[Index_Settings]
[repo].[Index_union]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_SqlConstraint_PkUq';

