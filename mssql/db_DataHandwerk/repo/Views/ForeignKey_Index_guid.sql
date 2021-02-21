

/*
can be used to find out missing [referenced_index_guid] or [referencing_index_guid]
to create them using [repo].[usp_Index_insert]
*/

CREATE VIEW [repo].[ForeignKey_Index_guid]
AS
SELECT
 --
 [fk].[ForeignKey_guid]
 , [is_MatchingDatatypePattern] = CASE 
  WHEN [i_1].[IndexPatternColumnDatatype] = [i_2].[IndexPatternColumnDatatype]
   THEN 1
  ELSE 0
  END
 , [fk].[ForeignKey_name]
 , [fk].[ForeignKey_fullname]
 , [referenced_index_guid] = [i_2].[index_guid]
 , [referenced_IndexPatternColumnDatatype] = [i_2].[IndexPatternColumnDatatype]
 , [fk].[referenced_IndexPatternColumnName]
 , [fk].[referenced_RepoObject_guid]
 , [referencing_index_guid] = [i_1].[index_guid]
 , [referencing_IndexPatternColumnDatatype] = [i_1].[IndexPatternColumnDatatype]
 , [fk].[referencing_IndexPatternColumnName]
 , [fk].[referencing_RepoObject_guid]
FROM [repo].[ForeignKey_IndexPattern] AS fk
LEFT JOIN [repo].[Index_gross] AS i_1
 ON i_1.[parent_RepoObject_guid] = fk.[referencing_RepoObject_guid]
  AND i_1.[IndexPatternColumnName] = fk.[referencing_IndexPatternColumnName]
LEFT JOIN [repo].[Index_gross] AS i_2
 ON i_2.[parent_RepoObject_guid] = fk.[referenced_RepoObject_guid]
  AND i_2.[IndexPatternColumnName] = fk.[referenced_IndexPatternColumnName]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aad08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Index_guid', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a9d08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Index_guid', @level2type = N'COLUMN', @level2name = N'referencing_IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a8d08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Index_guid', @level2type = N'COLUMN', @level2name = N'referencing_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a7d08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Index_guid', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a6d08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Index_guid', @level2type = N'COLUMN', @level2name = N'referenced_IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a5d08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Index_guid', @level2type = N'COLUMN', @level2name = N'referenced_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a4d08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Index_guid', @level2type = N'COLUMN', @level2name = N'ForeignKey_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a3d08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Index_guid', @level2type = N'COLUMN', @level2name = N'ForeignKey_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a2d08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Index_guid', @level2type = N'COLUMN', @level2name = N'ForeignKey_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7f170058-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '95d69880-2874-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Index_guid', @level2type = N'COLUMN', @level2name = N'referencing_IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '94d69880-2874-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Index_guid', @level2type = N'COLUMN', @level2name = N'referenced_IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '93d69880-2874-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Index_guid', @level2type = N'COLUMN', @level2name = N'is_MatchingDatatypePattern';

