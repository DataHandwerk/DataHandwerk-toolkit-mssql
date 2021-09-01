﻿
/*
Select
    Distinct
    j2.[Key]
  , j2.[value]
  , j2.Type
From
    ssas.[model_json_311_tables_columns_T] As T1
    Cross Apply OpenJson ( T1.tables_columns_description_ja )
                --As j1
                --Cross Apply OpenJson ( j1.Value )
                                           As j2
order by
    j2.[Key]
Go
*/

create View ssas.model_json_3111_tables_columns_descriptions_multiline
As
Select
    T1.databasename
  , T1.tables_name
  , T1.tables_columns_name
  , T1.RepoObject_guid
  , T1.RepoObjectColumn_guid
  , j2.[Key]
  , j2.Value
  , j2.Type
From
    ssas.model_json_311_tables_columns_T As T1
    Cross Apply OpenJson ( T1.tables_columns_description_ja )
                --As j1
                --Cross Apply OpenJson ( j1.Value )
                                         As j2