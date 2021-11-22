CREATE Procedure [ssis_t].[usp_GetProjectConnection] @ProjectPath Varchar(8000) = 'C:\Packages1'
As
Begin
    Set NoCount On;

    ----------------------truncate tables------------------------------------
    Truncate Table ssis_t.ProjectConnection

    Truncate Table ssis_t.TblProjectConnection

    -------------------Iterate over all dtsx files from folder------------------------------
    Declare @Path Varchar(8000) = @ProjectPath + '\*.conmgr';

    Declare @MyFiles Table
    (
        MyID     Int Identity(1, 1) Primary Key
      , FullPath Varchar(8000)
    );

    Declare @CommandLine Varchar(8000);

    Select
        @CommandLine = Left('dir "' + @Path + '" /A-D /B /S ', 8000);

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
Insert Into ssis_t.projectConnection
(
    ProjectPath
  , ConnectionPath
  , ConnectionXML
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

    Insert Into ssis_t.TblProjectConnection
    (
        ConnectionManagerName
      , ConnectionManagerID
      , ConnectionPath
      , ConnectionManagerType
      , ConnectionString
      , ExpressionValue
      , RowID
    )
    Select
        ConnectionManagerName
      , ConnectionManagerID
      , ConnectionPath
      , ConnectionManagerType
      , ConnectionString
      , ExpressionValue
      , RowID
    From
        ssis_t.TblProjectConnection_src
End
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '919a07f7-c23c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'PROCEDURE', @level1name = N'usp_GetProjectConnection';

