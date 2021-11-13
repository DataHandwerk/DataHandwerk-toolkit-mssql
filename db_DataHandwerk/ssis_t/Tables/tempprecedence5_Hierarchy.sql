CREATE TABLE [ssis_t].[tempprecedence5_Hierarchy] (
    [ROWID]      INT                 NULL,
    [task]       VARCHAR (2000)      NULL,
    [sequenceno] NVARCHAR (MAX)      NULL,
    [rid]        [sys].[hierarchyid] NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd6fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence5_Hierarchy', @level2type = N'COLUMN', @level2name = N'rid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd5fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence5_Hierarchy', @level2type = N'COLUMN', @level2name = N'sequenceno';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd4fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence5_Hierarchy', @level2type = N'COLUMN', @level2name = N'task';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd3fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence5_Hierarchy', @level2type = N'COLUMN', @level2name = N'ROWID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9864fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'tempprecedence5_Hierarchy';

