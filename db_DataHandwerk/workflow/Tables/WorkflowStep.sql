CREATE TABLE [workflow].[WorkflowStep] (
    [id]                   INT IDENTITY (1, 1) NOT NULL,
    [Workflow_id]          INT NOT NULL,
    [ProcedureInstance_id] INT NOT NULL,
    CONSTRAINT [PK_WorkflowStep] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_WorkflowStep_ProcedureInstance] FOREIGN KEY ([ProcedureInstance_id]) REFERENCES [workflow].[ProcedureInstance] ([id]),
    CONSTRAINT [FK_WorkflowStep_Workflow] FOREIGN KEY ([Workflow_id]) REFERENCES [workflow].[Workflow] ([id]),
    CONSTRAINT [UK_WorkflowStep] UNIQUE NONCLUSTERED ([Workflow_id] ASC, [ProcedureInstance_id] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f613103d-5b9c-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep', @level2type = N'CONSTRAINT', @level2name = N'FK_WorkflowStep_ProcedureInstance';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f413103d-5b9c-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep', @level2type = N'CONSTRAINT', @level2name = N'FK_WorkflowStep_Workflow';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6f34cb25-1e66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep', @level2type = N'CONSTRAINT', @level2name = N'UK_WorkflowStep';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6e34cb25-1e66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep', @level2type = N'CONSTRAINT', @level2name = N'PK_WorkflowStep';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ec4a3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep', @level2type = N'COLUMN', @level2name = N'ProcedureInstance_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eb4a3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ea4a3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6d34cb25-1e66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep';

