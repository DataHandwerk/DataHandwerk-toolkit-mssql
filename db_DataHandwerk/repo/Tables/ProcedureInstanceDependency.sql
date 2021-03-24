CREATE TABLE [repo].[ProcedureInstanceDependency] (
    [id]                       INT             IDENTITY (1, 1) NOT NULL,
    [referenced_id]            INT             NOT NULL,
    [referencing_id]           INT             NOT NULL,
    [is_active]                BIT             CONSTRAINT [DF_ProcedureInstanceDependency_is_active] DEFAULT ((1)) NOT NULL,
    [is_PersistenceDependency] BIT             CONSTRAINT [DF_ProcedureInstanceDependency_is_PersistenceDenpendency] DEFAULT ((0)) NOT NULL,
    [Description]              NVARCHAR (4000) NULL,
    CONSTRAINT [PK_ProcedureInstanceDependency] PRIMARY KEY CLUSTERED ([id] ASC),
    CONSTRAINT [FK_ProcedureInstanceDependency_ProcedureInstance_referenced] FOREIGN KEY ([referenced_id]) REFERENCES [repo].[ProcedureInstance] ([id]),
    CONSTRAINT [FK_ProcedureInstanceDependency_ProcedureInstance_referencing] FOREIGN KEY ([referencing_id]) REFERENCES [repo].[ProcedureInstance] ([id]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [UK_ProcedureInstanceDependency] UNIQUE NONCLUSTERED ([referenced_id] ASC, [referencing_id] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1368f544-e466-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ProcedureInstanceDependency', @level2type = N'CONSTRAINT', @level2name = N'DF_ProcedureInstanceDependency_is_PersistenceDenpendency';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7b34cb25-1e66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ProcedureInstanceDependency', @level2type = N'CONSTRAINT', @level2name = N'DF_ProcedureInstanceDependency_is_active';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7f34cb25-1e66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ProcedureInstanceDependency', @level2type = N'CONSTRAINT', @level2name = N'FK_ProcedureInstanceDependency_ProcedureInstance_referenced';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7e34cb25-1e66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ProcedureInstanceDependency', @level2type = N'CONSTRAINT', @level2name = N'FK_ProcedureInstanceDependency_ProcedureInstance_referencing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7d34cb25-1e66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ProcedureInstanceDependency', @level2type = N'CONSTRAINT', @level2name = N'UK_ProcedureInstanceDependency';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7c34cb25-1e66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ProcedureInstanceDependency', @level2type = N'CONSTRAINT', @level2name = N'PK_ProcedureInstanceDependency';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '074b3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ProcedureInstanceDependency', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1568f544-e466-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ProcedureInstanceDependency', @level2type = N'COLUMN', @level2name = N'is_PersistenceDependency';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '064b3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ProcedureInstanceDependency', @level2type = N'COLUMN', @level2name = N'is_active';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '054b3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ProcedureInstanceDependency', @level2type = N'COLUMN', @level2name = N'referencing_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '044b3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ProcedureInstanceDependency', @level2type = N'COLUMN', @level2name = N'referenced_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '034b3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ProcedureInstanceDependency', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7a34cb25-1e66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ProcedureInstanceDependency';

