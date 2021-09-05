


/*
Sollwert
jeder Index in [repo].[Index__virtual], der einen [referenced_index_guid] hat, der also geerbt wird
benötigt für diesen geerbten Index auch geerbte Spalten
alle benötigten Spalten werden hier aufgelistet

Setpoint:
each index in [repo].[Index__virtual], having a [referenced_index_guid] (the index is inherited)
also needs the columns
these required columns are listed here
this view is a "setpoint"
all these columns should exists in [repo].[IndexColumn__virtual]



isue:
some combinations of ([index_guid], [index_column_id]) are not unique
why?
because they have multiple [referencing_RepoObjectColumn_guid]
but this is wrong, only one referencing_RepoObjectColumn_guid is possible per [index_column_id]

=> [RowNumberInReferencing]



*/
CREATE View repo.IndexColumn_virtual_referenced_setpoint
As
--
Select
    i.index_guid                         --referencing index, which inherits columns from referenced index 
  , ic.index_column_id
  , ic.is_descending_key
  , ic.referencing_RepoObjectColumn_guid --columns in the referencing RepoObject
  , i.referenced_index_guid              --referenced index, which is the source for inherited columns 
  , i.RowNumberInReferencing
                                         --only for testing:
  , ic.referenced_RepoObjectColumn_guid
  , ic.referenced_RepoObject_guid
  , ic.referencing_RepoObject_guid
From
    repo.Index_virtual                                                       As i
    Inner Join
        repo.IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T As ic --setpoint belongs to the parent_RepoObject of the index
            On
            ic.referencing_RepoObject_guid = i.parent_RepoObject_guid
            --ic.index_guid is the referenced index (source index)
            And ic.index_guid              = i.referenced_index_guid
            And ic.RowNumberInReferencing  = i.RowNumberInReferencing
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '7d90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_referenced_setpoint';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f9f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'RowNumberInReferencing';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f7f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fcf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'faf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fbf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f8f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f6f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'is_descending_key';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f4f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f5f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'index_column_id';
Go

Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_virtual].[RowNumberInReferencing]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_virtual_referenced_setpoint', @level2type = N'COLUMN', @level2name = N'RowNumberInReferencing';


Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'the same index can be inherited several times into the same referenced object, if a source is used several times
for example
SELECT A_A = A.A, B_A = B.A from source_1 as A LEFT JOIN source_1 as B ON ... 
normaly these indexes should have different columns'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'RowNumberInReferencing';
Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T].[referencing_RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_virtual_referenced_setpoint', @level2type = N'COLUMN', @level2name = N'referencing_RepoObjectColumn_guid';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T].[referencing_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_virtual_referenced_setpoint', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T].[referenced_RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_virtual_referenced_setpoint', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_guid';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T].[referenced_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_virtual_referenced_setpoint', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_virtual].[referenced_index_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_virtual_referenced_setpoint', @level2type = N'COLUMN', @level2name = N'referenced_index_guid';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T].[is_descending_key]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_virtual_referenced_setpoint', @level2type = N'COLUMN', @level2name = N'is_descending_key';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_virtual].[index_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_virtual_referenced_setpoint', @level2type = N'COLUMN', @level2name = N'index_guid';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T].[index_column_id]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_virtual_referenced_setpoint', @level2type = N'COLUMN', @level2name = N'index_column_id';



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[Index_virtual]
* [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_virtual_referenced_setpoint';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'index_guid,index_column_id', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_virtual_referenced_setpoint';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'index_guid,index_column_id', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_virtual_referenced_setpoint';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,int', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_virtual_referenced_setpoint';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'439990FA-0896-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_virtual_referenced_setpoint';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.check_IndexColumn_virtual_referenced_setpoint.adoc[]
* xref:repo.usp_index_inheritance.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_virtual_referenced_setpoint';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.Index_virtual.adoc[]
* xref:repo.IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_virtual_referenced_setpoint';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_virtual_referenced_setpoint';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_virtual_referenced_setpoint';

