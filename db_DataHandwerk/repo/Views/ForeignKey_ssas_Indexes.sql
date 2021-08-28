
/*
<<property_start>>MS_Description
* mapping from xref:sqldb:repo.ForeignKey_ssas_IndexPattern.adoc[] to referenced_index and referencing_indx
* can be used to find out missing [referenced_index_guid] or [referencing_index_guid] to create them using xref:sqldb:repo.usp_Index_virtual_set.adoc[]
<<property_end>>
*/
create View repo.ForeignKey_ssas_Indexes
As
Select
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
    repo.ForeignKey_ssas_IndexPattern As fk
    Left Join
        repo.Index_gross              As i_1
            On
            i_1.parent_RepoObject_guid     = fk.referencing_RepoObject_guid
            And i_1.IndexPatternColumnName = fk.referencing_IndexPatternColumnName

    Left Join
        repo.Index_gross              As i_2
            On
            i_2.parent_RepoObject_guid     = fk.referenced_RepoObject_guid
            And i_2.IndexPatternColumnName = fk.referenced_IndexPatternColumnName