/*
master.dbo.spt_values is an undocumemted hidden view or table, containing useful entries 
it's copy should be in in repo_config.spt_values
*/
CREATE VIEW [config].[type]
 --WITH SCHEMABINDING
AS
--
SELECT PARSENAME(REPLACE([name], ':', '.'), 2) AS 'type'
 , PARSENAME(REPLACE([name], ':', '.'), 1) AS 'type_desc'
FROM [config].spt_values
WHERE [type] = 'O9T'
 AND [number] = - 1;

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'd98f291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'VIEW', @level1name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7df17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'VIEW', @level1name = N'type', @level2type = N'COLUMN', @level2name = N'type_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7cf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'VIEW', @level1name = N'type', @level2type = N'COLUMN', @level2name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'[repo].[spt_values]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'VIEW', @level1name = N'type';

