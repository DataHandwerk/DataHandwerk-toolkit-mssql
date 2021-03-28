CREATE TABLE [graph].[RepoObjectColumn] (
    [RepoObjectColumn_guid]     UNIQUEIDENTIFIER NOT NULL,
    [RepoObject_fullname]       NVARCHAR (261)   NOT NULL,
    [RepoObject_guid]           UNIQUEIDENTIFIER NOT NULL,
    [RepoObject_type]           CHAR (2)         NOT NULL,
    [RepoObjectColumn_name]     NVARCHAR (128)   NOT NULL,
    [RepoObjectColumn_fullname] NVARCHAR (520)   NULL,
    [RepoObjectColumn_type]     NVARCHAR (128)   NULL,
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


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a22c2611-ba7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '724679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'[graph].[RepoObjectColumn_S]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObjectColumn';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[graph].[RepoObjectColumn_S].[RepoObjectColumn_name]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the column. Is unique within the object.', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[graph].[RepoObjectColumn_S].[RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[graph].[RepoObjectColumn_S].[RepoObject_type]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[graph].[RepoObjectColumn_S].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[graph].[RepoObjectColumn_S].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObjectColumn', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';

