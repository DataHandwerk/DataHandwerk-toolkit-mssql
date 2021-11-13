
CREATE PROCEDURE [ssis_t].[usp_PackageAnalysis] @Path Varchar(8000)
As
Truncate Table ssis_t.PackageAnalysis;

Insert Into ssis_t.PackageAnalysis
(
    RowID
  , PackagePath
  , PackageName
  , Category
  , PackageCreatorName
  , ObjectName
  , ObjectType
  , DelayValidationPropertyValue
  , ObjectValue
  , ExpressionValue
  , ConnectionManagerID
  , RetainSameConnectionProperty
)
Select
    pkg.RowID
  , pkg.PackagePath
  , pkg.PackageName
  , pkg.Category
  , pkg.PackageCreatorName
  , pkg.ConnectionManagerName
  , pkg.ConnectionManagerType
  , pkg.DelayValidationPropertyValue
  , pkg.ConnectionString
  , pkg.ExpressionValue
  , pkg.ConnectionManagerID
  , pkg.RetainSameConnectionProperty
From
    ssis_t.TblConnection As pkg;

Insert Into ssis_t.PackageAnalysis
(
    RowID
  , PackagePath
  , PackageName
  , Category
  , PackageCreatorName
  , ObjectName
  , ObjectType
  , DelayValidationPropertyValue
  , ObjectValue
  , ExpressionValue
)
Select
    Distinct
    Tblvar.RowID
  , Tblvar.PackagePath
  , Tblvar.PackageName
  , Tblvar.Category
  , Tblvar.PackageCreatorName
  , Tblvar.VariableName
  , Tblvar.VariableDataType
  , DelayValidationPropertyValue = 'NA'
  , Tblvar.VariableValue
  , Tblvar.ExpressionValue
From
    ssis_t.TblVariable As Tblvar;

Insert Into ssis_t.PackageAnalysis
(
    RowID
  , PackagePath
  , PackageName
  , Category
  , PackageCreatorName
  , ObjectName
  , ObjectType
  , DelayValidationPropertyValue
  , ObjectValue
  , ExpressionValue
)
Select
    Distinct
    Tblvar.RowID
  , Tblvar.PackagePath
  , Tblvar.PackageName
  , Tblvar.Category
  , Tblvar.PackageCreatorName
  , Tblvar.ParameterName
  , Tblvar.ParameterDataType
  , DelayValidationPropertyValue = 'NA'
  , Tblvar.ParameterValue
  , Tblvar.ExpressionValue
From
    ssis_t.TblParameter As Tblvar;

/*
    Update
        execpkg
    Set
        execpkg.ExecutePackageConnection = pkg.ObjectValue
    From
        ssis_t.TblTask_ExecutePackage As execpkg
        Inner Join
            ssis_t.PackageAnalysis    As pkg
                On
                execpkg.RowID               = pkg.RowID
                And pkg.Category            = 'Connection'
                And pkg.ConnectionManagerID = execpkg.ExecutePackageConnection;

*/
Insert Into ssis_t.PackageAnalysis
(
    RowID
  , PackagePath
  , PackageName
  , Category
  , PackageCreatorName
  , TaskPath
  , ObjectName
  , ObjectType
  , ObjectTypeDescription
  , DelayValidationPropertyValue
  , ObjectValue
  , ExpressionValue
  , ConnectionManager
  , SourceColumn
  , DestinationColumn
  , DerivedValue
  , Variable
  , LookupJoins
  , ParameterBindingParameterName
  , SortKeyPosition
  , IsSortedProperty
  , MultihashcolumnSortPosition
)
Select
    Distinct
    DFTlvl.RowID
  , PKG.PackagePath
  , PackageName                  = Replace ( PKG.PackagePath, Replace ( @Path, '*.dtsx', '' ), '' )
  , Category                     = Cast('Data Flow Task' As Varchar(Max))
  , PKG.PackageCreatorName
  , TaskPath                     = DFTlvl.DFTTasksPath
  , TaskName                     = DFTlvl.DFTTaskName
  , TaskType                     = Case
                                       When Cast(CharIndex ( ';', Left(DFTlvl.DFTTaskType1, 8000)) As Varchar(1000))
                                            Between 4 And 100
                                           Then
                                           Left(Cast(DFTlvl.DFTTaskType1 As Varchar(8000)), CharIndex (
                                                                                                          ';'
                                                                                                        , Left(DFTlvl.DFTTaskType1, 8000)
                                                                                                      ) - 1)
                                       Else
                                           DFTlvl.DFTTaskType1
                                   End
  , ObjectTypeDescription        = Cast('' As Varchar(Max))
  , DelayValidationPropertyValue = 'NA'
  , ConnectionString             = Case
                                       When IsNull ( DFTlvl.DFTSQLCommand, '' ) <> ''
                                           Then
                                           IsNull ( DFTlvl.DFTSQLCommand, '' )
                                       Else
                                           IsNull ( DFTlvl.DFTRowSet, '' )
                                   End
  , ExpressionValue              = Cast('' As Varchar(Max))
  , ConnectionManager            = DFTlvl.DFTConnectionManager
  , IsNull ( Der.SourceColumn, SrcDest.SourceColumn )
  , IsNull ( Der.DestinationColumn, SrcDest.DestinationColumn )
  , Der.DerivedValue
  , DFTlvl.Variable
  , Lkup.LookupJoins
  , DFTlvl.ParameterBindingParameterName
  , SrcDest.SortKeyPosition
  , DFTlvl.IsSortedProperty
  , DFTlvl.MultihashcolumnSortPosition
