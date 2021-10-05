CREATE TABLE [repo].[RepoObject_sat2_T] (
    [RepoObject_guid]              UNIQUEIDENTIFIER NOT NULL,
    [CreateColumnList]             NVARCHAR (MAX)   NULL,
    [DbmlColumnList]               NVARCHAR (MAX)   NULL,
    [PersistenceCompareColumnList] NVARCHAR (MAX)   NULL,
    [PersistenceInsertColumnList]  NVARCHAR (MAX)   NULL,
    [PersistenceUpdateColumnList]  NVARCHAR (MAX)   NULL,
    [sql_modules_definition]       NVARCHAR (MAX)   NULL,
    [sql_modules_antora]           NVARCHAR (MAX)   NULL,
    [sql_modules_formatted]        NVARCHAR (MAX)   NULL,
    [sql_modules_formatted2]       NVARCHAR (MAX)   NULL,
    [AntoraReferencedList]         NVARCHAR (MAX)   NULL,
    [AntoraReferencingList]        NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_RepoObject_sat2_T] PRIMARY KEY CLUSTERED ([RepoObject_guid] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'c9eb859e-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_sat2_T', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObject_sat2_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '74bd0fa7-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_sat2_T', @level2type = N'COLUMN', @level2name = N'AntoraReferencingList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '73bd0fa7-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_sat2_T', @level2type = N'COLUMN', @level2name = N'AntoraReferencedList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '72bd0fa7-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_sat2_T', @level2type = N'COLUMN', @level2name = N'sql_modules_formatted2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '71bd0fa7-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_sat2_T', @level2type = N'COLUMN', @level2name = N'sql_modules_formatted';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '70bd0fa7-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_sat2_T', @level2type = N'COLUMN', @level2name = N'sql_modules_antora';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6fbd0fa7-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_sat2_T', @level2type = N'COLUMN', @level2name = N'sql_modules_definition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6ebd0fa7-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_sat2_T', @level2type = N'COLUMN', @level2name = N'PersistenceUpdateColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6dbd0fa7-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_sat2_T', @level2type = N'COLUMN', @level2name = N'PersistenceInsertColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6cbd0fa7-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_sat2_T', @level2type = N'COLUMN', @level2name = N'PersistenceCompareColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6bbd0fa7-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_sat2_T', @level2type = N'COLUMN', @level2name = N'DbmlColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6abd0fa7-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_sat2_T', @level2type = N'COLUMN', @level2name = N'CreateColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '69bd0fa7-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_sat2_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'caeb859e-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_sat2_T';

