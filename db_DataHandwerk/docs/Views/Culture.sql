
CREATE View docs.Culture
As
Select
    Distinct
    cultures_name
From
    ssas.model_json_3411_cultures_translations_model_T
Where
    is_CultureDocsOutput = 1
Union
Select
    ''
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2c5ec26b-2f22-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Culture';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e5243774-2f22-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Culture', @level2type = N'COLUMN', @level2name = N'cultures_name';

