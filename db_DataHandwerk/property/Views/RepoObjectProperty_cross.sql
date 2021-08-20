
/*
<<property_start>>MS_Description
* cross join between RepoObject and *all* used properties in any RepoObject
* required for Antora export: per RepoObject we export partials for all Properties: +
When we use includes with tags we can't check if the tags exists or not. That's why we need to create all tags, with contents without content
<<property_end>>
*/
CREATE View property.RepoObjectProperty_cross
As
Select
    ro.RepoObject_guid
  , p.property_name
From
    repo.RepoObject                             As ro
    Cross Join property.PropertyName_RepoObject As p
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6f1254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_cross'
  , @level2type = N'COLUMN'
  , @level2name = N'property_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6e1254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_cross'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'ec5bf6c2-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_cross';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [property].[PropertyName_RepoObject]
* [repo].[RepoObject]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_cross';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObject_guid,property_name', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_cross';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid,property_name', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_cross';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,nvarchar(128)', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_cross';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = '50094558-5f9f-eb11-84f8-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_cross';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'
* cross join between RepoObject and *all* used properties in any RepoObject
* required for Antora export: per RepoObject we export partials for all Properties: +
When we use includes with tags we can''t check if the tags exists or not. That''s why we need to create all tags, with contents without content', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_cross';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.RepoObject_Adoc.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_cross';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:property.PropertyName_RepoObject.adoc[]
* xref:repo.RepoObject.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_cross';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_cross', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[PropertyName_RepoObject].[property_name]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_cross', @level2type = N'COLUMN', @level2name = N'property_name';

