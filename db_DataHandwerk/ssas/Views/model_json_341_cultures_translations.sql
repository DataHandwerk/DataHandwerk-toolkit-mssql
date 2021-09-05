
/*
--get and check existing values

Select
    Distinct
    j2.[Key]
  , j2.Type
From
    ssas.model_json_34_cultures As T1
    Cross Apply OpenJson ( T1.cultures_translations_j )
                --As j1
                --Cross Apply OpenJson ( j1.Value )
                                As j2
order by
    j2.[Key]
  , j2.Type
Go

Select
    T1.*
  , j2.*
From
    ssas.model_json_34_cultures As T1
    Cross Apply OpenJson ( T1.cultures_translations_j )
                --As j1
                --Cross Apply OpenJson ( j1.Value ) 
                                As j2
Go

Select
    DISTINCT
    j2.*
From
    ssas.model_json_34_cultures As T1
    Cross Apply OpenJson ( T1.cultures_translations_j )
                --As j1
                --Cross Apply OpenJson ( j1.Value ) 
                                As j2
Where
    j2.[Key] = 'model'
GO
*/
CREATE View ssas.model_json_341_cultures_translations
As
Select
    T1.databasename
  , T1.cultures_name
  , j2.cultures_translations_model_j
From
    ssas.model_json_34_cultures As T1
    Cross Apply
    OpenJson ( T1.cultures_translations_j )
    --As j1
    --Cross Apply
    --OpenJson ( j1.Value )
    With
    (
        cultures_translations_model_j NVarchar ( Max ) N'$.model' As Json
    )                           As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9860d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341_cultures_translations', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_j';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9760d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341_cultures_translations', @level2type = N'COLUMN', @level2name = N'cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9660d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341_cultures_translations', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'fd5fd8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341_cultures_translations';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [ssas].[model_json_34_cultures]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341_cultures_translations';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341_cultures_translations';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341_cultures_translations';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:ssas.model_json_3411_cultures_translations_model.adoc[]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341_cultures_translations';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:ssas.model_json_34_cultures.adoc[]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341_cultures_translations';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_34_cultures].[databasename]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341_cultures_translations', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_34_cultures].[cultures_name]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341_cultures_translations', @level2type = N'COLUMN', @level2name = N'cultures_name';

