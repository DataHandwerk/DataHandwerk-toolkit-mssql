

CREATE View [ssis].[PackageFlow_tgt]
As
Select
    tgt.AntoraModule
  , tgt.PackageName
  , tgt.TaskFrom
  , tgt.Taskto
  , tgt.FlowType
  , tgt.LogicalAnd
  , tgt.ObjectName
  , tgt.CreationName
  , tgt.DTSID
  , tgt.EvalOp
  , tgt.Expression
From
    ssis.PackageFlow As tgt
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
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '85f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageFlow_tgt', @level2type = N'COLUMN', @level2name = N'Expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '84f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageFlow_tgt', @level2type = N'COLUMN', @level2name = N'EvalOp';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '83f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageFlow_tgt', @level2type = N'COLUMN', @level2name = N'DTSID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '82f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageFlow_tgt', @level2type = N'COLUMN', @level2name = N'CreationName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '81f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageFlow_tgt', @level2type = N'COLUMN', @level2name = N'ObjectName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '80f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageFlow_tgt', @level2type = N'COLUMN', @level2name = N'LogicalAnd';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7ff8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageFlow_tgt', @level2type = N'COLUMN', @level2name = N'FlowType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7cf8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageFlow_tgt', @level2type = N'COLUMN', @level2name = N'Taskto';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7bf8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageFlow_tgt', @level2type = N'COLUMN', @level2name = N'TaskFrom';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dfe3c11b-183b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageFlow_tgt', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7df8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageFlow_tgt', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5e64fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageFlow_tgt';

