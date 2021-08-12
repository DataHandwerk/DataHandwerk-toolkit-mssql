CREATE TABLE [workflow].[Connection] (
    [ConnectionName]   NVARCHAR (250)  NOT NULL,
    [ConnectionString] NVARCHAR (4000) NULL,
    [is_active]        BIT             CONSTRAINT [DF_Connection_is_active] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Connection] PRIMARY KEY CLUSTERED ([ConnectionName] ASC)
);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ae66a0a8-e3fa-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Connection', @level2type = N'CONSTRAINT', @level2name = N'PK_Connection';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'af66a0a8-e3fa-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Connection', @level2type = N'CONSTRAINT', @level2name = N'DF_Connection_is_active';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ad66a0a8-e3fa-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Connection';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '89448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Connection', @level2type = N'COLUMN', @level2name = N'is_active';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '88448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Connection', @level2type = N'COLUMN', @level2name = N'ConnectionString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '87448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'TABLE', @level1name = N'Connection', @level2type = N'COLUMN', @level2name = N'ConnectionName';

