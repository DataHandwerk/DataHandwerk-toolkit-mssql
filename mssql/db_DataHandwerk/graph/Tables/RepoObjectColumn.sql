CREATE TABLE [graph].[RepoObjectColumn] (
    [RepoObjectColumn_guid] UNIQUEIDENTIFIER NOT NULL,
    [RepoObject_fullname]   NVARCHAR (261)   NOT NULL,
    [RepoObject_guid]       UNIQUEIDENTIFIER NOT NULL,
    [RepoObject_type]       CHAR (2)         NOT NULL,
    [RepoObjectColumn_name] NVARCHAR (128)   NOT NULL,
    CONSTRAINT [UK_RepoObjectColumn] UNIQUE NONCLUSTERED ([RepoObjectColumn_guid] ASC),
    INDEX [ix_graphid] UNIQUE NONCLUSTERED ($node_id)
) AS NODE;






















GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '89efc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9fefc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd88f8f21-4265-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd78f8f21-4265-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd68f8f21-4265-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd58f8f21-4265-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2cc1e60f-ed66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoObjectColumn';

