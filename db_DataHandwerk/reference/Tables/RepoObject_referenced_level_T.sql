CREATE TABLE [reference].[RepoObject_referenced_level_T] (
    [LastNode_fullname]      NVARCHAR (261)   NULL,
    [LastNode_fullname2]     NVARCHAR (257)   NULL,
    [LastNode_guid]          UNIQUEIDENTIFIER NULL,
    [ListNode]               NVARCHAR (4000)  NULL,
    [referenced_level]       INT              NOT NULL,
    [StartingNode_fullname]  NVARCHAR (261)   NULL,
    [StartingNode_fullname2] NVARCHAR (257)   NULL,
    [StartingNode_guid]      UNIQUEIDENTIFIER NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9a18814c-9295-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_referenced_level_T', @level2type = N'COLUMN', @level2name = N'StartingNode_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9918814c-9295-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_referenced_level_T', @level2type = N'COLUMN', @level2name = N'StartingNode_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9818814c-9295-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_referenced_level_T', @level2type = N'COLUMN', @level2name = N'StartingNode_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9718814c-9295-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_referenced_level_T', @level2type = N'COLUMN', @level2name = N'referenced_level';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9618814c-9295-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_referenced_level_T', @level2type = N'COLUMN', @level2name = N'ListNode';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9518814c-9295-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_referenced_level_T', @level2type = N'COLUMN', @level2name = N'LastNode_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9418814c-9295-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_referenced_level_T', @level2type = N'COLUMN', @level2name = N'LastNode_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9318814c-9295-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_referenced_level_T', @level2type = N'COLUMN', @level2name = N'LastNode_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8a18814c-9295-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_referenced_level_T';

