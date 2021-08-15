CREATE TABLE [workflow].[Workflow_ProcedureDependency_T_bidirectional_T] (
    [Workflow_id]                           INT              NOT NULL,
    [referenced_Procedure_RepoObject_guid]  UNIQUEIDENTIFIER NOT NULL,
    [referencing_Procedure_RepoObject_guid] UNIQUEIDENTIFIER NOT NULL,
    [referenced_RepoObject_fullname]        NVARCHAR (261)   NOT NULL,
    [referencing_RepoObject_fullname]       NVARCHAR (261)   NOT NULL,
    [is_inactive]                           BIT              CONSTRAINT [DF_Workflow_ProcedureDependency_T_bidirectional_T_is_active] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_Workflow_ProcedureDependency_T_bidirectional_T] PRIMARY KEY CLUSTERED ([Workflow_id] ASC, [referenced_Procedure_RepoObject_guid] ASC, [referencing_Procedure_RepoObject_guid] ASC)
);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '78e72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'CONSTRAINT', @level2name = N'PK_Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7be72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'CONSTRAINT', @level2name = N'DF_Workflow_ProcedureDependency_T_bidirectional_T_is_active';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '77e72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '796d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7d6d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7b6d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7c6d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7a6d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'COLUMN', @level2name = N'referenced_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7e6d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow_ProcedureDependency_T_bidirectional_T', @level2type = N'COLUMN', @level2name = N'is_inactive';

