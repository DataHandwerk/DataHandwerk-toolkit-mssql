/*
EXEC repo_sys.sp_AddOrUpdateExtendedProperty   
    @name = N'repo_guid'  
    ,@value = N'Employee ID'  
    ,@level0type = N'Schema', @level0name = dbo  
    ,@level1type = N'Table',  @level1name = T1  
    ,@level2type = N'Column', @level2name = id;


sysnonym will not work because sp_updateextendedproperty and sp_addextendedproperty will always use the current datebase context

https://dba.stackexchange.com/questions/136135/how-can-a-database-parameter-be-used-on-sp-addextendedproperty

DECLARE @DbName SYSNAME = 'AdventureWorks2012';
DECLARE @module_name_var NVARCHAR(500) = QUOTENAME(@DbName) + 
                                              '.sys.sp_addextendedproperty';

EXEC @module_name_var
  @name = N'Caption',
  @value = 'AdventureWorks2012 Sample OLTP Database'; 

https://docs.microsoft.com/de-de/sql/t-sql/language-elements/execute-transact-sql?view=sql-server-ver15

module_name

Is the fully qualified or nonfully qualified name of the stored procedure or scalar-valued user-defined function to call. 
Module names must comply with the rules for identifiers. 
The names of extended stored procedures are always case-sensitive, regardless of the collation of the server.

A module that has been created in another database can be executed if the user running the module owns the module or has the appropriate permission to execute it in that database. 
A module can be executed on another server running SQL Server if the user running the module has the appropriate permission to use that server (remote access) and to execute the module in that database. 
If a server name is specified but no database name is specified, the SQL Server Database Engine looks for the module in the default database of the user.

@module_name_var

Is the name of a locally defined variable that represents a module name.

This can be a variable that holds the name of a natively compiled, scalar user-defined function.


immer noch Fehler:

RepoObject_guid;92D613F2-5752-EB11-84D5-A81E8446D5B0;Schema;Warehouse;TABLE;ColdRoomTemperatures;;;
Msg 12320, Level 16, State 80, Procedure WideWorldImporters-test.sys.sp_addextendedproperty, Line 37 [Batch Start Line 2]
Operations that require a change to the schema version, for example renaming, are not supported with memory optimized tables.

=> todo
*/
CREATE PROCEDURE [repo_sys].[usp_AddOrUpdateExtendedProperty] @name SYSNAME
 , @value SQL_VARIANT = NULL
 , @level0type VARCHAR(128) = NULL
 , @level0name SYSNAME = NULL
 , @level1type VARCHAR(128) = NULL
 , @level1name SYSNAME = NULL
 , @level2type VARCHAR(128) = NULL
 , @level2name SYSNAME = NULL
AS
DECLARE @DbName SYSNAME = [repo].[fs_dwh_database_name]()
DECLARE @module_name_var_update NVARCHAR(500) = QUOTENAME(@DbName) + '.sys.sp_updateextendedproperty'
 , @module_name_var_add NVARCHAR(500) = QUOTENAME(@DbName) + '.sys.sp_addextendedproperty'

----DEBUG
--PRINT CONCAT(@name , ';' , CAST(@value AS NVARCHAR(4000)) , ';' , @level0type , ';' , @level0name , ';' , @level1type , ';' , @level1name , ';' , @level2type , ';' , @level2name , ';')
----DEBUG
--
BEGIN TRY
 --EXEC [sys].sp_updateextendedproperty
 EXEC @module_name_var_update @name = @name
  , @value = @value
  , @level0type = @level0type
  , @level0name = @level0name
  , @level1type = @level1type
  , @level1name = @level1name
  , @level2type = @level2type
  , @level2name = @level2name
END TRY

BEGIN CATCH
 BEGIN TRY
  --EXEC [sys].sp_addextendedproperty
  EXEC @module_name_var_add @name = @name
   , @value = @value
   , @level0type = @level0type
   , @level0name = @level0name
   , @level1type = @level1type
   , @level1name = @level1name
   , @level2type = @level2type
   , @level2name = @level2name
 END TRY

 BEGIN CATCH
  PRINT 'Can''t insert extended property:'
  PRINT CONCAT (
    @name
    , ';'
    , CAST(@value AS NVARCHAR(4000))
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
 END CATCH
END CATCH
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a590291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'PROCEDURE', @level1name = N'usp_AddOrUpdateExtendedProperty';
