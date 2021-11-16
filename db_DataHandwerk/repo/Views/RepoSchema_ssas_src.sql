
/*
ssas databasename is used as RepoSchema_name
*/
CREATE View repo.RepoSchema_ssas_src
As
Select
    --PK: RepoSchema_name
    RepoSchema_name        = T1.databasename
  , is_ssas                = 1
  , is_SysSchema_missing   = 0
  , RepoSchema_description = Coalesce ( T1.l2_description, T2.descriptions_StrAgg )
  , SysSchema_name         = T1.databasename
From
    ssas.model_json_20                           As T1
    Left Join
        ssas.model_json_2011_descriptions_StrAgg As T2
            On
            T2.databasename = T1.databasename
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '514419fd-1f07-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoSchema_ssas_src', @level2type = N'COLUMN', @level2name = N'SysSchema_name';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4f4419fd-1f07-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoSchema_ssas_src', @level2type = N'COLUMN', @level2name = N'is_SysSchema_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4e4419fd-1f07-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoSchema_ssas_src', @level2type = N'COLUMN', @level2name = N'is_ssas';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4d4419fd-1f07-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoSchema_ssas_src', @level2type = N'COLUMN', @level2name = N'RepoSchema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '52ca43f5-1f07-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoSchema_ssas_src';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [ssas].[model_json_20]
* [ssas].[model_json_2011_descriptions_StrAgg]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoSchema_ssas_src';


GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoSchema_ssas_src';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoSchema_ssas_src';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.RepoSchema_ssas_tgt.adoc[]
* xref:repo.usp_PERSIST_RepoSchema_ssas_tgt.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoSchema_ssas_src';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:ssas.model_json_20.adoc[]
* xref:ssas.model_json_2011_descriptions_StrAgg.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoSchema_ssas_src';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_20].[databasename]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoSchema_ssas_src', @level2type = N'COLUMN', @level2name = N'RepoSchema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1040f2f7-cf46-ec11-852f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoSchema_ssas_src', @level2type = N'COLUMN', @level2name = N'RepoSchema_description';



