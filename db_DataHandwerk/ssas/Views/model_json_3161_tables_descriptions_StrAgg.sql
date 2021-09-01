
CREATE View ssas.model_json_3161_tables_descriptions_StrAgg
As
Select
    T1.databasename
  , T1.tables_name
  , T1.RepoObject_guid
  , descriptions_StrAgg = String_Agg ( Value, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                          [key])
From
    ssas.model_json_316_tables_descriptions_multiline As T1
Group By
    T1.databasename
  , T1.tables_name
  , T1.RepoObject_guid