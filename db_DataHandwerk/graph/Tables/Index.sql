CREATE TABLE [graph].[Index] (
    [Index_guid]                 UNIQUEIDENTIFIER NOT NULL,
    [Index_name]                 NVARCHAR (128)   NOT NULL,
    [index_type]                 TINYINT          NOT NULL,
    [IndexPatternColumnDatatype] NVARCHAR (4000)  NULL,
    [IndexPatternColumnName]     NVARCHAR (4000)  NULL,
    [IndexSemanticGroup]         NVARCHAR (512)   NULL,
    [is_index_disabled]          BIT              NULL,
    [is_index_primary_key]       BIT              NULL,
    [is_index_real]              BIT              NULL,
    [is_index_unique]            BIT              NULL,
    [RepoObject_fullname]        NVARCHAR (261)   NOT NULL,
    [RepoObject_fullname2]       NVARCHAR (257)   NULL,
    [RepoObject_guid]            UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [UK_Index] UNIQUE NONCLUSTERED ([Index_guid] ASC),
    INDEX [GRAPH_UNIQUE_INDEX_92FF5B62C41B42E3BEC8E437EC61A9CB] UNIQUE NONCLUSTERED ($node_id)
) AS NODE;


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'bed49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'Index', @level2type = N'CONSTRAINT', @level2name = N'UK_Index';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd1d49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'Index', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd0d49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'Index', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cfd49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'Index', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ced49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'Index', @level2type = N'COLUMN', @level2name = N'is_index_unique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cdd49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'Index', @level2type = N'COLUMN', @level2name = N'is_index_real';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ccd49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'Index', @level2type = N'COLUMN', @level2name = N'is_index_primary_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cbd49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'Index', @level2type = N'COLUMN', @level2name = N'is_index_disabled';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cad49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'Index', @level2type = N'COLUMN', @level2name = N'IndexSemanticGroup';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c9d49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'Index', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c8d49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'Index', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c7d49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'Index', @level2type = N'COLUMN', @level2name = N'index_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c6d49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'Index', @level2type = N'COLUMN', @level2name = N'Index_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c5d49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'Index', @level2type = N'COLUMN', @level2name = N'Index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'bdd49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'Index';

