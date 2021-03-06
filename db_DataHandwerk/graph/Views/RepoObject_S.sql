﻿Create View graph.RepoObject_S
As
Select
    -- 
    RepoObject_guid
  , RepoObject_fullname
  --we need to mark the column as nullable, because in [repo].[usp_sync_guid_RepoObjectColumn] in step 1010 it will be inherited into target: [Repo_is_nullable] = [scroc].[is_nullable] 
  , NullIf(RepoObject_fullname2, '') As RepoObject_fullname2
  , RepoObject_type
From
    repo.RepoObject;
Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'a89fcdb3-3265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_S';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ac9fcdb3-3265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_type';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'aa9fcdb3-3265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ab9fcdb3-3265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';


Go



Go
Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[RepoObject_type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_type';


Go
Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'reference in [repo_sys].[type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_type';


Go
Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[RepoObject_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';


Go
Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject].[RepoObject_fullname]'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';


Go
Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0639cf17-0592-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname2';

