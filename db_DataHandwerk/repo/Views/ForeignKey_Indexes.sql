





/*
<<property_start>>Description
* mapping from xref:sqldb:repo.foreignkey_indexpattern.adoc[] to referenced_index and referencing_indx
* can be used to find out missing [referenced_index_guid] or [referencing_index_guid] to create them using xref:sqldb:repo.usp_index_virtual_set.adoc[]
<<property_end>>
*/
CREATE View [repo].[ForeignKey_Indexes]
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
  , fk.ForeignKey_fullname
  , referenced_index_guid                  = i_2.index_guid
  , referenced_index_name                  = i_2.index_name
  , referenced_IndexPatternColumnDatatype  = i_2.IndexPatternColumnDatatype
  , fk.referenced_IndexPatternColumnName
  , referenced_RepoObject_fullname         = i_2.RepoObject_fullname
  , referenced_RepoObject_fullname2        = i_2.RepoObject_fullname2
  , fk.referenced_RepoObject_guid
  , referenced_SysObject_name              = i_2.SysObject_name
  , referenced_SysObject_schema_name       = i_2.SysObject_schema_name
  , referencing_index_guid                 = i_1.index_guid
  , referencing_index_name                 = i_1.index_name
  , referencing_IndexPatternColumnDatatype = i_1.IndexPatternColumnDatatype
  , fk.referencing_IndexPatternColumnName
  , referencing_RepoObject_fullname        = i_1.RepoObject_fullname
  , referencing_RepoObject_fullname2       = i_1.RepoObject_fullname2
  , fk.referencing_RepoObject_guid
  , referencing_SysObject_name             = i_1.SysObject_name
  , referencing_SysObject_schema_name      = i_1.SysObject_schema_name
  , fk.delete_referential_action
  , fk.update_referential_action
From
    repo.ForeignKey_IndexPattern As fk
    Left Join
        repo.Index_gross         As i_1
            On
            i_1.parent_RepoObject_guid     = fk.referencing_RepoObject_guid
            And i_1.IndexPatternColumnName = fk.referencing_IndexPatternColumnName

    Left Join
        repo.Index_gross         As i_2
            On
            i_2.parent_RepoObject_guid     = fk.referenced_RepoObject_guid
            And i_2.IndexPatternColumnName = fk.referenced_IndexPatternColumnName
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'aad08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a9d08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_IndexPatternColumnName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a8d08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a7d08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a6d08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_IndexPatternColumnName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a5d08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a4d08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'ForeignKey_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a3d08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'ForeignKey_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a2d08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'ForeignKey_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '7f170058-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '95d69880-2874-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_IndexPatternColumnDatatype';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '94d69880-2874-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_IndexPatternColumnDatatype';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '93d69880-2874-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'is_MatchingDatatypePattern';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '46df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'update_referential_action';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '44df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '43df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '45df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'delete_referential_action';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f4be898f-9381-eb11-84e9-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f3be898f-9381-eb11-84e9-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f2be898f-9381-eb11-84e9-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f1be898f-9381-eb11-84e9-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1525676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1425676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a96b2118-b19a-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_index_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a86b2118-b19a-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_index_name';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[ForeignKey_IndexPattern]
* [repo].[Index_gross]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'ForeignKey_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'ForeignKey_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'9B8AA10A-AB97-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'
* mapping from xref:sqldb:repo.ForeignKey_IndexPattern.adoc[] to referenced_index and referencing_indx
* can be used to find out missing [referenced_index_guid] or [referencing_index_guid] to create them using xref:sqldb:repo.usp_Index_virtual_set.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.ForeignKey_Indexes_union.adoc[]
* xref:repo.usp_Index_ForeignKey.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.ForeignKey_IndexPattern.adoc[]
* xref:repo.Index_gross.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[ForeignKey_IndexPattern].[update_referential_action]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'update_referential_action';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[SysObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[SysObject_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[ForeignKey_IndexPattern].[referencing_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[RepoObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([RepoObject_schema_name],''.'',[RepoObject_name]))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[ForeignKey_IndexPattern].[referencing_IndexPatternColumnName]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[IndexPatternColumnDatatype]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[index_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_index_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[index_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[SysObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[SysObject_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[ForeignKey_IndexPattern].[referenced_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[RepoObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([RepoObject_schema_name],''.'',[RepoObject_name]))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[ForeignKey_IndexPattern].[referenced_IndexPatternColumnName]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[IndexPatternColumnDatatype]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[index_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_index_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[index_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[ForeignKey_IndexPattern].[ForeignKey_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'ForeignKey_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[ForeignKey_IndexPattern].[ForeignKey_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'ForeignKey_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[ForeignKey_IndexPattern].[ForeignKey_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'ForeignKey_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[ForeignKey_IndexPattern].[delete_referential_action]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes', @level2type = N'COLUMN', @level2name = N'delete_referential_action';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes';

