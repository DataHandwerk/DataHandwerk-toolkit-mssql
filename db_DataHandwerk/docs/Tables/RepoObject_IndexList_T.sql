CREATE TABLE [docs].[RepoObject_IndexList_T] (
    [AntoraIndexList] NVARCHAR (MAX)   NULL,
    [PumlIndexList]   NVARCHAR (MAX)   NULL,
    [RepoObject_guid] UNIQUEIDENTIFIER NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd032d632-9498-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_IndexList_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cf32d632-9498-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_IndexList_T', @level2type = N'COLUMN', @level2name = N'PumlIndexList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ce32d632-9498-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_IndexList_T', @level2type = N'COLUMN', @level2name = N'AntoraIndexList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'eee49b2c-9498-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'RepoObject_IndexList_T';

