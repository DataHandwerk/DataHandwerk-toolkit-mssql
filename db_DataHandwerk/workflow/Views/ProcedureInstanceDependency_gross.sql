CREATE View workflow.ProcedureInstanceDependency_gross
As
Select
    --
    pid.id
  , pid.referenced_id
  , pid.referencing_id
  , pid.is_active
  , pid.is_PersistenceDependency
  , pid.Description
  , pi_1.Instance                  As referenced_Instance
  , ro_1.RepoObject_fullname       As referenced_RepoObject_fullname
  , pi_1.Procedure_RepoObject_guid As referenced_Procedure_RepoObject_guid
  , pi_2.Instance                  As referencing_Instance
  , ro_2.RepoObject_fullname       As referencing_RepoObject_fullname
  , pi_2.Procedure_RepoObject_guid As referencing_Procedure_RepoObject_guid
From
    workflow.ProcedureInstanceDependency As pid
    Inner Join
        workflow.ProcedureInstance       As pi_1
            On
            pid.referenced_id              = pi_1.id

    Inner Join
        workflow.ProcedureInstance       As pi_2
            On
            pid.referencing_id             = pi_2.id

    Inner Join
        repo.RepoObject              As ro_1
            On
            pi_1.Procedure_RepoObject_guid = ro_1.RepoObject_guid

    Inner Join
        repo.RepoObject              As ro_2
            On
            pi_2.Procedure_RepoObject_guid = ro_2.RepoObject_guid;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '331f4ec7-9874-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureInstanceDependency_gross', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '321f4ec7-9874-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureInstanceDependency_gross', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '311f4ec7-9874-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureInstanceDependency_gross', @level2type = N'COLUMN', @level2name = N'referencing_Instance';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '301f4ec7-9874-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureInstanceDependency_gross', @level2type = N'COLUMN', @level2name = N'referenced_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2f1f4ec7-9874-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureInstanceDependency_gross', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2e1f4ec7-9874-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureInstanceDependency_gross', @level2type = N'COLUMN', @level2name = N'referenced_Instance';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2d1f4ec7-9874-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureInstanceDependency_gross', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2c1f4ec7-9874-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureInstanceDependency_gross', @level2type = N'COLUMN', @level2name = N'is_PersistenceDependency';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2b1f4ec7-9874-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureInstanceDependency_gross', @level2type = N'COLUMN', @level2name = N'is_active';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2a1f4ec7-9874-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureInstanceDependency_gross', @level2type = N'COLUMN', @level2name = N'referencing_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '291f4ec7-9874-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureInstanceDependency_gross', @level2type = N'COLUMN', @level2name = N'referenced_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '281f4ec7-9874-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureInstanceDependency_gross', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e49d1ac1-9874-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureInstanceDependency_gross';

