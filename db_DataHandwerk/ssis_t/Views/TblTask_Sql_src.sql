
CREATE VIEW [ssis_t].[TblTask_Sql_src]
As
Select
    cf.RowID
  , cf.ControlFlowDetailsRowID
  , SqlConnection      = cfnodes1.x.value (
                                              'declare namespace SQLTask="www.microsoft.com/sqlserver/dts/tasks/sqltask";
					/SQLTask:SqlTaskData[1]/@SQLTask:Connection'
                                            , 'uniqueidentifier'
                                          )
  , SqlStatementSource = cfnodes1.x.value (
                                              'declare namespace SQLTask="www.microsoft.com/sqlserver/dts/tasks/sqltask";
					/SQLTask:SqlTaskData[1]/@SQLTask:SqlStatementSource'
                                            , 'nvarchar(max)'
                                          )
From
    ssis_t.TblControlFlow                   As cf
    Cross Apply Cf.SqlTaskQry.nodes ( '.' ) As cfnodes1(x)
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '92f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Sql_src', @level2type = N'COLUMN', @level2name = N'SqlStatementSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '91f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Sql_src', @level2type = N'COLUMN', @level2name = N'SqlConnection';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '90f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Sql_src', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8ff9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Sql_src', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9064fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Sql_src';

