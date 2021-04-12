
--todo IdentifierList
--done: bad performance => Persistence of [repo].[RepoObject_SqlModules_41_from]
Create View repo.RepoObject_SqlModules_42_from_Identifier
As
--
Select
    --
    T1.RepoObject_guid
  , T1.json_key
  , T1.SysObject_fullname
  , T1.class
  , T1.RowNumber_per_Object
  --todo: we need extra handling when the result of [name] is an IdentifierList and need to exclude them here
  , name                     = Coalesce ( T1.identifier_name, T1.normalized_wo_nolock )
  , name_charindex_dot       = CharIndex ( '.', Coalesce ( T1.identifier_name, T1.normalized_wo_nolock ))
  --some alias we can get from [T1].[identifier_alias]
  --but in case of aaa (NOLOCK) the alias is on the next row: [lag].[normalized_wo_nolock]
  , alias                    = Coalesce ( T1.identifier_alias, lag.normalized_wo_nolock )
  , T1_identifier_alias      = T1.identifier_alias
  , lag_normalized_wo_nolock = lag.normalized_wo_nolock
--, [pre_is_join] = [pre].[is_join]
--, [pre_is_from] = [pre].[is_from]
--, [T1].[patindex_nolock]
--, [lag_patindex_nolock] = [lag].[patindex_nolock]
--, [T1].[SysObject_fullname]
--, [T1].[is_group]
--, [T1].[is_keyword]
--, [T1].[is_whitespace]
--, [T1].[normalized]
--  --,T1.[children]
--, [T1].[normalized_wo_nolock]
--, [T1].[Min_RowNumber_From]
--, [T1].[Min_RowNumber_Where]
--, [T1].[identifier_name]
--, [T1].[identifier_alias]
--, [T1].[join_type]
--, [T1].[is_join]
--, [T1].[is_from]
From
    repo.RepoObject_SqlModules_41_from_T     As T1
    --required filter
    --the predecessor (by [RowNumber_per_Object]) of T1 should be (is_from or is_join)
    --then often T1 contains an identifier
    --todo: sometimes an Identifier is a SELECT statement like '(SELECT ... FROM ...) as abc'
    Inner Join
        repo.RepoObject_SqlModules_41_from_T As pre
            On
            pre.RepoObject_guid              = T1.RepoObject_guid
            And pre.RowNumber_per_Object + 1 = T1.RowNumber_per_Object
            And
            (
                pre.is_join                  = 1
                Or pre.is_from               = 1
            )
    --to extract some alias we need the folowing entry (lag 1)

    Left Outer Join
    (
        Select
            T1.RepoObject_guid
          , T1.RowNumber_per_Object
          , T1.normalized_wo_nolock
        --, [T1].[json_key]
        --, [T1].[SysObject_fullname]
        --, [T1].[class]
        --, [T1].[is_group]
        --, [T1].[is_keyword]
        --, [T1].[is_whitespace]
        --, [T1].[normalized]
        --, [T1].[children]
        --, [T1].[Min_RowNumber_From]
        --, [T1].[Min_RowNumber_GroupBy]
        --, [T1].[Min_RowNumber_Where]
        --, [T1].[identifier_name]
        --, [T1].[identifier_alias]
        --, [T1].[join_type]
        --, [T1].[is_join]
        --, [T1].[is_from]
        --, [T1].[patindex_nolock]
        From
            repo.RepoObject_SqlModules_41_from_T As T1
        Where
            T1.patindex_nolock > 0
    )                                        As lag
        On
        lag.RepoObject_guid                  = T1.RepoObject_guid
        And lag.RowNumber_per_Object - 1     = T1.RowNumber_per_Object
Where
    --we can extract only 'Identifier'
    T1.class                          = 'Identifier'
    --but even using this filter sometimes we get something different, for exampe a select statement
    --we will not handle them
    And T1.normalized_PatIndex_Select = 0
    --exclude UNION
    And Not Exists
(
    Select
        1
    From
        repo.RepoObject_SqlModules_29_1_object_is_union As filter
    Where
        filter.RepoObject_guid = T1.RepoObject_guid
);
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '4190291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_42_from_Identifier';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '12f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_42_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'T1_identifier_alias';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0ff47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_42_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'RowNumber_per_Object';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0df47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_42_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '10f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_42_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '13f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_42_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'lag_normalized_wo_nolock';
Go

Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '11f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_42_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'alias';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '005cfbad-f063-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_42_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '025cfbad-f063-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_42_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'name_charindex_dot';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '015cfbad-f063-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_42_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'class';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '38813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_42_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'json_key';
Go

Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_41_from_T].[identifier_alias]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_42_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'T1_identifier_alias';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_41_from_T].[SysObject_fullname]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_42_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_41_from_T].[RowNumber_per_Object]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_42_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'RowNumber_per_Object';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_41_from_T].[RepoObject_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_42_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_41_from_T].[json_key]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_42_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'json_key';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_SqlModules_41_from_T].[class]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_42_from_Identifier'
  , @level2type = N'COLUMN'
  , @level2name = N'class';
