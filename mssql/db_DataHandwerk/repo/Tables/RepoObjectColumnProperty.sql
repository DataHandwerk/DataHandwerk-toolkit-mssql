CREATE TABLE [repo].[RepoObjectColumnProperty] (
    [RepoObjectColumnProperty_id] INT              IDENTITY (1, 1) NOT NULL,
    [RepoObjectColumn_guid]       UNIQUEIDENTIFIER NOT NULL,
    [property_name]               NVARCHAR (128)   NOT NULL,
    [property_value]              SQL_VARIANT      NOT NULL,
    [inheritance]                 TINYINT          NULL,
    [property_basetype]           AS               (sql_variant_property([property_value],'BaseType')),
    [property_int]                AS               (TRY_CAST([property_value] AS [int])),
    [property_bigint]             AS               (TRY_CAST([property_value] AS [bigint])),
    [property_varchar]            AS               (TRY_CAST([property_value] AS [varchar](8000))),
    [property_nvarchar]           AS               (TRY_CAST([property_value] AS [nvarchar](4000))),
    [property_real]               AS               (TRY_CAST([property_value] AS [real])),
    [property_float]              AS               (TRY_CAST([property_value] AS [float])),
    [property_money]              AS               (TRY_CAST([property_value] AS [money])),
    CONSTRAINT [PK_RepoObjectColumnProperty] PRIMARY KEY CLUSTERED ([RepoObjectColumnProperty_id] ASC),
    CONSTRAINT [FK_RepoObjectColumnProperty__RepoObjectColumn] FOREIGN KEY ([RepoObjectColumn_guid]) REFERENCES [repo].[RepoObjectColumn] ([RepoObjectColumn_guid]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [UK_RepoObjectColumnProperty] UNIQUE NONCLUSTERED ([RepoObjectColumn_guid] ASC, [property_name] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '682c8508-724c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectColumnProperty__RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '672c8508-724c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoObjectColumnProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '662c8508-724c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectColumnProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '21ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'property_money';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1fea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'property_float';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '24ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'property_real';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '23ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'property_nvarchar';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '26ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'property_varchar';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1eea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'property_bigint';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '20ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'property_int';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1dea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'property_basetype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '25ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '22ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '27ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '28ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'RepoObjectColumnProperty_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '652c8508-724c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty';

