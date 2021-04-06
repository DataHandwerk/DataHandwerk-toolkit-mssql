CREATE TABLE [graph].[RepoObject] (
    [RepoObject_guid]      UNIQUEIDENTIFIER NOT NULL,
    [RepoObject_fullname]  NVARCHAR (261)   NOT NULL,
    [RepoObject_type]      CHAR (2)         NOT NULL,
    [RepoObject_fullname2] NVARCHAR (257)   NULL,
    CONSTRAINT [UK_RepoObject] UNIQUE NONCLUSTERED ([RepoObject_guid] ASC),
    INDEX [ix_graphid] UNIQUE NONCLUSTERED ($node_id)
) AS NODE;




























































GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2bc1e60f-ed66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '88efc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f762548b-3865-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9cefc212-b764-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f662548b-3865-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[graph].[RepoObject_S].[RepoObject_type]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[graph].[RepoObject_S].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[graph].[RepoObject_S].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0139cf17-0592-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'graph', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';