From
    ssis_t.TblTask_Dft_Details     As DFTlvl
    Inner Join
        ssis_t.pkgStats            As PKG
            On
            DFTlvl.RowID                    = PKG.RowID

    Left Join
        ssis_t.TblTask_Dft_SrcDest As SrcDest
            On
            DFTlvl.RowID                    = SrcDest.RowID
            And DFTlvl.DataFlowDetailsRowID = SrcDest.DataFlowDetailsRowID

    Left Join
        ssis_t.TblTask_Dft_Derived As Der
            On
            DFTlvl.RowID                    = Der.RowID
            And DFTlvl.DataFlowDetailsRowID = Der.DataFlowDetailsRowID

    Left Join
        ssis_t.TblTask_Lookup      As Lkup
            On
            DFTlvl.RowID                    = Lkup.RowID
            And DFTlvl.DataFlowDetailsRowID = Lkup.DataFlowDetailsRowID;

Insert Into ssis_t.PackageAnalysis
(
    RowID
  , PackagePath
  , PackageName
  , Category
  , PackageCreatorName
  , TaskPath
  , ObjectName
  , ObjectType
  , ObjectTypeDescription
  , DelayValidationPropertyValue
  , ObjectValue
  , ResultSetParameterName
  , ParameterBindingSequence
  , ParameterBindingParameterName
  , ExecutePackageExpression
  , ExecutedPackageName
  , ExecutePackageConnection
  , Script
  , ConnectionManagerID
  , IsDisabled
  , ExpressionValue
)
Select
    cflvl.RowID
  , PKG.PackagePath
  , PackageName                  = Replace ( PKG.PackagePath, Replace ( @Path, '*.dtsx', '' ), '' )
  , Category                     = Cast('Control Flow Task' As Varchar(Max))
  , PKG.PackageCreatorName
  , cflvl.TaskPath
  , TaskName                     = Cast(cflvl.TaskName As Varchar(Max))
  , TaskType                     = Cast(cflvl.TaskType As Varchar(Max))
  , ObjectTypeDescription        = Cast(cflvl.TaskDescription As Varchar(Max))
  , DelayValidationPropertyValue = IsNull ( NullIf(cflvl.DelayValidationPropertyValue, ''), 'False' )
  , ConnectionString             =
    (
        Select
            Top 1
            ConnectionString = cfnodes.x.value (
                                                   'declare namespace SQLTask="www.microsoft.com/sqlserver/dts/tasks/sqltask";@SQLTask:SqlStatementSource[1]'
                                                 , 'nvarchar(max)'
                                               )
        From
            cflvl.SqlTaskQry.nodes ( './*' ) As cfnodes(x)
    )
  , SQLTask.ResultSetParameterName
  , SQLTask.ParameterBindingSequence
  , SQLTask.ParameterBindingParameterName
  , ExecPkgTask.ExecutePackageExpression
  , ExecPkgTask.ExecutedPackageName
  , ExecPkgTask.ExecutePackageConnection
  , ScriptTsk.Script
  , ConnectionString             =
    (
        Select
            Top 1
            ConnectionString = cfnodes.x.value (
                                                   'declare namespace SQLTask="www.microsoft.com/sqlserver/dts/tasks/sqltask";@SQLTask:Connection[1]'
                                                 , 'nvarchar(max)'
                                               )
        From
            cflvl.SqlTaskQry.nodes ( './*' ) As cfnodes(x)
    )
  , IsNull ( cflvl.IsDisabled, 'False' )
  , cflvl.ExpressionValue
