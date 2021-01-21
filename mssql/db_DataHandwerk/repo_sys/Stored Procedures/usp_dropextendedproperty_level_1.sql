﻿
-- Create Procedure usp_dropextendedproperty_level_1
/*
this procedure will drop extended property with property_name = @name used in all "level 1 objects"
level 1 objects are:
AGGREGATE, DEFAULT, FUNCTION, LOGICAL FILE NAME, PROCEDURE, QUEUE, RULE, SYNONYM, TABLE, TABLE_TYPE, TYPE, VIEW, XML SCHEMA COLLECTION

for example:
if there are tables, views and ohter level 1 objects containing properties like 'repo_guid' then the following execution will drop them all

EXEC repo_sys.usp_dropextendedproperty_level_1
     @name = 'repo_guid'
*/

CREATE PROCEDURE [repo_sys].[usp_dropextendedproperty_level_1]
     @name VARCHAR(128)
AS
DECLARE
     @DbName SYSNAME = [repo].[fs_dwh_database_name]()
DECLARE
     @module_name_var_drop NVARCHAR(500) = QUOTENAME(@DbName) + '.sys.sp_dropextendedproperty'

DECLARE delete_cursor CURSOR READ_ONLY
FOR SELECT
           [property_name]
         , [property_value]
         , [level0type]
         , [level0name]
         , [level1type]
         , [level1name]
    FROM
         repo_sys.extended_properties__parameter_for_add_update_drop
    WHERE  [property_name] = @name

DECLARE
     @property_name  VARCHAR(128)
   , @property_value SQL_VARIANT
   , @level0type     VARCHAR(128)
   , @level0name     VARCHAR(128)
   , @level1type     VARCHAR(128)
   , @level1name     VARCHAR(128)

OPEN delete_cursor

FETCH NEXT FROM delete_cursor INTO
     @property_name
   , @property_value
   , @level0type
   , @level0name
   , @level1type
   , @level1name

WHILE @@fetch_status <> -1
    BEGIN
        IF @@fetch_status <> -2
            BEGIN
                --EXEC sp_dropextendedproperty
                EXEC @module_name_var_drop
                     @name = @property_name
                   , @level0type = @level0type
                   , @level0name = @level0name
                   , @level1type = @level1type
                   , @level1name = @level1name
        END
        FETCH NEXT FROM delete_cursor INTO
             @property_name
           , @property_value
           , @level0type
           , @level0name
           , @level1type
           , @level1name
    END

CLOSE delete_cursor

DEALLOCATE delete_cursor
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'20e67602-5b47-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'PROCEDURE', @level1name = N'usp_dropextendedproperty_level_1';

