CREATE VIEW docs.RepoObject_ParameterList
AS
SELECT RepoObject_guid = SysObject_RepoObject_guid
 , AntoraParameterList = STRING_AGG(CONCAT (
   cast(N'* ' AS NVARCHAR(max))
   , name
   , ' (' + user_type_fullname + ')'
   , IIF(has_default_value = 1, ' = ' + TRY_CAST(default_value AS NVARCHAR(4000)), NULL)
   ), CHAR(13) + CHAR(10)) within
GROUP (
  ORDER BY parameter_id
  )
FROM [repo_sys].[parameters]
GROUP BY SysObject_RepoObject_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '117e7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_ParameterList', @level2type = N'COLUMN', @level2name = N'AntoraParameterList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '107e7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_ParameterList', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9ddfbe88-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_ParameterList';

