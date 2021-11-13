CREATE TABLE [ssis].[PackageTask_Dft_Component] (
    [AntoraModule]                          VARCHAR (50)   NOT NULL,
    [PackageName]                           VARCHAR (200)  NOT NULL,
    [Component_refId]                       VARCHAR (MAX)  NOT NULL,
    [Component_name]                        VARCHAR (MAX)  NOT NULL,
    [Component_componentClassID]            VARCHAR (MAX)  NULL,
    [Component_description]                 VARCHAR (MAX)  NULL,
    [Component_ContactInfo]                 VARCHAR (MAX)  NULL,
    [Component_CommandTimeout]              INT            NULL,
    [Component_OpenRowset]                  VARCHAR (MAX)  NULL,
    [Component_OpenRowsetVariable]          VARCHAR (MAX)  NULL,
    [Component_SqlCommand]                  VARCHAR (MAX)  NULL,
    [Component_SqlCommandVariable]          VARCHAR (MAX)  NULL,
    [Component_DefaultCodePage]             INT            NULL,
    [Component_AlwaysUseDefaultCodePage]    VARCHAR (MAX)  NULL,
    [Component_AccessMode]                  VARCHAR (MAX)  NULL,
    [Component_ParameterMapping]            VARCHAR (MAX)  NULL,
    [Component_FastLoadKeepIdentity]        BIT            NULL,
    [Component_FastLoadKeepNulls]           BIT            NULL,
    [Component_FastLoadOptions]             VARCHAR (MAX)  NULL,
    [Component_FastLoadMaxInsertCommitSize] INT            NULL,
    [Component_VariableName]                VARCHAR (MAX)  NULL,
    [Component_Connection_refId]            VARCHAR (MAX)  NULL,
    [Component_connectionManagerID]         VARCHAR (MAX)  NULL,
    [Component_connectionManagerRefId]      VARCHAR (MAX)  NULL,
    [Component_Connection_description]      VARCHAR (MAX)  NULL,
    [Component_Connection_name]             VARCHAR (MAX)  NULL,
    [Component_IsSortedProperty]            VARCHAR (10)   NULL,
    [TaskPath]                              VARCHAR (8000) NOT NULL,
    [ControlFlowDetailsRowID]               INT            NOT NULL,
    [Component_ConnectionManagerName]       AS             (case when left([Component_connectionManagerRefId],(26))='Project.ConnectionManagers' OR left([Component_connectionManagerRefId],(26))='Package.ConnectionManagers' then substring([Component_connectionManagerRefId],(28),len([Component_connectionManagerRefId])-(28))  end),
    [PackageBasename]                       AS             (replace([PackageName],'.dtsx','')) PERSISTED
)
WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '95251c51-9f41-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'PackageBasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eca5f6bc-533f-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_ConnectionManagerName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7b9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7a9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'TaskPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '799c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_IsSortedProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '789c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_Connection_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '779c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_Connection_description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '769c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_connectionManagerRefId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '759c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_connectionManagerID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '749c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_Connection_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '739c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_VariableName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '729c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_FastLoadMaxInsertCommitSize';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '719c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_FastLoadOptions';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '709c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_FastLoadKeepNulls';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6f9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_FastLoadKeepIdentity';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6e9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_ParameterMapping';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6d9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_AccessMode';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6c9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_AlwaysUseDefaultCodePage';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6b9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_DefaultCodePage';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6a9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_SqlCommandVariable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '699c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_SqlCommand';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '689c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_OpenRowsetVariable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '679c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_OpenRowset';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '669c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_CommandTimeout';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '659c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_ContactInfo';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '649c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '639c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_componentClassID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '629c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '619c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Component_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '609c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5f9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b9dcad7f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'TABLE', @level1name = N'PackageTask_Dft_Component';

