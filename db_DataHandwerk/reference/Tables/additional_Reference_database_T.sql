CREATE TABLE [reference].[additional_Reference_database_T] (
    [AntoraComponent]  NVARCHAR (128) NOT NULL,
    [AntoraModule]     NVARCHAR (128) NOT NULL,
    [DatabaseName]     NVARCHAR (128) NULL,
    [RepoDatabaseName] NVARCHAR (128) NULL,
    CONSTRAINT [PK_additional_Reference_database_T] PRIMARY KEY CLUSTERED ([AntoraComponent] ASC, [AntoraModule] ASC) WITH (DATA_COMPRESSION = PAGE)
);








GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ceb17b93-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference_database_T', @level2type = N'CONSTRAINT', @level2name = N'PK_additional_Reference_database_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b2ed2e9f-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference_database_T', @level2type = N'COLUMN', @level2name = N'DatabaseName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b1ed2e9f-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference_database_T', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b0ed2e9f-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference_database_T', @level2type = N'COLUMN', @level2name = N'AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'c9b17b93-d017-ec11-851c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference_database_T';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '01557e28-d01b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'additional_Reference_database_T', @level2type = N'COLUMN', @level2name = N'RepoDatabaseName';


GO


