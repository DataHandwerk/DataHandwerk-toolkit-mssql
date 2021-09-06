
/*
Select
    Distinct
    j2.[Key]
  , j2.Value
  , j2.Type
From
    ssas.model_json_312_tables_measures_T As T1
    Cross Apply OpenJson ( T1.tables_measures_description_ja )
                --As j1
                --Cross Apply OpenJson ( j1.Value )
                                          As j2
Order By
    j2.[Key]
Go
*/

create View ssas.model_json_3121_tables_columns_descriptions_multiline
As
Select
    T1.databasename
  , T1.tables_name
  , T1.tables_measures_name
  , T1.RepoObject_guid
  , T1.Measure_guid
  , j2.[Key]
  , j2.Value
  , j2.Type
From
    ssas.model_json_312_tables_measures_T As T1
    Cross Apply OpenJson ( T1.tables_measures_description_ja )
                --As j1
                --Cross Apply OpenJson ( j1.Value )
                                          As j2