From
    ssis_t.TblControlFlow             As cflvl
    Inner Join
        ssis_t.pkgStats               As PKG
            On
            cflvl.RowID                       = PKG.RowID

    Left Join
        ssis_t.TblTask_Sql_Parameter  As SQLTask
            On
            cflvl.RowID                       = SQLTask.RowID
            And cflvl.ControlFlowDetailsRowID = SQLTask.ControlFlowDetailsRowID

    Left Join
        ssis_t.TblTask_ExecutePackage As ExecPkgTask
            On
            cflvl.RowID                       = ExecPkgTask.RowID
            And cflvl.ControlFlowDetailsRowID = ExecPkgTask.ControlFlowDetailsRowID

    Left Join
        ssis_t.TblTask_Script         As ScriptTsk
            On
            cflvl.RowID                       = ScriptTsk.RowID
            And cflvl.ControlFlowDetailsRowID = ScriptTsk.ControlFlowDetailsRowID;

Print '-------------Update sequence of task----------';

Update
    PA
Set
    PA.SequenceNo = TblPrecCon.sequenceno
From
    ssis_t.PackageAnalysis     As PA
    Inner Join
        ssis_t.tempprecedence6 As TblPrecCon
            On
            PA.RowID        = TblPrecCon.ROWID
            And PA.TaskPath = TblPrecCon.task;

--LEFT JOIN @TblPrecedenceConstraint1 TblPrec
--ON Final.RowID = TblPrec.RowID
--AND Final.PackagePath = TblPrec.PackagePath
--AND Final.TaskPath = TblPrec.TaskName
--ORDER BY TblPrec.RowID,TblPrec.PrecOrder
Print '--------------------update objecttype-------------------';

Update
    ssis_t.PackageAnalysis
Set
    ObjectType = 'Sequence Container'
Where
    ObjectType Like '%STOCK:SEQUENCE%'
    Or ObjectType Like '%(Sequence Container)%'
    Or ObjectType Like '%(Container)%';

Update
    ssis_t.PackageAnalysis
Set
    ObjectType = 'Data Flow Task'
Where
    ObjectType Like 'SSIS.Pipeline.3'
    Or ObjectType Like '%(Data Flow Task)%';

Update
    ssis_t.PackageAnalysis
Set
    ObjectType = 'For Loop Container'
Where
    ObjectType Like '%(For Loop Container)%'
    Or ObjectType Like 'STOCK:FORLOOP';

Update
    ssis_t.PackageAnalysis
Set
    ObjectType = 'Script Task'
Where
    ObjectType Like '%(Script Task)%';

Update
    ssis_t.PackageAnalysis
Set
    ObjectType = 'Execute SQL Task'
Where
    ObjectType Like '%(Execute SQL Task)%'
    Or ObjectType Like '%ExecuteSQLTask%';

Update
    ssis_t.PackageAnalysis
Set
    ObjectType = 'Execute Package Task'
Where
    ObjectType Like '%(Execute Package Task)%'
    Or ObjectType Like '%ExecutePackageTask%';

Update
    ssis_t.PackageAnalysis
Set
    ObjectType = 'Foreach Loop Container'
