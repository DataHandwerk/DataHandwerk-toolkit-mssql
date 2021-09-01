
/*
Select
    Distinct
    j2.[Key]
  , j2.[value]
  , j2.Type
From
    ssas.[model_json_31_tables] As T1
    Cross Apply OpenJson ( T1.[tables_description_ja] )
                --As j1
                --Cross Apply OpenJson ( j1.Value )
                       As j2
order by
    j2.[Key]
Go
*/

CREATE View ssas.model_json_316_tables_descriptions_multiline
As
Select
    T1.databasename
  , T1.tables_name
  , T1.RepoObject_guid
  , j2.[Key]
  , j2.Value
  , j2.Type
From
    ssas.model_json_31_tables_T As T1
    Cross Apply OpenJson ( T1.tables_description_ja )
                --As j1
                --Cross Apply OpenJson ( j1.Value )
                                As j2