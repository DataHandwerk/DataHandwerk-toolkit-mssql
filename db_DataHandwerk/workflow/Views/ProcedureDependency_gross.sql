
CREATE View workflow.ProcedureDependency_gross
As
Select
    pd.id
  , pd.referenced_Procedure_RepoObject_guid
  , pd.referencing_Procedure_RepoObject_guid
  , pd.is_active
  , pd.is_PersistenceDependency
  , pd.Description
  , ro_1.RepoObject_fullname    As referenced_RepoObject_fullname
  , ro_1.RepoObject_fullname2   As referenced_RepoObject_fullname2
  , ro_1.RepoObject_schema_name As referenced_RepoObject_schema_name
  , ro_2.RepoObject_fullname    As referencing_RepoObject_fullname
  , ro_2.RepoObject_fullname2   As referencing_RepoObject_fullname2
  , ro_2.RepoObject_schema_name As referencing_RepoObject_schema_name
From
    workflow.ProcedureDependency As pd
    Inner Join
        repo.RepoObject          As ro_1
            On
            pd.referenced_Procedure_RepoObject_guid  = ro_1.RepoObject_guid

    Inner Join
        repo.RepoObject          As ro_2
            On
            pd.referencing_Procedure_RepoObject_guid = ro_2.RepoObject_guid;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '68cda946-459d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_gross', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '52514649-189d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_gross', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '51514649-189d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_gross', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '67cda946-459d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_gross', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '50514649-189d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_gross', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4f514649-189d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_gross', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4e514649-189d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_gross', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4d514649-189d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_gross', @level2type = N'COLUMN', @level2name = N'is_PersistenceDependency';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4c514649-189d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_gross', @level2type = N'COLUMN', @level2name = N'is_active';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4b514649-189d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_gross', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4a514649-189d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_gross', @level2type = N'COLUMN', @level2name = N'referenced_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '49514649-189d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_gross', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '48514649-189d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_gross';

