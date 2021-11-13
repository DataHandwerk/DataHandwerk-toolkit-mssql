
CREATE View ssis.PackageTask_src
As
Select
    p.AntoraModule
  , p.PackageName
  , T2.TaskPath
  , T2.TaskName
  , T2.ControlFlowDetailsRowID
  , T2.TaskDescription
  , T2.TaskType
  , T2.IsDisabled
  , T2.DelayValidationPropertyValue
  ---- The XML data type cannot be compared or sorted, except when using the IS NULL operator.
  --, T2.DFTQuery
  --, T2.SqlTaskQry
  --, T2.ExecPkgTaskQry
  --, T2.ScriptTaskQry
  , T2.ExpressionValue
  , T3.Script
  , T4.SqlConnection
  , T4.SqlStatementSource
  , T5.ExecutePackageExpression
  , T5.ExecutedPackageName
  , T5.ExecutePackageConnection
From
    ssis.Package_src                  As p
    Inner Join
        ssis_t.TblControlFlow         As T2
            On
            p.RowID                    = T2.RowID

    Left Outer Join
        ssis_t.TblTask_Script         As T3
            On
            T3.ControlFlowDetailsRowID = T2.ControlFlowDetailsRowID

    Left Outer Join
        ssis_t.TblTask_Sql            As T4
            On
            T4.ControlFlowDetailsRowID = T2.ControlFlowDetailsRowID

    Left Outer Join
        ssis_t.TblTask_ExecutePackage As T5
            On
            T5.ControlFlowDetailsRowID = T2.ControlFlowDetailsRowID
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '18f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_src', @level2type = N'COLUMN', @level2name = N'ExecutePackageConnection';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '17f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_src', @level2type = N'COLUMN', @level2name = N'ExecutedPackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '16f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_src', @level2type = N'COLUMN', @level2name = N'ExecutePackageExpression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '15f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_src', @level2type = N'COLUMN', @level2name = N'SqlStatementSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '14f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_src', @level2type = N'COLUMN', @level2name = N'SqlConnection';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '13f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_src', @level2type = N'COLUMN', @level2name = N'Script';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '12f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_src', @level2type = N'COLUMN', @level2name = N'ExpressionValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0df9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_src', @level2type = N'COLUMN', @level2name = N'DelayValidationPropertyValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0cf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_src', @level2type = N'COLUMN', @level2name = N'IsDisabled';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0bf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_src', @level2type = N'COLUMN', @level2name = N'TaskType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0af9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_src', @level2type = N'COLUMN', @level2name = N'TaskDescription';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '09f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_src', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '08f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_src', @level2type = N'COLUMN', @level2name = N'TaskName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '07f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_src', @level2type = N'COLUMN', @level2name = N'TaskPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e8e3c11b-183b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_src', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '04f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_src', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6c64fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_src';

