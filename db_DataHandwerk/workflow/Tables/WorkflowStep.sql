CREATE TABLE [workflow].[WorkflowStep] (
    [id]                        INT              IDENTITY (1, 1) NOT NULL,
    [Workflow_id]               INT              NOT NULL,
    [Procedure_RepoObject_guid] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_WorkflowStep] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_WorkflowStep_RepoObject] FOREIGN KEY ([Procedure_RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [FK_WorkflowStep_Workflow] FOREIGN KEY ([Workflow_id]) REFERENCES [workflow].[Workflow] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [UK_WorkflowStep] UNIQUE NONCLUSTERED ([Workflow_id] ASC, [Procedure_RepoObject_guid] ASC)
);






GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f413103d-5b9c-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep', @level2type = N'CONSTRAINT', @level2name = N'FK_WorkflowStep_Workflow';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6f34cb25-1e66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep', @level2type = N'CONSTRAINT', @level2name = N'UK_WorkflowStep';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6e34cb25-1e66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep', @level2type = N'CONSTRAINT', @level2name = N'PK_WorkflowStep';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eb4a3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ea4a3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6d34cb25-1e66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '62cda946-459d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep', @level2type = N'CONSTRAINT', @level2name = N'FK_WorkflowStep_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '69cda946-459d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep', @level2type = N'COLUMN', @level2name = N'Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'WorkflowStep_id', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'id', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'int', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'6E34CB25-1E66-EB11-84DD-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'WorkflowStep';

