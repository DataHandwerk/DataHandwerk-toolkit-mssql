
CREATE View repo.Index_Settings_ForUpdate
As
Select
    T1.index_guid
  , T1.IndexPatternColumnDatatype
  , T1.IndexPatternColumnName
  , T1.IndexSemanticGroup
  , T1.is_create_constraint
  , T2.index_name
  , T2.parent_RepoObject_guid
  , T3.RepoObject_fullname
From
    repo.Index_Settings  As T1
    Inner Join
        repo.Index_union As T2
            On
            T2.index_guid      = T1.index_guid

    Left Outer Join
        repo.RepoObject  As T3
            On
            T3.RepoObject_guid = T2.parent_RepoObject_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '637159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_Settings_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6f7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_Settings_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6e7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_Settings_ForUpdate', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6c7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_Settings_ForUpdate', @level2type = N'COLUMN', @level2name = N'is_create_constraint';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6b7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_Settings_ForUpdate', @level2type = N'COLUMN', @level2name = N'IndexSemanticGroup';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6a7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_Settings_ForUpdate', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '697159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_Settings_ForUpdate', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6d7159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_Settings_ForUpdate', @level2type = N'COLUMN', @level2name = N'index_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '687159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_Settings_ForUpdate', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.Index_Settings.adoc[]
* xref:repo.Index_union.adoc[]
* xref:repo.RepoObject.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_Settings_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_Settings_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';

