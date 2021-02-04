
CREATE VIEW [graph].[ProcedureInstance_S]
AS
SELECT
 -- 
 [T1].[Procedure_RepoObject_guid]
 , [T1].[Instance]
 , [Procedure_fullname] = [ro].[RepoObject_fullname]
FROM [repo].[ProcedureInstance] AS T1
INNER JOIN [repo].[RepoObject] AS ro
 ON ro.RepoObject_guid = T1.[Procedure_RepoObject_guid]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '32c1e60f-ed66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'ProcedureInstance_S';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '48c1e60f-ed66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'ProcedureInstance_S', @level2type = N'COLUMN', @level2name = N'Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4ac1e60f-ed66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'ProcedureInstance_S', @level2type = N'COLUMN', @level2name = N'Procedure_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '49c1e60f-ed66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'VIEW', @level1name = N'ProcedureInstance_S', @level2type = N'COLUMN', @level2name = N'Instance';

