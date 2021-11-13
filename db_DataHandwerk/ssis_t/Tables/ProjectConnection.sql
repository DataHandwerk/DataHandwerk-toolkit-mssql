CREATE TABLE [ssis_t].[ProjectConnection] (
    [RowID]          INT            IDENTITY (1, 1) NOT NULL,
    [ProjectPath]    VARCHAR (8000) NOT NULL,
    [ConnectionPath] VARCHAR (8000) NOT NULL,
    [ConnectionXML]  XML            NOT NULL,
    CONSTRAINT [PK_projectConnection] PRIMARY KEY CLUSTERED ([RowID] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7f9a07f7-c23c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'ProjectConnection', @level2type = N'CONSTRAINT', @level2name = N'PK_projectConnection';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '56ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'ProjectConnection', @level2type = N'COLUMN', @level2name = N'ConnectionXML';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '55ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'ProjectConnection', @level2type = N'COLUMN', @level2name = N'ConnectionPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '54ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'ProjectConnection', @level2type = N'COLUMN', @level2name = N'ProjectPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '53ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'ProjectConnection', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '819a07f7-c23c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'ProjectConnection';

