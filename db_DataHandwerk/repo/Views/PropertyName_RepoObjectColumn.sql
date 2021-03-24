
CREATE VIEW [repo].[PropertyName_RepoObjectColumn]
AS
SELECT DISTINCT
 --
 [property_name]
FROM [repo].[RepoObjectColumnProperty]

UNION

SELECT DISTINCT
 --
 [sub_Parameter]
FROM [repo].[Parameter]
WHERE [Parameter_name] IN (
  'Inheritance_StringAggSeparatorSql_column'
  , 'InheritanceDefinition_column'
  , 'InheritanceType_column'
  )
 AND [sub_Parameter] <> ''
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5eb33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'PropertyName_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a6b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'PropertyName_RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'property_name';

