
CREATE VIEW [repo].[RepoObject__sql_modules_39_object]
AS
--
SELECT
       [T1].[RepoObject_guid]
     , [is_create_view_Identifier_as_select] = [T31].[is_1_create] * [T31].[is_2_view] * [T31].[is_3_Identifier] * [T31].[is_4_as] * [T31].[is_5_select]
     , [is_select_IdentifierList_from] = [T31].[is_5_select] * [T31].[is_6_IdentifierList] * [T31].[is_7_from]
     , [Min_RowNumber_IdentifierList] = [T32_1].[Min_RowNumber_per_class]
     , [Min_RowNumber_Where] = [T32_2].[Min_RowNumber_per_class]
     , [Min_RowNumber_From] = [T33_1].[Min_RowNumber_per_normalized]
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
FROM
     repo.RepoObject__sql_modules AS T1
     LEFT OUTER JOIN
     repo.RepoObject AS ro
     ON ro.RepoObject_guid = T1.RepoObject_guid
     LEFT OUTER JOIN
     repo.RepoObject__sql_modules_31_object AS T31
     ON T31.RepoObject_guid = T1.RepoObject_guid
     LEFT OUTER JOIN
     repo.RepoObject__sql_modules_32_object_class AS T32_1
     ON T32_1.RepoObject_guid = T1.RepoObject_guid
        AND T32_1.class = 'IdentifierList'
     LEFT OUTER JOIN
     repo.RepoObject__sql_modules_32_object_class AS T32_2
     ON T32_2.RepoObject_guid = T1.RepoObject_guid
        AND T32_2.class = 'WHERE'
     LEFT OUTER JOIN
     repo.RepoObject__sql_modules_33_object_normalized AS T33_1
     ON T33_1.RepoObject_guid = T1.RepoObject_guid
        AND T33_1.normalized = 'FROM'