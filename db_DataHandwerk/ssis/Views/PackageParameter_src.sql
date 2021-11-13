

CREATE View [ssis].[PackageParameter_src]
As
Select
    p.AntoraModule
  , p.PackageName
  , T2.ParameterName
  , T2.ParameterDataType
  , T2.ParameterValue
  , T2.ExpressionValue
  , T2.ParameterHexValue
From
    ssis.Package_src               As p
    Inner Join
        ssis_t.TblParameter As T2
            On
            p.RowID = T2.RowID
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8df8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageParameter_src', @level2type = N'COLUMN', @level2name = N'ParameterHexValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8cf8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageParameter_src', @level2type = N'COLUMN', @level2name = N'ExpressionValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8bf8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageParameter_src', @level2type = N'COLUMN', @level2name = N'ParameterValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8af8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageParameter_src', @level2type = N'COLUMN', @level2name = N'ParameterDataType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '89f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageParameter_src', @level2type = N'COLUMN', @level2name = N'ParameterName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e0e3c11b-183b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageParameter_src', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '86f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageParameter_src', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6064fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageParameter_src';

