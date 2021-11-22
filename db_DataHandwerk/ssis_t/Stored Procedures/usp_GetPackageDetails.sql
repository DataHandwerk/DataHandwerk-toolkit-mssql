/*
logic and implementation is based on this blog article https://www.sqlservercentral.com/articles/ssis-package-documentor[SSIS Package documentor] +
from 2016-11-04 (first published: 2015-09-01) +
author: https://www.sqlservercentral.com/author/Divya-Agrawal

the article explains how does it work and provides a link for a procedure script: 
https://www.sqlservercentral.com/wp-content/uploads/2019/05/CodeReviewAcceleratior_v10.sql


* empty columns in ssis.TblControlFlowDetails
** [ ] TaskTypeDescription
** [ ] DelayValidationPropertyValue
** [x] DFTQuery
+
[NOTE]
--
the issue is related to the original detection, using only 
....
./DTS:Executable[@DTS:ExecutableType=''SSIS.Pipeline.3'']
....
but documentation https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/bdf1b5fe-d2e2-4fb9-892c-02c50b865e40[2.6.1 ExecutableType Instance for Pipeline Task]

lists 4 ExecutionType:

* SSIS.Pipeline
* SSIS.Pipeline.3 (for DTSX2 2012/01)
* STOCK:SSIS.Pipeline
* Microsoft.Pipeline (for DTSX2 2014/01)
--
+
** [ ] SqlTaskQry
** [x] ExecPkgTaskQry
** [ ] ScriptTaskQry
** [ ] ExpressionValue

not all tasks are implemented

* https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/f8badd15-7e54-4cc5-a8e2-a15c15dce8fe[2.6.3 Executable Task Types]
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/43d08ee2-cffe-41e9-a140-181f65814ed0[2.6.3.1 ExecutableType Instance for CDC Control Task]
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/14ea1253-ecfd-408d-9a2e-490cc2fed784[2.6.3.2 ExecutableType Instance for ActiveX Script Task] 
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/1294dbe4-41e9-4c0f-b1d9-a4c34da7dde0[2.6.3.3 ExecutableType Instance for AS Execute DDL Task] 
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/8c3e3f5e-2795-41ba-9258-ffe9a48eb6a8[2.6.3.4 ExecutableType Instance for AS Processing Task]
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/9dbf8b6c-714c-4c4d-830f-bcb8fbb7f8b5[2.6.3.5 ExecutableType Instance for Bulk Insert Task]
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/da10af7f-8ac1-47e0-be52-ec05bddc1ae1[2.6.3.6 ExecutableType Instance for Data Mining Query Task]
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/8f607e36-98fa-40f7-a0ca-92dcd015287e[2.6.3.7 ExecutableType Instance for Data Profiling Task]
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/9696d1ec-baa7-48d7-a52d-3c87beac5e83[2.6.3.8 ExecutableType Instance for Execute DTS 2000 Package Task]
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/f71e8e17-aa69-4ce8-8fc6-d2e0fef99059[2.6.3.9 ExecutableType Instance for Execute Package Task]
** [x] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/221cbe95-b7b4-4adb-b5e9-8e632f9f2168[2.6.3.10 ExecutableType Instance for Execute Process Task]
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/80af8760-5b6d-4dfd-8a63-cf14bb090fbd[2.6.3.11 ExecutableType Instance for Execute SQL Task]
*** todo test with examples
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/09edb4c6-ffeb-41f6-9d56-eeafecc14e77[2.6.3.12 ExecutableType Instance for Expression Task]
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/05cc0ef5-663b-4980-8710-7fa3712392af[2.6.3.13 ExecutableType Instance for File System Task]
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/216f743a-f4ef-46bc-995e-9b02b74a35ac[2.6.3.14 ExecutableType Instance for FTP Task]
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/3f7c7677-917e-43a3-b9db-f6963513791e[2.6.3.15 ExecutableType Instance for Message Queue Task]
** [x] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/93ef6e19-9c22-4dd1-b6b1-ae7d9c43a490[2.6.3.16 ExecutableType Instance for Script Task]
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/98a05bb3-e159-44d0-b6b4-edbe921bb542[2.6.3.17 ExecutableType Instance for Send Mail Task]
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/76e8dc38-1511-499f-a52e-c80c412049ed[2.6.3.18 ExecutableType Instance for Transfer Database Task]
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/8a0fcdf9-ee5c-4859-93dc-e669c559b4b5[2.6.3.19 ExecutableType Instance for Transfer Error Messages Task]
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/2e4e51cc-ffab-4482-b720-0d6dc07c8313[2.6.3.20 ExecutableType Instance for Transfer Jobs Task]
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/3731eaf1-006c-4d54-ad65-b45751f0400c[2.6.3.21 ExecutableType Instance for Transfer Logins Task]
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/851d2a4b-139b-489d-98c2-00b1815d95e4[2.6.3.22 ExecutableType Instance for Transfer SQL Server Objects Task]
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/36b45bc0-a377-499f-882a-58b12a0c211d[2.6.3.23 ExecutableType Instance for Transfer Stored Procedures Task]
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/fa55878d-8c52-4faf-86a4-2f0b74d8e3fb[2.6.3.24 ExecutableType Instance for Web Service Task]
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/2f9f3fb7-e594-4792-a09a-374548b71772[2.6.3.25 ExecutableType Instance for WMI Data Reader Task]
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/b1a77cfa-20ad-4b82-8969-d15d7f58bbd6[2.6.3.26 ExecutableType Instance for WMI Event Watcher Task]
** [ ] https://docs.microsoft.com/en-us/openspecs/sql_data_portability/ms-dtsx2/2c88dd23-f29b-48d2-ad9d-f58c1e83a9d9[2.6.3.27 ExecutableType Instance for XML Task]


Exec ssis_t.usp_GetPackageDetails 'C:\Packages1'

Exec sys.sp_configure 'show advanced options', 1

Reconfigure With Override
Go

Exec sys.sp_configure 'xp_cmdshell', 1

Reconfigure With Override

*/
CREATE Procedure [ssis_t].[usp_GetPackageDetails] @ProjectPath Varchar(8000) = 'C:\Packages1'
As
Begin
    Set NoCount On;

    --------------------truncate tables------------------------------------
    Truncate Table ssis_t.pkgStats;

    Truncate Table ssis_t.Connection;

    Truncate Table ssis_t.TblPrecedenceConstraint;

    Truncate Table ssis_t.TblConnection;

    Truncate Table ssis_t.TblControlFlow;

    Truncate Table ssis_t.TblTask_Dft_Component;

    Truncate Table ssis_t.TblTask_Dft_Details;

    Truncate Table ssis_t.TblTask_Dft_SrcDest;

    Truncate Table ssis_t.TblTask_Dft_Derived;

    Truncate Table ssis_t.TblTask_ExecutePackage;

    Truncate Table ssis_t.TblTask_Lookup;

    Truncate Table ssis_t.TblTask_Script;

    Truncate Table ssis_t.TblTask_Sql;

    Truncate Table ssis_t.TblTask_Sql_Parameter;

    Truncate Table ssis_t.TblVariable;

    Truncate Table ssis_t.TblParameter;

    Truncate Table ssis_t.tempprecedence1;

    Truncate Table ssis_t.tempprecedence2;

    Truncate Table ssis_t.tempprecedence3;

    Truncate Table ssis_t.tempprecedence4;

    Truncate Table ssis_t.tempprecedence5;

    Truncate Table ssis_t.tempprecedence5_Hierarchy;

    Truncate Table ssis_t.tempprecedence6;

    -------------------truncate tables------------------------------------

    -------------------Iterate over all dtsx files from folder------------------------------
    Declare @Path Varchar(8000) = @ProjectPath + '\*.dtsx';

    Declare @MyFiles Table
    (
        MyID     Int Identity(1, 1) Primary Key
      , FullPath Varchar(8000)
    );

    Declare @CommandLine Varchar(8000);

    Select
        @CommandLine = Left('dir "' + @Path + '" /A-D /B /S', 8000);

    Insert Into @MyFiles
    (
        FullPath
    )
    Execute sys.xp_cmdshell @CommandLine;

    Delete From
    @MyFiles
    Where
        FullPath Is Null
        Or FullPath = 'File Not Found'
        Or FullPath = 'Datei nicht gefunden'
        Or FullPath = 'The system cannot find the path specified.'
        Or FullPath = 'The system cannot find the file specified.'
        Or FullPath = 'Das System kann die angegebene Datei nicht finden.'

    --select * from @MyFiles
    Declare @FullPath Varchar(2000);
    Declare
        @counter       Int = 0
      , @totalpkgcount Int;

    Select
        @totalpkgcount = Count ( * )
    From
        @MyFiles;

    While @counter <= @totalpkgcount
    Begin
        Select
            @FullPath = FullPath
        From
            @MyFiles
        Where
            MyID = @counter;

        Declare @sql NVarchar(Max);

        Set @sql
            = N'
