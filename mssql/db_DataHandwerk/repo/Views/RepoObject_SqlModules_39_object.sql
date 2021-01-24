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
LEFT OUTER JOIN repo.[RepoObject_SqlModules_32_object_class] AS T32_1
 ON T32_1.RepoObject_guid = T1.RepoObject_guid
  AND T32_1.class = 'IdentifierList'
LEFT OUTER JOIN repo.[RepoObject_SqlModules_32_object_class] AS T32_2
 ON T32_2.RepoObject_guid = T1.RepoObject_guid
  AND T32_2.class = 'WHERE'
LEFT OUTER JOIN repo.[RepoObject_SqlModules_33_object_normalized] AS T33_1
 ON T33_1.RepoObject_guid = T1.RepoObject_guid
  AND T33_1.normalized = 'FROM'
LEFT OUTER JOIN repo.[RepoObject_SqlModules_33_object_normalized] AS T33_2
 ON T33_2.RepoObject_guid = T1.RepoObject_guid
  AND T33_2.normalized = 'GROUP BY'
LEFT OUTER JOIN [repo].[RepoObject_SqlModules_26_object__union] AS T26
 ON T26.RepoObject_guid = T1.RepoObject_guid
LEFT OUTER JOIN [repo].[RepoObject_SqlModules_27_object__GroupBy] AS T27
 ON T27.RepoObject_guid = T1.RepoObject_guid
