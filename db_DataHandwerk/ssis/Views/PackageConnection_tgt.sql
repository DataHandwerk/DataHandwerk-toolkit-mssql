


CREATE View [ssis].[PackageConnection_tgt]
As
Select
    tgt.AntoraModule
  , tgt.PackageName
  , tgt.ConnectionManagerID
  , tgt.ConnectionManagerName
  , tgt.ConnectionManagerType
  , tgt.ConnectionString
  , tgt.ExpressionValue
  , tgt.RetainSameConnectionProperty
From
    ssis.PackageConnection As tgt
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
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6df8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageConnection_tgt', @level2type = N'COLUMN', @level2name = N'RetainSameConnectionProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6cf8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageConnection_tgt', @level2type = N'COLUMN', @level2name = N'ExpressionValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6bf8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageConnection_tgt', @level2type = N'COLUMN', @level2name = N'ConnectionString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6af8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageConnection_tgt', @level2type = N'COLUMN', @level2name = N'ConnectionManagerType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '69f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageConnection_tgt', @level2type = N'COLUMN', @level2name = N'ConnectionManagerName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '66f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageConnection_tgt', @level2type = N'COLUMN', @level2name = N'ConnectionManagerID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dde3c11b-183b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageConnection_tgt', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '67f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageConnection_tgt', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5a64fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageConnection_tgt';

