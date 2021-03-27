

/*
--The result must be grouped to determine all required calculation variants of an inheritance

SELECT is_StringAggAllSources
 , resulting_InheritanceDefinition
FROM repo.RepoObjectColumn_InheritanceType_resulting_InheritanceDefinition
GROUP BY is_StringAggAllSources
 , resulting_InheritanceDefinition
HAVING (NOT (resulting_InheritanceDefinition IS NULL))



Maybe rename RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition

*/

CREATE VIEW [repo].[RepoObjectColumn_InheritanceType_resulting_InheritanceDefinition]
AS
SELECT
 --
 [inh].[RepoObjectColumn_guid]
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
   THEN ISNULL([InheritanceDefinition], '[repo].[fs_get_RepoObjectColumnProperty_nvarchar]([referenced].[RepoObjectColumn_guid], [referencing].[property_name])')
  END
 --normally the result from [resulting_InheritanceDefinition] should not be empty to be inherited
 --this will avoid existing property_value to be deleted
 --but inheritance can be forced (dangerous!)
 , [inh].[InheritanceDefinition]
 , [inh].[RepoObjectColumn_name]
FROM [repo].[RepoObjectColumn_InheritanceType_InheritanceDefinition] AS inh
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '53b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_resulting_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6fb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'resulting_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '71b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '68b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6ab33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '69b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6db33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'is_StringAggAllSources';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6cb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'is_force_inherit_empty_source';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6bb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '70b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6eb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_InheritanceType_resulting_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'Inheritance_StringAggSeparatorSql';

