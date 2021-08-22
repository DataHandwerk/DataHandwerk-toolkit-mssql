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

