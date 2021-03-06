﻿
CREATE View [repo].[ForeignKey_gross]
As
Select
    fk.ForeignKey_guid
  , fk.is_MatchingDatatypePattern
  , fk.ForeignKey_name
  , fk.ForeignKey_fullname
  , fk.referenced_index_guid
  , referenced_index_name  = refed.index_name
  , fk.referenced_IndexPatternColumnDatatype
  , fk.referenced_IndexPatternColumnName
  , fk.referenced_RepoObject_fullname
  , fk.referenced_RepoObject_fullname2
  , fk.referenced_RepoObject_guid
  , fk.referenced_SysObject_name
  , fk.referenced_SysObject_schema_name
  , fk.referencing_index_guid
  , referencing_index_name = refing.index_name
  , fk.referencing_IndexPatternColumnDatatype
  , fk.referencing_IndexPatternColumnName
  , fk.referencing_RepoObject_fullname
  , fk.referencing_RepoObject_fullname2
  , fk.referencing_RepoObject_guid
  , fk.referencing_SysObject_name
  , fk.referencing_SysObject_schema_name
  , fk.delete_referential_action
  , fk.update_referential_action
  , referenced_AntoraXref  =
  --
  Concat (
             --++ForeignKey_name++ xref:aaa.bbb.adoc#index-pk_ccc[+pk_ccc+]
             '++' + fk.ForeignKey_name + '++ +'
           , Char ( 13 ) + Char ( 10 )
           , 'referenced: xref:' + fk.referenced_RepoObject_fullname2 + '.adoc[], xref:'
             + fk.referenced_RepoObject_fullname2 + '.adoc#' + 'index-'
             + docs.fs_cleanStringForAnchorId ( refed.index_name ) + '[+' + refed.index_name + '+]'
         )
From
    repo.ForeignKey_Indexes_union_T fk
    Left Join
        repo.Index_gross            refed
            On
            refed.index_guid  = fk.referenced_index_guid

    Left Join
        repo.Index_gross            refing
            On
            refing.index_guid = fk.referencing_index_guid;
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1325676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_AntoraXref';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1225676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'update_referential_action';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1125676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'delete_referential_action';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1025676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0f25676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0e25676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0d25676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0c25676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0b25676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_IndexPatternColumnName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0a25676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_IndexPatternColumnDatatype';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0925676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_index_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0825676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0725676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0625676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0525676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0425676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0325676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0225676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_IndexPatternColumnName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0125676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_IndexPatternColumnDatatype';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0025676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_index_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ff24676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fe24676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'ForeignKey_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fd24676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'ForeignKey_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fc24676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'is_MatchingDatatypePattern';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fb24676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross'
  , @level2type = N'COLUMN'
  , @level2name = N'ForeignKey_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'fa24676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_gross';
