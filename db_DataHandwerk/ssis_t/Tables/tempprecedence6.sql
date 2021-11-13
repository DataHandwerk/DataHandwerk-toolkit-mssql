CREATE TABLE [ssis_t].[tempprecedence6] (
    [ROWID]      INT            NULL,
    [task]       VARCHAR (2000) NULL,
    [sequenceno] BIGINT         NULL
);


GO
CREATE CLUSTERED INDEX [CIX_TblPrecedenceConstraint1]
    ON [ssis_t].[tempprecedence6]([ROWID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd9fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence6', @level2type = N'COLUMN', @level2name = N'sequenceno';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd8fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence6', @level2type = N'COLUMN', @level2name = N'task';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd7fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence6', @level2type = N'COLUMN', @level2name = N'ROWID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9964fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence6';

