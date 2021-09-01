
Create View ssas.[model_json_31111_tables_columns_descriptions_StrAgg]
As
Select
    T1.databasename
  , T1.tables_name
  , T1.tables_columns_name
  , T1.RepoObject_guid
  , T1.RepoObjectColumn_guid
  , descriptions_StrAgg = String_Agg ( Value, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                          [key])
From
    ssas.model_json_3111_tables_columns_descriptions_multiline As T1
Group By
    T1.databasename
  , T1.tables_name
  , T1.tables_columns_name
  , T1.RepoObject_guid
  , T1.RepoObjectColumn_guid