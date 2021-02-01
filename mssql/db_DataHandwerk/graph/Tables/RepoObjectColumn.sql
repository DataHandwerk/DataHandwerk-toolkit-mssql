CREATE TABLE [graph].[RepoObjectColumn] (
    [RepoObjectColumn_guid] UNIQUEIDENTIFIER NOT NULL,
    INDEX [ix_graphid] UNIQUE NONCLUSTERED ($node_id)
) AS NODE;

