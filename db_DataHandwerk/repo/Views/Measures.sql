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