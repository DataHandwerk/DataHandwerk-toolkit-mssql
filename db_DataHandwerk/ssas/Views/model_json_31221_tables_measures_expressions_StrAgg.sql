
CREATE View ssas.model_json_31221_tables_measures_expressions_StrAgg
As
Select
    T1.databasename
  , T1.tables_name
  , T1.tables_measures_name
  , T1.RepoObject_guid
  , T1.Measure_guid
  , expressions_StrAgg = String_Agg ( Cast(T1.Value As NVarchar(Max)), Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                                   Try_Cast(T1.[Key] As Int))
From
    ssas.model_json_3122_tables_measures_expressions_multiline As T1
Group By
    T1.databasename
  , T1.tables_name
  , T1.tables_measures_name
  , T1.RepoObject_guid
  , T1.Measure_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e3f27b65-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31221_tables_measures_expressions_StrAgg';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f85f9573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31221_tables_measures_expressions_StrAgg', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f95f9573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31221_tables_measures_expressions_StrAgg', @level2type = N'COLUMN', @level2name = N'tables_measures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fa5f9573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31221_tables_measures_expressions_StrAgg', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fb5f9573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31221_tables_measures_expressions_StrAgg', @level2type = N'COLUMN', @level2name = N'Measure_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fc5f9573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31221_tables_measures_expressions_StrAgg', @level2type = N'COLUMN', @level2name = N'expressions_StrAgg';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f75f9573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31221_tables_measures_expressions_StrAgg', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [ssas].[model_json_3122_tables_measures_expressions_multiline]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31221_tables_measures_expressions_StrAgg';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31221_tables_measures_expressions_StrAgg';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31221_tables_measures_expressions_StrAgg';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.Measures.adoc[]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31221_tables_measures_expressions_StrAgg';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:ssas.model_json_3122_tables_measures_expressions_multiline.adoc[]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31221_tables_measures_expressions_StrAgg';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_3122_tables_measures_expressions_multiline].[tables_name]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31221_tables_measures_expressions_StrAgg', @level2type = N'COLUMN', @level2name = N'tables_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_3122_tables_measures_expressions_multiline].[tables_measures_name]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31221_tables_measures_expressions_StrAgg', @level2type = N'COLUMN', @level2name = N'tables_measures_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_3122_tables_measures_expressions_multiline].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31221_tables_measures_expressions_StrAgg', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_3122_tables_measures_expressions_multiline].[Measure_guid]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31221_tables_measures_expressions_StrAgg', @level2type = N'COLUMN', @level2name = N'Measure_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json_3122_tables_measures_expressions_multiline].[databasename]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_31221_tables_measures_expressions_StrAgg', @level2type = N'COLUMN', @level2name = N'databasename';

