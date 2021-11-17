﻿
Create Procedure repo_sys.usp_DropExtendedProperty_in_dwh
    @name       sysname
  , @level0type Varchar(128) = Null
  , @level0name sysname      = Null
  , @level1type Varchar(128) = Null
  , @level1name sysname      = Null
  , @level2type Varchar(128) = Null
  , @level2name sysname      = Null
As
Declare @DbName sysname = config.fs_dwh_database_name ();
Declare @module_name_var_drop NVarchar(500) = QuoteName ( @DbName ) + N'.sys.sp_dropextendedproperty'

Begin Try
    --EXEC [sys].sp_dropextendedproperty
    Exec @module_name_var_drop
        @name = @name
      , @level0type = @level0type
      , @level0name = @level0name
      , @level1type = @level1type
      , @level1name = @level1name
      , @level2type = @level2type
      , @level2name = @level2name
End Try
Begin Catch
    Print 'Can''t drop extended property:'
    Print Concat (
                     @name
                   , ';'
                   , @level0type
                   , ';'
                   , @level0name
                   , ';'
                   , @level1type
                   , ';'
                   , @level1name
                   , ';'
                   , @level2type
                   , ';'
                   , @level2name
                   , ';'
                 )
End Catch
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '863efd10-0222-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'PROCEDURE', @level1name = N'usp_DropExtendedProperty_in_dwh';
