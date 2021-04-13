
/*
resolve Function 'T1 (NOLOCK)'
=> normalized_wo_nolock = 'T1'

(NOLOCK) needs to be extracted from children
*/
Create View [sqlparse].RepoObject_SqlModules_23_normalized_wo_nolock
As
--
Select
    T1.RepoObject_guid
  , T1.json_key
  , T1.SysObject_fullname
  , T1.normalized
  , normalized_wo_nolock = T2.child0_normalized
From
    [sqlparse].RepoObject_SqlModules_20_statement_children             As T1
    Cross Apply repo.ftv_sqlparse_children_pivot ( T1.children ) As T2
Where
    T1.class                 = 'Function'
    And T1.is_group          = 1
    And T2.child1_normalized = '(NOLOCK)';
--
--SELECT
--       [RepoObject_guid]
--     , [key]
--     , [SysObject_fullname]
--     , [normalized_wo_nolock] = [0]
--     --, [1]
--FROM
--(
--    SELECT
--           [T1].[RepoObject_guid]
--         , [T1].[key]
--         , [T1].[SysObject_fullname]
--         , [T1].[normalized]
--         , [T2_normalized] = [T2].[normalized]
--         , [T2_json_key] = [T2].[json_key]
--    FROM
--         repo.RepoObject__sql_modules_20_statement_children AS T1
--         CROSS APPLY
--         [repo].[ftv_sqlparse]([T1].[children]) AS T2
--    WHERE  [T1].[class] = 'Function'
--           AND [T1].[is_group] = 1
--) AS sourcetable PIVOT(MAX(T2_normalized) FOR T2_json_key IN(
--                                                             [0]
--                                                           , [1])) AS PivotTable
--WHERE [1] = '(NOLOCK)'
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '3990291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_23_normalized_wo_nolock';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'bff37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_23_normalized_wo_nolock'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'bdf37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_23_normalized_wo_nolock'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c1f37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_23_normalized_wo_nolock'
  , @level2type = N'COLUMN'
  , @level2name = N'normalized_wo_nolock';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c0f37926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_23_normalized_wo_nolock'
  , @level2type = N'COLUMN'
  , @level2name = N'normalized';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '34813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_23_normalized_wo_nolock'
  , @level2type = N'COLUMN'
  , @level2name = N'json_key';
Go

Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[SysObject_fullname]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_23_normalized_wo_nolock'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[RepoObject_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_23_normalized_wo_nolock'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[normalized]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_23_normalized_wo_nolock'
  , @level2type = N'COLUMN'
  , @level2name = N'normalized';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_20_statement_children].[json_key]'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_23_normalized_wo_nolock'
  , @level2type = N'COLUMN'
  , @level2name = N'json_key';
