CREATE TABLE [property].[RepoSchemaProperty] (
    [RepoSchemaProperty_id] INT              IDENTITY (1, 1) NOT NULL,
    [RepoSchema_guid]       UNIQUEIDENTIFIER NOT NULL,
    [property_name]         NVARCHAR (128)   NOT NULL,
    [property_value]        NVARCHAR (MAX)   NULL,
    [inheritance]           TINYINT          NULL,
    [property_int]          AS               (TRY_CAST([property_value] AS [int])),
    [property_bigint]       AS               (TRY_CAST([property_value] AS [bigint])),
    [property_varchar]      AS               (TRY_CAST([property_value] AS [varchar](8000))),
    [property_nvarchar]     AS               (TRY_CAST([property_value] AS [nvarchar](4000))),
    [property_real]         AS               (TRY_CAST([property_value] AS [real])),
    [property_float]        AS               (TRY_CAST([property_value] AS [float])),
    [property_money]        AS               (TRY_CAST([property_value] AS [money])),
    CONSTRAINT [PK_RepoSchemaProperty] PRIMARY KEY CLUSTERED ([RepoSchemaProperty_id] ASC),
    CONSTRAINT [FK_RepoSchemaProperty__RepoSchema] FOREIGN KEY ([RepoSchema_guid]) REFERENCES [repo].[RepoSchema] ([RepoSchema_guid]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [UK_RepoSchemaProperty] UNIQUE NONCLUSTERED ([RepoSchema_guid] ASC, [property_name] ASC)
);






GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b50747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoSchemaProperty__RepoSchema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b40747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoSchemaProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b30747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoSchemaProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e40747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'property_money';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e30747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'property_float';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e20747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'property_real';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e10747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'property_nvarchar';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e00747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'property_varchar';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'df0747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'property_bigint';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'de0747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'property_int';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dc0747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'inheritance';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'db0747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'da0747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd90747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'RepoSchema_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd80747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'RepoSchemaProperty_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b20747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoSchemaProperty_id', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'int', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = 'b30747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoSchemaProperty].[property_value]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'property_varchar';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST([property_value] AS [varchar](8000)))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'property_varchar';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoSchemaProperty].[property_value]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'property_real';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST([property_value] AS [real]))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'property_real';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoSchemaProperty].[property_value]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'property_nvarchar';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST([property_value] AS [nvarchar](4000)))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'property_nvarchar';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoSchemaProperty].[property_value]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'property_money';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST([property_value] AS [money]))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'property_money';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoSchemaProperty].[property_value]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'property_int';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST([property_value] AS [int]))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'property_int';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoSchemaProperty].[property_value]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'property_float';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST([property_value] AS [float]))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'property_float';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoSchemaProperty].[property_value]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'property_bigint';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST([property_value] AS [bigint]))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoSchemaProperty', @level2type = N'COLUMN', @level2name = N'property_bigint';


GO



GO


