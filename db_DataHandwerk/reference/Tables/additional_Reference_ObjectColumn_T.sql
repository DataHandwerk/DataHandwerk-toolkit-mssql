CREATE TABLE [reference].[additional_Reference_ObjectColumn_T] (
    [RepoObjectColumn_guid] UNIQUEIDENTIFIER CONSTRAINT [DF_additional_Reference_ObjectColumn_T_RepoObject_guid] DEFAULT (newsequentialid()) NOT NULL,
    [AntoraComponent]       NVARCHAR (128)   NOT NULL,
    [AntoraModule]          NVARCHAR (128)   NOT NULL,
    [SchemaName]            NVARCHAR (128)   NOT NULL,
    [ObjectName]            NVARCHAR (128)   NOT NULL,
    [ColumnName]            NVARCHAR (128)   NOT NULL,
    CONSTRAINT [PK_additional_Reference_ObjectColumn_T] PRIMARY KEY CLUSTERED ([RepoObjectColumn_guid] ASC)
);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'beed2e9f-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference_ObjectColumn_T', @level2type = N'COLUMN', @level2name = N'ColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bded2e9f-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference_ObjectColumn_T', @level2type = N'COLUMN', @level2name = N'ObjectName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bced2e9f-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference_ObjectColumn_T', @level2type = N'COLUMN', @level2name = N'SchemaName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bbed2e9f-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference_ObjectColumn_T', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'baed2e9f-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference_ObjectColumn_T', @level2type = N'COLUMN', @level2name = N'AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'cdb17b93-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference_ObjectColumn_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'c430c78c-161b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference_ObjectColumn_T', @level2type = N'CONSTRAINT', @level2name = N'PK_additional_Reference_ObjectColumn_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0cfe2e93-491a-ec11-851f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference_ObjectColumn_T', @level2type = N'CONSTRAINT', @level2name = N'DF_additional_Reference_ObjectColumn_T_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '30fe2e93-491a-ec11-851f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference_ObjectColumn_T', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';

