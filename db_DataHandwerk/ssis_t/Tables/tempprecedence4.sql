CREATE TABLE [ssis_t].[tempprecedence4] (
    [ROWID]  INT            NULL,
    [task]   VARCHAR (2000) NULL,
    [tlevel] INT            NULL,
    [level]  INT            NULL,
    [trank]  BIGINT         NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cefad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence4', @level2type = N'COLUMN', @level2name = N'trank';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cdfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence4', @level2type = N'COLUMN', @level2name = N'level';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ccfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence4', @level2type = N'COLUMN', @level2name = N'tlevel';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cbfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence4', @level2type = N'COLUMN', @level2name = N'task';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cafad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence4', @level2type = N'COLUMN', @level2name = N'ROWID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9664fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence4';

