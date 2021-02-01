CREATE TABLE [graph].[ReferencingObject] (
    CONSTRAINT [EC_ReferencingObject] CONNECTION ([graph].[RepoObject] TO [graph].[RepoObject]) ON DELETE CASCADE,
    INDEX [ix_graphid] UNIQUE NONCLUSTERED ($edge_id)
) AS EDGE;




GO
CREATE NONCLUSTERED INDEX [ix_fromid]
    ON [graph].[ReferencingObject]($from_id ASC, $to_id ASC);


GO
CREATE NONCLUSTERED INDEX [ix_toid]
    ON [graph].[ReferencingObject]($to_id ASC, $from_id ASC);

