CREATE TABLE [docs].[ssis_Adoc_T] (
    [AntoraModule]    VARCHAR (50)   NOT NULL,
    [PackageBasename] VARCHAR (8000) NOT NULL,
    [AdocContent]     NVARCHAR (MAX) NOT NULL
)
WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f0a5f6bc-533f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'ssis_Adoc_T', @level2type = N'COLUMN', @level2name = N'AdocContent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f1a5f6bc-533f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'ssis_Adoc_T', @level2type = N'COLUMN', @level2name = N'PackageBasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'efa5f6bc-533f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'ssis_Adoc_T', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '242faab3-533f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'TABLE', @level1name = N'ssis_Adoc_T';

