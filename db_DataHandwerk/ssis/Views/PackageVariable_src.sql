
CREATE View ssis.PackageVariable_src
As
Select
    p.AntoraModule
  , p.PackageName
  , T2.VariableName
  , T2.VariableDataType
  , T2.VariableValue
  , T2.ExpressionValue
  , T2.VariableHexValue
From
    ssis.Package_src       As p
    Inner Join
        ssis_t.TblVariable As T2
            On
            p.RowID = T2.RowID
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '35f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageVariable_src', @level2type = N'COLUMN', @level2name = N'VariableHexValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '34f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageVariable_src', @level2type = N'COLUMN', @level2name = N'ExpressionValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '33f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageVariable_src', @level2type = N'COLUMN', @level2name = N'VariableValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '32f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageVariable_src', @level2type = N'COLUMN', @level2name = N'VariableDataType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '31f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageVariable_src', @level2type = N'COLUMN', @level2name = N'VariableName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eae3c11b-183b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageVariable_src', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2ef9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageVariable_src', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6f64fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageVariable_src';

