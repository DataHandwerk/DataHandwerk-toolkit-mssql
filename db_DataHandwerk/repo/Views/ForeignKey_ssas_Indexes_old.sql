
/*
<<property_start>>MS_Description
* mapping from xref:sqldb:repo.ForeignKey_ssas_IndexPattern.adoc[] to referenced_index and referencing_indx
* can be used to find out missing [referenced_index_guid] or [referencing_index_guid] to create them using xref:sqldb:repo.usp_Index_virtual_set.adoc[]
<<property_end>>
*/
Create View repo.ForeignKey_ssas_Indexes_old
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
    repo.ForeignKey_ssas_IndexPattern_old As fk
    Left Join
        repo.Index_ssas_T                 As i_1
            On
            i_1.RepoObject_guid = fk.referencing_RepoObject_guid
            And i_1.ColumnName  = fk.referencing_ColumnName

    Left Join
        repo.Index_ssas_T                 As i_2
            On
            i_2.RepoObject_guid = fk.referenced_RepoObject_guid
            And i_2.ColumnName  = fk.referenced_ColumnName