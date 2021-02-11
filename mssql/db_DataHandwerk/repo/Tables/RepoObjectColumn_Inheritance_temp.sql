CREATE TABLE [repo].[RepoObjectColumn_Inheritance_temp] (
    [RepoObjectColumn_guid]             UNIQUEIDENTIFIER NOT NULL,
    [property_name]                     NVARCHAR (128)   NOT NULL,
    [property_value]                    SQL_VARIANT      NULL,
    [property_value_new]                SQL_VARIANT      NULL,
    [InheritanceType]                   INT              NULL,
    [Inheritance_StringAggSeparatorSql] NVARCHAR (4000)  NULL,
    [is_force_inherit_empty_source]     INT              NOT NULL,
    [is_StringAggAllSources]            INT              NOT NULL,
    [resulting_InheritanceDefinition]   NVARCHAR (4000)  NULL,
    [RowNumberSource]                   BIGINT           NULL,
    [referenced_RepoObjectColumn_guid]  UNIQUEIDENTIFIER NULL,
    [referenced_RepoObject_fullname]    NVARCHAR (261)   NOT NULL,
    [referenced_RepoObjectColumn_name]  NVARCHAR (128)   NOT NULL,
    [referencing_RepoObject_fullname]   NVARCHAR (261)   NOT NULL,
    [referencing_RepoObjectColumn_name] NVARCHAR (128)   NOT NULL
);

