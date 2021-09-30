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
)
WITH (DATA_COMPRESSION = PAGE);






GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0bdf2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '34df2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2edf2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree', @level2type = N'COLUMN', @level2name = N'Referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2ddf2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree', @level2type = N'COLUMN', @level2name = N'Referencing_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '41e90a1e-7495-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree', @level2type = N'COLUMN', @level2name = N'Referencing_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2cdf2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree', @level2type = N'COLUMN', @level2name = N'Referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '33df2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree', @level2type = N'COLUMN', @level2name = N'Referencing_Depth';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '31df2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree', @level2type = N'COLUMN', @level2name = N'Referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '30df2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree', @level2type = N'COLUMN', @level2name = N'Referenced_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '42e90a1e-7495-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree', @level2type = N'COLUMN', @level2name = N'Referenced_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2fdf2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree', @level2type = N'COLUMN', @level2name = N'Referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '32df2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree', @level2type = N'COLUMN', @level2name = N'Referenced_Depth';

