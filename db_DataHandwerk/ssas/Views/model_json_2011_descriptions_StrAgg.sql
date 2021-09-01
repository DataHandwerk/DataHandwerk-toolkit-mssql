Create View ssas.model_json_2011_descriptions_StrAgg
As
Select
    T1.databasename
  , descriptions_StrAgg = String_Agg ( Value, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                          [key])
From
    ssas.model_json_201_descriptions_multiline As T1
Group By
    T1.databasename