


CREATE VIEW [docs].[ForeignKey_RelationScript]
AS
--
SELECT
 --
 [DbmlRelation] = CONCAT (
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
, [referenced_RepoObject_fullname]
, [referenced_RepoObject_guid]
, [referencing_RepoObject_fullname]
, [referencing_RepoObject_guid]
--, [ForeignKey_guid]
--, [is_MatchingDatatypePattern]
--, [ForeignKey_name]
--, [ForeignKey_fullname]
--, [referenced_index_guid]
--, [referenced_IndexPatternColumnDatatype]
--, [referenced_IndexPatternColumnName]
--, [referencing_index_guid]
--, [referencing_IndexPatternColumnDatatype]
--, [referencing_IndexPatternColumnName]
--, [delete_referential_action]
--, [update_referential_action]
FROM [repo].[ForeignKey_Indexes_union_T]
WHERE NOT [referenced_index_guid] IS NULL
 AND NOT [referencing_index_guid] IS NULL
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e479297f-447f-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ForeignKey_RelationScript', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e379297f-447f-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ForeignKey_RelationScript', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e279297f-447f-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ForeignKey_RelationScript', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e179297f-447f-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ForeignKey_RelationScript', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e079297f-447f-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ForeignKey_RelationScript', @level2type = N'COLUMN', @level2name = N'DbmlRelation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '05df2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ForeignKey_RelationScript';

