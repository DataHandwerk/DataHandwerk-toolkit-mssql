CREATE VIEW repo.[DbmlRelationFK]
AS
--
SELECT
 --
 [DbmlRelationFK] = CONCAT (
  'Ref '
  , [ForeignKey_name]
  , ': '
  , QUOTENAME([referencing_RepoObject_fullname], '"')
  , '.('
  , [referencing_IndexPatternColumnName]
  , ')'
  --<: one-to-many. E.g: users.id < posts.user_id
  -->: many-to-one. E.g: posts.user_id > users.id
  ---: one-to-one. E.g: users.id - user_infos.user_id
  , ' > '
  , QUOTENAME([referenced_RepoObject_fullname], '"')
  , '.('
  , [referenced_IndexPatternColumnName]
  , ')'
  , '[delete: '
  , CASE [delete_referential_action]
   WHEN 0
    THEN 'no action'
   WHEN 1
    THEN 'Cascade'
   WHEN 2
    THEN 'Set null'
   WHEN 3
    THEN 'Set default'
   END
  , ', update: '
  , CASE [update_referential_action]
   WHEN 0
    THEN 'no action'
   WHEN 1
    THEN 'Cascade'
   WHEN 2
    THEN 'Set null'
   WHEN 3
    THEN 'Set default'
   END
  , ']'
  )
--, [ForeignKey_guid]
--, [referenced_RepoObject_fullname]
--, [referencing_RepoObject_fullname]
--, [is_MatchingDatatypePattern]
--, [ForeignKey_name]
--, [ForeignKey_fullname]
--, [referenced_index_guid]
--, [referenced_IndexPatternColumnDatatype]
--, [referenced_IndexPatternColumnName]
--, [referenced_RepoObject_guid]
--, [referencing_index_guid]
--, [referencing_IndexPatternColumnDatatype]
--, [referencing_IndexPatternColumnName]
--, [referencing_RepoObject_guid]
--, [delete_referential_action]
--, [update_referential_action]
FROM [repo].[ForeignKey_Index_guid_union]
WHERE NOT [referenced_index_guid] IS NULL
 AND NOT [referencing_index_guid] IS NULL
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '11df2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'DbmlRelationFK', @level2type = N'COLUMN', @level2name = N'DbmlRelationFK';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '05df2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'DbmlRelationFK';

