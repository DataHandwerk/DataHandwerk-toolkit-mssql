CREATE TABLE [graph].[ReferencingProcedureInstance] (
    CONSTRAINT [EC_ReferencingProcedureInstance] CONNECTION ([graph].[ProcedureInstance] TO [graph].[ProcedureInstance]) ON DELETE CASCADE,
    INDEX [ix_graphid] UNIQUE NONCLUSTERED ($edge_id)
) AS EDGE;








































GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '30c1e60f-ed66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'ReferencingProcedureInstance';

