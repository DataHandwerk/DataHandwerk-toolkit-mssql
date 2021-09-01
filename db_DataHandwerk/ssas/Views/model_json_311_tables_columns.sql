
/*
--get and check existing values

Select
    Distinct
    j2.[Key]
  , j2.Type
From
    ssas.model_json_31_tables                     As T1
    Cross Apply OpenJson ( T1.tables_columns_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Order by
    j2.[Key]
  , j2.Type
Go

Select
    T1.*
  , j2.*
From
    ssas.model_json_31_tables                     As T1
    Cross Apply OpenJson ( T1.tables_columns_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Go

Select
    j2.*
From
    ssas.model_json_31_tables                     As T1
    Cross Apply OpenJson ( T1.tables_columns_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Where
    j2.[Key] = 'description'

Select
    j2.*
From
    ssas.model_json_31_tables                     As T1
    Cross Apply OpenJson ( T1.tables_columns_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
Where
    j2.[Key] = 'expression'
Go
*/
CREATE View ssas.model_json_311_tables_columns
As
Select
    T1.databasename
  , T1.tables_name
  , T1.RepoObject_guid
  , j2.tables_columns_name
  , j2.tables_columns_dataType
  , j2.tables_columns_description
  , j2.tables_columns_description_ja
  , j2.tables_columns_displayFolder
  , j2.tables_columns_expression
  , j2.tables_columns_expression_ja
  , j2.tables_columns_formatString
  , j2.tables_columns_isDataTypeInferred
  , j2.tables_columns_isHidden
  , j2.tables_columns_isKey
  , j2.tables_columns_isNameInferred
  , j2.tables_columns_isNullable
  , j2.tables_columns_isUnique
  , j2.tables_columns_keepUniqueRows
  , j2.tables_columns_sortByColumn
  , j2.tables_columns_sourceColumn
  , j2.tables_columns_sourceProviderType
  , j2.tables_columns_summarizeBy
  , j2.tables_columns_type
From
    ssas.model_json_31_tables_T                   As T1
    Cross Apply OpenJson ( T1.tables_columns_ja ) As j1
    Cross Apply
    OpenJson ( j1.Value )
    With
    (
        tables_columns_name NVarchar ( 128 ) N'$.name'
      , tables_columns_dataType NVarchar ( 500 ) N'$.dataType'
      , tables_columns_description NVarchar ( Max ) N'$.description'
      , tables_columns_description_ja NVarchar ( Max ) N'$.description' As Json --multiple lines?
      , tables_columns_displayFolder NVarchar ( 500 ) N'$.displayFolder'
      , tables_columns_expression NVarchar ( Max ) N'$.expression'
      , tables_columns_expression_ja NVarchar ( Max ) N'$.expression' As Json   --multiple lines?
      , tables_columns_formatString NVarchar ( 500 ) N'$.formatString'
      , tables_columns_isDataTypeInferred Bit N'$.isDataTypeInferred'
      , tables_columns_isHidden Bit N'$.isHidden'
      , tables_columns_isKey Bit N'$.isKey'
      , tables_columns_isNameInferred Bit N'$.isNameInferred'
      , tables_columns_isNullable Bit N'$.isNullable'
      , tables_columns_isUnique Bit N'$.isUnique'
      , tables_columns_keepUniqueRows Bit N'$.keepUniqueRows'
      , tables_columns_sortByColumn NVarchar ( 500 ) N'$.sortByColumn'
      , tables_columns_sourceColumn NVarchar ( 500 ) N'$.sourceColumn'
      , tables_columns_sourceProviderType NVarchar ( 500 ) N'$.sourceProviderType'
      , tables_columns_summarizeBy NVarchar ( 500 ) N'$.summarizeBy'
      , tables_columns_type NVarchar ( 500 ) N'$.type'
    ) As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7660d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_311_tables_columns', @level2type = N'COLUMN', @level2name = N'tables_columns_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7560d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_311_tables_columns', @level2type = N'COLUMN', @level2name = N'tables_columns_summarizeBy';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7460d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_311_tables_columns', @level2type = N'COLUMN', @level2name = N'tables_columns_sourceProviderType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7360d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_311_tables_columns', @level2type = N'COLUMN', @level2name = N'tables_columns_sourceColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7260d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_311_tables_columns', @level2type = N'COLUMN', @level2name = N'tables_columns_sortByColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7160d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_311_tables_columns', @level2type = N'COLUMN', @level2name = N'tables_columns_keepUniqueRows';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7060d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_311_tables_columns', @level2type = N'COLUMN', @level2name = N'tables_columns_isUnique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6f60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_311_tables_columns', @level2type = N'COLUMN', @level2name = N'tables_columns_isNullable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6e60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_311_tables_columns', @level2type = N'COLUMN', @level2name = N'tables_columns_isNameInferred';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6d60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_311_tables_columns', @level2type = N'COLUMN', @level2name = N'tables_columns_isKey';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6c60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_311_tables_columns', @level2type = N'COLUMN', @level2name = N'tables_columns_isHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6b60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_311_tables_columns', @level2type = N'COLUMN', @level2name = N'tables_columns_isDataTypeInferred';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6a60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_311_tables_columns', @level2type = N'COLUMN', @level2name = N'tables_columns_formatString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6960d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_311_tables_columns', @level2type = N'COLUMN', @level2name = N'tables_columns_expression_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6860d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_311_tables_columns', @level2type = N'COLUMN', @level2name = N'tables_columns_expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6760d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_311_tables_columns', @level2type = N'COLUMN', @level2name = N'tables_columns_displayFolder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6660d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_311_tables_columns', @level2type = N'COLUMN', @level2name = N'tables_columns_description_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6560d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_311_tables_columns', @level2type = N'COLUMN', @level2name = N'tables_columns_description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6460d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_311_tables_columns', @level2type = N'COLUMN', @level2name = N'tables_columns_dataType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6360d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_311_tables_columns', @level2type = N'COLUMN', @level2name = N'tables_columns_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '641fb4d5-f00a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_311_tables_columns', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6260d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_311_tables_columns', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6160d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_311_tables_columns', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f25fd8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_311_tables_columns';

