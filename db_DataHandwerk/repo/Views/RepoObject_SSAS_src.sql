
/*
<<property_start>>MS_Description
converts xref:sqldb:ssas.TMSCHEMA_TABLES_T.adoc[] into xref:sqldb:repo.RepoObject.adoc[]
<<property_end>>
*/
CREATE View [repo].[RepoObject_SSAS_src]
As
Select
    RepoObject_guid
  , is_repo_managed        = 1
  , is_ssas                = 1
  --, modify_dt              = ModifiedTime
  , RepoObject_name        = tables_name
  , RepoObject_schema_name = databasename
  , RepoObject_type        = 'U'
  ----ID could interfer with relational database id
  ----we could use only, if we have only ssas objects in the repo
  ----that's why it is better, not to use it
  --, SysObject_id           = ID
  --, SysObject_modify_date  = ModifiedTime
  , SysObject_name         = tables_name
  , SysObject_schema_name  = databasename
  , SysObject_type         = 'U'
From
    ssas.model_json_31_tables_T As T1
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b3f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_src', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b2f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_src', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b1f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_src', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aff5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_src', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aef5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_src', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'adf5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_src', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'abf5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_src', @level2type = N'COLUMN', @level2name = N'is_ssas';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aaf5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_src', @level2type = N'COLUMN', @level2name = N'is_repo_managed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a9f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_src', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '114559f6-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SSAS_src';

