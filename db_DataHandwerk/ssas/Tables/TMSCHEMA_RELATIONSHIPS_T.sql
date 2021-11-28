CREATE TABLE [ssas].[TMSCHEMA_RELATIONSHIPS_T] (
    [databasename]               NVARCHAR (128)   NOT NULL,
    [ID]                         NUMERIC (20)     NOT NULL,
    [ModelID]                    NUMERIC (20)     NOT NULL,
    [Name]                       NVARCHAR (MAX)   NOT NULL,
    [IsActive]                   BIT              NOT NULL,
    [Type]                       BIGINT           NOT NULL,
    [CrossFilteringBehavior]     BIGINT           NOT NULL,
    [JoinOnDateBehavior]         BIGINT           NOT NULL,
    [RelyOnReferentialIntegrity] BIT              NOT NULL,
    [FromTableID]                NUMERIC (20)     NOT NULL,
    [FromColumnID]               NUMERIC (20)     NOT NULL,
    [FromCardinality]            BIGINT           NOT NULL,
    [ToTableID]                  NUMERIC (20)     NOT NULL,
    [ToColumnID]                 NUMERIC (20)     NOT NULL,
    [ToCardinality]              BIGINT           NOT NULL,
    [State]                      BIGINT           NOT NULL,
    [RelationshipStorageID]      NUMERIC (20)     NULL,
    [RelationshipStorage2ID]     NUMERIC (20)     NULL,
    [ModifiedTime]               DATETIME         NOT NULL,
    [RefreshedTime]              DATETIME         NULL,
    [SecurityFilteringBehavior]  BIGINT           NOT NULL,
    [ForeignKey_guid]            UNIQUEIDENTIFIER CONSTRAINT [DF_TMSCHEMA_RELATIONSHIPS_T_RepoObject_guid] DEFAULT (newsequentialid()) NOT NULL,
    CONSTRAINT [PK_TMSCHEMA_RELATIONSHIPS_T] PRIMARY KEY CLUSTERED ([databasename] ASC, [ID] ASC) WITH (DATA_COMPRESSION = PAGE)
);








GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '853adabd-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_RELATIONSHIPS_T_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '863adabd-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8d0962c8-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'ForeignKey_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2240bc32-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'SecurityFilteringBehavior';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1240bc32-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'RefreshedTime';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1840bc32-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'ModifiedTime';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1e40bc32-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'RelationshipStorage2ID';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1140bc32-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'RelationshipStorageID';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1940bc32-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'State';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1c40bc32-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'ToCardinality';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1640bc32-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'ToColumnID';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1740bc32-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'ToTableID';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1440bc32-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'FromCardinality';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1540bc32-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'FromColumnID';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1b40bc32-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'FromTableID';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1340bc32-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'RelyOnReferentialIntegrity';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1a40bc32-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'JoinOnDateBehavior';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1d40bc32-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'CrossFilteringBehavior';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2040bc32-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'Type';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2140bc32-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'IsActive';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2540bc32-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'Name';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1f40bc32-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'ModelID';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2340bc32-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'ID';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2440bc32-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'databasename';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '40ecd625-1608-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';




GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'CONSTRAINT', @level2name = N'PK_TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_RELATIONSHIPS_T_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'CONSTRAINT', @level2name = N'DF_TMSCHEMA_RELATIONSHIPS_T_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'usp_persistence_RepoObject_guid', @value = N'666E8DEE-3D08-EC11-8515-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [ssas].[TMSCHEMA_RELATIONSHIPS]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'databasename,ID', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(128),numeric(20, 0)', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'863ADABD-1608-EC11-8515-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_xref', @value = N'xref:ssas.TMSCHEMA_RELATIONSHIPS.adoc[]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_guid', @value = N'E4E6A70A-8A06-EC11-8515-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname2', @value = N'ssas.TMSCHEMA_RELATIONSHIPS', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname', @value = N'[ssas].[TMSCHEMA_RELATIONSHIPS]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'1', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_update_changed', @value = N'1', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_truncate', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_insert', @value = N'1', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_missing', @value = N'1', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_for_empty_source', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_duplicate_per_pk', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence', @value = N'1', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history_columns', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.ForeignKey_ssas_IndexPattern_old.adoc[]
* xref:ssas.usp_PERSIST_TMSCHEMA_RELATIONSHIPS_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:ssas.TMSCHEMA_RELATIONSHIPS.adoc[]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[TMSCHEMA_RELATIONSHIPS].[Type]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[TMSCHEMA_RELATIONSHIPS].[ToTableID]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'ToTableID';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[TMSCHEMA_RELATIONSHIPS].[ToColumnID]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'ToColumnID';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[TMSCHEMA_RELATIONSHIPS].[ToCardinality]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'ToCardinality';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[TMSCHEMA_RELATIONSHIPS].[State]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'State';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[TMSCHEMA_RELATIONSHIPS].[SecurityFilteringBehavior]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'SecurityFilteringBehavior';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[TMSCHEMA_RELATIONSHIPS].[RelyOnReferentialIntegrity]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'RelyOnReferentialIntegrity';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[TMSCHEMA_RELATIONSHIPS].[RelationshipStorageID]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'RelationshipStorageID';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[TMSCHEMA_RELATIONSHIPS].[RelationshipStorage2ID]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'RelationshipStorage2ID';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[TMSCHEMA_RELATIONSHIPS].[RefreshedTime]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'RefreshedTime';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[TMSCHEMA_RELATIONSHIPS].[Name]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'Name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[TMSCHEMA_RELATIONSHIPS].[ModifiedTime]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'ModifiedTime';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[TMSCHEMA_RELATIONSHIPS].[ModelID]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'ModelID';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[TMSCHEMA_RELATIONSHIPS].[JoinOnDateBehavior]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'JoinOnDateBehavior';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[TMSCHEMA_RELATIONSHIPS].[IsActive]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'IsActive';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[TMSCHEMA_RELATIONSHIPS].[ID]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'ID';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[TMSCHEMA_RELATIONSHIPS].[FromTableID]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'FromTableID';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[TMSCHEMA_RELATIONSHIPS].[FromColumnID]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'FromColumnID';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[TMSCHEMA_RELATIONSHIPS].[FromCardinality]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'FromCardinality';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[TMSCHEMA_RELATIONSHIPS].[databasename]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[TMSCHEMA_RELATIONSHIPS].[CrossFilteringBehavior]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'TABLE', @level1name = N'TMSCHEMA_RELATIONSHIPS_T', @level2type = N'COLUMN', @level2name = N'CrossFilteringBehavior';

