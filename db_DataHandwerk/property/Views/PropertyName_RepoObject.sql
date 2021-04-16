/*
all used [property_name] in any RepoObject, and additinally some [config].[Parameter].[sub_Parameter]
*/

Create View [property].PropertyName_RepoObject
As
Select
    Distinct
    --
    property_name
From
    [property].RepoObjectProperty
Union
Select
    Distinct
    --
    sub_Parameter
From
    [config].Parameter
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
