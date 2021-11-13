CREATE TABLE [ssis_t].[tempprecedence5] (
    [ROWID]      INT            NULL,
    [task]       VARCHAR (2000) NULL,
    [sequenceno] NVARCHAR (MAX) NULL,
    [trank]      BIGINT         NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd2fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence5', @level2type = N'COLUMN', @level2name = N'trank';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd1fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence5', @level2type = N'COLUMN', @level2name = N'sequenceno';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd0fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence5', @level2type = N'COLUMN', @level2name = N'task';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cffad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence5', @level2type = N'COLUMN', @level2name = N'ROWID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9764fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence5';

