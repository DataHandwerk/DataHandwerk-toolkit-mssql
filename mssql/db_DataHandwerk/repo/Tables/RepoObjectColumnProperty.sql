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



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO


