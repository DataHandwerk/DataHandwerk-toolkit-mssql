
CREATE VIEW [repo].[RepoObjectColumn_RelationScript]
AS
--
SELECT DISTINCT
 --
 [referenced_RepoObject_guid]
 , [referencing_RepoObject_guid]
 , [DbmlRelation] = CONCAT (
  'Ref'
  , ': '
  , QUOTENAME(QUOTENAME([referencing_schema_name]) + '.' + QUOTENAME([referencing_entity_name]), '"')
  , '."'
  , [referencing_column_name]
  , '"'
  --<: one-to-many. E.g: users.id < posts.user_id
  -->: many-to-one. E.g: posts.user_id > users.id
  ---: one-to-one. E.g: users.id - user_infos.user_id
  , ' > '
  , QUOTENAME(QUOTENAME([referenced_schema_name]) + '.' + QUOTENAME([referenced_entity_name]), '"')
  , '."'
  , [referenced_column_name]
  , '"'
  )
FROM [repo].[RepoObjectColumn_reference_union] AS rocu
INNER JOIN [repo].[RepoObjectColumn] AS roc1
 ON roc1.RepoObjectColumn_guid = rocu.referencing_RepoObjectColumn_guid
INNER JOIN [repo].[RepoObjectColumn] AS roc2
 ON roc2.RepoObjectColumn_guid = rocu.referenced_RepoObjectColumn_guid
WHERE
 --exclude virtual columns, which have [uniqueidentifier] as name
 [roc1].[is_RepoObjectColumn_name_uniqueidentifier] = 0
 AND [roc2].[is_RepoObjectColumn_name_uniqueidentifier] = 0
 AND [roc1].[is_SysObjectColumn_name_uniqueidentifier] = 0
 AND [roc2].[is_SysObjectColumn_name_uniqueidentifier] = 0
 --AND NOT [referenced_RepoObjectColumn_guid] IS NULL
 --AND NOT [referencing_RepoObjectColumn_guid] IS NULL
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e779297f-447f-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RelationScript', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e679297f-447f-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RelationScript', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e579297f-447f-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RelationScript', @level2type = N'COLUMN', @level2name = N'DbmlRelation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '06df2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RelationScript';

