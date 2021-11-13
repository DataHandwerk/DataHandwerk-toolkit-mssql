
CREATE VIEW [ssis].[PackageTask_tgt]
As
Select
    tgt.AntoraModule
  , tgt.PackageName
  , tgt.TaskPath
  , tgt.TaskName
  , tgt.ControlFlowDetailsRowID
  , tgt.TaskDescription
  , tgt.TaskType
  , tgt.IsDisabled
  , tgt.DelayValidationPropertyValue
  --, tgt.DFTQuery
  --, tgt.SqlTaskQry
  --, tgt.ExecPkgTaskQry
  --, tgt.ScriptTaskQry
  , tgt.ExpressionValue
  , tgt.Script
  , tgt.SqlConnection
  , tgt.SqlStatementSource
  , tgt.ExecutePackageExpression
  , tgt.ExecutedPackageName
  , tgt.ExecutePackageConnection
From
    ssis.PackageTask As tgt
Where
    Exists
(
    Select
        1
    From
        ssis.AntoraModule_tgt_filter As f
    Where
        tgt.AntoraModule = f.AntoraModule
)
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2df9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_tgt', @level2type = N'COLUMN', @level2name = N'ExecutePackageConnection';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2cf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_tgt', @level2type = N'COLUMN', @level2name = N'ExecutedPackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2bf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_tgt', @level2type = N'COLUMN', @level2name = N'ExecutePackageExpression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2af9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_tgt', @level2type = N'COLUMN', @level2name = N'SqlStatementSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '29f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_tgt', @level2type = N'COLUMN', @level2name = N'SqlConnection';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '28f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_tgt', @level2type = N'COLUMN', @level2name = N'Script';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '27f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_tgt', @level2type = N'COLUMN', @level2name = N'ExpressionValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '22f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_tgt', @level2type = N'COLUMN', @level2name = N'DelayValidationPropertyValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '21f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_tgt', @level2type = N'COLUMN', @level2name = N'IsDisabled';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '20f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_tgt', @level2type = N'COLUMN', @level2name = N'TaskType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1ff9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_tgt', @level2type = N'COLUMN', @level2name = N'TaskDescription';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1ef9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_tgt', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1df9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_tgt', @level2type = N'COLUMN', @level2name = N'TaskName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1af9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_tgt', @level2type = N'COLUMN', @level2name = N'TaskPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e9e3c11b-183b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_tgt', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1bf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_tgt', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6d64fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_tgt';

