CREATE TABLE [ssis_t].[Connection] (
    [ConnectionManager]   VARCHAR (5000)   NULL,
    [ConnectionManagerID] UNIQUEIDENTIFIER NULL
)
WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1dfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'Connection', @level2type = N'COLUMN', @level2name = N'ConnectionManagerID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1cfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'Connection', @level2type = N'COLUMN', @level2name = N'ConnectionManager';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5264fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'Connection';

