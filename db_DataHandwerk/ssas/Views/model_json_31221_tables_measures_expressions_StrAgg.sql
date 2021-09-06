
create View ssas.model_json_31221_tables_measures_expressions_StrAgg
As
Select
    T1.databasename
  , T1.tables_name
  , T1.tables_measures_name
  , T1.RepoObject_guid
  , T1.Measure_guid
  , expressions_StrAgg = String_Agg ( Value, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                         [key])
From
    ssas.model_json_3122_tables_measures_expressions_multiline As T1
Group By
    T1.databasename
  , T1.tables_name
  , T1.tables_measures_name
  , T1.RepoObject_guid
  , T1.Measure_guid