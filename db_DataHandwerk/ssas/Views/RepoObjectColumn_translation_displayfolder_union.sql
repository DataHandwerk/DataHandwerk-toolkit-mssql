
CREATE   View [ssas].[RepoObjectColumn_translation_displayfolder_union]
As
Select
    T1.RepoObjectColumn_guid
  , T1.cultures_name
  , T1.Column_name
  , T1.cultures_translations_model_name
  , T1.cultures_translations_model_tables_columns_name
  , T1.cultures_translations_model_tables_name
  , T1.databasename
  , T1.displayfolder_DisplayName
  , T1.displayfolder_translation
  , T1.pk_index_guid
  , T1.RepoObject_name
  , T1.RepoObject_schema_name
  , T1.RepoObjectColumn_DisplayName
  , T1.RepoObjectColumn_translation
  , T1.tabcol_IsHidden
  , T1.tables_columns_displayFolder
  , T1.tables_columns_name
  , T1.tables_name
  , is_displayfolder = 0
From
    ssas.RepoObjectColumn_translation_T As T1
Union All
--one pseudo measure per culture, table and displayfolder
Select
    T2.RepoObjectColumn_guid
  , T2.cultures_name
  , T2.Column_name
  , T2.cultures_translations_model_name
  , T2.cultures_translations_model_tables_columns_name
  , T2.cultures_translations_model_tables_name
  , T2.databasename
  , T2.displayfolder_DisplayName
  , T2.displayfolder_translation
  , T2.pk_index_guid
  , T2.RepoObject_name
  , T2.RepoObject_schema_name
  , T2.RepoObjectColumn_DisplayName
  , T2.RepoObjectColumn_translation
  , T2.tabcol_IsHidden
  , T2.tables_columns_displayFolder
  , T2.tables_columns_name
  , T2.tables_name
  , T2.is_displayfolder
From
(
    Select
        T1.RepoObjectColumn_guid
      , T1.cultures_name
      , T1.Column_name
      , T1.cultures_translations_model_name
      , T1.cultures_translations_model_tables_columns_name
      , T1.cultures_translations_model_tables_name
      , T1.databasename
      , T1.displayfolder_DisplayName
      , T1.displayfolder_translation
      , T1.pk_index_guid
      , T1.RepoObject_name
      , T1.RepoObject_schema_name
      , T1.RepoObjectColumn_DisplayName
      , T1.RepoObjectColumn_translation
      , T1.tabcol_IsHidden
      , T1.tables_columns_displayFolder
      , T1.tables_columns_name
      , T1.tables_name
      , is_displayfolder = 1
      , rn               = Row_Number () Over ( Partition By
                                                    T1.cultures_name
                                                  , T1.RepoObject_schema_name
                                                  , T1.RepoObject_name
                                                  , T1.displayfolder_DisplayName
                                                Order By
                                                    --das ist noch nicht richtig, weil nicht jede Spalte in jeder ColumnList enthalten ist
                                                    --am besten wäre es, erst mal die Spalten zu nehmen, die in einem PK enthalten sind
                                                    --dann not hidden
                                                    T1.pk_index_guid Desc
                                                  , T1.tabcol_IsHidden
                                              )
    From
        ssas.RepoObjectColumn_translation_T As T1
) As T2
Where
    T2.rn = 1
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4bfeedf7-7727-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'is_displayfolder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4afeedf7-7727-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '49feedf7-7727-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'tables_columns_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '48feedf7-7727-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'tables_columns_displayFolder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '47feedf7-7727-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'tabcol_IsHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '46feedf7-7727-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_translation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '45feedf7-7727-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_DisplayName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '44feedf7-7727-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '43feedf7-7727-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '42feedf7-7727-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'pk_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '41feedf7-7727-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'displayfolder_translation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '40feedf7-7727-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'displayfolder_DisplayName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3ffeedf7-7727-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3efeedf7-7727-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3dfeedf7-7727-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_tables_columns_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3cfeedf7-7727-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'cultures_translations_model_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3bfeedf7-7727-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'Column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3afeedf7-7727-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '39feedf7-7727-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation_displayfolder_union', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6cd59de4-7727-ec11-852a-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_translation_displayfolder_union';

