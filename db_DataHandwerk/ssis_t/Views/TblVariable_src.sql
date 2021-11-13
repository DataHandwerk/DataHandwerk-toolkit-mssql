
CREATE VIEW [ssis_t].[TblVariable_src]
As
With
CTE_PkgLevel
As
    (
    Select
        pkg.RowID
      , pkg.PackagePath
      --add PackageName:
      , pkg.PackageName
      , VariableName     = cfnodes.x.value (
                                               'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:ObjectName[1]'
                                             , 'varchar(max)'
                                           )
      , VariableHexValue = cfnodes.x.value (
                                               'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:DTSID[1]'
                                             , 'varchar(max)'
                                           )
      , ExpressionValue  = cfnodes.x.value (
                                               'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:Expression[1]'
                                             , 'varchar(max)'
                                           )
      , VariableQry      = cfnodes.x.query ( '.' ).query ( 'declare namespace p1="www.microsoft.com/SqlServer/Dts";./p1:Variable/p1:VariableValue' )
      , pkg.PackageCreatorName
    From
        ssis_t.pkgStats                                                                                                                     As pkg
        Cross Apply pkg.PackageXML.nodes ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";(//DTS:Executable/DTS:Variables/*)' ) As cfnodes(x)
    )
--select * from CTE_PkgLevel
,
CTE_PkgVarLevel
As
    (
    Select
        pkg.RowID
      , pkg.PackagePath
      --add PackageName:
      , pkg.PackageName
      , pkg.VariableName
      , pkg.ExpressionValue
      , pkg.VariableHexValue
      , VariableValue    =
        (
            Select
                Top 1
                VariableValue = cfnodes.x.value ( '.', 'nvarchar(max)' )
            From
                pkg.VariableQry.nodes ( './*' ) As cfnodes(x)
        )
      --,pkg.ConnectionStringQry
      , VariableDataType =
        (
            Select
                Top 1
                DataType = cfnodes.x.value (
                                               'declare namespace p1="www.microsoft.com/SqlServer/Dts";@p1:DataType[1]'
                                             , 'nvarchar(max)'
                                           )
            From
                pkg.VariableQry.nodes ( './*' ) As cfnodes(x)
        )
      , pkg.PackageCreatorName
    From
        CTE_PkgLevel As pkg
    )
--Insert Into ssis.TblVariableDetails
--(
--    RowID
--  , PackagePath
--  , PackageName
--  , Category
--  , PackageCreatorName
--  , ObjectName
--  , ObjectType
--  , ObjectValue
--  , ExpressionValue
--  , VariableHexValue
--)
Select
    Distinct
    Tblvar.RowID
  , Tblvar.PackagePath
  , Tblvar.PackageName
  --, PackageName     = Replace ( Tblvar.PackagePath, Replace ( @Path, '*.dtsx', '' ), '' )
  , Category        = 'Variable'
  , Tblvar.PackageCreatorName
  , VariableName        = Cast(Tblvar.VariableName As Varchar(Max))
  , VariableDataType        = Cast(Tblvar.VariableDataType As Varchar(Max))
  , VariableValue   = IsNull ( Cast(Tblvar.VariableValue As Varchar(Max)), '' )
  , ExpressionValue = IsNull ( Cast(Tblvar.ExpressionValue As Varchar(Max)), '' )
  , Tblvar.VariableHexValue
From
    CTE_PkgVarLevel As Tblvar;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9cf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblVariable_src', @level2type = N'COLUMN', @level2name = N'VariableHexValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9bf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblVariable_src', @level2type = N'COLUMN', @level2name = N'ExpressionValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9af9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblVariable_src', @level2type = N'COLUMN', @level2name = N'VariableValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '99f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblVariable_src', @level2type = N'COLUMN', @level2name = N'VariableDataType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '98f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblVariable_src', @level2type = N'COLUMN', @level2name = N'VariableName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '97f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblVariable_src', @level2type = N'COLUMN', @level2name = N'PackageCreatorName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '96f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblVariable_src', @level2type = N'COLUMN', @level2name = N'Category';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '95f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblVariable_src', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '94f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblVariable_src', @level2type = N'COLUMN', @level2name = N'PackagePath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '93f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblVariable_src', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9264fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblVariable_src';

