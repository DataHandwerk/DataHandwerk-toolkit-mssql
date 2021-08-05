CREATE TABLE [reference].[RepoObject_ReferenceTree_referenced_30_0_T] (
    [RepoObject_guid]      UNIQUEIDENTIFIER NOT NULL,
    [Referenced_guid]      UNIQUEIDENTIFIER NOT NULL,
    [Referenced_Depth]     INT              NULL,
    [Referenced_fullname]  NVARCHAR (261)   NULL,
    [Referenced_fullname2] NVARCHAR (257)   NULL,
    [RepoObject_fullname]  NVARCHAR (261)   NULL,
    [RepoObject_fullname2] NVARCHAR (257)   NULL,
    CONSTRAINT [PK_RepoObject_ReferenceTree_referenced_30_0_T] PRIMARY KEY CLUSTERED ([RepoObject_guid] ASC, [Referenced_guid] ASC) WITH (DATA_COMPRESSION = PAGE)
);

