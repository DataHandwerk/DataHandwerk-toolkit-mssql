/*
master.dbo.spt_values is an undocumemted hidden view or table, containing useful entries 
it's copy should be in in repo_config.spt_values
*/
CREATE VIEW [repo].[type]
 --WITH SCHEMABINDING
AS
--
SELECT PARSENAME(REPLACE([name], ':', '.'), 2) AS 'type'
 , PARSENAME(REPLACE([name], ':', '.'), 1) AS 'type_desc'
FROM repo.spt_values
WHERE [type] = 'O9T'
 AND [number] = - 1;
