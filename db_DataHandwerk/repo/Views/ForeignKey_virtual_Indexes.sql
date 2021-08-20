



/*
<<property_start>>MS_Description
* mapping from xref:sqldb:repo.ForeignKey_virtual.adoc[] to referenced_index and referencing_indx
* can be used to find out missing [referenced_index_guid] or [referencing_index_guid] to create them using xref:sqldb:repo.usp_Index_virtual_set.adoc[]
<<property_end>>
*/

CREATE View repo.ForeignKey_virtual_Indexes
As
Select
    --
    fk.ForeignKey_guid
  , is_MatchingDatatypePattern             = Case
                                                 When i_1.IndexPatternColumnDatatype = i_2.IndexPatternColumnDatatype
                                                     Then
                                                     1
                                                 Else
                                                     0
                                             End
  , fk.ForeignKey_name
  , ForeignKey_fullname                    = Concat ( QuoteName ( i_1.SysObject_schema_name ), '.', QuoteName ( fk.ForeignKey_name ))
  , fk.referenced_index_guid
  , referenced_index_name                  = i_2.index_name
  , referenced_IndexPatternColumnDatatype  = i_2.IndexPatternColumnDatatype
  , referenced_IndexPatternColumnName      = i_2.IndexPatternColumnName
  , referenced_RepoObject_fullname         = i_2.RepoObject_fullname
  , referenced_RepoObject_fullname2        = i_2.RepoObject_fullname2
  , referenced_RepoObject_guid             = i_2.parent_RepoObject_guid
  , referenced_SysObject_name              = i_2.SysObject_name
  , referenced_SysObject_schema_name       = i_2.SysObject_schema_name
  , fk.referencing_index_guid
  , referencing_index_name                 = i_1.index_name
  , referencing_IndexPatternColumnDatatype = i_1.IndexPatternColumnDatatype
  , referencing_IndexPatternColumnName     = i_1.IndexPatternColumnName
  , referencing_RepoObject_fullname        = i_1.RepoObject_fullname
  , referencing_RepoObject_fullname2       = i_1.RepoObject_fullname2
  , referencing_RepoObject_guid            = i_1.parent_RepoObject_guid
  , referencing_SysObject_name             = i_1.SysObject_name
  , referencing_SysObject_schema_name      = i_1.SysObject_schema_name
  , fk.delete_referential_action
  , fk.update_referential_action
From
    repo.ForeignKey_virtual As fk
    Left Join
        repo.Index_gross    As i_1
            On
            i_1.index_guid = fk.referencing_index_guid

    Left Join
        repo.Index_gross    As i_2
            On
            i_2.index_guid = fk.referenced_index_guid
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b3d08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b2d08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_IndexPatternColumnName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b1d08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b0d08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'afd08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_IndexPatternColumnName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'aed08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'add08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'ForeignKey_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'acd08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'ForeignKey_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'abd08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'ForeignKey_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '80170058-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '98d69880-2874-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_IndexPatternColumnDatatype';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '97d69880-2874-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_IndexPatternColumnDatatype';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '96d69880-2874-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'is_MatchingDatatypePattern';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4cdf2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'update_referential_action';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4adf2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '49df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4bdf2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'delete_referential_action';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f8be898f-9381-eb11-84e9-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f7be898f-9381-eb11-84e9-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f6be898f-9381-eb11-84e9-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f5be898f-9381-eb11-84e9-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1725676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1625676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ab6b2118-b19a-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_index_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'aa6b2118-b19a-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_virtual_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_index_name';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[ForeignKey_virtual]
* [repo].[Index_gross]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'ForeignKey_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'ForeignKey_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'9E8AA10A-AB97-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'
* mapping from xref:sqldb:repo.ForeignKey_virtual.adoc[] to referenced_index and referencing_indx
* can be used to find out missing [referenced_index_guid] or [referencing_index_guid] to create them using xref:sqldb:repo.usp_Index_virtual_set.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.ForeignKey_Indexes_union.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.ForeignKey_virtual.adoc[]
* xref:repo.Index_gross.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[ForeignKey_virtual].[update_referential_action]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'update_referential_action';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[SysObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[SysObject_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[parent_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[RepoObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([RepoObject_schema_name],''.'',[RepoObject_name]))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[IndexPatternColumnName]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[IndexPatternColumnDatatype]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[index_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_index_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[ForeignKey_virtual].[referencing_index_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[SysObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[SysObject_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[parent_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[RepoObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([RepoObject_schema_name],''.'',[RepoObject_name]))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[IndexPatternColumnName]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[IndexPatternColumnDatatype]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[index_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_index_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[ForeignKey_virtual].[referenced_index_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[ForeignKey_virtual].[ForeignKey_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'ForeignKey_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[ForeignKey_virtual].[ForeignKey_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'ForeignKey_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[ForeignKey_virtual].[delete_referential_action]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_virtual_Indexes', @level2type = N'COLUMN', @level2name = N'delete_referential_action';

