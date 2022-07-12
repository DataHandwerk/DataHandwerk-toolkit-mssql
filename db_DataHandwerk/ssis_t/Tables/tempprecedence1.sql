CREATE TABLE [ssis_t].[tempprecedence1] (
    [RowID]         INT            NULL,
    [TaskFrom]      VARCHAR (2000) NULL,
    [isparentlevel] INT            NOT NULL,
    [level]         BIGINT         NULL
);




GO
CREATE NONCLUSTERED INDEX [NCIX_TblPrecedenceConstraint1]
    ON [ssis_t].[tempprecedence1]([level] ASC);


GO
CREATE CLUSTERED INDEX [CIX_TblPrecedenceConstraint1]
    ON [ssis_t].[tempprecedence1]([RowID] ASC) WITH (DATA_COMPRESSION = PAGE);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bffad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence1', @level2type = N'COLUMN', @level2name = N'level';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'befad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence1', @level2type = N'COLUMN', @level2name = N'isparentlevel';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bdfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence1', @level2type = N'COLUMN', @level2name = N'TaskFrom';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bcfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence1', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9364fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence1';

