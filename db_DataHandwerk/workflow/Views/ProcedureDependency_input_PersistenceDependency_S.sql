


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


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [reference].[Persistence]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_input_PersistenceDependency_S';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'referenced_Procedure_RepoObject_guid,referencing_Procedure_RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_input_PersistenceDependency_S';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_input_PersistenceDependency_S';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'10A4D146-7BF7-EB11-850C-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_input_PersistenceDependency_S';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_input_PersistenceDependency_S';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_input_PersistenceDependency_S';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:workflow.ProcedureDependency_input_PersistenceDependency.adoc[]
* xref:workflow.usp_PERSIST_ProcedureDependency_input_PersistenceDependency.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_input_PersistenceDependency_S';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.Persistence.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_input_PersistenceDependency_S';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[Persistence].[referencing_usp_persistence_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_input_PersistenceDependency_S', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[Persistence].[referenced_usp_persistence_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'ProcedureDependency_input_PersistenceDependency_S', @level2type = N'COLUMN', @level2name = N'referenced_Procedure_RepoObject_guid';

