﻿
/*
--get and check existing values

Select
    Distinct
    j2.[Key]
  , j2.Type
From
    ssas.model_json_361_perspectives_tables                    As T1
    Cross Apply OpenJson ( T1.perspectives_tables_hierarchies_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
ORDER BY
    j2.[Key]
  , j2.Type
Go

Select
    T1.*
  , j2.*
From
    ssas.model_json_361_perspectives_tables                    As T1
    Cross Apply OpenJson ( T1.perspectives_tables_hierarchies_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Go

Select
    DISTINCT
    j2.*
From
    ssas.model_json_361_perspectives_tables                    As T1
    Cross Apply OpenJson ( T1.perspectives_tables_hierarchies_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Where
    j2.[Key] = 'hierarchies'
GO
*/
Create View ssas.model_json_3612_perspectives_tables_hierarchies
As
Select
    T1.databasename
  , T1.perspectives_name
  , T1.perspectives_tables_name
  , j2.perspectives_tables_hierarchies_name
From
    ssas.model_json_361_perspectives_tables                    As T1
    Cross Apply OpenJson ( T1.perspectives_tables_hierarchies_ja ) As j1
    Cross Apply
    OpenJson ( j1.Value )
    With
    (
        perspectives_tables_hierarchies_name NVarchar ( 500 ) N'$.name'
    ) As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c360d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3612_perspectives_tables_hierarchies', @level2type = N'COLUMN', @level2name = N'perspectives_tables_hierarchies_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c260d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3612_perspectives_tables_hierarchies', @level2type = N'COLUMN', @level2name = N'perspectives_tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c160d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3612_perspectives_tables_hierarchies', @level2type = N'COLUMN', @level2name = N'perspectives_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c060d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3612_perspectives_tables_hierarchies', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0560d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3612_perspectives_tables_hierarchies';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [ssas].[model_json_361_perspectives_tables]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3612_perspectives_tables_hierarchies';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'databasename,perspectives_name,perspectives_tables_name,perspectives_tables_hierarchies_name', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3612_perspectives_tables_hierarchies';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(128),nvarchar(500),nvarchar(500),nvarchar(500)', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3612_perspectives_tables_hierarchies';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'16B0C093-EC0A-EC11-8516-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3612_perspectives_tables_hierarchies';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3612_perspectives_tables_hierarchies';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3612_perspectives_tables_hierarchies';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:ssas.model_json_361_perspectives_tables.adoc[]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3612_perspectives_tables_hierarchies';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_361_perspectives_tables].[perspectives_tables_name]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3612_perspectives_tables_hierarchies', @level2type = N'COLUMN', @level2name = N'perspectives_tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_361_perspectives_tables].[perspectives_name]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3612_perspectives_tables_hierarchies', @level2type = N'COLUMN', @level2name = N'perspectives_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_361_perspectives_tables].[databasename]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_3612_perspectives_tables_hierarchies', @level2type = N'COLUMN', @level2name = N'databasename';

