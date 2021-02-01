CREATE TABLE [graph].[RepoObjectColumn] (
    [RepoObjectColumn_guid] UNIQUEIDENTIFIER NOT NULL,
    INDEX [ix_graphid] UNIQUE NONCLUSTERED ($node_id)
) AS NODE;




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '89efc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9fefc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';

