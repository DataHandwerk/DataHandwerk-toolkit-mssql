CREATE TABLE [ssis_t].[TblTask_Dft_Component] (
    [ControlFlowDetailsRowID]     INT           NOT NULL,
    [RowID]                       INT           NULL,
    [refId]                       VARCHAR (MAX) NULL,
    [name]                        VARCHAR (MAX) NULL,
    [componentClassID]            VARCHAR (MAX) NULL,
    [description]                 VARCHAR (MAX) NULL,
    [ContactInfo]                 VARCHAR (MAX) NULL,
    [CommandTimeout]              INT           NULL,
    [OpenRowset]                  VARCHAR (MAX) NULL,
    [OpenRowsetVariable]          VARCHAR (MAX) NULL,
    [SqlCommand]                  VARCHAR (MAX) NULL,
    [SqlCommandVariable]          VARCHAR (MAX) NULL,
    [DefaultCodePage]             INT           NULL,
    [AlwaysUseDefaultCodePage]    VARCHAR (MAX) NULL,
    [AccessMode]                  VARCHAR (MAX) NULL,
    [ParameterMapping]            VARCHAR (MAX) NULL,
    [FastLoadKeepIdentity]        BIT           NULL,
    [FastLoadKeepNulls]           BIT           NULL,
    [FastLoadOptions]             VARCHAR (MAX) NULL,
    [FastLoadMaxInsertCommitSize] INT           NULL,
    [VariableName]                VARCHAR (MAX) NULL,
    [Connection_refId]            VARCHAR (MAX) NULL,
    [connectionManagerID]         VARCHAR (MAX) NULL,
    [connectionManagerRefId]      VARCHAR (MAX) NULL,
    [Connection_description]      VARCHAR (MAX) NULL,
    [Connection_name]             VARCHAR (MAX) NULL,
    [IsSortedProperty]            VARCHAR (10)  NULL,
    [outputsQry]                  XML           NULL,
    [inputsQry]                   XML           NULL,
    [DftComponentId]              INT           IDENTITY (1, 1) NOT NULL,
    CONSTRAINT [PK_TblTask_Dft_Component] PRIMARY KEY CLUSTERED ([DftComponentId] ASC) WITH (DATA_COMPRESSION = PAGE)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b1dcad7f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'CONSTRAINT', @level2name = N'PK_TblTask_Dft_Component';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ae9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'DftComponentId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ad9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'inputsQry';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ac9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'outputsQry';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ab9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'IsSortedProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aa9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Connection_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a99b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Connection_description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a89b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'connectionManagerRefId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a79b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'connectionManagerID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a69b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'Connection_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a59b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'VariableName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a49b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'FastLoadMaxInsertCommitSize';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a39b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'FastLoadOptions';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a29b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'FastLoadKeepNulls';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a19b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'FastLoadKeepIdentity';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a09b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'ParameterMapping';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9f9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'AccessMode';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9e9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'AlwaysUseDefaultCodePage';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9d9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'DefaultCodePage';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9c9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'SqlCommandVariable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9b9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'SqlCommand';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9a9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'OpenRowsetVariable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '999b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'OpenRowset';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '989b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'CommandTimeout';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '979b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'ContactInfo';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '969b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '959b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'componentClassID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '949b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '939b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '929b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '919b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b0dcad7f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Component';

