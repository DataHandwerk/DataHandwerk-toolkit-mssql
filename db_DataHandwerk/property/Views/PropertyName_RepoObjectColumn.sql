
CREATE View property.PropertyName_RepoObjectColumn
As
Select
    Distinct
    --
    property_name
From
    property.RepoObjectColumnProperty
Union
Select
    Distinct
    --
    sub_Parameter
From
    config.Parameter
Where
    Parameter_name In
    ( 'Inheritance_StringAggSeparatorSql_column', 'InheritanceDefinition_column', 'InheritanceType_column' )
    And sub_Parameter <> ''
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '5eb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'PropertyName_RepoObjectColumn';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a6b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'PropertyName_RepoObjectColumn'
  , @level2type = N'COLUMN'
  , @level2name = N'property_name';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[Parameter]
* [property].[RepoObjectColumnProperty]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'PropertyName_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'property_name', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'PropertyName_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'property_name', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'PropertyName_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(128)', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'PropertyName_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'49ED6A64-0A96-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'PropertyName_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:property.RepoObjectColumnProperty_InheritanceType_InheritanceDefinition.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'PropertyName_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.Parameter.adoc[]
* xref:property.RepoObjectColumnProperty.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'PropertyName_RepoObjectColumn';

