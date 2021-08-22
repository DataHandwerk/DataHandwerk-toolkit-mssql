CREATE TABLE [reference].[external_object] (
    [RepoObject_guid]          UNIQUEIDENTIFIER NOT NULL,
    [external_AntoraModulName] NVARCHAR (128)   NOT NULL,
    [external_SchemaName]      NVARCHAR (128)   NOT NULL,
    [external_ObjectName]      NVARCHAR (128)   NOT NULL,
    [isReferenced]             BIT              CONSTRAINT [DF_external_object_isReferenced] DEFAULT ((1)) NOT NULL,
    [external_Type]            CHAR (2)         NULL,
    CONSTRAINT [PK_external_object] PRIMARY KEY CLUSTERED ([RepoObject_guid] ASC, [external_AntoraModulName] ASC, [external_SchemaName] ASC, [external_ObjectName] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_external_object_RepoObject] FOREIGN KEY ([RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid]) ON DELETE CASCADE ON UPDATE CASCADE
);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e435c571-8103-ec11-8513-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'external_object', @level2type = N'CONSTRAINT', @level2name = N'PK_external_object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e635c571-8103-ec11-8513-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'external_object', @level2type = N'CONSTRAINT', @level2name = N'FK_external_object_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e535c571-8103-ec11-8513-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'external_object', @level2type = N'CONSTRAINT', @level2name = N'DF_external_object_isReferenced';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e335c571-8103-ec11-8513-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'external_object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ea35c571-8103-ec11-8513-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'external_object', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ee35c571-8103-ec11-8513-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'external_object', @level2type = N'COLUMN', @level2name = N'isReferenced';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ef35c571-8103-ec11-8513-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'external_object', @level2type = N'COLUMN', @level2name = N'external_Type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ec35c571-8103-ec11-8513-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'external_object', @level2type = N'COLUMN', @level2name = N'external_SchemaName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ed35c571-8103-ec11-8513-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'external_object', @level2type = N'COLUMN', @level2name = N'external_ObjectName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eb35c571-8103-ec11-8513-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'external_object', @level2type = N'COLUMN', @level2name = N'external_AntoraModulName';

