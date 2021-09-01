
/*
ssas databasename is used as RepoSchema_name
*/
CREATE View repo.RepoSchema_ssas_src
As
Select
    RepoSchema_name           = T1.databasename
  , is_ssas                   = 1
  , is_SysSchema_missing      = 0
  , RepoSchema_ms_description = Coalesce ( T1.l2_description, T2.multiline_description )
  , SysSchema_name            = T1.databasename
From
    ssas.model_json_20 As T1
    Left Join
    (
        Select
            databasename
          , multiline_description = String_Agg ( Value, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                    [key])
        From
            ssas.model_json_201_descriptions
        Group By
            databasename
    )                  As T2
        On
        T2.databasename = T1.databasename
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '514419fd-1f07-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoSchema_ssas_src', @level2type = N'COLUMN', @level2name = N'SysSchema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '504419fd-1f07-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoSchema_ssas_src', @level2type = N'COLUMN', @level2name = N'RepoSchema_ms_description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4f4419fd-1f07-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoSchema_ssas_src', @level2type = N'COLUMN', @level2name = N'is_SysSchema_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4e4419fd-1f07-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoSchema_ssas_src', @level2type = N'COLUMN', @level2name = N'is_ssas';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4d4419fd-1f07-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoSchema_ssas_src', @level2type = N'COLUMN', @level2name = N'RepoSchema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '52ca43f5-1f07-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoSchema_ssas_src';

