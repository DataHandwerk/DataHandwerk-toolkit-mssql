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