CREATE TABLE [repo].[RepoObject_gross2_T] (
    [RepoObject_guid]                         UNIQUEIDENTIFIER NOT NULL,
    [RepoObject_schema_name]                  NVARCHAR (128)   NOT NULL,
    [RepoObject_name]                         NVARCHAR (128)   NOT NULL,
    [RepoObject_type]                         CHAR (2)         NOT NULL,
    [RepoObject_type_name]                    NVARCHAR (128)   NULL,
    [has_different_sys_names]                 BIT              NULL,
    [has_execution_plan_issue]                BIT              NULL,
    [has_get_referenced_issue]                BIT              NULL,
    [Inheritance_StringAggSeparatorSql]       NVARCHAR (4000)  NULL,
    [InheritanceDefinition]                   NVARCHAR (4000)  NULL,
    [InheritanceType]                         TINYINT          NULL,
    [is_DocsExclude]                          BIT              NOT NULL,
    [is_DocsOutput]                           INT              NULL,
    [is_in_reference]                         INT              NOT NULL,
    [is_repo_managed]                         BIT              NULL,
    [is_ssas]                                 BIT              NOT NULL,
    [is_required_ObjectMerge]                 BIT              NULL,
    [is_RepoObject_name_uniqueidentifier]     INT              NOT NULL,
    [is_SysObject_missing]                    BIT              NULL,
    [is_SysObject_name_uniqueidentifier]      INT              NOT NULL,
    [modify_dt]                               DATETIME         NOT NULL,
    [node_id]                                 BIGINT           NULL,
    [pk_index_guid]                           UNIQUEIDENTIFIER NULL,
    [pk_IndexPatternColumnDatatype]           NVARCHAR (4000)  NULL,
    [pk_IndexPatternColumnName]               NVARCHAR (4000)  NULL,
    [pk_IndexPatternColumnName_new]           NVARCHAR (4000)  NULL,
    [pk_IndexSemanticGroup]                   NVARCHAR (512)   NULL,
    [Repo_history_table_guid]                 UNIQUEIDENTIFIER NULL,
    [Repo_temporal_type]                      TINYINT          NULL,
    [RepoObject_fullname]                     NVARCHAR (261)   NOT NULL,
    [RepoObject_fullname2]                    NVARCHAR (257)   NOT NULL,
    [RepoObject_Referencing_Count]            INT              NULL,
    [SysObject_fullname]                      NVARCHAR (261)   NOT NULL,
    [SysObject_fullname2]                     NVARCHAR (257)   NOT NULL,
    [SysObject_id]                            INT              NULL,
    [SysObject_modify_date]                   DATETIME         NULL,
    [SysObject_name]                          NVARCHAR (128)   NOT NULL,
    [SysObject_parent_object_id]              INT              NOT NULL,
    [SysObject_query_executed_dt]             DATETIME         NULL,
    [SysObject_query_plan]                    XML              NULL,
    [SysObject_query_sql]                     NVARCHAR (406)   NOT NULL,
    [SysObject_schema_name]                   NVARCHAR (128)   NOT NULL,
    [SysObject_type]                          CHAR (2)         NULL,
    [SysObject_type_name]                     NVARCHAR (128)   NULL,
    [usp_persistence_name]                    NVARCHAR (140)   NOT NULL,
    [usp_persistence_RepoObject_guid]         UNIQUEIDENTIFIER NULL,
    [persistence_source_RepoObject_guid]      UNIQUEIDENTIFIER NULL,
    [persistence_source_RepoObject_fullname]  NVARCHAR (261)   NULL,
    [persistence_source_RepoObject_fullname2] NVARCHAR (257)   NULL,
    [persistence_source_RepoObject_xref]      NVARCHAR (269)   NULL,
    [persistence_source_SysObject_fullname]   NVARCHAR (261)   NULL,
    [persistence_source_SysObject_fullname2]  NVARCHAR (257)   NULL,
    [persistence_source_SysObject_xref]       NVARCHAR (269)   NULL,
    [has_history]                             BIT              NULL,
    [has_history_columns]                     BIT              NULL,
    [is_persistence]                          BIT              NULL,
    [is_persistence_check_duplicate_per_pk]   BIT              NULL,
    [is_persistence_check_for_empty_source]   BIT              NULL,
    [is_persistence_delete_missing]           BIT              NULL,
    [is_persistence_delete_changed]           BIT              NULL,
    [is_persistence_insert]                   BIT              NULL,
    [is_persistence_truncate]                 BIT              NULL,
    [is_persistence_update_changed]           BIT              NULL,
    [is_persistence_merge_delete_missing]     BIT              NULL,
    [is_persistence_merge_insert]             BIT              NULL,
    [is_persistence_merge_update_changed]     BIT              NULL,
    [history_schema_name]                     NVARCHAR (128)   NULL,
    [history_table_name]                      NVARCHAR (128)   NULL,
    [source_filter]                           NVARCHAR (4000)  NULL,
    [target_filter]                           NVARCHAR (4000)  NULL,
    [temporal_type]                           TINYINT          NULL,
    [Description]                             NVARCHAR (MAX)   NULL,
    [Property_ms_description]                 NVARCHAR (4000)  NULL,
    [tables_dataCategory]                     NVARCHAR (500)   NULL,
    [tables_isHidden]                         NVARCHAR (500)   NULL,
    [tables_description]                      NVARCHAR (MAX)   NULL,
    [CreateColumnList]                        NVARCHAR (MAX)   NULL,
    [DbmlColumnList]                          NVARCHAR (MAX)   NULL,
    [PersistenceCompareColumnList]            NVARCHAR (MAX)   NULL,
    [PersistenceInsertColumnList]             NVARCHAR (MAX)   NULL,
    [PersistenceUpdateColumnList]             NVARCHAR (MAX)   NULL,
    [sql_modules_definition]                  NVARCHAR (MAX)   NULL,
    [sql_modules_antora]                      NVARCHAR (MAX)   NULL,
    [sql_modules_formatted]                   NVARCHAR (MAX)   NULL,
    [sql_modules_formatted2]                  NVARCHAR (MAX)   NULL,
    [AntoraReferencedList]                    NVARCHAR (MAX)   NULL,
    [AntoraReferencingList]                   NVARCHAR (MAX)   NULL,
    [AntoraExternalReferencedList]            NVARCHAR (MAX)   NULL,
    [AntoraExternalReferencingList]           NVARCHAR (MAX)   NULL,
    [AntoraModule]                            NVARCHAR (MAX)   NULL,
    [AntoraComponent]                         NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_RepoObject_gross2_T] PRIMARY KEY CLUSTERED ([RepoObject_guid] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '62abe17f-c211-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObject_gross2_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '302d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2d2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '232d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'AntoraExternalReferencingList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '222d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'AntoraExternalReferencedList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '482d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'AntoraReferencingList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '452d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'AntoraReferencedList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '212d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'sql_modules_formatted2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1c2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'sql_modules_formatted';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '102d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'sql_modules_antora';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0e2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'sql_modules_definition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '312d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'PersistenceUpdateColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '142d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'PersistenceInsertColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '242d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'PersistenceCompareColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2b2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'DbmlColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '382d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'CreateColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '172d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'tables_description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f32c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'tables_isHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '182d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'tables_dataCategory';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '002d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'Property_ms_description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f72c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f92c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'temporal_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f42c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'target_filter';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fc2c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'source_filter';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1d2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'history_table_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '192d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'history_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0c2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'is_persistence_merge_update_changed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '202d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'is_persistence_merge_insert';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2f2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'is_persistence_merge_delete_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '112d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'is_persistence_update_changed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '492d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'is_persistence_truncate';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '262d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'is_persistence_insert';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '352d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_changed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '402d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'is_persistence_delete_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3a2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'is_persistence_check_for_empty_source';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '372d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'is_persistence_check_duplicate_per_pk';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '022d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'is_persistence';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fd2c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'has_history_columns';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fb2c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'has_history';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '062d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'persistence_source_SysObject_xref';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f52c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'persistence_source_SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f22c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'persistence_source_SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1f2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObject_xref';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1a2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '152d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0b2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '292d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'usp_persistence_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '282d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'usp_persistence_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '432d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'SysObject_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '412d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3e2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '472d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'SysObject_query_sql';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '042d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'SysObject_query_plan';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '332d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'SysObject_query_executed_dt';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1b2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'SysObject_parent_object_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f62c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0a2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'SysObject_modify_date';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1e2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'SysObject_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '132d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0f2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2e2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'RepoObject_Referencing_Count';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2c2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '462d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '442d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'Repo_temporal_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '342d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'Repo_history_table_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3d2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'pk_IndexSemanticGroup';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '082d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'pk_IndexPatternColumnName_new';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '362d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'pk_IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f12c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'pk_IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '092d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'pk_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '422d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'node_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3f2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'modify_dt';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3c2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'is_SysObject_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '392d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'is_SysObject_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '012d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'is_RepoObject_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ff2c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'is_required_ObjectMerge';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fa2c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'is_ssas';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f82c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'is_repo_managed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '122d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'is_in_reference';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0d2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'is_DocsOutput';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '032d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'is_DocsExclude';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '322d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '162d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '252d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2a2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'has_get_referenced_issue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4a2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'has_execution_plan_issue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '272d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'has_different_sys_names';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fe2c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'RepoObject_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3b2d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '072d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '052d2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f02c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '71e1c56a-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_gross2_T';

