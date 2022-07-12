CREATE TABLE [docs].[command] (
    [command] NVARCHAR (4000) NOT NULL,
    [id]      INT             IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_command] PRIMARY KEY CLUSTERED ([id] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '00f2f534-bd01-ed11-856f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'command', @level2type = N'CONSTRAINT', @level2name = N'PK_command';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '96705540-bd01-ed11-856f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'command', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '95705540-bd01-ed11-856f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'command', @level2type = N'COLUMN', @level2name = N'command';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'fff1f534-bd01-ed11-856f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'command';

