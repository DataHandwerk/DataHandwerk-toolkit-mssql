CREATE TABLE [reference].[RepoObject_ReferenceTree_0_30_T] (
    [RepoObject_guid]       UNIQUEIDENTIFIER NOT NULL,
    [Referencing_guid]      UNIQUEIDENTIFIER NOT NULL,
    [Referenced_guid]       UNIQUEIDENTIFIER NOT NULL,
    [Referenced_Depth]      INT              NULL,
    [Referenced_fullname]   NVARCHAR (261)   NULL,
    [Referenced_fullname2]  NVARCHAR (257)   NULL,
    [Referenced_type]       CHAR (2)         NULL,
    [Referencing_Depth]     INT              NULL,
    [Referencing_fullname]  NVARCHAR (261)   NULL,
    [Referencing_fullname2] NVARCHAR (257)   NULL,
    [Referencing_type]      VARCHAR (2)      NULL,
    CONSTRAINT [uq_RepoObject_ReferenceTree_0_30_T] UNIQUE NONCLUSTERED ([RepoObject_guid] ASC, [Referenced_guid] ASC, [Referencing_guid] ASC)
);


GO
CREATE CLUSTERED COLUMNSTORE INDEX [CSI_reference_RepoObject_ReferenceTree_0_30_T]
    ON [reference].[RepoObject_ReferenceTree_0_30_T];


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7c07068d-19f6-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_0_30_T', @level2type = N'CONSTRAINT', @level2name = N'uq_RepoObject_ReferenceTree_0_30_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ca98eae1-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_0_30_T', @level2type = N'COLUMN', @level2name = N'Referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c898eae1-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_0_30_T', @level2type = N'COLUMN', @level2name = N'Referencing_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c798eae1-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_0_30_T', @level2type = N'COLUMN', @level2name = N'Referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c698eae1-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_0_30_T', @level2type = N'COLUMN', @level2name = N'Referencing_Depth';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c298eae1-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_0_30_T', @level2type = N'COLUMN', @level2name = N'Referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c398eae1-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_0_30_T', @level2type = N'COLUMN', @level2name = N'Referenced_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cc98eae1-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_0_30_T', @level2type = N'COLUMN', @level2name = N'Referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cb98eae1-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_0_30_T', @level2type = N'COLUMN', @level2name = N'Referenced_Depth';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c598eae1-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_0_30_T', @level2type = N'COLUMN', @level2name = N'Referenced_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c998eae1-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_0_30_T', @level2type = N'COLUMN', @level2name = N'Referencing_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c498eae1-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_0_30_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'afe916da-fef5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_ReferenceTree_0_30_T';

