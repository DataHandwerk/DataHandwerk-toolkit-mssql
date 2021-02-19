
CREATE VIEW [repo].[PropertyName_RepoObject]
AS
SELECT DISTINCT
 --
 [property_name]
FROM [repo].[RepoObjectProperty]

UNION

SELECT DISTINCT
 --
 [sub_Parameter]
FROM [repo].[Parameter]
WHERE [Parameter_name] IN (
  'Inheritance_StringAggSeparatorSql_object'
  , 'InheritanceDefinition_object'
  , 'InheritanceType_object'
  )
 AND [sub_Parameter] <> ''
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5db33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'PropertyName_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a5b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'PropertyName_RepoObject', @level2type = N'COLUMN', @level2name = N'property_name';

