/****** Script for SelectTopNRows command from SSMS  ******/
CREATE View ssas.RepoObjectColumn_translation
As
Select
    roc.RepoObjectColumn_guid
  , cultures_name                = IsNull ( cult.cultures_name, '' )
  , roc.Column_name
  , RepoObjectColumn_translation = cult.cultures_translations_model_tables_columns_translatedCaption
  , RepoObjectColumn_DisplayName = Coalesce (
                                                cult.cultures_translations_model_tables_columns_translatedCaption
                                              , roc.Column_name
                                            )
  , tabcol.databasename
  , tabcol.tables_name
  , tabcol.tables_columns_name
  , cult.cultures_translations_model_name
  , cult.cultures_translations_model_tables_name
  , cult.cultures_translations_model_tables_columns_name
From
    repo.RepoObjectColumn                                                 As roc
    Left Outer Join
        ssas.model_json_311_tables_columns_T                              As tabcol
            On
            tabcol.RepoObjectColumn_guid                             = roc.RepoObjectColumn_guid

    Left Outer Join
        ssas.model_json_341111_cultures_translations_model_tables_columns As cult
            On
            cult.databasename                                        = tabcol.databasename
            And cult.cultures_translations_model_tables_name         = tabcol.tables_name
            And cult.cultures_translations_model_tables_columns_name = roc.Column_name
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f4acce3a-5e24-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_columns_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f3acce3a-5e24-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f2acce3a-5e24-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f1acce3a-5e24-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation', @level2type = N'COLUMN', @level2name = N'tables_columns_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f0acce3a-5e24-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'efacce3a-5e24-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eeacce3a-5e24-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_DisplayName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'edacce3a-5e24-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_translation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ecacce3a-5e24-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation', @level2type = N'COLUMN', @level2name = N'Column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ebacce3a-5e24-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation', @level2type = N'COLUMN', @level2name = N'cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eaacce3a-5e24-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0e42b32f-5e24-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation';