Where
    ObjectType Like '%(Foreach Loop Container)%'
    Or ObjectType Like 'STOCK:FOREACHLOOP';

Update
    ssis_t.PackageAnalysis
Set
    ObjectType = 'File System Task'
Where
    ObjectType Like '%FileSystemTask%';

Update
    ssis_t.PackageAnalysis
Set
    ObjectType = 'Script Task'
Where
    ObjectType Like '%ScriptTask%';

Update
    ssis_t.PackageAnalysis
Set
    ObjectType = 'Send Mail Task'
Where
    ObjectType Like '%SendMailTask%';

Update
    ssis_t.PackageAnalysis
Set
    ObjectType = 'ADO.NET:System.Data.SqlClient.SqlConnection'
Where
    ObjectType = 'ADO.NET:System.Data.SqlClient.SqlConnection, System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089';

Update
    ssis_t.PackageAnalysis
Set
    ObjectType = 'ADO.NET:System.Data.Odbc.OdbcConnection'
Where
    ObjectType = 'ADO.NET:System.Data.Odbc.OdbcConnection, System.Data, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089';

Update
    ssis_t.PackageAnalysis
Set
    ObjectType = 'Script Component'
Where
    ObjectType Like 'Hosts user-defined data transformations, source and destination adapters'
    Or ObjectType = 'Executes a custom script.';

Update
    ssis_t.PackageAnalysis
Set
    ObjectType = 'INT16'
Where
    ObjectType = '2' --OR objecttype = '0'
;

Update
    ssis_t.PackageAnalysis
Set
    ObjectType = 'INT32'
Where
    ObjectType = '3';

Update
    ssis_t.PackageAnalysis
Set
    ObjectType = 'BYTE'
Where
    ObjectType = '17';

Update
    ssis_t.PackageAnalysis
Set
    ObjectType = 'BOOLEAN'
Where
    ObjectType = '11';

Update
    ssis_t.PackageAnalysis
Set
    ObjectType = 'OBJECT'
Where
    ObjectType = '13';

Update
    ssis_t.PackageAnalysis
Set
    ObjectType = 'STRING'
Where
    ObjectType = '8';

Update
    ssis_t.PackageAnalysis
Set
    ObjectType = 'DOUBLE'
Where
    ObjectType = '5';

Update
    ssis_t.PackageAnalysis
Set
    ObjectType = 'DATETIME'
Where
    ObjectType = '7';

Update
    ssis_t.PackageAnalysis
Set
    ObjectType = 'INT64'
Where
    ObjectType = '20';

Update
    ssis_t.PackageAnalysis
Set
    ObjectType = 'ADO NET Source'
Where
    ObjectType = 'Extracts data from a relational database by using a .NET provider.';

Update
    ssis_t.PackageAnalysis
Set
    ObjectValue = Variable
Where
    ObjectType = 'Row count';

Update
    ssis_t.PackageAnalysis
Set
    ConnectionManager = ssis_t.Connection.ConnectionManager
From
    ssis_t.PackageAnalysis
    Inner Join
        ssis_t.Connection
            On
            ssis_t.PackageAnalysis.ConnectionManagerID = ssis_t.Connection.ConnectionManagerID;

Update
    ssis_t.PackageAnalysis
Set
    IsDisabled = IsNull ( IsDisabled, 'False' );

Delete From
ssis_t.PackageAnalysis
Where
    SourceColumn Like '%OLE DB Source Error Output%'
    And
    (
        ObjectType Like '%Source%'
        Or ObjectType Like '%Destination%'
    );

Delete From
ssis_t.PackageAnalysis
Where
    SourceColumn Like '%Derived Column Error Output%';

Declare @tblparameters Table
(
    rowid                              Int
  , ParameterBindingParameterName      Varchar(1000)
  , taskpath                           Varchar(2000)
  , SplitParameterBindingParameterName Varchar(1000)
  , NewParameterBindingParameterName   Varchar(1000)
);

Insert Into @tblparameters
(
    rowid
  , ParameterBindingParameterName
  , taskpath
  , SplitParameterBindingParameterName
)
Select
    Distinct
    F1.rowid
  , F1.ParameterBindingParameterName
  , F1.taskpath
  , O.ParameterBindingParameterNameSplit
