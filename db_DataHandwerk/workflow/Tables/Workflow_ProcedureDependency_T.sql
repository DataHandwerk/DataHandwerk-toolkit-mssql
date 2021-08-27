CREATE TABLE [workflow].[Workflow_ProcedureDependency_T] (
    [Workflow_id]                           INT              NOT NULL,
    [referenced_Procedure_RepoObject_guid]  UNIQUEIDENTIFIER NOT NULL,
    [referencing_Procedure_RepoObject_guid] UNIQUEIDENTIFIER NOT NULL,
    [is_redundant]                          BIT              CONSTRAINT [DF_Workflow_ProcedureDependency_T_is_redundant] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Workflow_ProcedureDependency_T] PRIMARY KEY CLUSTERED ([Workflow_id] ASC, [referenced_Procedure_RepoObject_guid] ASC, [referencing_Procedure_RepoObject_guid] ASC)
);








GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'fc228d9f-0bfb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T', @level2type = N'CONSTRAINT', @level2name = N'DF_Workflow_ProcedureDependency_T_is_redundant';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bd5ee3ac-0bfb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T', @level2type = N'COLUMN', @level2name = N'is_redundant';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'caa67203-eafa-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T', @level2type = N'COLUMN', @level2name = N'referenced_Procedure_RepoObject_guid';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c8a67203-eafa-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c5a67203-eafa-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T', @level2type = N'COLUMN', @level2name = N'Workflow_id';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '84a67203-eafa-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'fd228d9f-0bfb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T', @level2type = N'CONSTRAINT', @level2name = N'PK_Workflow_ProcedureDependency_T';

