
/*
<<property_start>>MS_Description
list of conflicting entries which needs to be merged

mismatch of RepoObjectColumn_guid can create 2 entries per one RepoObjectColumn +
this can happen, if the guid exists in the database extended properties and a new guid will be created in the repo

* roc1 has the right RepoObjectColumn_fullname, but the guid was new created
* roc2 got the "right" guid from database, but roc2 can't propagate the fullname into RepoObjectColumn because the RepoObjectColumn_fullname is occupied
now we have 2 entries, but we need to merge them

what we need to do in xref:sqldb.repo.usp_sync_guid_RepoObjectColumn[]

* keep roc1 (which has the right RepoObjectColumn_name)
** mark them set is_required_ColumnMerge = 1
* delete columns with RepoObjectColumn_guid in roc2_RepoObjectColumn_guid
* set SysObjectColumn_name = RepoObjectColumn_name (for roc1, for marked columns)
* remove marker where SysObjectColumn_name = RepoObjectColumn_name

<<property_end>>
*/
CREATE View repo.RepoObjectColumn_RequiredRepoObjectColumnMerge
As
Select
    --
    roc1.RepoObject_guid
  , roc1.RepoObjectColumn_guid
  , roc1.is_RepoObjectColumn_name_uniqueidentifier
  , roc1.is_SysObjectColumn_name_uniqueidentifier
  , roc1.persistence_source_RepoObjectColumn_guid
  , roc1.RepoObjectColumn_name
  , roc1.SysObjectColumn_name
  , roc2.persistence_source_RepoObjectColumn_guid As roc2_persistence_source_RepoObjectColumn_guid
  , roc2.RepoObjectColumn_guid                    As roc2_RepoObjectColumn_guid
  , roc2.RepoObjectColumn_name                    As roc2_RepoObjectColumn_name
  , roc2.SysObjectColumn_name                     As roc2_SysObjectColumn_name
From
    repo.RepoObjectColumn     As roc1
    Inner Join
        repo.RepoObjectColumn As roc2
            On
            roc2.RepoObject_guid           = roc1.RepoObject_guid
            And roc2.SysObjectColumn_name  = roc1.RepoObjectColumn_name
            And roc2.RepoObjectColumn_guid <> roc1.RepoObjectColumn_guid;
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '911aae52-a19b-eb11-84f6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'roc2_SysObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '901aae52-a19b-eb11-84f6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'roc2_RepoObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8f1aae52-a19b-eb11-84f6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'roc2_RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8e1aae52-a19b-eb11-84f6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'roc2_persistence_source_RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8d1aae52-a19b-eb11-84f6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8c1aae52-a19b-eb11-84f6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8b1aae52-a19b-eb11-84f6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'persistence_source_RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8a1aae52-a19b-eb11-84f6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'is_SysObjectColumn_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '891aae52-a19b-eb11-84f6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'is_RepoObjectColumn_name_uniqueidentifier';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '881aae52-a19b-eb11-84f6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '871aae52-a19b-eb11-84f6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '861aae52-a19b-eb11-84f6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[RepoObjectColumn]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'
list of conflicting entries which needs to be merged

mismatch of RepoObjectColumn_guid can create 2 entries per one RepoObjectColumn +
this can happen, if the guid exists in the database extended properties and a new guid will be created in the repo

* roc1 has the right RepoObjectColumn_fullname, but the guid was new created
* roc2 got the "right" guid from database, but roc2 can''t propagate the fullname into RepoObjectColumn because the RepoObjectColumn_fullname is occupied
now we have 2 entries, but we need to merge them

what we need to do in xref:sqldb.repo.usp_sync_guid_RepoObjectColumn[]

* keep roc1 (which has the right RepoObjectColumn_name)
** mark them set is_required_ColumnMerge = 1
* delete columns with RepoObjectColumn_guid in roc2_RepoObjectColumn_guid
* set SysObjectColumn_name = RepoObjectColumn_name (for roc1, for marked columns)
* remove marker where SysObjectColumn_name = RepoObjectColumn_name
', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.usp_sync_guid_RepoObjectColumn.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoObjectColumn.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[SysObjectColumn_name]
* [repo].[RepoObjectColumn].[SysObjectColumn_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge', @level2type = N'COLUMN', @level2name = N'SysObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the column. Is unique within the object.
if it not exists in the database, the RepoObject_guid or any other guid is used, because this column should not be empty', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge', @level2type = N'COLUMN', @level2name = N'SysObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the column. Is unique within the object.
if it not exists in the database, the RepoObject_guid or any other guid is used, because this column should not be empty', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge', @level2type = N'COLUMN', @level2name = N'roc2_SysObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the column. Is unique within the object.', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge', @level2type = N'COLUMN', @level2name = N'roc2_RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[RepoObjectColumn_name]
* [repo].[RepoObjectColumn].[RepoObjectColumn_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the column. Is unique within the object.', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[RepoObjectColumn_guid]
* [repo].[RepoObjectColumn].[RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[persistence_source_RepoObjectColumn_guid]
* [repo].[RepoObjectColumn].[persistence_source_RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[is_SysObjectColumn_name_uniqueidentifier]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge', @level2type = N'COLUMN', @level2name = N'is_SysObjectColumn_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(case when TRY_CAST([SysObjectColumn_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end)', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge', @level2type = N'COLUMN', @level2name = N'is_SysObjectColumn_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[is_RepoObjectColumn_name_uniqueidentifier]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge', @level2type = N'COLUMN', @level2name = N'is_RepoObjectColumn_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(case when TRY_CAST([RepoObjectColumn_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end)', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RequiredRepoObjectColumnMerge', @level2type = N'COLUMN', @level2name = N'is_RepoObjectColumn_name_uniqueidentifier';

