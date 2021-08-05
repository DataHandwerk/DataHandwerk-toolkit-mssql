create view repo.IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check
as
select T1.index_guid
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
     , ro1.RepoObject_fullname    as referenced_RepoObject_fullname
     , roc1.RepoObjectColumn_name as referenced_RepoObjectColumn_name
     , ro2.RepoObject_fullname    as referencing_RepoObject_fullname
     , roc2.RepoObjectColumn_name as referencing_RepoObjectColumn_name
from repo.IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T as T1
    left outer join repo.RepoObjectColumn                                 as roc2
        on T1.referencing_RepoObjectColumn_guid = roc2.RepoObjectColumn_guid
    left outer join repo.RepoObjectColumn                                 as roc1
        on T1.referenced_RepoObjectColumn_guid = roc1.RepoObjectColumn_guid
    left outer join repo.RepoObject                                       as ro2
        on T1.referencing_RepoObject_guid = ro2.RepoObject_guid
    left outer join repo.RepoObject                                       as ro1
        on T1.referenced_RepoObject_guid = ro1.RepoObject_guid
    left outer join repo.Index_Settings                                   as iset
        on T1.index_guid = iset.index_guid
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

