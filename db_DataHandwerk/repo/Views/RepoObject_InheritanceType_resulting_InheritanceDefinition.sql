


/*
--The result must be grouped to determine all required calculation variants of an inheritance

SELECT is_StringAggAllSources
 , resulting_InheritanceDefinition
FROM repo.RepoObject_InheritanceType_resulting_InheritanceDefinition
GROUP BY is_StringAggAllSources
 , resulting_InheritanceDefinition
HAVING (NOT (resulting_InheritanceDefinition IS NULL))


*/
--todo: refactoring [RepoObjectProperty_InheritanceType_resulting_InheritanceDefinition]

CREATE VIEW [repo].[RepoObject_InheritanceType_resulting_InheritanceDefinition]
AS
SELECT
 --
 [inh].[RepoObject_guid]
 , [inh].[property_name]
 , [inh].[property_value]
 , [inh].[InheritanceType]
 , [is_force_inherit_empty_source] =
 --
 CASE 
  WHEN [InheritanceType] = 14
   THEN 1
  ELSE 0
  END
 , [is_StringAggAllSources] =
 --
 CASE 
  WHEN NOT [Inheritance_StringAggSeparatorSql] IS NULL
   THEN 1
  ELSE 0
  END
 , [Inheritance_StringAggSeparatorSql]
 , [resulting_InheritanceDefinition] =
 --
 CASE 
  WHEN (
    [InheritanceType] = 11
    AND [inh].[property_value] IS NULL
    )
   OR (
    [InheritanceType] = 12
    AND NULLIF([inh].[property_value], '') IS NULL
    )
   OR [InheritanceType] = 13
   OR [InheritanceType] = 14
   THEN ISNULL([InheritanceDefinition], '[repo].[fs_get_RepoObjectProperty_nvarchar]([referenced].[RepoObject_guid], [referencing].[property_name])')
  END
 --normally the result from [resulting_InheritanceDefinition] should not be empty to be inherited
 --this will avoid existing property_value to be deleted
 --but inheritance can be forced (dangerous!)
 , [inh].[InheritanceDefinition]
 , [inh].[RepoObject_fullname]
 , inh.RepoObject_type
FROM [repo].[RepoObject_InheritanceType_InheritanceDefinition] AS inh
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '61b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_resulting_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bdb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'resulting_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c0b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b6b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bfb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b8b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b7b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bbb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'is_StringAggAllSources';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bab33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'is_force_inherit_empty_source';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b9b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'beb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bcb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'Inheritance_StringAggSeparatorSql';

