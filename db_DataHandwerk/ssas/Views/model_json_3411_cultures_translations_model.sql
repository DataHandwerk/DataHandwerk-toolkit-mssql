/*
--get and check existing values

Select
    Distinct
    j2.[Key]
  , j2.Type
From
    ssas.model_json_341_cultures_translations As T1
    Cross Apply OpenJson ( T1.cultures_translations_model_j )
                --As j1
                --Cross Apply OpenJson ( j1.Value )
                                As j2
order by
    j2.[Key]
  , j2.Type
Go
*/
CREATE View [ssas].[model_json_3411_cultures_translations_model]
As
Select
    T1.databasename
  , T1.cultures_name
  --, T1.cultures_translations_model_j
  , j2.cultures_translations_model_name
  , j2.cultures_translations_model_perspectives_ja
  , j2.cultures_translations_model_tables_ja
  , j2.cultures_translations_model_translatedDescription
From
    ssas.model_json_341_cultures_translations As T1
    Cross Apply
    OpenJson ( T1.cultures_translations_model_j )
    --As j1
    --Cross Apply
    --OpenJson ( j1.Value )
    With
    (
        cultures_translations_model_name NVarchar ( 500 ) N'$.name'
      , cultures_translations_model_perspectives_ja NVarchar ( Max ) N'$.perspectives' As Json
      , cultures_translations_model_tables_ja NVarchar ( Max ) N'$.tables' As Json
      , cultures_translations_model_translatedDescription NVarchar ( Max ) N'$.translatedDescription'
    )                                         As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9e60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3411_cultures_translations_model', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_translatedDescription';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9d60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3411_cultures_translations_model', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9c60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3411_cultures_translations_model', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_perspectives_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9b60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3411_cultures_translations_model', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9a60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3411_cultures_translations_model', @level2type = N'COLUMN', @level2name = N'cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9960d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3411_cultures_translations_model', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'fe5fd8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3411_cultures_translations_model';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [ssas].[model_json_341_cultures_translations]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3411_cultures_translations_model';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'databasename,cultures_name,cultures_translations_model_name', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3411_cultures_translations_model';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(128),nvarchar(500),nvarchar(500)', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3411_cultures_translations_model';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'0FB0C093-EC0A-EC11-8516-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3411_cultures_translations_model';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3411_cultures_translations_model';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3411_cultures_translations_model';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:ssas.model_json_341_cultures_translations.adoc[]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3411_cultures_translations_model';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_341_cultures_translations].[databasename]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3411_cultures_translations_model', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_341_cultures_translations].[cultures_name]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3411_cultures_translations_model', @level2type = N'COLUMN', @level2name = N'cultures_name';

