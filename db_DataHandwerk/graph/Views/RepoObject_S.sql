﻿CREATE VIEW [graph].[RepoObject_S]
AS
SELECT
 -- 
 [RepoObject_guid]
 , [RepoObject_fullname]
 , [RepoObject_type]
FROM [repo].[RepoObject]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a89fcdb3-3265-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObject_S';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ac9fcdb3-3265-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObject_S', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aa9fcdb3-3265-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObject_S', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ab9fcdb3-3265-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'RepoObject_S', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';
