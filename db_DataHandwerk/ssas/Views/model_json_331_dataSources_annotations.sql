﻿
/*
--get and check existing values

Select
    Distinct
    j2.[Key]
  , j2.Type
From
    ssas.model_json_33_dataSources                         As T1
    Cross Apply OpenJson ( T1.dataSources_annotations_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
order by
    j2.[Key]
  , j2.Type
Go

Select
    T1.*
  , j2.*
From
    ssas.model_json_33_dataSources                         As T1
    Cross Apply OpenJson ( T1.dataSources_annotations_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Go

Select
    DISTINCT
    j2.*
From
    ssas.model_json_33_dataSources                         As T1
    Cross Apply OpenJson ( T1.dataSources_annotations_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Where
    j2.[Key] = 'value'
GO
*/
CREATE View ssas.model_json_331_dataSources_annotations
As
Select
    T1.databasename
  , T1.dataSources_name
  , j2.dataSources_annotations_name
  , j2.dataSources_annotations_value
  , j2.dataSources_annotations_value_ja
From
    ssas.model_json_33_dataSources                         As T1
    Cross Apply OpenJson ( T1.dataSources_annotations_ja ) As j1
    Cross Apply
    OpenJson ( j1.Value )
    With
    (
        dataSources_annotations_name NVarchar ( 500 ) N'$.name'
      , dataSources_annotations_value NVarchar ( Max ) N'$.value'
      , dataSources_annotations_value_ja NVarchar ( Max ) N'$.value' As Json --currently no array in my data
    ) As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9560d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_331_dataSources_annotations', @level2type = N'COLUMN', @level2name = N'dataSources_annotations_value_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9460d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_331_dataSources_annotations', @level2type = N'COLUMN', @level2name = N'dataSources_annotations_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9360d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_331_dataSources_annotations', @level2type = N'COLUMN', @level2name = N'dataSources_annotations_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9260d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_331_dataSources_annotations', @level2type = N'COLUMN', @level2name = N'dataSources_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9160d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_331_dataSources_annotations', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'fb5fd8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_331_dataSources_annotations';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [ssas].[model_json_33_dataSources]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_331_dataSources_annotations';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'databasename,dataSources_name,dataSources_annotations_name', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_331_dataSources_annotations';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(128),nvarchar(500),nvarchar(500)', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_331_dataSources_annotations';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'0DB0C093-EC0A-EC11-8516-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_331_dataSources_annotations';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_331_dataSources_annotations';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_331_dataSources_annotations';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:ssas.model_json_33_dataSources.adoc[]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_331_dataSources_annotations';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_33_dataSources].[dataSources_name]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_331_dataSources_annotations', @level2type = N'COLUMN', @level2name = N'dataSources_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_33_dataSources].[databasename]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_331_dataSources_annotations', @level2type = N'COLUMN', @level2name = N'databasename';

