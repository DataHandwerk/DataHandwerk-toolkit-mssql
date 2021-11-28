CREATE TABLE [property].[external_RepoObjectColumnProperty] (
    [RepoObjectColumn_guid]  UNIQUEIDENTIFIER NOT NULL,
    [property_name]          NVARCHAR (128)   NOT NULL,
    [property_value]         NVARCHAR (MAX)   NULL,
    [repo_database]          NVARCHAR (128)   NULL,
    [dwh_database]           NVARCHAR (128)   NULL,
    [AntoraComponent]        NVARCHAR (MAX)   NULL,
    [AntoraModule]           NVARCHAR (MAX)   NULL,
    [RepoObject_schema_name] NVARCHAR (128)   NOT NULL,
    [RepoObject_name]        NVARCHAR (128)   NOT NULL,
    [RepoObjectColumn_name]  NVARCHAR (128)   NOT NULL,
    CONSTRAINT [PK_external_RepoObjectColumnProperty] PRIMARY KEY CLUSTERED ([RepoObjectColumn_guid] ASC, [property_name] ASC) WITH (DATA_COMPRESSION = PAGE)
);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'c73dcf42-d31b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'external_RepoObjectColumnProperty', @level2type = N'CONSTRAINT', @level2name = N'PK_external_RepoObjectColumnProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '31d0ae3d-471c-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'external_RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ed6d1c4e-d31b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'external_RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ec6d1c4e-d31b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'external_RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eb6d1c4e-d31b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'external_RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ea6d1c4e-d31b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'external_RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e96d1c4e-d31b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'external_RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'dwh_database';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e86d1c4e-d31b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'external_RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'repo_database';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e76d1c4e-d31b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'external_RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e66d1c4e-d31b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'external_RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e56d1c4e-d31b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'external_RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'c63dcf42-d31b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'external_RepoObjectColumnProperty';

