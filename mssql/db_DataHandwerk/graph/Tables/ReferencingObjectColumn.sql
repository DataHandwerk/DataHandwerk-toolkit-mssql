CREATE TABLE [graph].[ReferencingObjectColumn] (
    CONSTRAINT [EC_ReferencingObjectColumn] CONNECTION ([graph].[RepoObjectColumn] TO [graph].[RepoObjectColumn]) ON DELETE CASCADE,
    INDEX [ix_graphid] UNIQUE NONCLUSTERED ($edge_id)
) AS EDGE;


GO
CREATE NONCLUSTERED INDEX [ix_fromid]
    ON [graph].[ReferencingObjectColumn]($from_id ASC, $to_id ASC);


GO
CREATE NONCLUSTERED INDEX [ix_toid]
    ON [graph].[ReferencingObjectColumn]($to_id ASC, $from_id ASC);

