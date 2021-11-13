CREATE TABLE [ssis_t].[tempprecedence3] (
    [ROWID]       INT            NULL,
    [task]        VARCHAR (2000) NULL,
    [parentlevel] INT            NULL,
    [LEVEL]       INT            NULL,
    [trank]       BIGINT         NULL
);


GO
CREATE CLUSTERED INDEX [CIX_TblPrecedenceConstraint1]
    ON [ssis_t].[tempprecedence3]([ROWID] ASC);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c9fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence3', @level2type = N'COLUMN', @level2name = N'trank';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c8fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence3', @level2type = N'COLUMN', @level2name = N'LEVEL';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c7fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence3', @level2type = N'COLUMN', @level2name = N'parentlevel';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c6fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence3', @level2type = N'COLUMN', @level2name = N'task';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c5fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence3', @level2type = N'COLUMN', @level2name = N'ROWID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9564fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence3';

