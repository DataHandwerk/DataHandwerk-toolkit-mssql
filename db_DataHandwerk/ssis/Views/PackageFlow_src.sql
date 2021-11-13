



CREATE View [ssis].[PackageFlow_src]
As
Select
    p.AntoraModule
  , p.PackageName
  , T2.TaskFrom
  , T2.TaskTo
  , T2.FlowType
  , T2.LogicalAnd
  , T2.ObjectName
  , T2.CreationName
  , T2.DTSID
  , T2.EvalOp
  , T2.Expression
From
    ssis.Package_src                   As p
    Inner Join
        ssis_t.TblPrecedenceConstraint As T2
            On
            p.RowID = T2.RowID
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '79f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageFlow_src', @level2type = N'COLUMN', @level2name = N'Expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '78f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageFlow_src', @level2type = N'COLUMN', @level2name = N'EvalOp';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '77f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageFlow_src', @level2type = N'COLUMN', @level2name = N'DTSID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '76f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageFlow_src', @level2type = N'COLUMN', @level2name = N'CreationName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '75f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageFlow_src', @level2type = N'COLUMN', @level2name = N'ObjectName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '74f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageFlow_src', @level2type = N'COLUMN', @level2name = N'LogicalAnd';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '73f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageFlow_src', @level2type = N'COLUMN', @level2name = N'FlowType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '72f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageFlow_src', @level2type = N'COLUMN', @level2name = N'TaskTo';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '71f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageFlow_src', @level2type = N'COLUMN', @level2name = N'TaskFrom';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dee3c11b-183b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageFlow_src', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6ef8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageFlow_src', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5d64fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageFlow_src';

