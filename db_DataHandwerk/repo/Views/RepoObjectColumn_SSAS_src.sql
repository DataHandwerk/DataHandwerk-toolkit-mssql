
/*
<<property_start>>MS_Description
converts xref:sqldb:ssas.TMSCHEMA_COLUMNS_T.adoc[] into xref:sqldb:repo.RepoObjectColumn.adoc[]
<<property_end>>
*/
CREATE View repo.RepoObjectColumn_SSAS_src
As
Select
    T2.RepoObjectColumn_guid
  , is_SysObjectColumn_missing = 0
  , Repo_is_nullable           = T2.IsNullable
  , Repo_user_type_name        = T3.ExplicitDataTypeName
  , Repo_user_type_fullname    = T3.ExplicitDataTypeName
  , RepoObjectColumn_name      = T2.ExplicitName
  , T1.RepoObject_guid
  , SysObjectColumn_name       = T2.ExplicitName
----could be required:
--, is_repo_managed            = 1
----could be required, but is missing in target
--, is_ssas                    = 1
From
    ssas.TMSCHEMA_TABLES_T               As T1
    Inner Join
        ssas.TMSCHEMA_COLUMNS_T          As T2
            On
            T1.databasename     = T2.databasename
            And T1.ID           = T2.TableID

    Left Join
        configT.SsasDmv_ExplicitDataType As T3
            On
            T3.ExplicitDataType = T2.ExplicitDataType
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b9f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_SSAS_src', @level2type = N'COLUMN', @level2name = N'SysObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b8f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_SSAS_src', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b7f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_SSAS_src', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b6f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_SSAS_src', @level2type = N'COLUMN', @level2name = N'Repo_is_nullable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b5f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_SSAS_src', @level2type = N'COLUMN', @level2name = N'is_SysObjectColumn_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b4f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_SSAS_src', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '124559f6-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_SSAS_src';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8fd59301-2c07-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_SSAS_src', @level2type = N'COLUMN', @level2name = N'Repo_user_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '90d59301-2c07-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_SSAS_src', @level2type = N'COLUMN', @level2name = N'Repo_user_type_fullname';

