
/*
EXEC [sys_self].usp_dropextendedproperty_level_1
     @name = 'RepoObject_guid'
*/

CREATE PROCEDURE [sys_self].[usp_dropextendedproperty_level_1]
     @name VARCHAR(128)
AS
DECLARE
     @DbName SYSNAME = DB_NAME()
PRINT @DbName

DECLARE
     @module_name_var_drop NVARCHAR(500) = QUOTENAME(@DbName) + '.sys.sp_dropextendedproperty'
PRINT @module_name_var_drop

DECLARE delete_cursor CURSOR READ_ONLY
FOR SELECT
           [property_name]
         , [property_value]
         , [level0type]
         , [level0name]
         , [level1type]
         , [level1name]
    FROM
         sys_self.[ExtendedProperties_ParameterForAddUpdateDrop]
    WHERE  [property_name] = @name
           AND NOT [level1type] IS NULL
           AND NOT [level1name] IS NULL
           AND [level2type] IS NULL
           AND [level2name] IS NULL

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
                PRINT CONCAT(@module_name_var_drop , ';' , @name , ';' , @level0type , ';' , @level0name , ';' , @level1type , ';' , @level1name)
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