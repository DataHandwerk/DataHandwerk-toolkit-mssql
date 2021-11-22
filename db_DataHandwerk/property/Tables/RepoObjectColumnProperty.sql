CREATE TABLE [property].[RepoObjectColumnProperty] (
    [RepoObjectColumnProperty_id] INT              IDENTITY (1, 1) NOT NULL,
    [RepoObjectColumn_guid]       UNIQUEIDENTIFIER NOT NULL,
    [property_name]               NVARCHAR (128)   NOT NULL,
    [property_value]              NVARCHAR (MAX)   NOT NULL,
    [inheritance]                 TINYINT          NULL,
    [property_int]                AS               (TRY_CAST(left([property_value],(4000)) AS [int])),
    [property_bigint]             AS               (TRY_CAST(left([property_value],(4000)) AS [bigint])),
    [property_real]               AS               (TRY_CAST(left([property_value],(4000)) AS [real])),
    [property_float]              AS               (TRY_CAST(left([property_value],(4000)) AS [float])),
    [property_money]              AS               (TRY_CAST(left([property_value],(4000)) AS [money])),
    CONSTRAINT [PK_RepoObjectColumnProperty] PRIMARY KEY CLUSTERED ([RepoObjectColumnProperty_id] ASC) WITH (DATA_COMPRESSION = PAGE),
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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1a90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoObjectColumnProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1890291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectColumnProperty';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1690291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cff27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'RepoObjectColumnProperty_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd0f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd2f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd1f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd3f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'inheritance';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd9f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'property_real';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dbf27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'property_money';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd5f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'property_int';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'daf27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'property_float';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd6f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'property_bigint';


GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectColumnProperty].[property_value]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'property_real';




GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectColumnProperty].[property_value]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'property_money';




GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectColumnProperty].[property_value]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'property_int';




GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectColumnProperty].[property_value]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'property_float';




GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectColumnProperty].[property_value]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'COLUMN', @level2name = N'property_bigint';




GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObjectColumnProperty_id', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'int', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'1890291C-9D61-EB11-84DC-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:property.ExtendedProperty_Repo2Sys_level2_RepoObjectColumn.adoc[]
* xref:property.fs_get_RepoObjectColumnProperty_nvarchar.adoc[]
* xref:property.PropertyName_RepoObjectColumn.adoc[]
* xref:property.RepoObjectColumnProperty_ForUpdate.adoc[]
* xref:property.RepoObjectColumnProperty_InheritanceType_InheritanceDefinition.adoc[]
* xref:property.RepoObjectColumnProperty_sys_repo.adoc[]
* xref:property.usp_RepoObjectColumn_Inheritance.adoc[]
* xref:property.usp_RepoObjectColumnProperty_set.adoc[]
* xref:property.usp_sync_ExtendedProperties_Sys2Repo_InsertUpdate.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty';


GO



GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoObjectColumnProperty';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoObjectColumnProperty';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectColumnProperty';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectColumnProperty';


GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'TABLE', @level1name = N'RepoObjectColumnProperty';

