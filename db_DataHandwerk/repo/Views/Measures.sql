CREATE View repo.Measures
As
Select
    T1.Measure_guid
  , RepoSchema_name         = T1.databasename
  , Description             = Coalesce ( T1.tables_measures_description, T2.descriptions_StrAgg )
  , Expression              = Coalesce ( T1.tables_measures_expression, T3.expressions_StrAgg )
  , is_ssas                 = Cast(1 As Bit)
  , measures_name           = T1.tables_measures_name
  , measures_description    = T1.tables_measures_description
  , measures_description_ja = T1.tables_measures_description_ja
  , measures_displayFolder  = T1.tables_measures_displayFolder
  , measures_expression     = T1.tables_measures_expression
  , measures_expression_ja  = T1.tables_measures_expression_ja
  , measures_formatString   = T1.tables_measures_formatString
  , measures_isHidden       = T1.tables_measures_isHidden
  , measures_fullname2      = T1.databasename + '.measures.' + T1.tables_measures_name
  , measures_fullname       = QuoteName ( T1.databasename ) + '.' + QuoteName ( T1.tables_measures_name )
  , RepoObject_fullname2    = T1.databasename + '.' + T1.tables_name
  , T1.RepoObject_guid
  , RepoObject_name         = T1.tables_name
From
    ssas.model_json_312_tables_measures_T                        As T1
    Left Outer Join
        ssas.model_json_31211_tables_columns_descriptions_StrAgg As T2
            On
            T2.Measure_guid = T1.Measure_guid

    Left Outer Join
        ssas.model_json_31221_tables_measures_expressions_StrAgg As T3
            On
            T3.Measure_guid = T1.Measure_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'dff27b65-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'de5f9573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'RepoSchema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ee5f9573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ed5f9573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ec5f9573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e25f9573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'measures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e95f9573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'measures_isHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ea5f9573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'measures_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eb5f9573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'measures_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e85f9573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'measures_formatString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e75f9573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'measures_expression_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e65f9573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'measures_expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e55f9573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'measures_displayFolder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e45f9573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'measures_description_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e35f9573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'measures_description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dd5f9573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'Measure_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e15f9573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'is_ssas';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e05f9573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'Expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'df5f9573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [ssas].[model_json_312_tables_measures_T]
* [ssas].[model_json_31211_tables_columns_descriptions_StrAgg]
* [ssas].[model_json_31221_tables_measures_expressions_StrAgg]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.Unit_1_union.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:ssas.model_json_312_tables_measures_T.adoc[]
* xref:ssas.model_json_31211_tables_columns_descriptions_StrAgg.adoc[]
* xref:ssas.model_json_31221_tables_measures_expressions_StrAgg.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_312_tables_measures_T].[databasename]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'RepoSchema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_312_tables_measures_T].[tables_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_312_tables_measures_T].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_312_tables_measures_T].[tables_measures_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'measures_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_312_tables_measures_T].[tables_measures_isHidden]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'measures_isHidden';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_312_tables_measures_T].[tables_measures_formatString]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'measures_formatString';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_312_tables_measures_T].[tables_measures_expression_ja]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'measures_expression_ja';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_312_tables_measures_T].[tables_measures_expression]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'measures_expression';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_312_tables_measures_T].[tables_measures_displayFolder]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'measures_displayFolder';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_312_tables_measures_T].[tables_measures_description_ja]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'measures_description_ja';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_312_tables_measures_T].[tables_measures_description]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'measures_description';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_312_tables_measures_T].[Measure_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measures', @level2type = N'COLUMN', @level2name = N'Measure_guid';

