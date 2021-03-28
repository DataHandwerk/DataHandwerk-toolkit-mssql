CREATE TABLE [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T] (
    [index_guid]                        UNIQUEIDENTIFIER NULL,
    [is_descending_key]                 BIT              NULL,
    [referenced_RepoObject_guid]        UNIQUEIDENTIFIER NULL,
    [index_column_id]                   INT              NOT NULL,
    [referenced_RepoObjectColumn_guid]  UNIQUEIDENTIFIER NULL,
    [RowNumberInReferencing]            BIGINT           NULL,
    [referencing_RepoObject_guid]       UNIQUEIDENTIFIER NULL,
    [referencing_RepoObjectColumn_guid] UNIQUEIDENTIFIER NULL
);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b47ed154-6b62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'referencing_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b37ed154-6b62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b27ed154-6b62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'RowNumberInReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b17ed154-6b62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b07ed154-6b62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'index_column_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'af7ed154-6b62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ae7ed154-6b62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'is_descending_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ad7ed154-6b62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ab7ed154-6b62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'[repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing].[RowNumberInReferencing]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'RowNumberInReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing].[referencing_RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'referencing_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing].[referencing_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing].[referenced_RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing].[referenced_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing].[is_descending_key]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'is_descending_key';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing].[index_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing].[index_column_id]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T', @level2type = N'COLUMN', @level2name = N'index_column_id';

