/****** Script for SelectTopNRows command from SSMS  ******/
CREATE VIEW repo.RepoObject_fullname_u_v
AS
SELECT [RepoObject_fullname]
FROM [repo].[RepoObject]
WHERE [RepoObject_type] IN (
  'u'
  , 'v'
  )
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '19df2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_fullname_u_v', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '08df2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_fullname_u_v';

