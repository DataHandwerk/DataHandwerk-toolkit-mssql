
/*
--get and check existing values

Select
    Distinct
    j2.[Key]
  , j2.Type
From
    ssas.model_json_31_tables                      As T1
    Cross Apply OpenJson ( T1.tables_measures_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
order by
    j2.[Key]
  , j2.Type
Go

Select
    T1.*
  , j2.*
From
    ssas.model_json_31_tables                      As T1
    Cross Apply OpenJson ( T1.tables_measures_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Go

Select
    j2.*
From
    ssas.model_json_31_tables                      As T1
    Cross Apply OpenJson ( T1.tables_measures_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Where
    j2.[Key] = 'description'

Select
    j2.*
From
    ssas.model_json_31_tables                      As T1
    Cross Apply OpenJson ( T1.tables_measures_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Where
    j2.[Key] = 'expression'
Go

*/
CREATE View ssas.model_json_312_tables_measures
As
Select
    T1.databasename
  , T1.tables_name
  , T1.RepoObject_guid
  , j2.tables_measures_name
  , j2.tables_measures_description
  , j2.tables_measures_description_ja
  , j2.tables_measures_displayFolder
  , j2.tables_measures_expression
  , j2.tables_measures_expression_ja
  , j2.tables_measures_formatString
  , j2.tables_measures_isHidden
From
    ssas.model_json_31_tables_T                    As T1
    Cross Apply OpenJson ( T1.tables_measures_ja ) As j1
    Cross Apply
    OpenJson ( j1.Value )
    With
    (
        tables_measures_name NVarchar ( 500 ) N'$.name'
      , tables_measures_description NVarchar ( Max ) N'$.description'
      , tables_measures_description_ja NVarchar ( Max ) N'$.description' As Json --multiple lines?
      , tables_measures_displayFolder NVarchar ( 500 ) N'$.displayFolder'
      , tables_measures_expression NVarchar ( Max ) N'$.expression'
      , tables_measures_expression_ja NVarchar ( Max ) N'$.expression' As Json   --multiple lines?
      , tables_measures_formatString NVarchar ( 500 ) N'$.formatString'
      , tables_measures_isHidden Bit N'$.isHidden'
    ) As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8060d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_312_tables_measures', @level2type = N'COLUMN', @level2name = N'tables_measures_isHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7f60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_312_tables_measures', @level2type = N'COLUMN', @level2name = N'tables_measures_formatString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7e60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_312_tables_measures', @level2type = N'COLUMN', @level2name = N'tables_measures_expression_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7d60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_312_tables_measures', @level2type = N'COLUMN', @level2name = N'tables_measures_expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7c60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_312_tables_measures', @level2type = N'COLUMN', @level2name = N'tables_measures_displayFolder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7b60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_312_tables_measures', @level2type = N'COLUMN', @level2name = N'tables_measures_description_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7a60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_312_tables_measures', @level2type = N'COLUMN', @level2name = N'tables_measures_description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7960d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_312_tables_measures', @level2type = N'COLUMN', @level2name = N'tables_measures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '651fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_312_tables_measures', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7860d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_312_tables_measures', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7760d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_312_tables_measures', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f35fd8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_312_tables_measures';

