
-- Alter View type
-- Alter View type

/*
master.dbo.spt_values is an undocumemted hidden view or table, containing useful entries 
it's copy should be in in repo_config.spt_values
*/
CREATE VIEW [repo].[type]
--WITH SCHEMABINDING
As
--
Select
       PARSENAME(REPLACE([name] , ':' , '.') , 2) As 'type'
     , PARSENAME(REPLACE([name] , ':' , '.') , 1) As 'type_desc'
From
     repo.spt_values
Where  [type] = 'O9T'
       And [number] = -1;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6928ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'type', @level2type = N'COLUMN', @level2name = N'type_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6828ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'type', @level2type = N'COLUMN', @level2name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '549f84d1-c646-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'type';

