CREATE TABLE [workflow].[WorkflowStep_Sortorder] (
    [Workflow_id]               INT              NOT NULL,
    [Procedure_RepoObject_guid] UNIQUEIDENTIFIER NOT NULL,
    [Sortorder]                 INT              IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_WorkflowStep_Sortorder] PRIMARY KEY CLUSTERED ([Workflow_id] ASC, [Procedure_RepoObject_guid] ASC)
);

