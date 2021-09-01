
/*
<<property_start>>MS_Description
* mapping from xref:sqldb:repo.ForeignKey_ssas_IndexPattern.adoc[] to referenced_index and referencing_indx
* can be used to find out missing [referenced_index_guid] or [referencing_index_guid] to create them using xref:sqldb:repo.usp_Index_virtual_set.adoc[]
<<property_end>>
*/
CREATE View repo.ForeignKey_ssas_Indexes
As
Select
    fk.ForeignKey_guid
  , is_MatchingDatatypePattern        = Iif(
                                 fk.referencing_IndexPatternColumnDatatype = fk.referenced_IndexPatternColumnDatatype
                                     , 1
                                     , 0)
  , fk.ForeignKey_name
  , fk.ForeignKey_fullname
  , referenced_index_guid             = i_2.index_guid
  , referenced_index_name             = i_2.index_name
  , fk.referenced_IndexPatternColumnDatatype
  , fk.referenced_IndexPatternColumnName
  , fk.referenced_RepoObject_fullname
  , fk.referenced_RepoObject_fullname2
  , fk.referenced_RepoObject_guid
  , referenced_SysObject_name         = fk.referenced_ObjectName
  , referenced_SysObject_schema_name  = fk.databasename
  , referencing_index_guid            = i_1.index_guid
  , referencing_index_name            = i_1.index_name
  , fk.referencing_IndexPatternColumnDatatype
  , fk.referencing_IndexPatternColumnName
  , fk.referencing_RepoObject_fullname
  , fk.referencing_RepoObject_fullname2
  , fk.referencing_RepoObject_guid
  , referencing_SysObject_name        = fk.referencing_ObjectName
  , referencing_SysObject_schema_name = fk.databasename
  , fk.delete_referential_action
  , fk.update_referential_action
From
    repo.ForeignKey_ssas_IndexPattern As fk
    Left Join
        repo.Index_ssas_T             As i_1
            On
            i_1.RepoObject_guid = fk.referencing_RepoObject_guid
            And i_1.ColumnName  = fk.referencing_ColumnName

    Left Join
        repo.Index_ssas_T             As i_2
            On
            i_2.RepoObject_guid = fk.referenced_RepoObject_guid
            And i_2.ColumnName  = fk.referenced_ColumnName
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '686e8dee-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bc4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes', @level2type = N'COLUMN', @level2name = N'update_referential_action';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ba4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b94578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b84578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b74578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b64578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b54578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b44578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b34578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_index_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b24578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes', @level2type = N'COLUMN', @level2name = N'referencing_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b14578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b04578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'af4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ae4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ad4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ac4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ab4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aa4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_index_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a94578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes', @level2type = N'COLUMN', @level2name = N'referenced_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a64578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes', @level2type = N'COLUMN', @level2name = N'is_MatchingDatatypePattern';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a74578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes', @level2type = N'COLUMN', @level2name = N'ForeignKey_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a54578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes', @level2type = N'COLUMN', @level2name = N'ForeignKey_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a84578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes', @level2type = N'COLUMN', @level2name = N'ForeignKey_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bb4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_Indexes', @level2type = N'COLUMN', @level2name = N'delete_referential_action';

