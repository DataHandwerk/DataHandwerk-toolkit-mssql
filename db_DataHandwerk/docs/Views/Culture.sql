Create View docs.Culture
As
Select
    Distinct
    cultures_name
From
    ssas.model_json_34_cultures_T
Where
    is_CultureDocsOutput = 1
Union
Select
    ''