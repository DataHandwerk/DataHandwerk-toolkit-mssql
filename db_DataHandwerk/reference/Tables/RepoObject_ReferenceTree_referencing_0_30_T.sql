CREATE TABLE [reference].[RepoObject_ReferenceTree_referencing_0_30_T] (
    [RepoObject_guid]       UNIQUEIDENTIFIER NOT NULL,
    [Referencing_guid]      UNIQUEIDENTIFIER NOT NULL,
    [referencing_Depth]     INT              NULL,
    [referencing_fullname]  NVARCHAR (261)   NULL,
    [referencing_fullname2] NVARCHAR (257)   NULL,
    [RepoObject_fullname]   NVARCHAR (261)   NULL,
    [RepoObject_fullname2]  NVARCHAR (257)   NULL,
    CONSTRAINT [PK_RepoObject_ReferenceTree_referencing_0_30_T] PRIMARY KEY CLUSTERED ([RepoObject_guid] ASC, [Referencing_guid] ASC) WITH (DATA_COMPRESSION = PAGE)
);

