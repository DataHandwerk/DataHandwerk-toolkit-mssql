CREATE VIEW repo.ExtendedProperty_Repo2Sys_level2_Union
AS
SELECT
 --
 [property_name]
 , [property_value]
 , [level0type]
 , [level0name]
 , [level1type]
 , [level1name]
 , [level2type]
 , [level2name]
FROM [repo].[ExtendedProperty_Repo2Sys_level2_RepoObject]

UNION ALL

SELECT
 --
 [property_name]
 , [property_value]
 , [level0type]
 , [level0name]
 , [level1type]
 , [level1name]
 , [level2type]
 , [level2name]
FROM [repo].ExtendedProperty_Repo2Sys_level2_RepoObjectColumn