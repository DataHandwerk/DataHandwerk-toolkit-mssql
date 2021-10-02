﻿
/*
--get and check existing values

Select
    Distinct
    j2.[Key]
  , j2.Type
From
    ssas.model_json_34111_cultures_translations_model_tables                      As T1
    Cross Apply OpenJson ( T1.cultures_translations_model_tables_columns_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Order by
    j2.[Key]
  , j2.Type
Go

Select
    T1.*
  , j2.*
From
    ssas.model_json_34111_cultures_translations_model_tables                      As T1
    Cross Apply OpenJson ( T1.cultures_translations_model_tables_columns_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Go

Select
    j2.*
From
    ssas.model_json_34111_cultures_translations_model_tables                      As T1
    Cross Apply OpenJson ( T1.cultures_translations_model_tables_columns_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Where
    j2.[Key] = 'columns'

Select
    j2.*
From
    ssas.model_json_34111_cultures_translations_model_tables                      As T1
    Cross Apply OpenJson ( T1.cultures_translations_model_tables_columns_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Where
    j2.[Key] = 'measures'
Go

*/
Create View ssas.model_json_341111_cultures_translations_model_tables_columns
As
Select
    T1.databasename
  , T1.cultures_name
  , T1.cultures_translations_model_name
  , T1.cultures_translations_model_tables_name
  , j2.cultures_translations_model_tables_columns_name
  , j2.cultures_translations_model_tables_columns_translatedCaption
From
    ssas.model_json_34111_cultures_translations_model_tables                  As T1
    Cross Apply OpenJson ( T1.cultures_translations_model_tables_columns_ja ) As j1
    Cross Apply
    OpenJson ( j1.Value )
    With
    (
        cultures_translations_model_tables_columns_name NVarchar ( 128 ) N'$.name'
      , cultures_translations_model_tables_columns_translatedCaption NVarchar ( 128 ) N'$.translatedCaption'
    ) As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'af32fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341111_cultures_translations_model_tables_columns', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_columns_translatedCaption';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ae32fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341111_cultures_translations_model_tables_columns', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_columns_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ad32fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341111_cultures_translations_model_tables_columns', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ac32fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341111_cultures_translations_model_tables_columns', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ab32fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341111_cultures_translations_model_tables_columns', @level2type = N'COLUMN', @level2name = N'cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aa32fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341111_cultures_translations_model_tables_columns', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0e09da81-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_341111_cultures_translations_model_tables_columns';

