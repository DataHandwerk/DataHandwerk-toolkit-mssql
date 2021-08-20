


CREATE View workflow.ProcedureDependency_input_PersistenceDependency_S
As
Select
    referenced_Procedure_RepoObject_guid  = T1.referenced_usp_persistence_RepoObject_guid
  , referencing_Procedure_RepoObject_guid = T1.referencing_usp_persistence_RepoObject_guid
  , is_PersistenceDependency              = 1
--, T1.referenced_RepoObject_guid
--, T1.referencing_RepoObject_guid
From
    reference.Persistence As T1
Where
    ( Not ( T1.referenced_usp_persistence_RepoObject_guid Is Null ))
    And ( Not ( T1.referencing_usp_persistence_RepoObject_guid Is Null ))
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '626bea16-72f7-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_input_PersistenceDependency_S', @level2type = N'COLUMN', @level2name = N'is_PersistenceDependency';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '616bea16-72f7-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_input_PersistenceDependency_S', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '606bea16-72f7-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_input_PersistenceDependency_S', @level2type = N'COLUMN', @level2name = N'referenced_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9ab707fe-71f7-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_input_PersistenceDependency_S';

