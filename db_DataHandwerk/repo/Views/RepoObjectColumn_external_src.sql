
/*
<<property_start>>Description
* converts xref:sqldb:reference.additional_reference_objectcolumn_t.adoc[] into xref:sqldb:repo.repoobjectcolumn.adoc[]
* [ ] todo: solve issues with same external object names like internal names
<<property_end>>
*/
CREATE View repo.RepoObjectColumn_external_src
As
Select
    --PK: RepoObjectColumn_guid
    T2.RepoObjectColumn_guid
  , ro.RepoObject_guid
  , RepoObjectColumn_name      = T2.ColumnName
  , SysObjectColumn_name       = T2.ColumnName
  , is_SysObjectColumn_missing = 0
--, Repo_user_type_name        = T2.tables_columns_dataType
--, Repo_user_type_fullname    = T2.tables_columns_dataType
From
    reference.additional_Reference_ObjectColumn_T As T2
    Left Join
        reference.additional_Reference_Object_T   As ro
            On
            ro.AntoraComponent  = T2.AntoraComponent
            And ro.AntoraModule = T2.AntoraModule
            And ro.SchemaName   = T2.SchemaName
            And ro.ObjectName   = T2.ObjectName
--workaround to solve issues with not imported same named external objects
Where
    Exists
(
    Select
        1
    From
        repo.RepoObject As tgt
    Where
        tgt.RepoObject_guid = ro.RepoObject_guid
)
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ad5f98ee-1a1b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_external_src', @level2type = N'COLUMN', @level2name = N'is_SysObjectColumn_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ac5f98ee-1a1b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_external_src', @level2type = N'COLUMN', @level2name = N'SysObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ab5f98ee-1a1b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_external_src', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aa5f98ee-1a1b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_external_src', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a95f98ee-1a1b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_external_src', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'c2d025e7-1a1b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_external_src';

