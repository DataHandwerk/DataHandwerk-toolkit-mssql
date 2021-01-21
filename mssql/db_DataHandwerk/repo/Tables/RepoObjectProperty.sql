CREATE TABLE [repo].[RepoObjectProperty] (
    [RepoObjectProperty_id] INT              IDENTITY (1, 1) NOT NULL,
    [RepoObject_guid]       UNIQUEIDENTIFIER NOT NULL,
    [property_name]         NVARCHAR (128)   NOT NULL,
    [property_value]        SQL_VARIANT      NULL,
    [inheritance]           TINYINT          NULL,
    [property_basetype]     AS               (sql_variant_property([property_value],'BaseType')),
    [property_int]          AS               (TRY_CAST([property_value] AS [int])),
    [property_bigint]       AS               (TRY_CAST([property_value] AS [bigint])),
    [property_varchar]      AS               (TRY_CAST([property_value] AS [varchar](8000))),
    [property_nvarchar]     AS               (TRY_CAST([property_value] AS [nvarchar](4000))),
    [property_real]         AS               (TRY_CAST([property_value] AS [real])),
    [property_float]        AS               (TRY_CAST([property_value] AS [float])),
    [property_money]        AS               (TRY_CAST([property_value] AS [money])),
    CONSTRAINT [PK_RepoObjectProperty] PRIMARY KEY CLUSTERED ([RepoObjectProperty_id] ASC),
    CONSTRAINT [FK_RepoObjectProperty__RepoObject] FOREIGN KEY ([RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [UK_RepoObjectProperty] UNIQUE NONCLUSTERED ([RepoObject_guid] ASC, [property_name] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '802c8508-724c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectProperty__RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '692c8508-724c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoObjectProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7f2c8508-724c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '56ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_money';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '54ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_float';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '59ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_real';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '58ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_nvarchar';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5bea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_varchar';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '53ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_bigint';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '55ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_int';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '52ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_basetype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5aea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '57ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5cea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5dea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'RepoObjectProperty_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7e2c8508-724c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectProperty';

