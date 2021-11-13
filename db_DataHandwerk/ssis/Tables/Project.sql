CREATE TABLE [ssis].[Project] (
    [AntoraModule] VARCHAR (50)   NOT NULL,
    [ProjectPath]  VARCHAR (8000) NULL,
    [sql_import]   AS             (((((((((('Exec ssis_t.usp_GetPackageDetails '''+[ProjectPath])+'''')+char((13)))+char((10)))+'Exec ssis_t.usp_GetProjectConnection ''')+[ProjectPath])+'''')+char((13)))+char((10)))+'Exec ssis.usp_import'),
    CONSTRAINT [PK_Project] PRIMARY KEY CLUSTERED ([AntoraModule] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7564fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'Project', @level2type = N'CONSTRAINT', @level2name = N'PK_Project';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1bfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'sql_import';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1afad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'ProjectPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '19fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'Project', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7b64fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'Project';

