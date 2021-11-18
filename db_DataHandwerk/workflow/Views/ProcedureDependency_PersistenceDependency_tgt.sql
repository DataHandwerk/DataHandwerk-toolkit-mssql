

create View [workflow].[ProcedureDependency_PersistenceDependency_tgt]
As
Select
    referenced_Procedure_RepoObject_guid
  , referencing_Procedure_RepoObject_guid
  , is_PersistenceDependency
--, [is_active]
--, [Description]
--, [id]
From
    workflow.ProcedureDependency
Where
    is_PersistenceDependency = 1
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b39ff6cf-f347-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_PersistenceDependency_tgt', @level2type = N'COLUMN', @level2name = N'is_PersistenceDependency';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b29ff6cf-f347-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_PersistenceDependency_tgt', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b19ff6cf-f347-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_PersistenceDependency_tgt', @level2type = N'COLUMN', @level2name = N'referenced_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'fe1f04c7-f347-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_PersistenceDependency_tgt';

