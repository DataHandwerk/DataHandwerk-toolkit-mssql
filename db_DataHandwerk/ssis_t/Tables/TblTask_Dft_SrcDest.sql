CREATE TABLE [ssis_t].[TblTask_Dft_SrcDest] (
    [DataFlowDetailsRowID] INT            NULL,
    [RowID]                INT            NULL,
    [SourceColumn]         VARCHAR (8000) NULL,
    [DestinationColumn]    VARCHAR (8000) NULL,
    [SortKeyPosition]      VARCHAR (10)   NULL,
    [DataSource]           VARCHAR (50)   NULL
);


GO
CREATE CLUSTERED INDEX [CX_TblSrcDestDetails]
    ON [ssis_t].[TblTask_Dft_SrcDest]([DataFlowDetailsRowID] ASC, [RowID] ASC) WITH (DATA_COMPRESSION = PAGE);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9afad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_SrcDest', @level2type = N'COLUMN', @level2name = N'DataSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '99fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_SrcDest', @level2type = N'COLUMN', @level2name = N'SortKeyPosition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '98fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_SrcDest', @level2type = N'COLUMN', @level2name = N'DestinationColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '97fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_SrcDest', @level2type = N'COLUMN', @level2name = N'SourceColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '96fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_SrcDest', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '95fad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_SrcDest', @level2type = N'COLUMN', @level2name = N'DataFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8764fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'TABLE', @level1name = N'TblTask_Dft_SrcDest';

