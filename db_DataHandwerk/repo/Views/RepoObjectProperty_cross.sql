/*
<<property_start>>MS_Description
* cross join between RepoObject and *all* used properties in any RepoObject
* required for Antora export: per RepoObject we export partials for all Properties: +
When we use includes with tags we can't check if the tags exists or not. That's why we need to create all tags, with contents without content
<<property_end>>
*/
Create View repo.RepoObjectProperty_cross
As
Select
    ro.RepoObject_guid
  , p.property_name
From
    repo.RepoObject                         As ro
    Cross Join repo.PropertyName_RepoObject As p;
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6f1254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_cross'
  , @level2type = N'COLUMN'
  , @level2name = N'property_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6e1254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_cross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'ec5bf6c2-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_cross';