From
(
    Select
        RowID
      , ParameterBindingParameterName
      , TaskPath
      , ParameterBindingParameterNameSep = Cast('<X>' + Replace ( ParameterBindingParameterName, ';', '</X><X>' )
                                                + '</X>' As Xml)
    From
        ssis_t.PackageAnalysis
    Where
        Category = 'Data Flow Task'
        And ParameterBindingParameterName Is Not Null
) As F1
    Cross Apply
(
    Select
        ParameterBindingParameterNameSplit = fdata.D.value ( '.', 'varchar(1000)' )
    From
        f1.ParameterBindingParameterNameSep.nodes ( 'X' ) As fdata(D)
) As O
Where
    O.ParameterBindingParameterNameSplit <> '';

Update
    P
Set
    P.NewParameterBindingParameterName = Replace (
                                                     P.SplitParameterBindingParameterName
                                                   , v.VariableHexValue
                                                   , 'VariableName = ' + v.VariableName
                                                 ) + ',Value = ' + v.VariableValue
From
    @tblparameters         As P
    Inner Join
        ssis_t.TblVariable As v
            On
            P.rowid                                                                    = v.RowID
            And CharIndex ( v.VariableHexValue, P.SplitParameterBindingParameterName ) > 0;

Update
    p
Set
    p.ParameterBindingParameterName = t.NewParameterBindingParameterName
From
    ssis_t.PackageAnalysis As p
    Inner Join
    (
        Select
            t.rowid
          , t.taskpath
          , t.ParameterBindingParameterName
          , NewParameterBindingParameterName = Stuff (
                                                         (
                                                             Select
                                                                 ';' + NewParameterBindingParameterName
                                                             From
                                                                 @tblparameters
                                                             Where
                                                                 rowid        = t.rowid
                                                                 And taskpath = t.taskpath
                                                             For Xml Path ( '' ), Type, Root
                                                         ).value ( 'root[1]', 'nvarchar(max)' )
                                                       , 1
                                                       , 1
                                                       , ''
                                                     )
        From
            @tblparameters As t
    )                      As t
        On
        p.RowID                             = t.rowid
        And p.TaskPath                      = t.taskpath
        And p.ParameterBindingParameterName = t.ParameterBindingParameterName

--Create NonClustered Index NCIX
--On ssis.PackageAnalysis (
--                            RowID
--                          , SequenceNo
--                        );
Update
    pkg
Set
    pkg.PackageSequenceNo = NewTableRowID
From
    ssis_t.PackageAnalysis As pkg
    Join
    (
        Select
            NewTableRowID = Row_Number () Over ( Partition By RowID Order By IsNull ( SequenceNo, -1 ))
          , SequenceNo
          , RowID
          , TableRowID
        From
            ssis_t.PackageAnalysis
    )                      As newpkg
        On
        pkg.RowID          = newpkg.RowID
        And pkg.TableRowID = newpkg.TableRowID

-- possible values 0 - 5
-- https://docs.microsoft.com/en-us/dotnet/api/microsoft.sqlserver.dts.runtime.dtsprotectionlevel?view=sqlserver-2019

/*
DontSaveSensitive	0	
Sensitive information is not saved in the package. The sensitive information is removed and replaced with blanks.

EncryptAllWithPassword	3	
Encrypts the entire package by using a password.

EncryptAllWithUserKey	4	
Encrypts the entire package by using keys based on the user profile. Only the same user using the same profile can load the package.

EncryptSensitiveWithPassword	2	
Encrypts only sensitive information contained in the package by using a password. DPAPI is used for this encryption.

EncryptSensitiveWithUserKey	1	
Encrypts sensitive properties only by using keys based on the current user. Only the same user using the same profile can load the package. If a different user opens the package, the sensitive information is replaced with blanks. DPAPI is used for this encryption.

ServerStorage	5	
Encrypts the package within a SQL Server msdb database. This option is supported only when a package is saved to SQL Server. It is not supported when a package is saved to the File System. The access control of who can decrypt the package is controlled by SQL Server database roles. For more information, see Database-Level Roles and sysssispackages (Transact-SQL).
*/
Update
    pkg
