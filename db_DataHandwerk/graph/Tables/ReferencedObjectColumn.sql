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


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '90efc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'ReferencedObjectColumn';

