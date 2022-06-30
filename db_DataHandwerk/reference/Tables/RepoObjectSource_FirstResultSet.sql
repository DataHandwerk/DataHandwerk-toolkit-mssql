CREATE TABLE [reference].[RepoObjectSource_FirstResultSet] (
    [RepoObject_guid]      UNIQUEIDENTIFIER NOT NULL,
    [column_ordinal]       INT              NOT NULL,
    [target_column_name]   NVARCHAR (128)   NULL,
    [source_server_name]   NVARCHAR (128)   NULL,
    [source_database_name] NVARCHAR (128)   NULL,
    [source_schema_name]   NVARCHAR (128)   NULL,
    [source_table_name]    NVARCHAR (128)   NULL,
    [source_column_name]   NVARCHAR (128)   NULL,
    [system_type_id]       INT              NULL,
    [system_type_name]     NVARCHAR (128)   NULL,
    [created_dt]           DATETIME         NOT NULL,
    [is_hidden]            BIT              NULL,
    CONSTRAINT [PK_RepoObjectSource_FirstResultSet] PRIMARY KEY NONCLUSTERED ([RepoObject_guid] ASC, [column_ordinal] ASC),
    CONSTRAINT [FK_RepoObjectSource_FirstResultSet__RepoObject] FOREIGN KEY ([RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid]) ON DELETE CASCADE ON UPDATE CASCADE
)
WITH (DATA_COMPRESSION = PAGE);














GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2e90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectSource_FirstResultSet';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0d90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectSource_FirstResultSet__RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2c90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3bf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'COLUMN', @level2name = N'target_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '42f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'COLUMN', @level2name = N'system_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '41f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'COLUMN', @level2name = N'system_type_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3ff37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'COLUMN', @level2name = N'source_table_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3cf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'COLUMN', @level2name = N'source_server_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3ef37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'COLUMN', @level2name = N'source_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3df37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'COLUMN', @level2name = N'source_database_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '40f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'COLUMN', @level2name = N'source_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '39f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '44f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'COLUMN', @level2name = N'is_hidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '43f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'COLUMN', @level2name = N'created_dt';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3af37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'COLUMN', @level2name = N'column_ordinal';


GO



GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid,column_ordinal', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,int', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'2E90291C-9D61-EB11-84DC-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.RepoObjectColumn_reference_FirstResultSet.adoc[]
* xref:reference.usp_RepoObjectSource_FirstResultSet.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectSource_FirstResultSet';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObjectSource_FirstResultSet';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectSource_FirstResultSet__RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectSource_FirstResultSet__RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_FirstResultSet';


GO
CREATE COLUMNSTORE INDEX [CCI_RepoObjectSource_FirstResultSet]
    ON [reference].[RepoObjectSource_FirstResultSet]([RepoObject_guid]);