Set
    pkg.PackageProtectionLevel = Case
                                     When stats.PackageProtectionLevel Is Null
                                         Then
                                         'EncryptSensitiveWithUserKey'
                                     When stats.PackageProtectionLevel = '0'
                                         Then
                                         'DontSaveSensitive'
                                     When stats.PackageProtectionLevel = '2'
                                         Then
                                         'EncryptSensitiveWithPassword'
                                     Else
                                         stats.PackageProtectionLevel
                                 End
From
    ssis_t.PackageAnalysis As pkg
    Join
        ssis_t.pkgStats    As Stats
            On
            pkg.RowID = Stats.RowID

--Select
--    RowID
--  , PackageSequenceNo
--  , SequenceNo
--  , PackagePath                   = '"' + PackagePath + '"'
--  , PackageName                   = '"' + PackageName + '"'
--  , IsDisabled                    = '"' + IsNull ( IsDisabled, '' ) + '"'
--  , Category                      = '"' + IsNull ( Category, '' ) + '"'
--  , PackageCreatorName            = '"' + IsNull ( PackageCreatorName, '' ) + '"'
--  , PackageProtectionLevel        = '"' + IsNull ( PackageProtectionLevel, '' ) + '"'
--  , TaskPath                      = '"' + IsNull ( TaskPath, '' ) + '"'
--  , ObjectName                    = '"' + IsNull ( ObjectName, '' ) + '"'
--  , ObjectType                    = '"' + IsNull ( ObjectType, '' ) + '"'
--  , ObjectTypeDescription         = '"' + IsNull ( ObjectTypeDescription, '' ) + '"'
--  , DelayValidationPropertyValue  = '"' + IsNull ( DelayValidationPropertyValue, '' ) + '"'
--  , ObjectValue                   = '"' + IsNull ( ObjectValue, '' ) + '"'
--  , RetainSameConnectionProperty  = '"' + IsNull ( RetainSameConnectionProperty, '' ) + '"'
--  , IsSortedProperty              = '"' + IsNull ( IsSortedProperty, '' ) + '"'
--  , ExpressionValue               = '"' + IsNull ( ExpressionValue, '' ) + '"'
--  , ConnectionManager             = '"' + IsNull ( ConnectionManager, '' ) + '"'
--  , SourceColumn                  = '"' + IsNull ( SourceColumn, '' ) + '"'
--  , DestinationColumn             = '"' + IsNull ( DestinationColumn, '' ) + '"'
--  , SortKeyPosition               = '"' + IsNull ( SortKeyPosition, '' ) + '"'
--  , MultihashcolumnSortPosition   = '"' + IsNull ( MultihashcolumnSortPosition, '' ) + '"'
--  , DerivedValue                  = '"' + IsNull ( DerivedValue, '' ) + '"'
--  , ResultSetParameterName        = '"' + IsNull ( ResultSetParameterName, '' ) + '"'
--  , ParameterBindingSequence      = '"' + IsNull ( ParameterBindingSequence, '' ) + '"'
--  , ParameterBindingParameterName = '"' + IsNull ( ParameterBindingParameterName, '' ) + '"'
--  , ExecutePackageExpression      = '"' + IsNull ( ExecutePackageExpression, '' ) + '"'
--  , ExecutedPackageName           = '"' + IsNull ( ExecutedPackageName, '' ) + '"'
--  , ExecutePackageConnection      = '"' + IsNull ( ExecutePackageConnection, '' ) + '"'
--  , Script                        = '"' + IsNull ( Script, '' ) + '"'
--  , Variable                      = '"' + IsNull ( Variable, '' ) + '"'
--  , LookupJoins                   = '"' + IsNull ( LookupJoins, '' ) + '"'
--From
--    ssis.PackageAnalysis
--Order By
--    3
--  , 1;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '464ab625-2d3b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'PROCEDURE', @level1name = N'usp_PackageAnalysis';

