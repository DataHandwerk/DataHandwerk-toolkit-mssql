CREATE TABLE [repo].[Index_ColumList_T] (
    [index_guid]                 UNIQUEIDENTIFIER NOT NULL,
    [AntoraIndexColumnList]      NVARCHAR (MAX)   NULL,
    [ColumnList]                 NVARCHAR (MAX)   NULL,
    [ConstraintColumnList]       NVARCHAR (MAX)   NULL,
    [DbmlIndexColumnList]        NVARCHAR (MAX)   NULL,
    [PersistenceWhereColumnList] NVARCHAR (MAX)   NULL,
    [PumlIndexColumnList]        NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Index_ColumList_T] PRIMARY KEY NONCLUSTERED ([index_guid] ASC)
)
WITH (DATA_COMPRESSION = PAGE);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '61abe17f-c211-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_ColumList_T', @level2type = N'CONSTRAINT', @level2name = N'PK_Index_ColumList_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c136a7b2-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_ColumList_T', @level2type = N'COLUMN', @level2name = N'PumlIndexColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bc36a7b2-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_ColumList_T', @level2type = N'COLUMN', @level2name = N'PersistenceWhereColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bf36a7b2-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_ColumList_T', @level2type = N'COLUMN', @level2name = N'DbmlIndexColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bd36a7b2-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_ColumList_T', @level2type = N'COLUMN', @level2name = N'ConstraintColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'be36a7b2-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_ColumList_T', @level2type = N'COLUMN', @level2name = N'ColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bb36a7b2-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_ColumList_T', @level2type = N'COLUMN', @level2name = N'AntoraIndexColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c036a7b2-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_ColumList_T', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '83b1dda3-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_ColumList_T';


GO
CREATE COLUMNSTORE INDEX [CCI_Index_ColumList_T]
    ON [repo].[Index_ColumList_T]([index_guid]);

