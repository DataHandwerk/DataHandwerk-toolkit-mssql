
CREATE VIEW [ssis_t].[TblConnection_src]
As
With
CTE_PkgLevel
As
    (
    Select
        pkg.RowID
      , pkg.PackagePath
      --add PackageName
      , pkg.PackageName
      , ConnectionManagerName = cfnodes.x.value (
                                                    'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:ObjectName[1]'
                                                  , 'varchar(max)'
                                                )
      , ConnectionManagerType = cfnodes.x.value (
                                                    'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:CreationName[1]'
                                                  , 'varchar(max)'
                                                )
      --, cfnodes1.y.value('declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:ConnectionString[1]', 'varchar(max)') 
      , ConnectionStringQry   = cfnodes.x.query ( '.' ).query ( 'declare namespace p1="www.microsoft.com/SqlServer/Dts";./p1:ConnectionManager/p1:ObjectData/p1:ConnectionManager' )
      , ExpressionQry         = cfnodes.x.query ( '.' ).query ( 'declare namespace p1="www.microsoft.com/SqlServer/Dts";./p1:ConnectionManager/p1:PropertyExpression' )
      , ConnectionManagerID   = cfnodes.x.value (
                                                    'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:DTSID[1]'
                                                  , 'uniqueidentifier'
                                                )
      , pkg.PackageCreatorName
    From
        ssis_t.pkgStats                                                                                                                            As pkg
        Cross Apply pkg.PackageXML.nodes ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";(//DTS:Executable/DTS:ConnectionManagers/*)' ) As cfnodes(x)
    )
,
CTE_PkgConLevel
As
    (
    Select
        pkg.RowID
      , pkg.PackagePath
      , pkg.PackageName
      , pkg.ConnectionManagerName
      , pkg.ConnectionManagerType
      , pkg.ConnectionManagerID
      --,pkg.ConnectionStringQry
      , ConnectionString             =
        (
            Select
                Top 1
                ConnectionString = cfnodes.x.value (
                                                       'declare namespace p1="www.microsoft.com/SqlServer/Dts";@p1:ConnectionString[1]'
                                                     , 'nvarchar(max)'
                                                   )
            From
                pkg.ConnectionStringQry.nodes ( './*' ) As cfnodes(x)
        )
      , ExpressionValue              =
        (
            Select
                Top 1
                ExpressionValue = cfnodes.x.value ( '.', 'nvarchar(max)' )
            From
                pkg.ExpressionQry.nodes ( './*' ) As cfnodes(x)
        )
      , pkg.PackageCreatorName
      , RetainSameConnectionProperty =
        (
            Select
                Top 1
                RetainSameConnectionProperty = cfnodes.x.value (
                                                                   'declare namespace p1="www.microsoft.com/SqlServer/Dts";@p1:Retain[1]'
                                                                 , 'nvarchar(max)'
                                                               )
            From
                pkg.ConnectionStringQry.nodes ( './*' ) As cfnodes(x)
        )
    From
        CTE_PkgLevel As pkg
    )
--Insert Into ssis.PackageAnalysis
--(
--    RowID
--  , PackagePath
--  , PackageName
--  , Category
--  , PackageCreatorName
--  , ObjectName
--  , ObjectType
--  , DelayValidationPropertyValue
--  , ObjectValue
--  , ExpressionValue
--  , ConnectionManagerID
--  , RetainSameConnectionProperty
--)
Select
    Distinct
    pkg.RowID
  , pkg.PackagePath
  --, PackageName                  = Replace ( pkg.PackagePath, Replace ( @Path, '*.dtsx', '' ), '' )
  , pkg.PackageName
  , Category                     = 'Connection'
  , pkg.PackageCreatorName
  , ConnectionManagerName        = Cast(pkg.ConnectionManagerName As Varchar(Max))
  , ConnectionManagerType        = Cast(pkg.ConnectionManagerType As Varchar(Max))
  , DelayValidationPropertyValue = 'NA'
  , ConnectionString             = Cast(pkg.ConnectionString As Varchar(Max))
  , ExpressionValue              = Cast(pkg.ExpressionValue As Varchar(Max))
  , pkg.ConnectionManagerID
  , pkg.RetainSameConnectionProperty
From
    CTE_PkgConLevel As pkg;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '55f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblConnection_src', @level2type = N'COLUMN', @level2name = N'RetainSameConnectionProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '54f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblConnection_src', @level2type = N'COLUMN', @level2name = N'ConnectionManagerID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '53f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblConnection_src', @level2type = N'COLUMN', @level2name = N'ExpressionValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '52f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblConnection_src', @level2type = N'COLUMN', @level2name = N'ConnectionString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '51f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblConnection_src', @level2type = N'COLUMN', @level2name = N'DelayValidationPropertyValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '50f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblConnection_src', @level2type = N'COLUMN', @level2name = N'ConnectionManagerType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4ff9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblConnection_src', @level2type = N'COLUMN', @level2name = N'ConnectionManagerName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4ef9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblConnection_src', @level2type = N'COLUMN', @level2name = N'PackageCreatorName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4df9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblConnection_src', @level2type = N'COLUMN', @level2name = N'Category';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4cf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblConnection_src', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4bf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblConnection_src', @level2type = N'COLUMN', @level2name = N'PackagePath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4af9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblConnection_src', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7d64fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblConnection_src';

