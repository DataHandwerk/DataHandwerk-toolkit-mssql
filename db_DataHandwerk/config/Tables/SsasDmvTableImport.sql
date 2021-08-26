CREATE TABLE [config].[SsasDmvTableImport] (
    [DmvTableName] NVARCHAR (128) NOT NULL,
    [isActive]     BIT            CONSTRAINT [DF_SsasDmvTableImport_isActive] DEFAULT ((0)) NOT NULL,
    CONSTRAINT [PK_SsasDmvTableImport] PRIMARY KEY CLUSTERED ([DmvTableName] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'cde6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDmvTableImport', @level2type = N'CONSTRAINT', @level2name = N'DF_SsasDmvTableImport_isActive';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'cee6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDmvTableImport', @level2type = N'CONSTRAINT', @level2name = N'PK_SsasDmvTableImport';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ecc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDmvTableImport', @level2type = N'COLUMN', @level2name = N'isActive';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ebc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDmvTableImport', @level2type = N'COLUMN', @level2name = N'DmvTableName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'cce6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'SsasDmvTableImport';

