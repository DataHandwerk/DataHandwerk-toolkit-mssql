CREATE TABLE [workflow].[ProcedureInstance] (
    [id]                        INT              IDENTITY (1, 1) NOT NULL,
    [Procedure_RepoObject_guid] UNIQUEIDENTIFIER NOT NULL,
    [Instance]                  VARCHAR (500)    CONSTRAINT [DF_ProcedureInstance_Instance] DEFAULT ('') NOT NULL,
    [Description]               NVARCHAR (4000)  NULL,
    CONSTRAINT [PK_ProcedureInstance] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_ProcedureInstance_RepoObject] FOREIGN KEY ([Procedure_RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid]) ON DELETE CASCADE,
    CONSTRAINT [UK_ProcedureInstance] UNIQUE NONCLUSTERED ([Procedure_RepoObject_guid] ASC, [Instance] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7634cb25-1e66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'ProcedureInstance', @level2type = N'CONSTRAINT', @level2name = N'DF_ProcedureInstance_Instance';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f513103d-5b9c-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'ProcedureInstance', @level2type = N'CONSTRAINT', @level2name = N'FK_ProcedureInstance_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7834cb25-1e66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'ProcedureInstance', @level2type = N'CONSTRAINT', @level2name = N'UK_ProcedureInstance';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7734cb25-1e66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'ProcedureInstance', @level2type = N'CONSTRAINT', @level2name = N'PK_ProcedureInstance';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '024b3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'ProcedureInstance', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '014b3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'ProcedureInstance', @level2type = N'COLUMN', @level2name = N'Instance';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '004b3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'ProcedureInstance', @level2type = N'COLUMN', @level2name = N'Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ff4a3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'ProcedureInstance', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7534cb25-1e66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'ProcedureInstance';

