CREATE TABLE [repo].[IndexColumn_ssas_T] (
    [index_guid]            UNIQUEIDENTIFIER NOT NULL,
    [index_column_id]       INT              NOT NULL,
    [RepoObjectColumn_guid] UNIQUEIDENTIFIER NOT NULL,
    [databasename]          NVARCHAR (128)   NOT NULL,
    [TableID]               NUMERIC (20)     NOT NULL,
    [TableName]             NVARCHAR (MAX)   NOT NULL,
    [ColumnName]            NVARCHAR (MAX)   NOT NULL,
    [ColumnType]            BIGINT           NOT NULL,
    [is_descending_key]     AS               (CONVERT([bit],(0))),
    CONSTRAINT [PK_IndexColumn_ssas_T] PRIMARY KEY CLUSTERED ([index_guid] ASC, [index_column_id] ASC),
    CONSTRAINT [FK_IndexColumn_ssas_T_Index_ssas_T] FOREIGN KEY ([index_guid]) REFERENCES [repo].[Index_ssas_T] ([index_guid]) ON DELETE CASCADE ON UPDATE CASCADE
);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f841f8c3-0f08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ssas_T', @level2type = N'CONSTRAINT', @level2name = N'FK_IndexColumn_ssas_T_Index_ssas_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f641f8c3-0f08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ssas_T', @level2type = N'CONSTRAINT', @level2name = N'PK_IndexColumn_ssas_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '14a7e6d1-0f08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ssas_T', @level2type = N'COLUMN', @level2name = N'ColumnType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '13a7e6d1-0f08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ssas_T', @level2type = N'COLUMN', @level2name = N'ColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '12a7e6d1-0f08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ssas_T', @level2type = N'COLUMN', @level2name = N'TableName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '11a7e6d1-0f08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ssas_T', @level2type = N'COLUMN', @level2name = N'TableID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '10a7e6d1-0f08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ssas_T', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0fa7e6d1-0f08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ssas_T', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0ea7e6d1-0f08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ssas_T', @level2type = N'COLUMN', @level2name = N'index_column_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0da7e6d1-0f08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ssas_T', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f541f8c3-0f08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'IndexColumn_ssas_T';

