
CREATE View repo.ForeignKey_Indexes_union
As
Select
    ForeignKey_guid
  , is_MatchingDatatypePattern
  , ForeignKey_name                       = ForeignKey_name Collate Database_Default
  , ForeignKey_fullname
  , referenced_index_guid
  , referenced_index_name
  , referenced_IndexPatternColumnDatatype
  , referenced_IndexPatternColumnName
  , referenced_RepoObject_fullname
  , referenced_RepoObject_fullname2
  , referenced_RepoObject_guid
  , referenced_SysObject_name
  , referenced_SysObject_schema_name
  , referencing_index_guid
  , referencing_index_name
  , referencing_IndexPatternColumnDatatype
  , referencing_IndexPatternColumnName
  , referencing_RepoObject_fullname
  , referencing_RepoObject_fullname2
  , referencing_RepoObject_guid
  , referencing_SysObject_name
  , referencing_SysObject_schema_name
  , delete_referential_action
  , update_referential_action
From
    repo.ForeignKey_Indexes
Union All
Select
    ForeignKey_guid
  , is_MatchingDatatypePattern
  , ForeignKey_name Collate Database_Default
  , ForeignKey_fullname
  , referenced_index_guid
  , referenced_index_name
  , referenced_IndexPatternColumnDatatype
  , referenced_IndexPatternColumnName
  , referenced_RepoObject_fullname
  , referenced_RepoObject_fullname2
  , referenced_RepoObject_guid
  , referenced_SysObject_name
  , referenced_SysObject_schema_name
  , referencing_index_guid
  , referencing_index_name
  , referencing_IndexPatternColumnDatatype
  , referencing_IndexPatternColumnName
  , referencing_RepoObject_fullname
  , referencing_RepoObject_fullname2
  , referencing_RepoObject_guid
  , referencing_SysObject_name
  , referencing_SysObject_schema_name
  , delete_referential_action
  , update_referential_action
From
    repo.ForeignKey_virtual_Indexes
Union All
Select
    ForeignKey_guid
  , is_MatchingDatatypePattern
  , ForeignKey_name Collate Database_Default
  , ForeignKey_fullname
  , referenced_index_guid
  , referenced_index_name
  , referenced_IndexPatternColumnDatatype
  , referenced_IndexPatternColumnName
  , referenced_RepoObject_fullname
  , referenced_RepoObject_fullname2
  , referenced_RepoObject_guid
  , referenced_SysObject_name
  , referenced_SysObject_schema_name
  , referencing_index_guid
  , referencing_index_name
  , referencing_IndexPatternColumnDatatype
  , referencing_IndexPatternColumnName
  , referencing_RepoObject_fullname
  , referencing_RepoObject_fullname2
  , referencing_RepoObject_guid
  , referencing_SysObject_name
  , referencing_SysObject_schema_name
  , delete_referential_action
  , update_referential_action
From
    repo.ForeignKey_ssas_Indexes
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'bcd08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'bbd08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_IndexPatternColumnName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'bad08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b9d08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b8d08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_IndexPatternColumnName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b7d08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b6d08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union'
  , @level2type = N'COLUMN'
  , @level2name = N'ForeignKey_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b5d08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union'
  , @level2type = N'COLUMN'
  , @level2name = N'ForeignKey_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b4d08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union'
  , @level2type = N'COLUMN'
  , @level2name = N'ForeignKey_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '81170058-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9bd69880-2874-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_IndexPatternColumnDatatype';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9ad69880-2874-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_IndexPatternColumnDatatype';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '99d69880-2874-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union'
  , @level2type = N'COLUMN'
  , @level2name = N'is_MatchingDatatypePattern';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '50df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union'
  , @level2type = N'COLUMN'
  , @level2name = N'update_referential_action';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4edf2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4ddf2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4fdf2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union'
  , @level2type = N'COLUMN'
  , @level2name = N'delete_referential_action';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fcbe898f-9381-eb11-84e9-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fbbe898f-9381-eb11-84e9-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fabe898f-9381-eb11-84e9-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f9be898f-9381-eb11-84e9-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_SysObject_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1925676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1825676d-1797-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ad6b2118-b19a-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_index_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ac6b2118-b19a-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_Indexes_union'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_index_name';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[ForeignKey_Indexes]
* [repo].[ForeignKey_virtual_Indexes]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes_union';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'ForeignKey_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes_union';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'ForeignKey_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes_union';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes_union';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'7AB8BC13-0696-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes_union';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.ForeignKey_Indexes_union_T.adoc[]
* xref:repo.usp_PERSIST_ForeignKey_Indexes_union_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes_union';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.ForeignKey_Indexes.adoc[]
* xref:repo.ForeignKey_virtual_Indexes.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_Indexes_union';

