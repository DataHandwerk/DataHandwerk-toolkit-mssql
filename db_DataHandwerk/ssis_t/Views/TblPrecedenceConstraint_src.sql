
CREATE VIEW [ssis_t].[TblPrecedenceConstraint_src]
As
With
CTE_CFPrec
As
    (
    Select
        pkg.RowID
      , pkg.PackagePath
      , TaskFrom     = cfnodes.x.value (
                                           'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:From[1]'
                                         , 'nvarchar(max)'
                                       )
      , TaskTo       = cfnodes.x.value (
                                           'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:To[1]'
                                         , 'nvarchar(max)'
                                       )
      , LogicalAnd   = cfnodes.x.value (
                                           'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:LogicalAnd[1]'
                                         , 'bit'
                                       )
      , ObjectName   = cfnodes.x.value (
                                           'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:ObjectName[1]'
                                         , 'nvarchar(max)'
                                       )
      , CreationName = cfnodes.x.value (
                                           'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:CreationName[1]'
                                         , 'nvarchar(max)'
                                       )
      , DTSID        = cfnodes.x.value (
                                           'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:DTSID[1]'
                                         , 'uniqueidentifier'
                                       )
      , EvalOp       = cfnodes.x.value ( 'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:EvalOp[1]', 'int' )
      --https://docs.microsoft.com/de-de/dotnet/api/microsoft.sqlserver.dts.runtime.dtsprecedenceevalop?view=sqlserver-2019
      /*
Constraint	2	
Gibt an, dass das Ausführungsergebnis bestimmt, ob der eingeschränkte Container oder Task ausgeführt wird. Legen Sie für die Value-Eigenschaft von PrecedenceConstraint den gewünschten Wert aus der DTSExecResult-Enumeration fest.

Expression	1	
Gibt an, dass der Wert eines Ausdrucks bestimmt, ob der eingeschränkte Container oder Task ausgeführt wird. Legen Sie die Expression-Eigenschaft von PrecedenceConstraint fest.

ExpressionAndConstraint	3	
Gibt an, dass das Einschränkungsergebnis auftreten und der Ausdruck ausgewertet werden muss, damit der eingeschränkte Container oder Task ausgeführt wird. Legen Sie die Value -Eigenschaft und die- Expression Eigenschaft des fest PrecedenceConstraint , und legen Sie die- LogicalAnd Eigenschaft auf true fest.

ExpressionOrConstraint	4	
Gibt an, dass entweder das Einschränkungsergebnis auftreten oder der Ausdruck ausgewertet werden muss, damit der eingeschränkte Container oder Task ausgeführt wird. Legen Sie die Value -Eigenschaft und die- Expression Eigenschaft des fest PrecedenceConstraint , und legen Sie die- LogicalAnd Eigenschaft auf false fest.
*/
      , Expression   = cfnodes.x.value (
                                           'declare namespace p1="www.microsoft.com/SqlServer/Dts";./@p1:Expression[1]'
                                         , 'nvarchar(max)'
                                       )
    --,dft.x.value('@refId[1]','varchar(max)')
    From
        ssis_t.pkgStats                                                                                                                             As pkg
        Cross Apply pkg.PackageXML.nodes ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";//DTS:Executable/DTS:PrecedenceConstraints/*' ) As cfnodes(x)
    )
,
CTE_DFTPrec
As
    (
    Select
        pkg.RowID
      , pkg.PackagePath
      , TaskFrom = cfnodes.x.value ( './@startId[1]', 'nvarchar(max)' )
      , TaskTo   = cfnodes.x.value ( './@endId[1]', 'nvarchar(max)' )
      , name   = cfnodes.x.value ( './@name[1]', 'nvarchar(max)' )
    --,dft.x.value('@refId[1]','varchar(max)')
    From
        ssis_t.pkgStats                                                                                                                                 As pkg
        Cross Apply pkg.PackageXML.nodes ( 'declare namespace DTS="www.microsoft.com/SqlServer/Dts";//DTS:Executable/DTS:ObjectData/pipeline/paths/*' ) As cfnodes(x)
    )


Select
    t.RowID
  , t.PackagePath
  , t.TaskFrom
  , t.TaskTo
  , t.LogicalAnd
  , t.ObjectName
  , t.CreationName
  , t.DTSID
  , t.EvalOp
  , t.Expression
  , t.FlowType
From
(
    Select
        CTE_CFPrec.RowID
      , CTE_CFPrec.PackagePath
      , CTE_CFPrec.TaskFrom
      , CTE_CFPrec.TaskTo
      , CTE_CFPrec.LogicalAnd
      , CTE_CFPrec.ObjectName
      , CTE_CFPrec.CreationName
      , CTE_CFPrec.DTSID
      , CTE_CFPrec.EvalOp
      , CTE_CFPrec.Expression
      , FlowType = 'Control Flow'
    From
        CTE_CFPrec
    Union All
    Select
        CTE_DFTPrec.RowID
      , CTE_DFTPrec.PackagePath
      , TaskFrom   = Substring ( CTE_DFTPrec.TaskFrom, 1, CharIndex ( '.', CTE_DFTPrec.TaskFrom ) - 1 )
      , TaskTo = Substring ( CTE_DFTPrec.TaskTo, 1, CharIndex ( '.', CTE_DFTPrec.TaskTo ) - 1 )
      , LogicalAnd = Null
      , ObjectName = CTE_DFTPrec.name
      , Null
      , Null
      , Null
      , Null
      , 'Data Flow'
    From
        CTE_DFTPrec

/*
for CTE_DFTPrec (Datenflusstask, dataflowtask) we have much more information in the package:

* variables
* ObjectData
** pipeline
*** components
**** compontent
***** connections
***** inputs
***** outputs

*/
) As t
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '76f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblPrecedenceConstraint_src', @level2type = N'COLUMN', @level2name = N'FlowType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '75f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblPrecedenceConstraint_src', @level2type = N'COLUMN', @level2name = N'Expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '74f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblPrecedenceConstraint_src', @level2type = N'COLUMN', @level2name = N'EvalOp';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '73f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblPrecedenceConstraint_src', @level2type = N'COLUMN', @level2name = N'DTSID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '72f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblPrecedenceConstraint_src', @level2type = N'COLUMN', @level2name = N'CreationName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '71f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblPrecedenceConstraint_src', @level2type = N'COLUMN', @level2name = N'ObjectName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '70f9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblPrecedenceConstraint_src', @level2type = N'COLUMN', @level2name = N'LogicalAnd';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6ff9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblPrecedenceConstraint_src', @level2type = N'COLUMN', @level2name = N'TaskTo';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6ef9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblPrecedenceConstraint_src', @level2type = N'COLUMN', @level2name = N'TaskFrom';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6df9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblPrecedenceConstraint_src', @level2type = N'COLUMN', @level2name = N'PackagePath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6cf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblPrecedenceConstraint_src', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8364fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblPrecedenceConstraint_src';

