
/*
Select
    Distinct
    j2.[Key]
  , j2.[value]
  , j2.Type
From
    ssas.model_json_20 As T1
    Cross Apply OpenJson ( T1.l2_description_ja )
                --As j1
                --Cross Apply OpenJson ( j1.Value )
                       As j2
order by
    j2.[Key]
Go
*/

CREATE View ssas.model_json_201_descriptions_multiline
As
Select
    T1.databasename
  , j2.[Key]
  , j2.Value
  , j2.Type
From
    ssas.model_json_20 As T1
    Cross Apply OpenJson ( T1.l2_description_ja )
                --As j1
                --Cross Apply OpenJson ( j1.Value )
                       As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2f064fc7-110b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_201_descriptions_multiline', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2e064fc7-110b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_201_descriptions_multiline', @level2type = N'COLUMN', @level2name = N'Value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2d064fc7-110b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_201_descriptions_multiline', @level2type = N'COLUMN', @level2name = N'Key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2c064fc7-110b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_201_descriptions_multiline', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '24064fc7-110b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_201_descriptions_multiline';

