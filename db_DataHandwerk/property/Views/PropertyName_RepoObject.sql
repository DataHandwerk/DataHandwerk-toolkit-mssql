
/*
all used [property_name] in any RepoObject, and additinally some [config].[Parameter].[sub_Parameter]
*/

CREATE View property.PropertyName_RepoObject
As
Select
    Distinct
    --
    Trim ( property_name ) As property_name
From
    property.RepoObjectProperty
Union
Select
    Distinct
    --
    Trim ( sub_Parameter )
From
    config.Parameter
Where
    Parameter_name In
    ( 'Inheritance_StringAggSeparatorSql_object', 'InheritanceDefinition_object', 'InheritanceType_object' )
    And sub_Parameter <> '';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '5db33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'PropertyName_RepoObject';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a5b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'PropertyName_RepoObject'
  , @level2type = N'COLUMN'
  , @level2name = N'property_name';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[Parameter]
* [property].[RepoObjectProperty]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'PropertyName_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'property_name', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'PropertyName_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'property_name', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'PropertyName_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(128)', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'PropertyName_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'045B0257-0A96-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'PropertyName_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.AntoraTemplate_examples.adoc[]
* xref:property.RepoObjectProperty_cross.adoc[]
* xref:property.RepoObjectProperty_InheritanceType_InheritanceDefinition.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'PropertyName_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.Parameter.adoc[]
* xref:property.RepoObjectProperty.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'PropertyName_RepoObject';

