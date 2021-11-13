
/*
data flow task

details per each column between data flow task steps

data flow task steps can be extracted later by using select distinct
*/
CREATE VIEW [ssis_t].[TblTask_Dft_Details_src]
As
Select
    pkglvl.ControlFlowDetailsRowID
  , pkglvl.RowID
  , DFTTasksPath                  = dftnodes.x.value ( '@refId[1]', 'varchar(max)' )
  , DFTTaskName                   = dftnodes.x.value ( '@name[1]', 'varchar(max)' )
  , DFTTaskType                   = dftnodes.x.value ( '@description[1]', 'varchar(max)' )
  , DFTTaskType1                  = dftnodes.x.value ( '@contactInfo[1]', 'varchar(max)' )
  , DFTRowSet                     = dftnodes.x.value ( 'data(./properties/property[@name=''OpenRowset'']	)[1]', 'varchar(max)' )
  , ParameterBindingParameterName = dftnodes.x.value (
                                                         'data(./properties/property[@name=''ParameterMapping'']	)[1]'
                                                       , 'varchar(max)'
                                                     )
  , DFTSQLCommand                 = Case
                                        When IsNull (
                                                        dftnodes.x.value (
                                                                             'data(./properties/property[@name=''SqlCommand''])[1]'
                                                                           , 'varchar(max)'
                                                                         )
                                                      , ''
                                                    ) = ''
                                            Then
                                            IsNull (
                                                       dftnodes.x.value (
                                                                            'data(./properties/property[@name=''SqlCommandVariable''])[1]'
                                                                          , 'varchar(max)'
                                                                        )
                                                     , ''
                                                   )
                                        Else
                                            IsNull (
                                                       dftnodes.x.value (
                                                                            'data(./properties/property[@name=''SqlCommand''])[1]'
                                                                          , 'varchar(max)'
                                                                        )
                                                     , ''
                                                   )
                                    End
  , DFTConnectionManager          = dftnodes.x.value ( 'data(./connections/connection/@connectionManagerID)[1]', 'varchar(max)' )
  , Variable                      = dftnodes.x.value ( 'data(./properties/property[@name=''VariableName'']	)[1]' , 'varchar(max)' )
  , IsSortedProperty              = dftnodes.x.value ( 'data(./outputs/output/@isSorted)[1]', 'varchar(10)' )
  --multiple input and output columns per data flow step:
  , InputQry                      = lineage.x.query ( '.' )
  , OutputQry                     = outputvalue.x.query ( '.' )
  , MultihashcolumnSortPosition   = outputvalue.x.value (
                                                            'data(./properties/property[@name=''InputColumnLineageIDs'']	)[1]'
                                                          , 'varchar(max)'
                                                        )
From
    ssis_t.TblControlFlow                       As pkglvl
    Cross Apply pkglvl.DFTQuery.nodes ( './*' ) As dftnodes(x)
    Outer Apply dftnodes.x.nodes ( './inputs/input/inputColumns/*' ) As lineage(x)
    Outer Apply dftnodes.x.nodes ( './outputs/output/outputColumns/*' ) As outputvalue(x);
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '85f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Details_src', @level2type = N'COLUMN', @level2name = N'MultihashcolumnSortPosition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '84f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Details_src', @level2type = N'COLUMN', @level2name = N'OutputQry';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '83f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Details_src', @level2type = N'COLUMN', @level2name = N'InputQry';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '82f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Details_src', @level2type = N'COLUMN', @level2name = N'IsSortedProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '81f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Details_src', @level2type = N'COLUMN', @level2name = N'Variable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '80f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Details_src', @level2type = N'COLUMN', @level2name = N'DFTConnectionManager';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7ff9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Details_src', @level2type = N'COLUMN', @level2name = N'DFTSQLCommand';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7ef9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Details_src', @level2type = N'COLUMN', @level2name = N'ParameterBindingParameterName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7df9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Details_src', @level2type = N'COLUMN', @level2name = N'DFTRowSet';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7cf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Details_src', @level2type = N'COLUMN', @level2name = N'DFTTaskType1';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7bf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Details_src', @level2type = N'COLUMN', @level2name = N'DFTTaskType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7af9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Details_src', @level2type = N'COLUMN', @level2name = N'DFTTaskName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '79f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Details_src', @level2type = N'COLUMN', @level2name = N'DFTTasksPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '78f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Details_src', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '77f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Details_src', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8664fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Details_src';

