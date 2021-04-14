CREATE TABLE [workflow].[ProcedureDependency] (
    [id]                                    INT              IDENTITY (1, 1) NOT NULL,
    [referenced_Procedure_RepoObject_guid]  UNIQUEIDENTIFIER NOT NULL,
    [referencing_Procedure_RepoObject_guid] UNIQUEIDENTIFIER NOT NULL,
    [is_active]                             BIT              CONSTRAINT [DF_ProcedureDependency_is_active] DEFAULT ((1)) NOT NULL,
    [is_PersistenceDependency]              BIT              CONSTRAINT [DF_ProcedureDependency_is_PersistenceDependency] DEFAULT ((0)) NOT NULL,
    [Description]                           NVARCHAR (4000)  NULL,
    CONSTRAINT [PK_ProcedureDependency] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_ProcedureDependency_RepoObject_referenced] FOREIGN KEY ([referenced_Procedure_RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid]),
    CONSTRAINT [FK_ProcedureDependency_RepoObject_referencing] FOREIGN KEY ([referencing_Procedure_RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [UK_ProcedureDependency] UNIQUE NONCLUSTERED ([referenced_Procedure_RepoObject_guid] ASC, [referencing_Procedure_RepoObject_guid] ASC)
);


GO
ALTER TABLE [workflow].[ProcedureDependency] NOCHECK CONSTRAINT [FK_ProcedureDependency_RepoObject_referenced];


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'cde20e01-119d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'ProcedureDependency', @level2type = N'CONSTRAINT', @level2name = N'DF_ProcedureDependency_is_PersistenceDependency';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'cce20e01-119d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'ProcedureDependency', @level2type = N'CONSTRAINT', @level2name = N'DF_ProcedureDependency_is_active';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'cae20e01-119d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'ProcedureDependency', @level2type = N'CONSTRAINT', @level2name = N'FK_ProcedureDependency_RepoObject_referenced';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'c9e20e01-119d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'ProcedureDependency', @level2type = N'CONSTRAINT', @level2name = N'FK_ProcedureDependency_RepoObject_referencing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'cfe20e01-119d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'ProcedureDependency', @level2type = N'CONSTRAINT', @level2name = N'UK_ProcedureDependency';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'cee20e01-119d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'ProcedureDependency', @level2type = N'CONSTRAINT', @level2name = N'PK_ProcedureDependency';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd5e20e01-119d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'ProcedureDependency', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd4e20e01-119d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'ProcedureDependency', @level2type = N'COLUMN', @level2name = N'is_PersistenceDependency';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd3e20e01-119d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'ProcedureDependency', @level2type = N'COLUMN', @level2name = N'is_active';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd2e20e01-119d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'ProcedureDependency', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd1e20e01-119d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'ProcedureDependency', @level2type = N'COLUMN', @level2name = N'referenced_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd0e20e01-119d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'ProcedureDependency', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'cbe20e01-119d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'ProcedureDependency';

