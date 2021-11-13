CREATE TABLE [ssis_t].[TblTask_Dft_Derived] (
    [DataFlowDetailsRowID] INT            NULL,
    [RowID]                INT            NULL,
    [DerivedValue]         VARCHAR (8000) NULL,
    [SourceColumn]         VARCHAR (8000) NULL,
    [DestinationColumn]    VARCHAR (8000) NULL
);


GO
CREATE CLUSTERED INDEX [CX_TblDerivedTaskDetails]
    ON [ssis_t].[TblTask_Dft_Derived]([DataFlowDetailsRowID] ASC, [RowID] ASC) WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '84fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Derived', @level2type = N'COLUMN', @level2name = N'DestinationColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '83fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Derived', @level2type = N'COLUMN', @level2name = N'SourceColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '82fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Derived', @level2type = N'COLUMN', @level2name = N'DerivedValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '81fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Derived', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '80fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Derived', @level2type = N'COLUMN', @level2name = N'DataFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8464fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_Derived';

