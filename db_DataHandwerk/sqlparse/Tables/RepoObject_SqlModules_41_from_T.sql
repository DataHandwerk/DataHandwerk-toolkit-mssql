CREATE TABLE [sqlparse].[RepoObject_SqlModules_41_from_T] (
    [children]                   NVARCHAR (MAX)   NULL,
    [class]                      NVARCHAR (500)   NULL,
    [identifier_alias]           NVARCHAR (MAX)   NULL,
    [identifier_name]            NVARCHAR (MAX)   NULL,
    [is_from]                    INT              NOT NULL,
    [is_group]                   BIT              NULL,
    [is_join]                    INT              NOT NULL,
    [is_keyword]                 BIT              NULL,
    [is_whitespace]              BIT              NULL,
    [join_type]                  VARCHAR (16)     NULL,
    [json_key]                   NVARCHAR (4000)  NOT NULL,
    [Min_RowNumber_From]         BIGINT           NULL,
    [Min_RowNumber_GroupBy]      BIGINT           NULL,
    [Min_RowNumber_Where]        BIGINT           NULL,
    [normalized]                 NVARCHAR (MAX)   NULL,
    [normalized_PatIndex_Select] BIGINT           NULL,
    [normalized_wo_nolock]       NVARCHAR (MAX)   NULL,
    [patindex_nolock]            BIGINT           NULL,
    [RepoObject_guid]            UNIQUEIDENTIFIER NOT NULL,
    [RowNumber_per_Object]       BIGINT           NULL,
    [SysObject_fullname]         NVARCHAR (261)   NULL
);




















GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '664cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '654cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'RowNumber_per_Object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '644cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '634cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'patindex_nolock';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '624cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'normalized_wo_nolock';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '614cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'normalized';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '604cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'Min_RowNumber_Where';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5f4cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'Min_RowNumber_GroupBy';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5e4cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'Min_RowNumber_From';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5c4cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'join_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5b4cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'is_whitespace';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5a4cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'is_keyword';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '594cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'is_join';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '584cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'is_group';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '574cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'is_from';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '564cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'identifier_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '554cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'identifier_alias';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '544cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '534cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'children';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4e4cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5d4241cb-fb63-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'normalized_PatIndex_Select';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5d4cb4d0-4762-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'json_key';


GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_41_from].[SysObject_fullname]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_41_from].[RowNumber_per_Object]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'RowNumber_per_Object';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_41_from].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_41_from].[patindex_nolock]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'patindex_nolock';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_41_from].[normalized_wo_nolock]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'normalized_wo_nolock';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_41_from].[normalized_PatIndex_Select]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'normalized_PatIndex_Select';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_41_from].[normalized]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'normalized';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_41_from].[Min_RowNumber_Where]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'Min_RowNumber_Where';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_41_from].[Min_RowNumber_GroupBy]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'Min_RowNumber_GroupBy';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_41_from].[Min_RowNumber_From]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'Min_RowNumber_From';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_41_from].[json_key]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'json_key';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_41_from].[join_type]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'join_type';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_41_from].[is_whitespace]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'is_whitespace';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_41_from].[is_keyword]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'is_keyword';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_41_from].[is_join]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'is_join';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_41_from].[is_group]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'is_group';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_41_from].[is_from]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'is_from';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_41_from].[identifier_name]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'identifier_name';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_41_from].[identifier_alias]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'identifier_alias';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_41_from].[class]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'class';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [sqlparse].[RepoObject_SqlModules_41_from].[children]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T', @level2type = N'COLUMN', @level2name = N'children';




GO
EXECUTE sp_addextendedproperty @name = N'usp_persistence_RepoObject_guid', @value = N'667581A6-3C9C-EB11-84F6-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [sqlparse].[RepoObject_SqlModules_41_from]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T';


GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_xref', @value = N'xref:sqlparse.RepoObject_SqlModules_41_from.adoc[]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_guid', @value = N'3F90291C-9D61-EB11-84DC-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname2', @value = N'sqlparse.RepoObject_SqlModules_41_from', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T';


GO
EXECUTE sp_addextendedproperty @name = N'persistence_source_RepoObject_fullname', @value = N'[sqlparse].[RepoObject_SqlModules_41_from]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'1', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_update_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_truncate', @value = N'1', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_insert', @value = N'1', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_missing', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_delete_changed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_for_empty_source', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence_check_duplicate_per_pk', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T';


GO
EXECUTE sp_addextendedproperty @name = N'is_persistence', @value = N'1', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history_columns', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T';


GO
EXECUTE sp_addextendedproperty @name = N'has_history', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:sqlparse.RepoObject_SqlModules_42_from_Identifier.adoc[]
* xref:sqlparse.usp_PERSIST_RepoObject_SqlModules_41_from_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:sqlparse.RepoObject_SqlModules_41_from.adoc[]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T';


GO



GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'TABLE', @level1name = N'RepoObject_SqlModules_41_from_T';


GO
CREATE CLUSTERED COLUMNSTORE INDEX [CCI_RepoObject_SqlModules_41_from_T]
    ON [sqlparse].[RepoObject_SqlModules_41_from_T];

