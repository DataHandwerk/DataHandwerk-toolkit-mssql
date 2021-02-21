CREATE VIEW repo.ForeignKey_IndexPattern
AS
SELECT
 --
 [constraint_object_id]
 , [ForeignKey_guid]
 , MAX([ForeignKey_name]) AS [ForeignKey_name]
 , MAX([ForeignKey_fullname]) AS [ForeignKey_fullname]
 , MAX([referencing_RepoObject_guid]) AS [referencing_RepoObject_guid]
 , MAX([referenced_RepoObject_guid]) AS [referenced_RepoObject_guid]
 , referencing_IndexPatternColumnName = String_Agg(referencing_column_name, ';') WITHIN
GROUP (
  ORDER BY [constraint_column_id]
  )
 -- , referencing_IndexPatternColumnGuid = String_Agg(CAST(referencing_RepoObjectColumn_guid AS VARCHAR(36)), ';') WITHIN
 --GROUP (
 --  ORDER BY [constraint_column_id]
 --  )
 , referenced_IndexPatternColumnName = String_Agg(referenced_column_name, ';') WITHIN
GROUP (
  ORDER BY [constraint_column_id]
  )
-- , referenced_IndexPatternColumnGuid = String_Agg(CAST(referenced_RepoObjectColumn_guid AS VARCHAR(36)), ';') WITHIN
--GROUP (
--  ORDER BY [constraint_column_id]
--  )
FROM [repo_sys].[ForeignKeyColumn]
GROUP BY [constraint_object_id]
 , [ForeignKey_guid]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7e170058-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_IndexPattern';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9ed08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_IndexPattern', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a0d08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_IndexPattern', @level2type = N'COLUMN', @level2name = N'referencing_IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9fd08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_IndexPattern', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a1d08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_IndexPattern', @level2type = N'COLUMN', @level2name = N'referenced_IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9cd08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_IndexPattern', @level2type = N'COLUMN', @level2name = N'ForeignKey_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9bd08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_IndexPattern', @level2type = N'COLUMN', @level2name = N'ForeignKey_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9dd08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_IndexPattern', @level2type = N'COLUMN', @level2name = N'ForeignKey_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9ad08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_IndexPattern', @level2type = N'COLUMN', @level2name = N'constraint_object_id';