Insert Into ssis_t.pkgStats
(
    ProjectPath
  , PackagePath
  , PackageXML
)
Select
    ProjectPath = ''@ProjectPath''
  , PackagePath = ''@FullPath''
  , PackageXML  = Cast(BulkColumn As Xml)
From
    OpenRowset ( Bulk ''@FullPath'', Single_Blob )
    As pkgColumn
'

        Select
            @sql = Replace ( Replace ( @sql, '@FullPath', @FullPath ), '@ProjectPath', @ProjectPath )

        Exec sys.sp_executesql @sql;

        Set @counter = @counter + 1;
    End

    -------------------Iterate over all dtsx files from folder------------------------------		
    Update
        P
    Set
        P.PackageCreationDate = C.PackageCreationDate
      , P.PackageCreatorComputerName = C.PackageCreatorComputerName
      , P.PackageCreatorName = C.PackageCreatorName
      , P.PackageDescription = C.PackageDescription
      , P.PackageDTSID = C.PackageDTSID
      , P.PackageLastModifiedProductVersion = C.PackageLastModifiedProductVersion
      , P.PackageLocaleID = C.PackageLocaleID
      , P.PackageObjectName = C.PackageObjectName
      , P.PackageProtectionLevel = C.PackageProtectionLevel
      , P.PackageVersionGUID = C.PackageVersionGUID
    From
        ssis_t.pkgStats           As P
        Inner Join
            ssis_t.PackageDetails As C
                On
                P.RowID = C.RowID;

    ------------add package creator name---------------------------
    Print '---------------Get all connections-----------------------------------';

    Insert Into ssis_t.TblConnection
    (
        RowID
      , PackagePath
      , PackageName
      , Category
      , PackageCreatorName
      , ConnectionManagerName
      , ConnectionManagerType
      , DelayValidationPropertyValue
      , ConnectionString
      , ExpressionValue
      , ConnectionManagerID
      , RetainSameConnectionProperty
    )
    Select
        RowID
      , PackagePath
      , PackageName
      , Category
      , PackageCreatorName
      , ConnectionManagerName
      , ConnectionManagerType
      , DelayValidationPropertyValue
      , ConnectionString
      , ExpressionValue
      , ConnectionManagerID
      , RetainSameConnectionProperty
    From
        ssis_t.TblConnection_src

    Print '-------------Insert Connection details in  table----------';

    Insert Into ssis_t.Connection
    (
        ConnectionManager
      , ConnectionManagerID
    )
    Select
        Distinct
        ConnectionManagerName
      , ConnectionManagerID
    From
        ssis_t.TblConnection

    Print '-------------Insert Connection  details in  table----------';
    Print '---------------Get all connections-----------------------------------';
    Print '------------------------Get all variable details-------------------------------------';

    Insert Into ssis_t.TblVariable
    (
        RowID
      , PackagePath
      , PackageName
      , Category
      , PackageCreatorName
      , VariableName
      , VariableDataType
      , VariableValue
      , ExpressionValue
      , VariableHexValue
    )
    Select
        RowID
      , PackagePath
      , PackageName
      , Category
      , PackageCreatorName
      , VariableName
      , VariableDataType
      , VariableValue
      , ExpressionValue
      , VariableHexValue
    From
        ssis_t.TblVariable_src

    Print '------------------------Get all variable details-------------------------------------';
    Print '------------------------Get all parameter details-------------------------------------';

    Insert Into ssis_t.TblParameter
    (
        RowID
      , PackagePath
      , PackageName
      , Category
      , PackageCreatorName
      , ParameterName
      , ParameterDataType
      , ParameterValue
      , ExpressionValue
      , ParameterHexValue
    )
    Select
        RowID
      , PackagePath
      , PackageName
      , Category
      , PackageCreatorName
      , ParameterName
      , ParameterDataType
      , ParameterValue
      , ExpressionValue
      , ParameterHexValue
    From
        ssis_t.TblParameter_src

    Print '------------------------Get all parameter details-------------------------------------';
    Print '----------------Get  precedence constraint details------------------------------';

    Insert Into ssis_t.TblPrecedenceConstraint
    (
        RowID
      , PackagePath
      , TaskFrom
      , TaskTo
      , LogicalAnd
      , ObjectName
      , CreationName
      , DTSID
      , EvalOp
      , Expression
      , FlowType
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
        ssis_t.TblPrecedenceConstraint_src As t

    --Insert Into ssis_t.tempprecedence1
    --(
    --    RowID
    --  , TaskFrom
    --  , isparentlevel
    --  , level
    --)
    --Select
    --    Distinct
    --    T.RowID
    --  , T.TaskFrom
    --  , T.isparentlevel
    --  , level = Row_Number () Over ( Partition By T.RowID Order By T.level )
    --From
    --(
    --    Select
    --        Distinct
    --        t1.RowID
    --      , t1.TaskFrom
    --      , isparentlevel = 1
    --      , level         = Len ( t1.TaskFrom ) - Len ( Replace ( t1.TaskFrom, '\', '' ))
    --    From
    --        ssis_t.TblPrecedenceConstraint     As t1
    --        Left Join
    --            ssis_t.TblPrecedenceConstraint As t2
    --                On
    --                t1.RowID        = t2.RowID
    --                And t1.TaskFrom = t2.TaskTo
    --    Where
    --        t2.TaskTo Is Null
    --) As T

    --  Declare
    --      @cntlevel Int
    --    , @cnt      Int = 1;

    --  Select
    --      @cntlevel = Count ( * )
    --  From
    --      ssis_t.tempprecedence1;

    --  While @cnt <= @cntlevel
    --  Begin
    --      ;
    --      With
    --      cte
    --      As
    --          (
    --          Select
    --              RowID
    --            , TaskFrom
    --            , task    = TaskFrom
    --            , level
    --            , cnt     = 1
    --          From
    --              ssis_t.tempprecedence1
    --          Where
    --              level = @cnt
    --          Union All
    --          Select
    --              c.RowID
    --            , c.TaskFrom
    --            , t.TaskTo
    --            , c.level
    --            , c.cnt + 1
    --          From
    --              ssis_t.TblPrecedenceConstraint As t
    --              Inner Join
    --                  cte                        As c
    --                      On
    --                      t.RowID    = c.RowID
    --                      And c.task = t.TaskFrom
    --          )
    --      Insert Into ssis_t.tempprecedence2
    --      (
    --          ROWID
    --        , TaskFrom
    --        , task
    --        , parentlevel
    --        , LEVEL
    --      )
    --      Select
    --          cte.RowID
    --        , cte.TaskFrom
    --        , cte.task
    --        , @cnt
    --        , cte.cnt
    --      From
    --          cte;

    --      Select
    --          @cnt = @cnt + 1;
    --  End

    --  Insert Into ssis_t.tempprecedence3
    --  (
    --      ROWID
    --    , task
    --    , parentlevel
    --    , LEVEL
    --    , trank
    --  )
    --  Select
    --      ROWID
    --    , task
    --    , parentlevel
    --    , LEVEL
    --    , trank = Row_Number () Over ( Partition By ROWID Order By parentlevel, LEVEL )
    --  From
    --      ssis_t.tempprecedence2;

    --  Insert Into ssis_t.tempprecedence4
    --  (
    --      ROWID
    --    , task
    --    , tlevel
    --    , level
    --    , trank
    --  )
    --  Select
    --      t.ROWID
    --    , task   = IsNull ( t1.task, t.task )
    --    , tlevel = t.LEVEL
    --    , level  = IsNull ( Max ( t1.LEVEL ), Max ( t.LEVEL ))
    --    , trank  = IsNull ( Max ( t1.trank ), Max ( t.trank ))
    --  From
    --      ssis_t.tempprecedence3     As t
    --      Left Join
    --          ssis_t.tempprecedence3 As t1
    --              On
    --              t.ROWID = t1.ROWID
    --              And t1.task Like '%' + t.task + '\%'
    --  Group By
    --      t.ROWID
    --    , t1.task
    --    , t.task
    --    , t.LEVEL
    --  --,t1.LEVEL
    --  Order By
    --      level
    --    , trank;

    --  --select t.rowid,t1.task,t.level tlevel,t1.level, (t1.trank) trank into ssis.tempprecedence4
    --  --from ssis.tempprecedence3 t
    --  --join ssis.tempprecedence3 t1
    --  --on t.rowid = t1.rowid
    --  --and t1.task like '%'+t.task+'%'
    --  -- order by trank
    --  Insert Into ssis_t.tempprecedence5
    --  (
    --      ROWID
    --    , task
    --    , sequenceno
    --    , trank
    --  )
    --  Select
    --      t.ROWID
    --    , t.task
    --    , sequenceno = Replace (
    --                               Replace (
    --                                           Replace ((
    --                                                        Select
    --                                                            t1.tlevel
    --                                                        From
    --                                                            ssis_t.tempprecedence4 As t1
    --                                                        Where
    --                                                            t1.ROWID    = t.ROWID
    --                                                            And t1.task = t.task
    --                                                        For Xml Path ( '' )
    --                                                    )
    --                                                  , '</tlevel><tlevel>'
    --                                                  , '/'
    --                                                   )
    --                                         , '</tlevel>'
    --                                         , '/'
    --                                       )
    --                             , '<tlevel>'
    --                             , ''
    --                           )
    --    , t.trank
    --  From
    --      ssis_t.tempprecedence4 As t
    --  Group By
    --      t.ROWID
    --    , t.task
    --    , t.trank
    --  Order By
    --      t.ROWID
    --    , t.trank;

    --  Insert Into ssis_t.tempprecedence5_Hierarchy
    --  (
    --      ROWID
    --    , task
    --    , sequenceno
    --    , rid
    --  )
    --  Select
    --      ROWID
    --    , task
    --    , sequenceno
    --    , rid = Cast('/1/' + sequenceno + Cast(trank As Varchar) + '/' As HierarchyId)
    --  From
    --      ssis_t.tempprecedence5

    --  Insert Into ssis_t.tempprecedence6
    --  (
    --      ROWID
    --    , task
    --    , sequenceno
    --  )
    --  Select
    --      ROWID
    --    , task
    --    , sequenceno = Row_Number () Over ( Partition By ROWID Order By rid )
    --  From
    --      ssis_t.tempprecedence5_Hierarchy;

    --  /*

    -- select t1.task,t1.parentlevel,t.task as t1,row_number() over(partition by t1.rowid order by t.level) level,t.rowid into ssis.tempprecedence3
    --from ssis.tempprecedence2 t
    --join ssis.tempprecedence2 t1
    --on charindex(t.task, t1.taskFrom)>0  
    --and t1.parentlevel >1 and t.parentlevel =1
    --and t.rowid =t1.rowid
    --  order by t.rowid, t1.parentlevel ,t.level 

    --   select  rowid, task,row_number() over(partition by rowid order by max(sequenceno)) sequenceno into ssis.tempprecedence4
    --from(
    --  select distinct t1.rowid,isnull(t2.task,t1.task) Task,row_number() over(partition by t1.rowid order by t1.parentlevel,t1.level,isnull(t2.level,1)) sequenceno  
    --from ssis.tempprecedence2 t1
    --left join ssis.tempprecedence3 t2
    --on t1.rowid = t2.rowid
    --and t1.task = t2.t1
    -- where t1.parentlevel =1  )t
    -- group by rowid,task 
    --*/
    Print '----------------Get  precedence constraint details------------------------------';
    Print '----------------Get all Control flow tasks details------------------------------';
    Print '----------------Get all  data flow tasks details------------------------------';

    Insert Into ssis_t.TblControlFlow
    (
        RowID
      , TaskPath
      , TaskName
      , TaskDescription
      , TaskType
      , DelayValidationPropertyValue
      , DFTQuery
      , SqlTaskQry
      , ExecPkgTaskQry
      , ScriptTaskQry
      , IsDisabled
      , ExpressionValue
    )
    Select
        RowID
      , TaskPath
      , TaskName
      , TaskTypeDescription         = TaskDescription
      , TaskType
      , DelayValidationPropertyValue
      , DFTQuery
      , SqlTaskQry
      , ExecPkgTaskQry
      , ScriptTaskQry
      , IsDisabled
      , ExpressionValue
    From
        ssis_t.TblControlFlow_src

    Print '---------- Insert Script task details-----------------------';

    Insert Into ssis_t.TblTask_Script
    (
        RowID
      , ControlFlowDetailsRowID
      , Script
    )
    Select
        RowID
      , ControlFlowDetailsRowID
      , Script
    From
        ssis_t.TblTask_Script_src

    Print '---------- Insert Sql task details-----------------------';

    Insert Into ssis_t.TblTask_Sql
    (
        RowID
      , ControlFlowDetailsRowID
      , SqlConnection
      , SqlStatementSource
    )
    Select
        RowID
      , ControlFlowDetailsRowID
      , Connection             = SqlConnection
      , SqlStatementSource
    From
        ssis_t.TblTask_Sql_src

    Print '---------- Insert Execute package task details-----------------------';

    Insert Into ssis_t.TblTask_ExecutePackage
    (
        RowID
      , ControlFlowDetailsRowID
      , ExecutePackageExpression
      , ExecutedPackageName
      , ExecutePackageConnection
    )
    Select
        cf.RowID
      , cf.ControlFlowDetailsRowID
      , ExecutePackageExpression = cfnodes1.x.value (
                                                        'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
                    ./DTS:PropertyExpression[1]'
                                                      , 'varchar(1000)'
                                                    )
      , ExecutedPackageName      = cfnodes1.x.value (
                                                        'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
            (./DTS:ObjectData/ExecutePackageTask/PackageName)[1]'
                                                      , 'varchar(1000)'
                                                    )
      , ExecutePackageConnection = cfnodes1.x.value (
                                                        'declare namespace DTS="www.microsoft.com/SqlServer/Dts";
            (./DTS:ObjectData/ExecutePackageTask/Connection)[1]'
                                                      , 'varchar(1000)'
                                                    )
    From
        ssis_t.TblControlFlow                       As cf
        Cross Apply Cf.ExecPkgTaskQry.nodes ( '.' ) As cfnodes1(x);

    --Update
    --    execpkg
    --Set
    --    execpkg.ExecutePackageConnection = pkg.ObjectValue
    --From
    --    ssis_t.TblTask_ExecutePackage As execpkg
    --    Inner Join
    --        ssis_t.PackageAnalysis    As pkg
    --            On
    --            execpkg.RowID               = pkg.RowID
    --            And pkg.Category            = 'Connection'
    --            And pkg.ConnectionManagerID = execpkg.ExecutePackageConnection;

    /*
maybe we can analyse example packages and then join with

the folowing is wrong, it makes no sense to join via ExecutePackageConnection and to update ExecutePackageConnection
one of them is wrong?

or it this a replacement? Then it would be better not to replace but to use an additional column

Update
    execpkg
Set
    execpkg.ExecutePackageConnection = con.?
From
    ssis_t.TblTask_ExecutePackage As execpkg
    Inner Join
        ssis_t.TblConnection      As con
            On
            con.RowID                   = execpkg.RowID
            And con.ConnectionManagerID = execpkg.ExecutePackageConnection;

*/
    Print '---------- Insert Execute SQL task details-----------------------';

    Insert Into ssis_t.TblTask_Sql_Parameter
    (
        RowID
      , ControlFlowDetailsRowID
      , ParameterBindingSequence
      , ParameterBindingParameterName
    )
    Select
        Distinct
        cf.RowID
      , cf.ControlFlowDetailsRowID
      --,cfnodes1.x.value('declare namespace SQLTask="www.microsoft.com/sqlserver/dts/tasks/sqltask"; (./@SQLTask:DtsVariableName)','varchar(1000)') as ResultSetParameterName
      , ParameterBindingSequence      = cfnodes.x.value (
                                                            'declare namespace SQLTask="www.microsoft.com/sqlserver/dts/tasks/sqltask"; (./@SQLTask:ParameterName)'
                                                          , 'varchar(1000)'
                                                        )
      , ParameterBindingParameterName = cfnodes.x.value (
                                                            'declare namespace SQLTask="www.microsoft.com/sqlserver/dts/tasks/sqltask"; (./@SQLTask:DtsVariableName)'
                                                          , 'varchar(1000)'
                                                        )
    From
        ssis_t.TblControlFlow                                                                                                                                          As cf
        Outer Apply Cf.SqlTaskQry.nodes ( 'declare namespace SQLTask="www.microsoft.com/sqlserver/dts/tasks/sqltask";./SQLTask:SqlTaskData/SQLTask:ParameterBinding' ) As cfnodes(x)
    Order By
        1
      , 2
      , 3;

    Update
        sqltsk
    Set
        sqltsk.ResultSetParameterName = CF.ResultSetParameterName
    From
        ssis_t.TblTask_Sql_Parameter As sqltsk
        Inner Join
        (
            Select
                Distinct
                cf.RowID
              , cf.ControlFlowDetailsRowID
              , rid                    = Cast(Row_Number () Over ( Partition By cf.ControlFlowDetailsRowID Order By ( Select 1 )) - 1 As Varchar)
              , ResultSetParameterName = cfnodes1.x.value (
                                                              'declare namespace SQLTask="www.microsoft.com/sqlserver/dts/tasks/sqltask"; (./@SQLTask:DtsVariableName)'
                                                            , 'varchar(1000)'
                                                          )
            From
                ssis_t.TblControlFlow                                                                                                                                       As cf
                Outer Apply Cf.SqlTaskQry.nodes ( 'declare namespace SQLTask="www.microsoft.com/sqlserver/dts/tasks/sqltask";./SQLTask:SqlTaskData/SQLTask:ResultBinding' ) As cfnodes1(x)
        )                            As CF
            On
            sqltsk.ControlFlowDetailsRowID = CF.ControlFlowDetailsRowID
            And CF.rid                     = IsNull ( sqltsk.ParameterBindingSequence, 0 )

    Print '---------- ssis_t.TblTask_Dft_Component -----------------------';

    Insert Into ssis_t.TblTask_Dft_Component
    (
        ControlFlowDetailsRowID
      , RowID
      , refId
      , name
      , componentClassID
      , description
      , ContactInfo
      , CommandTimeout
      , [OpenRowset]
      , OpenRowsetVariable
      , SqlCommand
      , SqlCommandVariable
      , DefaultCodePage
      , AlwaysUseDefaultCodePage
      , AccessMode
      , ParameterMapping
      , FastLoadKeepIdentity
      , FastLoadKeepNulls
      , FastLoadOptions
      , FastLoadMaxInsertCommitSize
      , VariableName
      , Connection_refId
      , connectionManagerID
      , connectionManagerRefId
      , Connection_description
      , Connection_name
      , IsSortedProperty
      , outputsQry
      , inputsQry
    )
    Select
        ControlFlowDetailsRowID
      , RowID
      , refId
      , name
      , componentClassID
      , description
      , ContactInfo
      , CommandTimeout
      , [OpenRowset]
      , OpenRowsetVariable
      , SqlCommand
      , SqlCommandVariable
      , DefaultCodePage
      , AlwaysUseDefaultCodePage
      , AccessMode
      , ParameterMapping
      , FastLoadKeepIdentity
      , FastLoadKeepNulls
      , FastLoadOptions
      , FastLoadMaxInsertCommitSize
      , VariableName
      , Connection_refId
      , connectionManagerID
      , connectionManagerRefId
      , Connection_description
      , Connection_name
      , IsSortedProperty
      , outputsQry
      , inputsQry
    From
        ssis_t.TblTask_Dft_Component_src

    Print '---------- ssis_t.TblTask_Dft_Component -----------------------';
--Print '---------- Insert DFT details-----------------------';

--Insert Into ssis_t.TblTask_Dft_Details
--(
--    ControlFlowDetailsRowID
--  , RowID
--  , DFTTasksPath
--  , DFTTaskName
--  , DFTTaskType
--  , DFTTaskType1
--  , DFTRowSet
--  , ParameterBindingParameterName
--  , DFTSQLCommand
--  , DFTConnectionManager
--  , Variable
--  , IsSortedProperty
--  , InputQry
--  , OutputQry
--  , MultihashcolumnSortPosition
--)
--Select
--    ControlFlowDetailsRowID
--  , RowID
--  , DFTTasksPath
--  , DFTTaskName
--  , DFTTaskType
--  , DFTTaskType1
--  , DFTRowSet
--  , ParameterBindingParameterName
--  , DFTSQLCommand
--  , DFTConnectionManager
--  , Variable
--  , IsSortedProperty
--  , InputQry
--  , OutputQry
--  , MultihashcolumnSortPosition
--From
--    ssis_t.TblTask_Dft_Details_src

--Print '---------- Insert DFT details-----------------------';
----Print '---------- Insert DFT Source and destination details-----------------------';

----Insert Into ssis_t.TblTask_Dft_SrcDest
----(
----    RowID
----  , DataFlowDetailsRowID
----  , SourceColumn
----  , DestinationColumn
----  , SortKeyPosition
----  , DataSource
----)
------from pkglvl.InputQry.nodes
----Select
----    RowID
----  , DataFlowDetailsRowID
----  , SourceColumn
----  , DestinationColumn
----  , SortKeyPosition
----  , DataSource
----From
----    ssis_t.TblTask_Dft_SrcDest_src

----Print '---------- Insert DFT Source and destination details-----------------------';
--Print '---------- Insert DFT Derived task  details-----------------------';

--Insert Into ssis_t.TblTask_Dft_Derived
--(
--    RowID
--  , DataFlowDetailsRowID
--  , DerivedValue
--  , SourceColumn
--  , DestinationColumn
--)
--Select
--    Distinct
--    pkglvl.RowID
--  , pkglvl.DataFlowDetailsRowID
--  , DerivedValue      = IsNull (
--                                   inputvalue.x.value (
--                                                          'data(./properties/property[@description =''Derived Column Friendly Expression''])[1]'
--                                                        , 'varchar(max)'
--                                                      )
--                                 , inputvalue.x.value (
--                                                          'data(./properties/property[@name =''FriendlyExpression''])[1]'
--                                                        , 'varchar(max)'
--                                                      )
--                               )
--  , SourceColumn      = inputvalue.x.value ( './@lineageId[1]', 'varchar(max)' )
--  , DestinationColumn = inputvalue.x.value ( './@refId[1]', 'varchar(max)' )
--From
--    ssis_t.TblTask_Dft_Details                  As pkglvl
--    Cross Apply pkglvl.InputQry.nodes ( './*' ) As inputvalue(x)
--Union All
--Select
--    Distinct
--    pkglvl.RowID
--  , pkglvl.DataFlowDetailsRowID
--  , DerivedValue      = IsNull (
--                                   outputvalue.x1.value (
--                                                            'data(./properties/property[@description =''Derived Column Friendly Expression''])[1]'
--                                                          , 'varchar(max)'
--                                                        )
--                                 , outputvalue.x1.value (
--                                                            'data(./properties/property[@name =''FriendlyExpression''])[1]'
--                                                          , 'varchar(max)'
--                                                        )
--                               )
--  , SourceColumn      = outputvalue.x1.value ( './@lineageId[1]', 'varchar(max)' )
--  , DestinationColumn = outputvalue.x1.value ( './@refId[1]', 'varchar(max)' )
--From
--    ssis_t.TblTask_Dft_Details                   As pkglvl
--    Cross Apply pkglvl.OutputQry.nodes ( './*' ) As outputvalue(x1)
--Where
--    pkglvl.DFTTaskType1 Like '%DERIVED%';

--Print '---------- Insert DFT Derived task  details-----------------------';
--Print '---------- Insert DFT lookup task  details-----------------------';

--Insert Into ssis_t.TblTask_Lookup
--(
--    RowID
--  , DataFlowDetailsRowID
--  , LookupJoins
--  , SourceColumn
--  , DestinationColumn
--)
--Select
--    pkglvl.RowID
--  , pkglvl.DataFlowDetailsRowID
--  , LookupJoins       = outputvalue.x.value ( './@lineageId[1]', 'varchar(max)' ) + '----->'
--                        + outputvalue.x.value (
--                                                  'data(./properties/property[@name =''JoinToReferenceColumn''])[1]'
--                                                , 'varchar(max)'
--                                              )
--  , SourceColumn      = outputvalue1.x.value (
--                                                 'data(./properties/property[@name =''CopyFromReferenceColumn''])[1]'
--                                               , 'varchar(max)'
--                                             )
--  , DestinationColumn = outputvalue1.x.value ( './@refId[1]', 'varchar(max)' )
--From
--    ssis_t.TblTask_Dft_Details                  As pkglvl
--    Cross Apply pkglvl.InputQry.nodes ( './*' ) As outputvalue(x)
--    Cross Apply pkglvl.OutputQry.nodes ( './*' ) As outputvalue1(x)
--Where
--    pkglvl.DFTTaskType = 'Lookup'
--    Or pkglvl.DFTTaskType1 Like '%Lookup%';

--Delete From
--ssis_t.TblTask_Lookup
--Where
--    DestinationColumn Like '%Lookup Error Output%';

--Print '---------- Insert DFT lookup task  details-----------------------';
End
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5364fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'PROCEDURE', @level1name = N'usp_GetPackageDetails';

