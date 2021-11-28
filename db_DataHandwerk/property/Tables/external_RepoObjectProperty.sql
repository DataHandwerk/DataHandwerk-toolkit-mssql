CREATE TABLE [property].[external_RepoObjectProperty] (
    [RepoObject_guid]        UNIQUEIDENTIFIER NOT NULL,
    [property_name]          NVARCHAR (128)   NOT NULL,
    [property_value]         NVARCHAR (MAX)   NULL,
    [repo_database]          NVARCHAR (128)   NULL,
    [dwh_database]           NVARCHAR (128)   NULL,
    [AntoraComponent]        NVARCHAR (MAX)   NULL,
    [AntoraModule]           NVARCHAR (MAX)   NULL,
    [RepoObject_schema_name] NVARCHAR (128)   NOT NULL,
    [RepoObject_name]        NVARCHAR (128)   NOT NULL,
    CONSTRAINT [PK_external_RepoObjectProperty] PRIMARY KEY CLUSTERED ([RepoObject_guid] ASC, [property_name] ASC) WITH (DATA_COMPRESSION = PAGE)
);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '45948d1f-d01b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'external_RepoObjectProperty', @level2type = N'CONSTRAINT', @level2name = N'PK_external_RepoObjectProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '15557e28-d01b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'external_RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '14557e28-d01b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'external_RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '13557e28-d01b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'external_RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '12557e28-d01b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'external_RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '11557e28-d01b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'external_RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'dwh_database';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '10557e28-d01b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'external_RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'repo_database';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0f557e28-d01b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'external_RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0e557e28-d01b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'external_RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0d557e28-d01b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'external_RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '44948d1f-d01b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'external_RepoObjectProperty';

