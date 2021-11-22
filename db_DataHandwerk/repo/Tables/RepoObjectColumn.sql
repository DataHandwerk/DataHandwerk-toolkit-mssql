CREATE TABLE [repo].[RepoObjectColumn] (
    [RepoObjectColumn_guid]                     UNIQUEIDENTIFIER CONSTRAINT [DF_RepoObjectColumn_RepoObjectColumn_guid] DEFAULT (newsequentialid()) NOT NULL,
    [Inheritance_StringAggSeparatorSql]         NVARCHAR (4000)  NULL,
    [InheritanceDefinition]                     NVARCHAR (4000)  NULL,
    [InheritanceType]                           TINYINT          NULL,
    [is_persistence_no_check]                   BIT              NULL,
    [is_persistence_no_include]                 BIT              NULL,
    [is_persistence_no_update]                  BIT              NULL,
    [is_query_plan_expression]                  BIT              NULL,
    [is_required_ColumnMerge]                   BIT              NULL,
    [is_SysObjectColumn_missing]                BIT              NULL,
    [persistence_source_RepoObjectColumn_guid]  UNIQUEIDENTIFIER NULL,
    [Referencing_Count]                         INT              NULL,
    [Repo_default_definition]                   NVARCHAR (MAX)   NULL,
    [Repo_default_is_system_named]              BIT              NULL,
    [Repo_default_name]                         NVARCHAR (128)   NULL,
    [Repo_definition]                           NVARCHAR (MAX)   NULL,
    [Repo_generated_always_type]                TINYINT          CONSTRAINT [DF_RepoObjectColumn_Repo_generated_always_type] DEFAULT ((0)) NOT NULL,
    [Repo_graph_type]                           INT              NULL,
    [Repo_is_computed]                          BIT              CONSTRAINT [DF_RepoObjectColumn_Repo_is_computed] DEFAULT ((0)) NOT NULL,
    [Repo_is_identity]                          BIT              CONSTRAINT [DF_RepoObjectColumn_Repo_is_identity] DEFAULT ((0)) NOT NULL,
    [Repo_is_nullable]                          BIT              NULL,
    [Repo_is_persisted]                         BIT              NULL,
    [Repo_seed_value]                           SQL_VARIANT      NULL,
    [Repo_increment_value]                      SQL_VARIANT      NULL,
    [Repo_user_type_name]                       NVARCHAR (128)   NULL,
    [Repo_user_type_fullname]                   NVARCHAR (128)   NULL,
    [Repo_uses_database_collation]              BIT              NULL,
    [RepoObjectColumn_column_id]                INT              NULL,
    [RepoObjectColumn_name]                     NVARCHAR (128)   CONSTRAINT [DF_RepoObjectColumn_RepoObjectColumn_name] DEFAULT (newid()) NOT NULL,
    [RepoObject_guid]                           UNIQUEIDENTIFIER NOT NULL,
    [SysObjectColumn_column_id]                 INT              NULL,
    [SysObjectColumn_name]                      NVARCHAR (128)   CONSTRAINT [DF_RepoObjectColumn_SysObjectColumn_name] DEFAULT (newid()) NOT NULL,
    [has_different_sys_names]                   AS               (CONVERT([bit],case when [RepoObjectColumn_name]<>[SysObjectColumn_name] then (1) else (0) end,(0))),
    [is_RepoObjectColumn_name_uniqueidentifier] AS               (case when TRY_CAST([RepoObjectColumn_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end) PERSISTED NOT NULL,
    [is_SysObjectColumn_name_uniqueidentifier]  AS               (case when TRY_CAST([SysObjectColumn_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end) PERSISTED NOT NULL,
    [Column_name]                               AS               (case when TRY_CAST([RepoObjectColumn_name] AS [uniqueidentifier]) IS NULL then [RepoObjectColumn_name] else [SysObjectColumn_name] end) PERSISTED NOT NULL,
    [RepoObject_fullname2]                      AS               ([repo].[fs_RepoObject_fullname2]([RepoObject_guid])),
    CONSTRAINT [PK_RepoObjectColumn] PRIMARY KEY CLUSTERED ([RepoObjectColumn_guid] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_RepoObjectColumn_RepoObject] FOREIGN KEY ([RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid]) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT [UK_RepoObjectColumn__RepoNames] UNIQUE NONCLUSTERED ([RepoObject_guid] ASC, [RepoObjectColumn_name] ASC),
    CONSTRAINT [UK_RepoObjectColumn__SysNames] UNIQUE NONCLUSTERED ([RepoObjectColumn_guid] ASC, [SysObjectColumn_name] ASC)
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



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4290291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoObjectColumn__SysNames';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4490291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoObjectColumn__RepoNames';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4090291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1190291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectColumn_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8a90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_SysObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8890291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8090291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8690291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_Repo_is_identity';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8490291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_Repo_is_computed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8290291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_Repo_generated_always_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3e90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f5f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'SysObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f4f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'SysObjectColumn_column_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f2f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'daf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f1f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_column_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f3f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f0f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_uses_database_collation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eef37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_user_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eff37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_user_type_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ecf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_seed_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ebf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_is_persisted';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eaf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_is_nullable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e9f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_is_identity';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e8f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_is_computed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'edf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_increment_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e7f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_graph_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e6f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_generated_always_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e5f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_definition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e4f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_default_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e3f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_default_is_system_named';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e2f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Repo_default_definition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e1f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Referencing_Count';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e0f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dff37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'is_SysObjectColumn_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'def37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'is_query_plan_expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ddf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'is_persistence_no_update';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dcf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'is_persistence_no_include';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dbf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'is_persistence_no_check';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f8f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'is_SysObjectColumn_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f7f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'is_RepoObjectColumn_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f6f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'has_different_sys_names';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a2b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a1b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a0b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[SysObjectColumn_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'is_SysObjectColumn_name_uniqueidentifier';




GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[RepoObjectColumn_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'is_RepoObjectColumn_name_uniqueidentifier';




GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[RepoObjectColumn_name]
* [repo].[RepoObjectColumn].[SysObjectColumn_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'has_different_sys_names';




GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0cfb57e8-9f9b-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'is_required_ColumnMerge';


GO



GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObjectColumn_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'4090291C-9D61-EB11-84DC-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:property.ExtendedProperty_Repo2Sys_level2_RepoObjectColumn.adoc[]
* xref:property.RepoObjectColumnProperty_InheritanceType_InheritanceDefinition.adoc[]
* xref:property.RepoObjectColumnProperty_sys_repo.adoc[]
* xref:property.usp_RepoObjectColumnProperty_set.adoc[]
* xref:reference.additional_Reference_guid.adoc[]
* xref:reference.RepoObjectColumn_reference_Persistence.adoc[]
* xref:reference.RepoObjectColumn_reference_SqlModules.adoc[]
* xref:reference.RepoObjectColumn_ReferenceTree.adoc[]
* xref:reference.RepoObjectColumn_RelationScript.adoc[]
* xref:reference.usp_RepoObjectColumnSource_virtual_set.adoc[]
* xref:reference.usp_RepoObjectSource_QueryPlan.adoc[]
* xref:reference.usp_update_Referencing_Count.adoc[]
* xref:repo.check_IndexColumn_virtual_referenced_setpoint.adoc[]
* xref:repo.IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing.adoc[]
* xref:repo.IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check.adoc[]
* xref:repo.IndexColumn_ssas_gross.adoc[]
* xref:repo.IndexColumn_virtual_gross.adoc[]
* xref:repo.RepoObject_persistence_column.adoc[]
* xref:repo.RepoObject_SqlCreateTable.adoc[]
* xref:repo.RepoObjectColumn_gross.adoc[]
* xref:repo.RepoObjectColumn_MissingSource_TypeV.adoc[]
* xref:repo.RepoObjectColumn_RequiredRepoObjectColumnMerge.adoc[]
* xref:repo.RepoObjectColumn_SSAS_tgt.adoc[]
* xref:repo.SysColumn_RepoObjectColumn_via_guid.adoc[]
* xref:repo.SysColumn_RepoObjectColumn_via_name.adoc[]
* xref:repo.usp_Index_virtual_set.adoc[]
* xref:repo.usp_sync_guid_RepoObjectColumn.adoc[]
* xref:repo.usp_update_Referencing_Count.adoc[]
* xref:sqlparse.RepoObject_SqlModules_71_reference_ExpliciteTableAlias.adoc[]
* xref:sqlparse.RepoObject_SqlModules_72_reference_NoTableAlias.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4cae410c-d3f5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Column_name';


GO



GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoObjectColumn__SysNames';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoObjectColumn__SysNames';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoObjectColumn__RepoNames';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoObjectColumn__RepoNames';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectColumn_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectColumn_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_SysObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_SysObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_Repo_is_identity';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_Repo_is_identity';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_Repo_is_computed';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_Repo_is_computed';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_Repo_generated_always_type';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObjectColumn_Repo_generated_always_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[RepoObjectColumn_SSAS_tgt]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoObjectColumn_SSAS_tgt.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[RepoObjectColumn_name]
* [repo].[RepoObjectColumn].[SysObjectColumn_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'Column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '475889ab-cb47-ec11-8530-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';

