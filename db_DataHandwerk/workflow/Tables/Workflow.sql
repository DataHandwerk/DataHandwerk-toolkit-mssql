CREATE TABLE [workflow].[Workflow] (
    [id]           INT             IDENTITY (1, 1) NOT NULL,
    [Name]         NVARCHAR (500)  NOT NULL,
    [Description]  NVARCHAR (4000) NULL,
    [is_active]    BIT             CONSTRAINT [DF_Workflow_is_active] DEFAULT ((1)) NOT NULL,
    [Package_Biml] NVARCHAR (MAX)  NULL,
    CONSTRAINT [PK_Workflow] PRIMARY KEY CLUSTERED ([id] ASC)
);






GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7434cb25-1e66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow', @level2type = N'CONSTRAINT', @level2name = N'DF_Workflow_is_active';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7034cb25-1e66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow', @level2type = N'CONSTRAINT', @level2name = N'PK_Workflow';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fe4a3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow', @level2type = N'COLUMN', @level2name = N'is_active';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fd4a3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fc4a3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fb4a3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7334cb25-1e66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'Workflow_id', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'id', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'int', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'7034CB25-1E66-EB11-84DD-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e266a0a8-e3fa-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Workflow', @level2type = N'COLUMN', @level2name = N'Package_Biml';

