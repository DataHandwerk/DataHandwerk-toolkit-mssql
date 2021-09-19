CREATE TABLE [reference].[additional_Reference_ObjectColumn_T] (
    [AntoraComponent] NVARCHAR (128) NOT NULL,
    [AntoraModule]    NVARCHAR (128) NOT NULL,
    [SchemaName]      NVARCHAR (128) NOT NULL,
    [ObjectName]      NVARCHAR (128) NOT NULL,
    [ColumnName]      NVARCHAR (128) NOT NULL
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

