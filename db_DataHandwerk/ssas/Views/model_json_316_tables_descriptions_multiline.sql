

/*
Select
    Distinct
    j2.[Key]
  , j2.[value]
  , j2.Type
From
    ssas.[model_json_31_tables_T] As T1
    Cross Apply OpenJson ( T1.[tables_description_ja] )
                --As j1
                --Cross Apply OpenJson ( j1.Value )
                       As j2
order by
    j2.[Key]
Go
*/

CREATE View [ssas].[model_json_316_tables_descriptions_multiline]
As
Select
    T1.databasename
  , T1.tables_name
  , T1.RepoObject_guid
  , j2.[Key]
  , j2.Value
  , j2.Type
From
    ssas.model_json_31_tables_T As T1
    Cross Apply OpenJson ( T1.tables_description_ja )
                --As j1
                --Cross Apply OpenJson ( j1.Value )
                                As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1eff988b-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_316_tables_descriptions_multiline';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dbdfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_316_tables_descriptions_multiline', @level2type = N'COLUMN', @level2name = N'Value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dcdfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_316_tables_descriptions_multiline', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd8dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_316_tables_descriptions_multiline', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd9dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_316_tables_descriptions_multiline', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dadfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_316_tables_descriptions_multiline', @level2type = N'COLUMN', @level2name = N'Key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd7dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_316_tables_descriptions_multiline', @level2type = N'COLUMN', @level2name = N'databasename';

