CREATE TABLE [repo].[Index_virtual] (
    [index_guid]             UNIQUEIDENTIFIER CONSTRAINT [DF__Index_vir__index__12FDD1B2] DEFAULT (newsequentialid()) NOT NULL,
    [index_name]             NVARCHAR (128)   NULL,
    [index_type]             TINYINT          CONSTRAINT [DF__Index_vir__index__13F1F5EB] DEFAULT ((0)) NOT NULL,
    [is_index_disabled]      BIT              CONSTRAINT [DF__Index_vir__is_in__14E61A24] DEFAULT ((0)) NOT NULL,
    [is_index_primary_key]   BIT              CONSTRAINT [DF__Index_vir__is_in__15DA3E5D] DEFAULT ((0)) NOT NULL,
    [is_index_unique]        BIT              CONSTRAINT [DF__Index_vir__is_in__16CE6296] DEFAULT ((0)) NOT NULL,
    [parent_RepoObject_guid] UNIQUEIDENTIFIER NOT NULL,
    [referenced_index_guid]  UNIQUEIDENTIFIER NULL,
    [RowNumberInReferencing] INT              NULL,
    CONSTRAINT [PK_Index_virtual] PRIMARY KEY CLUSTERED ([index_guid] ASC),
    CONSTRAINT [FK_Index_virtual__RepoObject] FOREIGN KEY ([parent_RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid]) ON DELETE CASCADE ON UPDATE CASCADE
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
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Type of index:
0 = Heap
1 = Clustered
2 = Nonclustered
3 = XML
4 = Spatial
5 = Clustered columnstore index. Applies to: SQL Server 2014 (12.x) and later.
6 = Nonclustered columnstore index. Applies to: SQL Server 2012 (11.x) and later.
7 = Nonclustered hash index. Applies to: SQL Server 2014 (12.x) and later.', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'COLUMN', @level2name = N'index_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3690291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'PK_Index_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0f90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'FK_Index_virtual__RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3490291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '67cbc49c-3862-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF__Index_vir__is_in__16CE6296';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '66cbc49c-3862-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF__Index_vir__is_in__15DA3E5D';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '65cbc49c-3862-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF__Index_vir__is_in__14E61A24';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '64cbc49c-3862-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF__Index_vir__index__13F1F5EB';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '63cbc49c-3862-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'CONSTRAINT', @level2name = N'DF__Index_vir__index__12FDD1B2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'adf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'COLUMN', @level2name = N'RowNumberInReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'acf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'COLUMN', @level2name = N'referenced_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'abf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aaf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'COLUMN', @level2name = N'is_index_unique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a9f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'COLUMN', @level2name = N'is_index_primary_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a8f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'COLUMN', @level2name = N'is_index_disabled';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a7f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'COLUMN', @level2name = N'index_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a6f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'COLUMN', @level2name = N'index_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a5f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_virtual', @level2type = N'COLUMN', @level2name = N'index_guid';

