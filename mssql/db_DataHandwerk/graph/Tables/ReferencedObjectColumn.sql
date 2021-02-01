CREATE TABLE [graph].[ReferencedObjectColumn] (
    CONSTRAINT [EC_ReferencedObjectColumn] CONNECTION ([graph].[RepoObjectColumn] TO [graph].[RepoObjectColumn]) ON DELETE CASCADE,
    INDEX [ix_graphid] UNIQUE NONCLUSTERED ($edge_id)
) AS EDGE;


GO
CREATE NONCLUSTERED INDEX [ix_fromid]
    ON [graph].[ReferencedObjectColumn]($from_id ASC, $to_id ASC);


GO
CREATE NONCLUSTERED INDEX [ix_toid]
    ON [graph].[ReferencedObjectColumn]($to_id ASC, $from_id ASC);

