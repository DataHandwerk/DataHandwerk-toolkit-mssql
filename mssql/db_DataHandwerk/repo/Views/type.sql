
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



GO



GO


