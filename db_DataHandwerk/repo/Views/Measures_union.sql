/*
<<property_start>>MS_Description
Measures should assigned twice to two different tables

* original table
* virtual table '_measures' +
  the guid and name of this table are defined in xref:sqldb:repo.RepoSchema.adoc[]
<<property_end>>
*/
Create View repo.Measures_union
As
Select
    Measure_guid
  , RepoSchema_name
  , Description
  , Expression
  , is_ssas
  , measures_name
  , measures_description
  , measures_description_ja
  , measures_displayFolder
  , measures_expression
  , measures_expression_ja
  , measures_formatString
  , measures_isHidden
  , measures_fullname2
  , measures_fullname
  , RepoObject_fullname2
  , RepoObject_guid
  , RepoObject_name
From
    repo.Measures
Union All
Select
    Measure_guid
  , RepoSchema_name
  , Description
  , Expression
  , is_ssas
  , measures_name
  , measures_description
  , measures_description_ja
  , measures_displayFolder
  , measures_expression
  , measures_expression_ja
  , measures_formatString
  , measures_isHidden
  , measures_fullname2
  , measures_fullname
  , RepoObject_fullname2
  , RepoObject_guid = MeasuresRepoObjekt_guid
  , RepoObject_name = MeasuresRepoObjekt_name
From
    repo.Measures