
CREATE VIEW [ssis_t].[TblControlFlow_src]
As
With
CTE_CFLevel
As
    (
    Select
        pkg.RowID
      --, DFTQuery                           = cfnodes.x.query ( '.' ).query ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
      --          ./DTS:Executable[@DTS:ExecutableType=''SSIS.Pipeline.3'']/DTS:ObjectData/pipeline/components/component' )

      ---- https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/bdf1b5fe-d2e2-4fb9-892c-02c50b865e40
      , DFTQuery_1                   = cfnodes.x.query ( '.' ).query ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''SSIS.Pipeline'']/DTS:ObjectData/pipeline/components/component' )
      , DFTQuery_2                   = cfnodes.x.query ( '.' ).query ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''SSIS.Pipeline.3'']/DTS:ObjectData/pipeline/components/component' )
      , DFTQuery_3                   = cfnodes.x.query ( '.' ).query ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''STOCK:SSIS.Pipeline'']/DTS:ObjectData/pipeline/components/component' )
      , DFTQuery_4                   = cfnodes.x.query ( '.' ).query ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''Microsoft.Pipeline'']/DTS:ObjectData/pipeline/components/component' )
      , exist_DFTQuery_1             = cfnodes.x.query ( '.' ).exist ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''SSIS.Pipeline'']/DTS:ObjectData/pipeline/components/component' )
      , exist_DFTQuery_2             = cfnodes.x.query ( '.' ).exist ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''SSIS.Pipeline.3'']/DTS:ObjectData/pipeline/components/component' )
      , exist_DFTQuery_3             = cfnodes.x.query ( '.' ).exist ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''STOCK:SSIS.Pipeline'']/DTS:ObjectData/pipeline/components/component' )
      , exist_DFTQuery_4             = cfnodes.x.query ( '.' ).exist ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''Microsoft.Pipeline'']/DTS:ObjectData/pipeline/components/component' )
      , TaskPath                     = cfnodes.x.value (
                                                           'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:refId[1]'
                                                         , 'varchar(max)'
                                                       )
      , TaskName                     = cfnodes.x.value (
                                                           'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:ObjectName[1]'
                                                         , 'nvarchar(max)'
                                                       )
      , TaskDescription              = cfnodes.x.value (
                                                           'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:Description'
                                                         , 'nvarchar(max)'
                                                       )
      , TaskType                     = cfnodes.x.value (
                                                           'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:ExecutableType'
                                                         , 'nvarchar(max)'
                                                       )
      , DelayValidationPropertyValue = cfnodes.x.value (
                                                           'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:DelayValidation'
                                                         , 'nvarchar(max)'
                                                       )
      , IsDisabled                   = IsNull (
                                                  cfnodes.x.value (
                                                                      'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:Disabled'
                                                                    , 'nvarchar(max)'
                                                                  )
                                                , 'False'
                                              )
      , ForloopEvalExpression        = 'EvalExpression = '
                                       + cfnodes.x.value (
                                                             'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:EvalExpression'
                                                           , 'nvarchar(max)'
                                                         )
      --, SqlTaskQry                         = cfnodes.x.query ( '.' ).query ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
      --          ./DTS:Executable[@DTS:ExecutableType=''Microsoft.SqlServer.Dts.Tasks.ExecuteSQLTask.ExecuteSQLTask, Microsoft.SqlServer.SQLTask, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91'']/DTS:ObjectData/*' )

      ---- https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/80af8760-5b6d-4dfd-8a63-cf14bb090fbd
      , SqlTaskQry_1                 = cfnodes.x.query ( '.' ).query ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''Microsoft.SqlServer.Dts.Tasks.ExecuteSQLTask.ExecuteSQLTask, Microsoft.SqlServer.SQLTask, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91'']/DTS:ObjectData/*' )
      , SqlTaskQry_2                 = cfnodes.x.query ( '.' ).query ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''STOCK:SQLTask'']/DTS:ObjectData/*' )
      , SqlTaskQry_3                 = cfnodes.x.query ( '.' ).query ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''Microsoft.ExecuteSQLTask'']/DTS:ObjectData/*' )
      , exist_SqlTaskQry_1           = cfnodes.x.query ( '.' ).exist ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''Microsoft.SqlServer.Dts.Tasks.ExecuteSQLTask.ExecuteSQLTask, Microsoft.SqlServer.SQLTask, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91'']/DTS:ObjectData/*' )
      , exist_SqlTaskQry_2           = cfnodes.x.query ( '.' ).exist ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''STOCK:SQLTask'']/DTS:ObjectData/*' )
      , exist_SqlTaskQry_3           = cfnodes.x.query ( '.' ).exist ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''Microsoft.ExecuteSQLTask'']/DTS:ObjectData/*' )
      --
      --, ExecPkgTaskQry                     = cfnodes.x.query ( '.' ).query ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
      --              ./DTS:Executable[@DTS:ExecutableType=''SSIS.ExecutePackageTask.3'']/*' )

      ---- https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/f71e8e17-aa69-4ce8-8fc6-d2e0fef99059
      , ExecPkgTaskQry_1             = cfnodes.x.query ( '.' ).query ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''SSIS.ExecutePackageTask'']/*' )
      , ExecPkgTaskQry_2             = cfnodes.x.query ( '.' ).query ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''SSIS.ExecutePackageTask.3'']/*' )
      , ExecPkgTaskQry_3             = cfnodes.x.query ( '.' ).query ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''STOCK:ExecutePackageTask'']/*' )
      , ExecPkgTaskQry_4             = cfnodes.x.query ( '.' ).query ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''Microsoft.ExecutePackageTask'']/*' )
      , exist_ExecPkgTaskQry_1       = cfnodes.x.query ( '.' ).exist ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''SSIS.ExecutePackageTask'']/*' )
      , exist_ExecPkgTaskQry_2       = cfnodes.x.query ( '.' ).exist ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''SSIS.ExecutePackageTask.3'']/*' )
      , exist_ExecPkgTaskQry_3       = cfnodes.x.query ( '.' ).exist ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''STOCK:ExecutePackageTask'']/*' )
      , exist_ExecPkgTaskQry_4       = cfnodes.x.query ( '.' ).exist ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''Microsoft.ExecutePackageTask'']/*' )

      ---- https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/93ef6e19-9c22-4dd1-b6b1-ae7d9c43a490
      ---- error in documentation, the right value is 'Microsoft.ScriptTask' but not 'Microsoft:ScriptTask'
      , ScriptTaskQry_1              = cfnodes.x.query ( '.' ).query ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''Microsoft.SqlServer.Dts.Tasks.ScriptTask.ScriptTask, Microsoft.SqlServer.ScriptTask, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91'']/DTS:ObjectData/ScriptProject/*' )
      , ScriptTaskQry_2              = cfnodes.x.query ( '.' ).query ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''STOCK:ScriptTask'']/DTS:ObjectData/ScriptProject/*' )
      , ScriptTaskQry_3              = cfnodes.x.query ( '.' ).query ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''Microsoft.ScriptTask'']/DTS:ObjectData/ScriptProject/*' )
      , exist_ScriptTaskQry_1        = cfnodes.x.query ( '.' ).exist ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''Microsoft.SqlServer.Dts.Tasks.ScriptTask.ScriptTask, Microsoft.SqlServer.ScriptTask, Version=11.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91'']/DTS:ObjectData/ScriptProject/*' )
      , exist_ScriptTaskQry_2        = cfnodes.x.query ( '.' ).exist ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''STOCK:ScriptTask'']/DTS:ObjectData/ScriptProject/*' )
      , exist_ScriptTaskQry_3        = cfnodes.x.query ( '.' ).exist ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:Executable[@DTS:ExecutableType=''Microsoft.ScriptTask'']/DTS:ObjectData/ScriptProject/*' )
    From
        ssis_t.pkgStats                                                                                                                   As pkg
        Cross Apply pkg.PackageXML.nodes ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";//DTS:Executable/DTS:Executables/*' ) As cfnodes(x)
    )
--Insert Into ssis.TblControlFlowDetails
--(
--    RowID
--  , TaskPath
--  , TaskName
--  , TaskTypeDescription
--  , TaskType
--  , DelayValidationPropertyValue
--  , DFTQuery
--  , SqlTaskQry
--  , ExecPkgTaskQry
--  , ScriptTaskQry
--  , IsDisabled
--  , ExpressionValue
--)
Select
    CTE_CFLevel.RowID
  , CTE_CFLevel.TaskPath
  , CTE_CFLevel.TaskName
  , CTE_CFLevel.TaskDescription
  , CTE_CFLevel.TaskType
  , CTE_CFLevel.DelayValidationPropertyValue
  --, CTE_CFLevel.DFTQuery
  , DFTQuery        = Case
                          When CTE_CFLevel.exist_DFTQuery_1 = 1
                              Then
                              CTE_CFLevel.DFTQuery_1
                          When CTE_CFLevel.exist_DFTQuery_2 = 1
                              Then
                              CTE_CFLevel.DFTQuery_2
                          When CTE_CFLevel.exist_DFTQuery_3 = 1
                              Then
                              CTE_CFLevel.DFTQuery_3
                          When CTE_CFLevel.exist_DFTQuery_4 = 1
                              Then
                              CTE_CFLevel.DFTQuery_4
                      End
  --, CTE_CFLevel.SqlTaskQry
  , SqlTaskQry      = Case
                          When CTE_CFLevel.exist_SqlTaskQry_1 = 1
                              Then
                              CTE_CFLevel.SqlTaskQry_1
                          When CTE_CFLevel.exist_SqlTaskQry_2 = 1
                              Then
                              CTE_CFLevel.SqlTaskQry_2
                          When CTE_CFLevel.exist_SqlTaskQry_3 = 1
                              Then
                              CTE_CFLevel.SqlTaskQry_3
                      End
  --, CTE_CFLevel.ExecPkgTaskQry
  , ExecPkgTaskQry  = Case
                          When CTE_CFLevel.exist_ExecPkgTaskQry_1 = 1
                              Then
                              CTE_CFLevel.ExecPkgTaskQry_1
                          When CTE_CFLevel.exist_ExecPkgTaskQry_2 = 1
                              Then
                              CTE_CFLevel.ExecPkgTaskQry_2
                          When CTE_CFLevel.exist_ExecPkgTaskQry_3 = 1
                              Then
                              CTE_CFLevel.ExecPkgTaskQry_3
                          When CTE_CFLevel.exist_ExecPkgTaskQry_4 = 1
                              Then
                              CTE_CFLevel.ExecPkgTaskQry_4
                      End
  --, CTE_CFLevel.ScriptTaskQry
  , ScriptTaskQry   = Case
                          When CTE_CFLevel.exist_ScriptTaskQry_1 = 1
                              Then
                              CTE_CFLevel.ScriptTaskQry_1
                          When CTE_CFLevel.exist_ScriptTaskQry_2 = 1
                              Then
                              CTE_CFLevel.ScriptTaskQry_2
                          When CTE_CFLevel.exist_ScriptTaskQry_3 = 1
                              Then
                              CTE_CFLevel.ScriptTaskQry_3
                      End
  , CTE_CFLevel.IsDisabled
  , ExpressionValue = CTE_CFLevel.ForloopEvalExpression
From
    CTE_CFLevel;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '61f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblControlFlow_src', @level2type = N'COLUMN', @level2name = N'ExpressionValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '60f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblControlFlow_src', @level2type = N'COLUMN', @level2name = N'IsDisabled';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5ff9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblControlFlow_src', @level2type = N'COLUMN', @level2name = N'ScriptTaskQry';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5ef9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblControlFlow_src', @level2type = N'COLUMN', @level2name = N'ExecPkgTaskQry';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5df9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblControlFlow_src', @level2type = N'COLUMN', @level2name = N'SqlTaskQry';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5cf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblControlFlow_src', @level2type = N'COLUMN', @level2name = N'DFTQuery';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5bf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblControlFlow_src', @level2type = N'COLUMN', @level2name = N'DelayValidationPropertyValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5af9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblControlFlow_src', @level2type = N'COLUMN', @level2name = N'TaskType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '59f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblControlFlow_src', @level2type = N'COLUMN', @level2name = N'TaskDescription';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '58f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblControlFlow_src', @level2type = N'COLUMN', @level2name = N'TaskName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '57f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblControlFlow_src', @level2type = N'COLUMN', @level2name = N'TaskPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '56f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblControlFlow_src', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7f64fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblControlFlow_src';

