CREATE TABLE [ssas].[Measures_translation_T] (
    [Measure_guid]              UNIQUEIDENTIFIER NOT NULL,
    [cultures_name]             NVARCHAR (10)    NOT NULL,
    [RepoObject_name]           NVARCHAR (128)   NOT NULL,
    [RepoSchema_name]           NVARCHAR (128)   NOT NULL,
    [measures_name]             NVARCHAR (500)   NOT NULL,
    [Measure_translation]       NVARCHAR (128)   NULL,
    [Measure_DisplayName]       NVARCHAR (500)   NULL,
    [measures_displayFolder]    NVARCHAR (500)   NULL,
    [displayfolder_translation] NVARCHAR (512)   NULL,
    [displayfolder_DisplayName] NVARCHAR (512)   NULL,
    CONSTRAINT [PK_Measures_translation_T] PRIMARY KEY CLUSTERED ([Measure_guid] ASC, [cultures_name] ASC, [RepoObject_name] ASC) WITH (DATA_COMPRESSION = PAGE)
);






GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '45ae5b16-6224-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'Measures_translation_T', @level2type = N'CONSTRAINT', @level2name = N'PK_Measures_translation_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cf51fe1e-6224-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'Measures_translation_T', @level2type = N'COLUMN', @level2name = N'Measure_DisplayName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ce51fe1e-6224-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'Measures_translation_T', @level2type = N'COLUMN', @level2name = N'Measure_translation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cd51fe1e-6224-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'Measures_translation_T', @level2type = N'COLUMN', @level2name = N'measures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cb51fe1e-6224-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'Measures_translation_T', @level2type = N'COLUMN', @level2name = N'RepoSchema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cc51fe1e-6224-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'Measures_translation_T', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ca51fe1e-6224-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'Measures_translation_T', @level2type = N'COLUMN', @level2name = N'cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c951fe1e-6224-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'Measures_translation_T', @level2type = N'COLUMN', @level2name = N'Measure_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '44ae5b16-6224-ec11-8526-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'Measures_translation_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6b20c60c-ca26-ec11-8529-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'Measures_translation_T', @level2type = N'COLUMN', @level2name = N'measures_displayFolder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6c20c60c-ca26-ec11-8529-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'Measures_translation_T', @level2type = N'COLUMN', @level2name = N'displayfolder_translation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6d20c60c-ca26-ec11-8529-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'Measures_translation_T', @level2type = N'COLUMN', @level2name = N'displayfolder_DisplayName';

