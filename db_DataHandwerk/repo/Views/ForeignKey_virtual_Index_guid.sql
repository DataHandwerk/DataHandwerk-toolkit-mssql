﻿




CREATE VIEW [repo].[ForeignKey_virtual_Index_guid]
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
 , [ForeignKey_fullname] = CONCAT (
  QUOTENAME([i_1].[SysObject_schema_name])
  , '.'
  , QUOTENAME([fk].[ForeignKey_name])
  )
 , [fk].[referenced_index_guid]
 , [referenced_IndexPatternColumnDatatype] = [i_2].[IndexPatternColumnDatatype]
 , [referenced_IndexPatternColumnName] = [i_2].[IndexPatternColumnName]
 , [referenced_RepoObject_fullname] = [i_2].[RepoObject_fullname]
 , [referenced_RepoObject_fullname2] = [i_2].[RepoObject_fullname2]
 , [referenced_RepoObject_guid] = [i_2].[parent_RepoObject_guid]
 , [referenced_SysObject_name] = [i_2].[SysObject_name]
 , [referenced_SysObject_schema_name] = [i_2].[SysObject_schema_name]
 , [fk].[referencing_index_guid]
 , [referencing_IndexPatternColumnDatatype] = [i_1].[IndexPatternColumnDatatype]
 , [referencing_IndexPatternColumnName] = [i_1].[IndexPatternColumnName]
 , [referencing_RepoObject_fullname] = [i_1].[RepoObject_fullname]
 , [referencing_RepoObject_fullname2] = [i_1].[RepoObject_fullname2]
 , [referencing_RepoObject_guid] = [i_1].[parent_RepoObject_guid]
 , [referencing_SysObject_name] = [i_1].[SysObject_name]
 , [referencing_SysObject_schema_name] = [i_1].[SysObject_schema_name]
 , [delete_referential_action]
 , [update_referential_action]
FROM [repo].[ForeignKey_virtual] AS fk
LEFT JOIN [repo].[Index_gross] AS i_1
 ON i_1.[index_guid] = fk.[referencing_index_guid]
LEFT JOIN [repo].[Index_gross] AS i_2
 ON i_2.[index_guid] = fk.[referenced_index_guid]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b3d08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Index_guid', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b2d08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Index_guid', @level2type = N'COLUMN', @level2name = N'referencing_IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b1d08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Index_guid', @level2type = N'COLUMN', @level2name = N'referencing_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b0d08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Index_guid', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'afd08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Index_guid', @level2type = N'COLUMN', @level2name = N'referenced_IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aed08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Index_guid', @level2type = N'COLUMN', @level2name = N'referenced_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'add08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Index_guid', @level2type = N'COLUMN', @level2name = N'ForeignKey_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'acd08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Index_guid', @level2type = N'COLUMN', @level2name = N'ForeignKey_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'abd08365-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Index_guid', @level2type = N'COLUMN', @level2name = N'ForeignKey_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '80170058-c073-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '98d69880-2874-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Index_guid', @level2type = N'COLUMN', @level2name = N'referencing_IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '97d69880-2874-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Index_guid', @level2type = N'COLUMN', @level2name = N'referenced_IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '96d69880-2874-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Index_guid', @level2type = N'COLUMN', @level2name = N'is_MatchingDatatypePattern';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4cdf2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Index_guid', @level2type = N'COLUMN', @level2name = N'update_referential_action';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4adf2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Index_guid', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '49df2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Index_guid', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4bdf2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Index_guid', @level2type = N'COLUMN', @level2name = N'delete_referential_action';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f8be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Index_guid', @level2type = N'COLUMN', @level2name = N'referencing_SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f7be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Index_guid', @level2type = N'COLUMN', @level2name = N'referencing_SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f6be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Index_guid', @level2type = N'COLUMN', @level2name = N'referenced_SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f5be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Index_guid', @level2type = N'COLUMN', @level2name = N'referenced_SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1725676d-1797-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Index_guid', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1625676d-1797-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Index_guid', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname2';

