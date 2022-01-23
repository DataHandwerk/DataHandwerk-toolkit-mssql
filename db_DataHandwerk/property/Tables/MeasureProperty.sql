CREATE TABLE [property].[MeasureProperty] (
    [Measure_guid]    UNIQUEIDENTIFIER NOT NULL,
    [property_name]   NVARCHAR (128)   NOT NULL,
    [property_value]  NVARCHAR (MAX)   NULL,
    [inheritance]     TINYINT          NULL,
    [property_int]    AS               (TRY_CAST(left([property_value],(4000)) AS [int])),
    [property_bigint] AS               (TRY_CAST(left([property_value],(4000)) AS [bigint])),
    [property_real]   AS               (TRY_CAST(left([property_value],(4000)) AS [real])),
    [property_float]  AS               (TRY_CAST(left([property_value],(4000)) AS [float])),
    [property_money]  AS               (TRY_CAST(left([property_value],(4000)) AS [money])),
    CONSTRAINT [PK_MeasureProperty] PRIMARY KEY CLUSTERED ([Measure_guid] ASC, [property_name] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_MeasureProperty_model_json_312_tables_measures_T] FOREIGN KEY ([Measure_guid]) REFERENCES [ssas].[model_json_312_tables_measures_T] ([Measure_guid]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [UK_MeasureProperty] UNIQUE NONCLUSTERED ([Measure_guid] ASC, [property_name] ASC)
);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2a8d889d-3250-ec11-8532-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'MeasureProperty', @level2type = N'CONSTRAINT', @level2name = N'FK_MeasureProperty_model_json_312_tables_measures_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f61ea651-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'MeasureProperty', @level2type = N'CONSTRAINT', @level2name = N'UK_MeasureProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f51ea651-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'MeasureProperty', @level2type = N'CONSTRAINT', @level2name = N'PK_MeasureProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7e7f7d5a-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'MeasureProperty', @level2type = N'COLUMN', @level2name = N'property_money';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7d7f7d5a-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'MeasureProperty', @level2type = N'COLUMN', @level2name = N'property_float';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7c7f7d5a-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'MeasureProperty', @level2type = N'COLUMN', @level2name = N'property_real';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7b7f7d5a-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'MeasureProperty', @level2type = N'COLUMN', @level2name = N'property_bigint';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7a7f7d5a-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'MeasureProperty', @level2type = N'COLUMN', @level2name = N'property_int';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '797f7d5a-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'MeasureProperty', @level2type = N'COLUMN', @level2name = N'inheritance';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '787f7d5a-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'MeasureProperty', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '777f7d5a-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'MeasureProperty', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '767f7d5a-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'MeasureProperty', @level2type = N'COLUMN', @level2name = N'Measure_guid';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f41ea651-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'MeasureProperty';

