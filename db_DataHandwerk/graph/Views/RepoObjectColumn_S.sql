Create View graph.RepoObjectColumn_S
As
Select
    --
    RepoObjectColumn_guid
  , RepoObjectColumn_fullname
  --we need to mark the column as nullable, because in [repo].[usp_sync_guid_RepoObjectColumn] in step 1010 it will be inherited into target: [Repo_is_nullable] = [scroc].[is_nullable] 
  , NullIf(RepoObjectColumn_fullname2, '') As RepoObjectColumn_fullname2
  , RepoObjectColumn_name
  , Repo_user_type_fullname                As RepoObjectColumn_type
  , RepoObject_guid
  , RepoObject_fullname
  --we need to mark the column as nullable, because in [repo].[usp_sync_guid_RepoObjectColumn] in step 1010 it will be inherited into target: [Repo_is_nullable] = [scroc].[is_nullable] 
  , NullIf(RepoObject_fullname2, '')       As RepoObject_fullname2
  , RepoObject_type
From
    repo.RepoObjectColumn_gross;
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
Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn_gross].[RepoObjectColumn_name]'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_name';


Go
Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'Name of the column. Is unique within the object.'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_name';


Go
Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn_gross].[RepoObjectColumn_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_guid';


Go
Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn_gross].[RepoObject_type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_type';


Go
Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'reference in [repo_sys].[type]'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_type';


Go
Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn_gross].[RepoObject_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';


Go
Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectColumn_gross].[RepoObject_fullname]'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';


Go
Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))'
  , @level0type = N'SCHEMA'
  , @level0name = N'graph'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_S'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';


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
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObjectColumn_guid', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObjectColumn_guid', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'D88818B0-CA97-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:graph.RepoObjectColumn.adoc[]
* xref:graph.usp_PERSIST_RepoObjectColumn.adoc[]
* xref:repo.usp_sync_guid_RepoObjectColumn.adoc[]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoObjectColumn_gross.adoc[]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[RepoObjectColumn_fullname]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_S', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_fullname';

