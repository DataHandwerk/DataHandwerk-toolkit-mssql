CREATE TABLE [reference].[RepoObject_ReferenceTree] (
    [RepoObject_guid]       UNIQUEIDENTIFIER NOT NULL,
    [Referenced_guid]       UNIQUEIDENTIFIER NOT NULL,
    [Referenced_Depth]      INT              NULL,
    [Referenced_fullname]   NVARCHAR (261)   NULL,
    [Referenced_fullname2]  NVARCHAR (257)   NULL,
    [Referenced_type]       CHAR (2)         NULL,
    [Referencing_guid]      UNIQUEIDENTIFIER NOT NULL,
    [Referencing_Depth]     INT              NULL,
    [Referencing_fullname]  NVARCHAR (261)   NULL,
    [Referencing_fullname2] NVARCHAR (257)   NULL,
    [Referencing_type]      VARCHAR (2)      NULL
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0bdf2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree';

