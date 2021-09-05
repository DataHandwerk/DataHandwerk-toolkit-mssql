CREATE TABLE [property].[RepoObjectProperty] (
    [RepoObjectProperty_id] INT              IDENTITY (1, 1) NOT NULL,
    [RepoObject_guid]       UNIQUEIDENTIFIER NOT NULL,
    [property_name]         NVARCHAR (128)   NOT NULL,
    [property_value]        NVARCHAR (MAX)   NULL,
    [inheritance]           TINYINT          NULL,
    [property_int]          AS               (TRY_CAST(left([property_value],(4000)) AS [int])),
    [property_bigint]       AS               (TRY_CAST(left([property_value],(4000)) AS [bigint])),
    [property_real]         AS               (TRY_CAST(left([property_value],(4000)) AS [real])),
    [property_float]        AS               (TRY_CAST(left([property_value],(4000)) AS [float])),
    [property_money]        AS               (TRY_CAST(left([property_value],(4000)) AS [money])),
    CONSTRAINT [PK_RepoObjectProperty] PRIMARY KEY CLUSTERED ([RepoObjectProperty_id] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_RepoObjectProperty__RepoObject] FOREIGN KEY ([RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [UK_RepoObjectProperty] UNIQUE NONCLUSTERED ([RepoObject_guid] ASC, [property_name] ASC)
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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1490291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoObjectProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1290291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0b90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectProperty__RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1090291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c2f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'RepoObjectProperty_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c3f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c5f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c4f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c6f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'inheritance';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ccf27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_real';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cef27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_money';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c8f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_int';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cdf27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_float';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c9f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_bigint';


GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectProperty].[property_value]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_real';




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST([property_value] AS [real]))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_real';


GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectProperty].[property_value]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_money';




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST([property_value] AS [money]))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_money';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectProperty].[property_value]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_int';




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST([property_value] AS [int]))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_int';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectProperty].[property_value]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_float';




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST([property_value] AS [float]))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_float';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectProperty].[property_value]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_bigint';




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST([property_value] AS [bigint]))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_bigint';


GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObjectProperty_id', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObjectProperty_id', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'int', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'1290291C-9D61-EB11-84DC-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.RepoObject_Adoc.adoc[]
* xref:property.ExtendedProperty_Repo2Sys_level1.adoc[]
* xref:property.ExtendedProperty_Repo2Sys_level2_RepoObject.adoc[]
* xref:property.fs_get_RepoObjectProperty_nvarchar.adoc[]
* xref:property.PropertyName_RepoObject.adoc[]
* xref:property.RepoObjectProperty_ForUpdate.adoc[]
* xref:property.RepoObjectProperty_InheritanceType_InheritanceDefinition.adoc[]
* xref:property.RepoObjectProperty_sys_repo.adoc[]
* xref:property.usp_RepoObject_Inheritance.adoc[]
* xref:property.usp_RepoObjectProperty_collect.adoc[]
* xref:property.usp_RepoObjectProperty_set.adoc[]
* xref:property.usp_sync_ExtendedProperties_Sys2Repo_InsertUpdate.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = 'datatype of property_value is `sql_variant`, because it should be possible to synchronize the property_value in the repository with property_value in extended properties in the dwh database, which is `sql_variant` +
therefore the maximum content is nvarchar(4000) or varchar(8000)', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoObjectProperty';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoObjectProperty';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectProperty';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectProperty';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectProperty__RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectProperty__RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectProperty';

