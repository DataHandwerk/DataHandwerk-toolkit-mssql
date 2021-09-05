



/*
--The result must be grouped to determine all required calculation variants of an inheritance

SELECT is_StringAggAllSources
 , resulting_InheritanceDefinition
FROM repo.RepoObjectColumn_InheritanceType_resulting_InheritanceDefinition
GROUP BY is_StringAggAllSources
 , resulting_InheritanceDefinition
HAVING (NOT (resulting_InheritanceDefinition IS NULL))

*/

CREATE View property.RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition
As
Select
    --
    inh.RepoObjectColumn_guid
  , inh.property_name
  , inh.property_value
  , inh.InheritanceType
  , is_force_inherit_empty_source   =
  --
  Case
      When inh.InheritanceType = 14
          Then
          1
      Else
          0
  End
  , is_StringAggAllSources          =
  --
  Case
      When Not inh.Inheritance_StringAggSeparatorSql Is Null
          Then
          1
      Else
          0
  End
  , inh.Inheritance_StringAggSeparatorSql
  , resulting_InheritanceDefinition =
  --
  Case
      When (
               inh.InheritanceType = 11
               And inh.property_value Is Null
           )
           Or
           (
               inh.InheritanceType = 12
               And NullIf(inh.property_value, '') Is Null
           )
           Or inh.InheritanceType = 13
           Or inh.InheritanceType = 14
          Then
          IsNull (
                     inh.InheritanceDefinition
                   , '[property].[fs_get_RepoObjectColumnProperty_nvarchar]([referenced].[RepoObjectColumn_guid], [referencing].[property_name])'
                 )
  End
  --normally the result from [resulting_InheritanceDefinition] should not be empty to be inherited
  --this will avoid existing property_value to be deleted
  --but inheritance can be forced (dangerous!)
  , inh.InheritanceDefinition
  , inh.RepoObjectColumn_name
From
    property.RepoObjectColumnProperty_InheritanceType_InheritanceDefinition As inh
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '53b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6fb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'resulting_InheritanceDefinition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '71b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '68b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6ab33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'property_value';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '69b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'property_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6db33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'is_StringAggAllSources';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6cb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'is_force_inherit_empty_source';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6bb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'InheritanceType';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '70b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'InheritanceDefinition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6eb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'Inheritance_StringAggSeparatorSql';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [property].[RepoObjectColumnProperty_InheritanceType_InheritanceDefinition]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObjectColumn_guid,property_name', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObjectColumn_guid,property_name', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,nvarchar(128)', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = '9085accf-5e9f-eb11-84f8-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:property.usp_RepoObjectColumn_Inheritance.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:property.RepoObjectColumnProperty_InheritanceType_InheritanceDefinition.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectColumnProperty_InheritanceType_InheritanceDefinition].[RepoObjectColumn_name]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the column. Is unique within the object.', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectColumnProperty_InheritanceType_InheritanceDefinition].[RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectColumnProperty_InheritanceType_InheritanceDefinition].[property_value]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'datatype of property_value is `sql_variant`, because it should be possible to synchronize the property_value in the repository with property_value in extended properties in the dwh database, which is `sql_variant` +
therefore the maximum content is nvarchar(4000) or varchar(8000)', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectColumnProperty_InheritanceType_InheritanceDefinition].[property_name]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectColumnProperty_InheritanceType_InheritanceDefinition].[InheritanceType]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectColumnProperty_InheritanceType_InheritanceDefinition].[InheritanceDefinition]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectColumnProperty_InheritanceType_InheritanceDefinition].[Inheritance_StringAggSeparatorSql]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition';

