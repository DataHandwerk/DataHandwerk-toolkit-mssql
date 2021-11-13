
CREATE VIEW [ssis_t].[TblTask_Dft_SrcDest_src]
As
Select
    pkglvl.RowID
  , pkglvl.DataFlowDetailsRowID
  , SourceColumn      = lineage.x.value ( './@lineageId[1]', 'varchar(max)' )
  , DestinationColumn = Coalesce (
                                     lineage.x.value ( './@name[1]', 'varchar(max)' )
                                   , lineage.x.value ( './@externalMetadataColumnId[1]', 'varchar(max)' )
                                   , lineage.x.value ( './@refId[1]', 'varchar(max)' )
                                 )
  , SortKeyPosition   = lineage.x.value ( './@sortKeyPosition[1]', 'varchar(200)' )
  , DataSource        = 'InputQry'
From
    ssis_t.TblTask_Dft_Details                    As pkglvl
    Cross Apply pkglvl.InputQry.nodes ( './*' ) As lineage(x)
Union All
Select
    pkglvl.RowID
  , pkglvl.DataFlowDetailsRowID
  , SourceColumn      = lineage.x.value ( './@lineageId[1]', 'varchar(max)' )
  , DestinationColumn = Coalesce (
                                     lineage.x.value ( './@name[1]', 'varchar(max)' )
                                   , lineage.x.value ( './@externalMetadataColumnId[1]', 'varchar(max)' )
                                   , lineage.x.value ( './@refId[1]', 'varchar(max)' )
                                 )
  , SortKeyPosition   = lineage.x.value ( './@sortKeyPosition[1]', 'varchar(200)' )
  , DataSource        = 'OutputQry'
From
    ssis_t.TblTask_Dft_Details                     As pkglvl
    Cross Apply pkglvl.OutputQry.nodes ( './*' ) As lineage(x)
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8bf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_SrcDest_src', @level2type = N'COLUMN', @level2name = N'DataSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8af9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_SrcDest_src', @level2type = N'COLUMN', @level2name = N'SortKeyPosition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '89f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_SrcDest_src', @level2type = N'COLUMN', @level2name = N'DestinationColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '88f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_SrcDest_src', @level2type = N'COLUMN', @level2name = N'SourceColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '87f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_SrcDest_src', @level2type = N'COLUMN', @level2name = N'DataFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '86f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_SrcDest_src', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8864fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_SrcDest_src';

