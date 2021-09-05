
CREATE View repo.IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check
As
Select
    T1.index_guid
  , T1.is_descending_key
  , T1.referenced_RepoObject_guid
  , T1.index_column_id
  , T1.referenced_RepoObjectColumn_guid
  , T1.RowNumberInReferencing
  , T1.referencing_RepoObject_guid
  , T1.referencing_RepoObjectColumn_guid
  , iset.IndexPatternColumnDatatype
  , iset.IndexPatternColumnName
  , iset.IndexSemanticGroup
  , referenced_RepoObject_fullname    = ro1.RepoObject_fullname
  , referenced_RepoObjectColumn_name  = roc1.RepoObjectColumn_name
  , referencing_RepoObject_fullname   = ro2.RepoObject_fullname
  , referencing_RepoObjectColumn_name = roc2.RepoObjectColumn_name
From
    repo.IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T As T1
    Left Outer Join
        repo.RepoObjectColumn                                            As roc2
            On
            T1.referencing_RepoObjectColumn_guid = roc2.RepoObjectColumn_guid

    Left Outer Join
        repo.RepoObjectColumn                                            As roc1
            On
            T1.referenced_RepoObjectColumn_guid  = roc1.RepoObjectColumn_guid

    Left Outer Join
        repo.RepoObject                                                  As ro2
            On
            T1.referencing_RepoObject_guid       = ro2.RepoObject_guid

    Left Outer Join
        repo.RepoObject                                                  As ro1
            On
            T1.referenced_RepoObject_guid        = ro1.RepoObject_guid

    Left Outer Join
        repo.Index_Settings                                              As iset
            On
            T1.index_guid                        = iset.index_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '657159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a07159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'RowNumberInReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a97159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'referencing_RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a27159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'referencing_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a17159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a87159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a77159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9f7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9d7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a67159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9c7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'is_descending_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a57159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'IndexSemanticGroup';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a47159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a37159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9b7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9e7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'index_column_id';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.Index_Settings.adoc[]
* xref:repo.IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T.adoc[]
* xref:repo.RepoObject.adoc[]
* xref:repo.RepoObjectColumn.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the column. Is unique within the object.', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'referencing_RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the column. Is unique within the object.', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[Index_Settings]
* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T]
* [repo].[RepoObject]
* [repo].[RepoObjectColumn]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T].[RowNumberInReferencing]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'RowNumberInReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[RepoObjectColumn_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'referencing_RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T].[referencing_RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'referencing_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T].[referencing_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[RepoObjectColumn_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T].[referenced_RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T].[referenced_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T].[is_descending_key]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'is_descending_key';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_Settings].[IndexSemanticGroup]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'IndexSemanticGroup';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_Settings].[IndexPatternColumnName]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_Settings].[IndexPatternColumnDatatype]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T].[index_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T].[index_column_id]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check', @level2type = N'COLUMN', @level2name = N'index_column_id';

