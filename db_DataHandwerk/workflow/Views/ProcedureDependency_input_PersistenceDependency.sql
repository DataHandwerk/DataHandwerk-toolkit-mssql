CREATE View [workflow].[ProcedureDependency_input_PersistenceDependency]
As
Select
    [referenced_Procedure_RepoObject_guid]
  , [referencing_Procedure_RepoObject_guid]
  , [is_PersistenceDependency]
--, [is_active]
--, [Description]
--, [id]
From
    [workflow].[ProcedureDependency]
Where
    [is_PersistenceDependency] = 1;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '99b707fe-71f7-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_input_PersistenceDependency';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5e6bea16-72f7-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_input_PersistenceDependency', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5d6bea16-72f7-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_input_PersistenceDependency', @level2type = N'COLUMN', @level2name = N'referenced_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5f6bea16-72f7-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_input_PersistenceDependency', @level2type = N'COLUMN', @level2name = N'is_PersistenceDependency';

