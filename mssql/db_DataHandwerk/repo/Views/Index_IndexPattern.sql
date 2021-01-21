
CREATE VIEW [repo].[Index_IndexPattern]
AS
--
Select [index_guid]
     , IndexPatternColumnName     = String_Agg (SysObject_column_name, ';') WITHIN Group(Order By [index_column_id])
     , IndexPatternColumnDatatype = String_Agg ([SysObject_column_user_type_fullname], ';') WITHIN Group(Order By [index_column_id])
From [repo].[IndexColumn__union]
Where Not [index_guid] Is Null
Group By [index_guid]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd25cc334-334f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_IndexPattern', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd35cc334-334f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_IndexPattern', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd15cc334-334f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_IndexPattern', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'c75cc334-334f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_IndexPattern';

