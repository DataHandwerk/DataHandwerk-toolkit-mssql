CREATE TABLE [dbeaver].[DataSources] (
    [id]         INT           IDENTITY (1, 1) NOT NULL,
    [BulkColumn] VARCHAR (MAX) NULL,
    [is_json]    AS            (isjson([BulkColumn])),
    CONSTRAINT [PK_dbeaver_DataSources] PRIMARY KEY CLUSTERED ([id] ASC)
);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '95be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'TABLE', @level1name = N'DataSources', @level2type = N'CONSTRAINT', @level2name = N'PK_dbeaver_DataSources';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9fbe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'TABLE', @level1name = N'DataSources', @level2type = N'COLUMN', @level2name = N'is_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9ebe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'TABLE', @level1name = N'DataSources', @level2type = N'COLUMN', @level2name = N'BulkColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9dbe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'TABLE', @level1name = N'DataSources', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '94be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'TABLE', @level1name = N'DataSources';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'id', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'TABLE', @level1name = N'DataSources';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'int', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'TABLE', @level1name = N'DataSources';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'95BE898F-9381-EB11-84E9-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'TABLE', @level1name = N'DataSources';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:dbeaver.DataSources_connection.adoc[]
* xref:dbeaver.DataSources_DbSchemaTable.adoc[]', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'TABLE', @level1name = N'DataSources';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [dbeaver].[DataSources].[BulkColumn]', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'TABLE', @level1name = N'DataSources', @level2type = N'COLUMN', @level2name = N'is_json';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(isjson([BulkColumn]))', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'TABLE', @level1name = N'DataSources', @level2type = N'COLUMN', @level2name = N'is_json';

