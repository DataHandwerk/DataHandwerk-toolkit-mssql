CREATE TABLE [repo].[RepoObject_referencing_level_T] (
    [LastNode_fullname]      NVARCHAR (261)   NULL,
    [LastNode_fullname2]     NVARCHAR (257)   NULL,
    [LastNode_guid]          UNIQUEIDENTIFIER NULL,
    [ListNode]               NVARCHAR (4000)  NULL,
    [referencing_level]      INT              NOT NULL,
    [StartingNode_fullname]  NVARCHAR (261)   NULL,
    [StartingNode_fullname2] NVARCHAR (257)   NULL,
    [StartingNode_guid]      UNIQUEIDENTIFIER NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a218814c-9295-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_referencing_level_T', @level2type = N'COLUMN', @level2name = N'StartingNode_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a118814c-9295-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_referencing_level_T', @level2type = N'COLUMN', @level2name = N'StartingNode_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a018814c-9295-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_referencing_level_T', @level2type = N'COLUMN', @level2name = N'StartingNode_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9f18814c-9295-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_referencing_level_T', @level2type = N'COLUMN', @level2name = N'referencing_level';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9e18814c-9295-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_referencing_level_T', @level2type = N'COLUMN', @level2name = N'ListNode';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9d18814c-9295-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_referencing_level_T', @level2type = N'COLUMN', @level2name = N'LastNode_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9c18814c-9295-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_referencing_level_T', @level2type = N'COLUMN', @level2name = N'LastNode_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9b18814c-9295-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_referencing_level_T', @level2type = N'COLUMN', @level2name = N'LastNode_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8d18814c-9295-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject_referencing_level_T';

