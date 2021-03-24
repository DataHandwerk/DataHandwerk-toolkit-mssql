
CREATE VIEW [repo].[RepoObject_SqlModules_39_object]
AS
--
SELECT [T1].[RepoObject_guid]
 , [is_create_view_Identifier_as_select] = [T31].[is_1_create] * [T31].[is_2_view] * [T31].[is_3_Identifier] * [T31].[is_4_as] * [T31].[is_5_select]
 , [is_select_IdentifierList_from] = [T31].[is_5_select] * [T31].[is_6_IdentifierList] * [T31].[is_7_from]
 , [Min_RowNumber_IdentifierList] = [T32_1].[Min_RowNumber_per_class]
 , [Min_RowNumber_From] = [T33_1].[Min_RowNumber_per_normalized]
 , [Min_RowNumber_GroupBy] = [T33_2].[Min_RowNumber_per_normalized]
 , [Min_RowNumber_Where] = [T32_2].[Min_RowNumber_per_class]
 --the following columns are for easy issue tracking
 , [ro].[SysObject_fullname]
 , [T31].[is_1_create]
 , [T31].[is_2_view]
 , [T31].[is_3_Identifier]
 , [T31].[is_4_as]
 , [T31].[is_5_select]
 , [T31].[is_6_Identifier]
 , [T31].[is_6_IdentifierList]
 , [T31].[is_7_from]
 , [T31].[is_7_IdentifierList]
 , [T31].[is_8_IdentifierList]
 , [t26].[is_union]
 , [t27].[has_GroupBy]
FROM repo.RepoObject_SqlModules AS T1
LEFT OUTER JOIN repo.RepoObject AS ro
 ON ro.RepoObject_guid = T1.RepoObject_guid
LEFT OUTER JOIN repo.[RepoObject_SqlModules_31_object] AS T31
 ON T31.RepoObject_guid = T1.RepoObject_guid
LEFT OUTER JOIN repo.[RepoObject_SqlModules_32_ObjectClass] AS T32_1
 ON T32_1.RepoObject_guid = T1.RepoObject_guid
  AND T32_1.class = 'IdentifierList'
LEFT OUTER JOIN repo.[RepoObject_SqlModules_32_ObjectClass] AS T32_2
 ON T32_2.RepoObject_guid = T1.RepoObject_guid
  AND T32_2.class = 'WHERE'
LEFT OUTER JOIN repo.[RepoObject_SqlModules_33_ObjectNormalized] AS T33_1
 ON T33_1.RepoObject_guid = T1.RepoObject_guid
  AND T33_1.normalized = 'FROM'
LEFT OUTER JOIN repo.[RepoObject_SqlModules_33_ObjectNormalized] AS T33_2
 ON T33_2.RepoObject_guid = T1.RepoObject_guid
  AND T33_2.normalized = 'GROUP BY'
LEFT OUTER JOIN [repo].[RepoObject_SqlModules_29_1_object_is_union] AS T26
 ON T26.RepoObject_guid = T1.RepoObject_guid
LEFT OUTER JOIN [repo].[RepoObject_SqlModules_29_2_object_is_GroupBy] AS T27
 ON T27.RepoObject_guid = T1.RepoObject_guid

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0190291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1df27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '16f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1cf27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object', @level2type = N'COLUMN', @level2name = N'Min_RowNumber_Where';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '19f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object', @level2type = N'COLUMN', @level2name = N'Min_RowNumber_IdentifierList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1bf27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object', @level2type = N'COLUMN', @level2name = N'Min_RowNumber_GroupBy';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1af27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object', @level2type = N'COLUMN', @level2name = N'Min_RowNumber_From';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '27f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object', @level2type = N'COLUMN', @level2name = N'is_union';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '18f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object', @level2type = N'COLUMN', @level2name = N'is_select_IdentifierList_from';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '17f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object', @level2type = N'COLUMN', @level2name = N'is_create_view_Identifier_as_select';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '26f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object', @level2type = N'COLUMN', @level2name = N'is_8_IdentifierList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '25f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object', @level2type = N'COLUMN', @level2name = N'is_7_IdentifierList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '24f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object', @level2type = N'COLUMN', @level2name = N'is_7_from';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '23f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object', @level2type = N'COLUMN', @level2name = N'is_6_IdentifierList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '22f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object', @level2type = N'COLUMN', @level2name = N'is_5_select';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '21f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object', @level2type = N'COLUMN', @level2name = N'is_4_as';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '20f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object', @level2type = N'COLUMN', @level2name = N'is_3_Identifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1ff27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object', @level2type = N'COLUMN', @level2name = N'is_2_view';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1ef27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object', @level2type = N'COLUMN', @level2name = N'is_1_create';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '28f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object', @level2type = N'COLUMN', @level2name = N'has_GroupBy';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '32813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_39_object', @level2type = N'COLUMN', @level2name = N'is_6_Identifier';

