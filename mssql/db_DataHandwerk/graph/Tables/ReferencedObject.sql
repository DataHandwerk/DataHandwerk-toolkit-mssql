CREATE TABLE [graph].[ReferencedObject] (
    CONSTRAINT [EC_ReferencedObject] CONNECTION ([graph].[RepoObject] TO [graph].[RepoObject]) ON DELETE CASCADE,
    INDEX [ix_graphid] UNIQUE NONCLUSTERED ($edge_id)
) AS EDGE;




GO
CREATE NONCLUSTERED INDEX [ix_fromid]
    ON [graph].[ReferencedObject]($from_id ASC, $to_id ASC);


GO
CREATE NONCLUSTERED INDEX [ix_toid]
    ON [graph].[ReferencedObject]($to_id ASC, $from_id ASC);

