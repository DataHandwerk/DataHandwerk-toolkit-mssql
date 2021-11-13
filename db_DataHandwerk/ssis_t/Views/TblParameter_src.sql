
CREATE VIEW [ssis_t].[TblParameter_src]
As
With
CTE_PkgLevel
As
    (
    Select
        pkg.RowID
      , pkg.PackagePath
      , pkg.PackageName
      , ParameterName     = cfnodes.x.value (
                                                'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:ObjectName[1]'
                                              , 'varchar(max)'
                                            )
      , ParameterHexValue = cfnodes.x.value (
                                                'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:DTSID[1]'
                                              , 'varchar(max)'
                                            )
      , ExpressionValue   = cfnodes.x.value (
                                                'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:Expression[1]'
                                              , 'varchar(max)'
                                            )
      , ParameterQry      = cfnodes.x.query ( '.' ).query ( 'declare namespace p1="www.microsoft.com/SqlServer/Dts";./p1:PackageParameter/p1:Property' )
      , pkg.PackageCreatorName
    From
        ssis_t.pkgStats                                                                                                                           As pkg
        Cross Apply pkg.PackageXML.nodes ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";(//DTS:Executable/DTS:PackageParameters/*)' ) As cfnodes(x)
    )
--select * from CTE_PkgLevel
,
CTE_PkgVarLevel
As
    (
    Select
        pkg.RowID
      , pkg.PackagePath
      , pkg.PackageName
      , pkg.ParameterName
      , pkg.ExpressionValue
      , pkg.ParameterHexValue
      , ParameterValue    =
        (
            Select
                Top 1
                ParameterValue = cfnodes.x.value ( '.', 'nvarchar(max)' )
            From
                pkg.ParameterQry.nodes ( './*' ) As cfnodes(x)
        )
      --,pkg.ConnectionStringQry
      , ParameterDataType =
        (
            Select
                Top 1
                DataType = cfnodes.x.value (
                                               'declare namespace p1="www.microsoft.com/SqlServer/Dts";@p1:DataType[1]'
                                             , 'nvarchar(max)'
                                           )
            From
                pkg.ParameterQry.nodes ( './*' ) As cfnodes(x)
        )
      , pkg.PackageCreatorName
    From
        CTE_PkgLevel As pkg
    )
--Insert Into ssis.TblParameterDetails
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
--  , ParameterHexValue
--)
Select
    Distinct
    Tblvar.RowID
  , Tblvar.PackagePath
  , Tblvar.PackageName
  --, PackageName     = Replace ( Tblvar.PackagePath, Replace ( @Path, '*.dtsx', '' ), '' )
  , Category          = 'Variable'
  , Tblvar.PackageCreatorName
  , ParameterName     = Cast(Tblvar.ParameterName As Varchar(Max))
  , ParameterDataType = Cast(Tblvar.ParameterDataType As Varchar(Max))
  , ParameterValue    = IsNull ( Cast(Tblvar.ParameterValue As Varchar(Max)), '' )
  , ExpressionValue   = IsNull ( Cast(Tblvar.ExpressionValue As Varchar(Max)), '' )
  , Tblvar.ParameterHexValue
From
    CTE_PkgVarLevel As Tblvar;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6bf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblParameter_src', @level2type = N'COLUMN', @level2name = N'ParameterHexValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6af9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblParameter_src', @level2type = N'COLUMN', @level2name = N'ExpressionValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '69f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblParameter_src', @level2type = N'COLUMN', @level2name = N'ParameterValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '68f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblParameter_src', @level2type = N'COLUMN', @level2name = N'ParameterDataType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '67f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblParameter_src', @level2type = N'COLUMN', @level2name = N'ParameterName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '66f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblParameter_src', @level2type = N'COLUMN', @level2name = N'PackageCreatorName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '65f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblParameter_src', @level2type = N'COLUMN', @level2name = N'Category';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '64f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblParameter_src', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '63f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblParameter_src', @level2type = N'COLUMN', @level2name = N'PackagePath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '62f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblParameter_src', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8164fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblParameter_src';

