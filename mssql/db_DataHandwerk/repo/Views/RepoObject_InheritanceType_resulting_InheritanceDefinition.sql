

/*
--The result must be grouped to determine all required calculation variants of an inheritance

SELECT is_StringAggAllSources
 , resulting_InheritanceDefinition
FROM repo.RepoObject_InheritanceType_resulting_InheritanceDefinition
GROUP BY is_StringAggAllSources
 , resulting_InheritanceDefinition
HAVING (NOT (resulting_InheritanceDefinition IS NULL))

*/

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