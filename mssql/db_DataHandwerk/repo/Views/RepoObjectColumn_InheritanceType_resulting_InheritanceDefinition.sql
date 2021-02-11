CREATE VIEW [repo].[RepoObjectColumn_InheritanceType_resulting_InheritanceDefinition]
AS
SELECT
 --
 [inh].[RepoObjectColumn_guid]
 , [inh].[property_name]
 , [inh].[property_value]
 , [inh].[InheritanceType]
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
   THEN ISNULL([InheritanceDefinition], '[repo].[fs_get_RepoObjectColumnProperty_nvarchar]([predecessor].[RepoObjectColumn_guid], [this].[property_name])')
  END
 --normally the result from [resulting_InheritanceDefinition] should not be empty to be inherited
 --this will avoid existing property_value to be deleted
 --but inheritance can be forced (dangerous!)
 , [is_force_inherit_empty_source] =
 --
 CASE 
  WHEN [InheritanceType] = 14
   THEN 1
  ELSE 0
  END
 , [inh].[InheritanceDefinition]
 , [inh].[RepoObjectColumn_name]
FROM [repo].[RepoObjectColumn_InheritanceType_InheritanceDefinition] AS inh