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
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '19ff988b-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_2011_descriptions_StrAgg';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e2dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_2011_descriptions_StrAgg', @level2type = N'COLUMN', @level2name = N'descriptions_StrAgg';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e1dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_2011_descriptions_StrAgg', @level2type = N'COLUMN', @level2name = N'databasename';

