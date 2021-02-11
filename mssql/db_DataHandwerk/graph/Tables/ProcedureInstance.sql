CREATE TABLE [graph].[ProcedureInstance] (
    [Procedure_RepoObject_guid] UNIQUEIDENTIFIER NOT NULL,
    [Instance]                  VARCHAR (500)    NOT NULL,
    [Procedure_fullname]        NVARCHAR (261)   NOT NULL,
    CONSTRAINT [UK_ProcedureInstance] UNIQUE NONCLUSTERED ([Procedure_RepoObject_guid] ASC, [Instance] ASC),
    INDEX [ix_graphid] UNIQUE NONCLUSTERED ($node_id)
) AS NODE;












GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2dc1e60f-ed66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'ProcedureInstance', @level2type = N'CONSTRAINT', @level2name = N'UK_ProcedureInstance';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2ac1e60f-ed66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'ProcedureInstance';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '35c1e60f-ed66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'ProcedureInstance', @level2type = N'COLUMN', @level2name = N'Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '37c1e60f-ed66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'ProcedureInstance', @level2type = N'COLUMN', @level2name = N'Procedure_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '36c1e60f-ed66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'ProcedureInstance', @level2type = N'COLUMN', @level2name = N'Instance';

