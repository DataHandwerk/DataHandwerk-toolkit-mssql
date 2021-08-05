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


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8cefc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'ReferencingObject';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.RepoObject_referencing_level.adoc[]
* xref:repo.usp_main.adoc[]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'ReferencingObject';

