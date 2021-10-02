﻿

CREATE View [graph].[RepoObjectColumn_S]
As
Select
    --
    RepoObjectColumn_guid
  , RepoObjectColumn_fullname
  --we need to mark the column as nullable, because in [repo].[usp_sync_guid_RepoObjectColumn] in step 1010 it will be inherited into target: [Repo_is_nullable] = [scroc].[is_nullable] 
  , RepoObjectColumn_fullname2 = NullIf(RepoObjectColumn_fullname2, '')
  , RepoObjectColumn_name
  , RepoObjectColumn_type      = Repo_user_type_fullname
  , RepoObject_guid
  , RepoObject_fullname
  --we need to mark the column as nullable, because in [repo].[usp_sync_guid_RepoObjectColumn] in step 1010 it will be inherited into target: [Repo_is_nullable] = [scroc].[is_nullable] 
  , RepoObject_fullname2       = NullIf(RepoObject_fullname2, '')
  , RepoObject_type
From
    repo.RepoObjectColumn_gross
Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'a99fcdb3-3265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_S';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ae9fcdb3-3265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_name';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ad9fcdb3-3265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_guid';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b19fcdb3-3265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_type';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'af9fcdb3-3265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b09fcdb3-3265-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a32c2611-ba7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_fullname';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '774679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_type';


Go



Go
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[RepoObjectColumn_name]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';




Go



Go
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';




Go
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[RepoObject_type]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S', @level2type = N'COLUMN', @level2name = N'RepoObject_type';




Go



Go
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';




Go
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';




Go



Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0739cf17-0592-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_fullname2';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0839cf17-0592-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[RepoObjectColumn_gross]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S';


GO



GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoObjectColumn_gross.adoc[]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[RepoObjectColumn_fullname]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[Repo_user_type_fullname]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_type';

