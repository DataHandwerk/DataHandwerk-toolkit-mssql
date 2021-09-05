



/*
<<property_start>>MS_Description
list of conflicting entries which needs to be merged

mismatch of RepoObject_guid can create 2 entries per one RepoObject +
this can happen, if the guid exists in the database extended properties and a new guid will be created in the repo

* `RepoObject_guid` roc1 has the right RepoObject_fullname
* `ro2_RepoObject_guid` roc2 got a guid from database, but roc2 can't propagate the fullname into RepoObject because the RepoObject_fullname is occupied

now we have 2 entries, but we need to merge them

merge is done in `[repo].[usp_sync_guid_RepoObject]`

`'usp_id;Number;Parent_Number: ',8,';',710,';',700`
<<property_end>>

some history, how we started to investigate:

first we check where the RepoObject PK is used in FK

[source,sql]
------
--Returns logical foreign key information
EXEC sp_fkeys @pktable_name = N'RepoObject', @pktable_owner = N'repo';
------

we should care about

repo	RepoObject_persistence	target_RepoObject_guid
repo	ProcedureInstance	Procedure_RepoObject_guid

we will not care about

repo	Index_virtual	parent_RepoObject_guid
repo	RepoObject_SqlModules	RepoObject_guid
repo	RepoObjectColumn	RepoObject_guid
repo	RepoObjectProperty	RepoObject_guid
repo	RepoObjectSource_FirstResultSet	RepoObject_guid
repo	RepoObjectSource_QueryPlan	RepoObject_guid

*/
CREATE View repo.RepoObject_RequiredRepoObjectMerge
As
Select
    ro1.RepoObject_guid
  , ro2_RepoObject_guid        = ro2.RepoObject_guid
  , ro1.RepoObject_fullname
  , ro2_RepoObject_fullname    = ro2.RepoObject_fullname
  , ro1.SysObject_fullname
  , ro2_SysObject_fullname     = ro2.SysObject_fullname
  , ro1.RepoObject_name
  , ro1.RepoObject_schema_name
  , ro1.SysObject_name
  , ro1.SysObject_schema_name
  , ro2_RepoObject_name        = ro2.RepoObject_name
  , ro2_RepoObject_schema_name = ro2.RepoObject_schema_name
  , ro2_SysObject_name         = ro2.SysObject_name
From
    repo.RepoObject     As ro1
    Inner Join
        repo.RepoObject As ro2
            On
            ro2.SysObject_fullname  = ro1.RepoObject_fullname
            And ro2.RepoObject_guid <> ro1.RepoObject_guid
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f94a3013-3866-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_RequiredRepoObjectMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'ro2_SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f84a3013-3866-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_RequiredRepoObjectMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'ro2_RepoObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f74a3013-3866-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_RequiredRepoObjectMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'ro2_RepoObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f64a3013-3866-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_RequiredRepoObjectMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f54a3013-3866-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_RequiredRepoObjectMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f44a3013-3866-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_RequiredRepoObjectMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f34a3013-3866-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_RequiredRepoObjectMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f24a3013-3866-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_RequiredRepoObjectMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'ro2_SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f14a3013-3866-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_RequiredRepoObjectMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f04a3013-3866-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_RequiredRepoObjectMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'ro2_RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ef4a3013-3866-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_RequiredRepoObjectMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ee4a3013-3866-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_RequiredRepoObjectMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'ro2_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ed4a3013-3866-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_RequiredRepoObjectMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '52230f14-2e66-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_RequiredRepoObjectMerge';
Go

Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'SysObject_name';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(concat(''['',[SysObject_schema_name],''].['',[SysObject_name],'']''))'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_RequiredRepoObjectMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_RequiredRepoObjectMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[RepoObject]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = '575ab48d-129e-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'
list of conflicting entries which needs to be merged

mismatch of RepoObject_guid can create 2 entries per one RepoObject +
this can happen, if the guid exists in the database extended properties and a new guid will be created in the repo

* `RepoObject_guid` roc1 has the right RepoObject_fullname
* `ro2_RepoObject_guid` roc2 got a guid from database, but roc2 can''t propagate the fullname into RepoObject because the RepoObject_fullname is occupied

now we have 2 entries, but we need to merge them

merge is done in `[repo].[usp_sync_guid_RepoObject]`

`''usp_id;Number;Parent_Number: '',8,'';'',710,'';'',700`', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge';




GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.usp_sync_guid_RepoObject.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoObject.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[SysObject_schema_name],''].['',[SysObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'ro2_SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'ro2_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'ro2_SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'ro2_SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'ro2_RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'ro2_RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'ro2_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'ro2_RepoObject_fullname';

