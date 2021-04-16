

/*
--The result must be grouped to determine all required calculation variants of an inheritance

SELECT is_StringAggAllSources
 , resulting_InheritanceDefinition
FROM repo.RepoObjectColumn_InheritanceType_resulting_InheritanceDefinition
GROUP BY is_StringAggAllSources
 , resulting_InheritanceDefinition
HAVING (NOT (resulting_InheritanceDefinition IS NULL))

*/

Create View [property].RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition
As
Select
    --
    inh.RepoObjectColumn_guid
  , inh.property_name
  , inh.property_value
  , inh.InheritanceType
  , is_force_inherit_empty_source    =
  --
  Case
      When InheritanceType = 14
          Then
          1
      Else
          0
  End
  , is_StringAggAllSources           =
  --
  Case
      When Not Inheritance_StringAggSeparatorSql Is Null
          Then
          1
      Else
          0
  End
  , Inheritance_StringAggSeparatorSql
  , resulting_InheritanceDefinition  =
  --
  Case
      When (
               InheritanceType = 11
               And inh.property_value Is Null
           )
           Or
           (
               InheritanceType = 12
               And NullIf(inh.property_value, '') Is Null
           )
           Or InheritanceType = 13
           Or InheritanceType = 14
          Then
          IsNull (
                     InheritanceDefinition
                   , '[repo].[fs_get_RepoObjectColumnProperty_nvarchar]([referenced].[RepoObjectColumn_guid], [referencing].[property_name])'
                 )
  End
  --normally the result from [resulting_InheritanceDefinition] should not be empty to be inherited
  --this will avoid existing property_value to be deleted
  --but inheritance can be forced (dangerous!)
  , inh.InheritanceDefinition
  , inh.RepoObjectColumn_name
From
    [property].RepoObjectColumnProperty_InheritanceType_InheritanceDefinition As inh;
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
