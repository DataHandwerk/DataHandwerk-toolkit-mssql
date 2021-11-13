CREATE TABLE [ssis_t].[TblTask_Sql] (
    [ControlFlowDetailsRowID] INT              NOT NULL,
    [RowID]                   INT              NOT NULL,
    [SqlConnection]           UNIQUEIDENTIFIER NULL,
    [SqlStatementSource]      NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_TblTask_Sql] PRIMARY KEY CLUSTERED ([ControlFlowDetailsRowID] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7964fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Sql', @level2type = N'CONSTRAINT', @level2name = N'PK_TblTask_Sql';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'abfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Sql', @level2type = N'COLUMN', @level2name = N'SqlStatementSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aafad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Sql', @level2type = N'COLUMN', @level2name = N'SqlConnection';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a9fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Sql', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a8fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Sql', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8e64fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Sql';

