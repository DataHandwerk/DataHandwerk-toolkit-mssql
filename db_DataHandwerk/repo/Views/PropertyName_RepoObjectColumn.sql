Create View repo.PropertyName_RepoObjectColumn
As
Select
    Distinct
    --
    property_name
From
    repo.RepoObjectColumnProperty
Union
Select
    Distinct
    --
    sub_Parameter
From
    [config].Parameter
Where
    Parameter_name In
    ( 'Inheritance_StringAggSeparatorSql_column', 'InheritanceDefinition_column', 'InheritanceType_column' )
    And sub_Parameter <> '';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '5eb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'PropertyName_RepoObjectColumn';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a6b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'PropertyName_RepoObjectColumn'
  , @level2type = N'COLUMN'
  , @level2name = N'property_name';
