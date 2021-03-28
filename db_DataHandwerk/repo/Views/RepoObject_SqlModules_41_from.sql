

/*
rows in [repo].[RepoObject__sql_modules_20_statement_children]
which define the first Block 
- between FROM and WHERE
- or between FROM and GROUP BY

Attention, this will not work for UNION to analyze all parts of the UNION
- we could get the first part
- we could get the part from the first from to a first where in another part of the UNION
*/

CREATE VIEW [repo].[RepoObject_SqlModules_41_from]
AS
--
SELECT
       [T1].[RepoObject_guid]
     , [T1].[json_key]
     , [T1].[SysObject_fullname]
     , [T1].[RowNumber_per_Object]
     , [T1].[class]
     , [T1].[is_group]
     , [T1].[is_keyword]
     , [T1].[is_whitespace]
     , [T1].[normalized]
     , [T1].[children]
     , [normalized_PatIndex_Select] = PATINDEX('%SELECT%' , [T1].[normalized])
     , [normalized_wo_nolock] = TRIM(REPLACE([T1].[normalized] , '(NOLOCK)' , ''))
       --, [T23_normalized_wo_nolock] = [T23].[normalized_wo_nolock]
     , [T2].[Min_RowNumber_From]
     , [T2].[Min_RowNumber_GroupBy]
     , [T2].[Min_RowNumber_Where]
     , [T22].[identifier_name]
     , [T22].[identifier_alias]
     , [t4].[join_type]
     , [is_join] = IIF(NOT [t4].[join_type] IS NULL , 1 , 0)
     , [is_from] = IIF([T1].[normalized] = 'FROM'
                       AND [T1].[is_keyword] = 1 , 1 , 0)
     , [patindex_nolock] = PATINDEX('%(NOLOCK)%' , [T1].[normalized])
FROM
     [repo].[RepoObject_SqlModules_20_statement_children] AS T1
     LEFT OUTER JOIN
     [repo].[RepoObject_SqlModules_39_object] AS T2
     ON T2.[RepoObject_guid] = T1.[RepoObject_guid]
     LEFT OUTER JOIN
     [repo].[RepoObject_SqlModules_22_identifier_alias_AS] AS T22
     ON T22.[RepoObject_guid] = T1.[RepoObject_guid]
        AND T22.[json_key] = T1.[json_key]
     --LEFT OUTER JOIN
     --[repo].[RepoObject__sql_modules_23_normalized_wo_nolock] AS T23
     --ON T23.[RepoObject_guid] = T1.[RepoObject_guid]
     --   AND T23.[key] = T1.[key]
     LEFT OUTER JOIN
     [config].[join_type] AS T4
     ON T4.[join_type_variant] = T1.normalized
        AND T1.is_keyword = 1
WHERE
--extract the FROM part:
--start: [Min_RowNumber_From]
[T2].[Min_RowNumber_From] <= [T1].[RowNumber_per_Object]
--ende: [Min_RowNumber_Where] or [Min_RowNumber_GroupBy]
AND ([T2].[Min_RowNumber_Where] IS NULL
     OR [T2].[Min_RowNumber_Where] > [T1].[RowNumber_per_Object])
AND ([T2].[Min_RowNumber_GroupBy] IS NULL
     OR [T2].[Min_RowNumber_GroupBy] > [T1].[RowNumber_per_Object])
--ORDER BY
--         [T1].[RepoObject_guid]
--       , [T1].[RowNumber_per_Object]

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3f90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fbf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fcf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'RowNumber_per_Object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f9f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0cf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'patindex_nolock';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '03f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'normalized_wo_nolock';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '01f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'normalized';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '06f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'Min_RowNumber_Where';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '05f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'Min_RowNumber_GroupBy';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '04f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'Min_RowNumber_From';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '09f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'join_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '00f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'is_whitespace';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fff37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'is_keyword';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0af47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'is_join';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fef37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'is_group';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0bf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'is_from';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '07f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'identifier_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '08f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'identifier_alias';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fdf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '02f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'children';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ff5bfbad-f063-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'normalized_PatIndex_Select';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '37813ebd-7764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'json_key';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'[repo].[join_type]
[repo].[RepoObject_SqlModules_20_statement_children]
[repo].[RepoObject_SqlModules_22_identifier_alias_AS]
[repo].[RepoObject_SqlModules_39_object]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[SysObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[RowNumber_per_Object]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'RowNumber_per_Object';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[normalized]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'normalized';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_SqlModules_39_object].[Min_RowNumber_Where]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'Min_RowNumber_Where';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_SqlModules_39_object].[Min_RowNumber_GroupBy]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'Min_RowNumber_GroupBy';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_SqlModules_39_object].[Min_RowNumber_From]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'Min_RowNumber_From';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[json_key]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'json_key';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[join_type].[join_type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'join_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[is_whitespace]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'is_whitespace';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[is_keyword]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'is_keyword';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[is_group]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'is_group';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_SqlModules_22_identifier_alias_AS].[identifier_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'identifier_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_SqlModules_22_identifier_alias_AS].[identifier_alias]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'identifier_alias';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[class]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'class';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[children]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlModules_41_from', @level2type = N'COLUMN', @level2name = N'children';

