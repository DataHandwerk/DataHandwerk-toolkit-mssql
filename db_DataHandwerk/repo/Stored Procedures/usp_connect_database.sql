/*
<<property_start>>exampleUsage
EXEC [repo].[usp_connect_database]
@dwh_database_name = 'WideWorldImporters'
<<property_end>>
*/
Create Procedure repo.usp_connect_database
( @dwh_database_name NVarchar(128))
As
--
--ensure existence of required parameters like 'dwh_database_name'
Exec config.usp_init_parameter;

--ensure [repo].[spt_values] is filled, otherwise extended properties will not be written into database
Exec config.usp_init_spt_values;

Declare @dwh_database_name_old NVarchar(128) =
        (
            Select repo.fs_dwh_database_name ()
        );

Exec repo.usp_parameter_set
    @Parameter_name = 'dwh_database_name'
  , @Parameter_value = @dwh_database_name;

--this required every time, in case synonyms are corrupt or new synonyms have been added
--IF @dwh_database_name <> ISNULL(@dwh_database_name_old , '')
Begin
    Declare @SQLString NVarchar(4000);
    Declare @ParmDefinition NVarchar(500);

    Set @SQLString
        = N'
DROP SYNONYM  IF EXISTS [sys_dwh].[columns]
DROP SYNONYM  IF EXISTS [sys_dwh].[computed_columns]
DROP SYNONYM  IF EXISTS [sys_dwh].[default_constraints]
DROP SYNONYM  IF EXISTS [sys_dwh].[dm_exec_describe_first_result_set]
DROP SYNONYM  IF EXISTS [sys_dwh].[dm_sql_referenced_entities]
DROP SYNONYM  IF EXISTS [sys_dwh].[extended_properties]
DROP SYNONYM  IF EXISTS [sys_dwh].[foreign_key_columns]
DROP SYNONYM  IF EXISTS [sys_dwh].[foreign_keys]
DROP SYNONYM  IF EXISTS [sys_dwh].[identity_columns]
DROP SYNONYM  IF EXISTS [sys_dwh].[indexes]
DROP SYNONYM  IF EXISTS [sys_dwh].[index_columns]
DROP SYNONYM  IF EXISTS [sys_dwh].[objects]
DROP SYNONYM  IF EXISTS [sys_dwh].[parameters]
DROP SYNONYM  IF EXISTS [sys_dwh].[schemas]
DROP SYNONYM  IF EXISTS [sys_dwh].[sp_addextendedproperty]
DROP SYNONYM  IF EXISTS [sys_dwh].[sp_updateextendedproperty]
DROP SYNONYM  IF EXISTS [sys_dwh].[sql_expression_dependencies]
DROP SYNONYM  IF EXISTS [sys_dwh].[sql_modules]
DROP SYNONYM  IF EXISTS [sys_dwh].[tables]
DROP SYNONYM  IF EXISTS [sys_dwh].[types]

CREATE SYNONYM [sys_dwh].[columns] FOR [' + @dwh_database_name
          + N'].[sys].[columns]
CREATE SYNONYM [sys_dwh].[computed_columns] FOR [' + @dwh_database_name
          + N'].[sys].[computed_columns]
CREATE SYNONYM [sys_dwh].[default_constraints] FOR [' + @dwh_database_name
          + N'].[sys].[default_constraints]
CREATE SYNONYM [sys_dwh].[dm_exec_describe_first_result_set] FOR [' + @dwh_database_name
          + N'].[sys].[dm_exec_describe_first_result_set]
CREATE SYNONYM [sys_dwh].[dm_sql_referenced_entities] FOR [' + @dwh_database_name
          + N'].[sys].[dm_sql_referenced_entities]
CREATE SYNONYM [sys_dwh].[extended_properties] FOR [' + @dwh_database_name
          + N'].[sys].[extended_properties]
CREATE SYNONYM [sys_dwh].[foreign_key_columns] FOR [' + @dwh_database_name
          + N'].[sys].[foreign_key_columns]
CREATE SYNONYM [sys_dwh].[foreign_keys] FOR [' + @dwh_database_name
          + N'].[sys].[foreign_keys]
CREATE SYNONYM [sys_dwh].[identity_columns] FOR [' + @dwh_database_name
          + N'].[sys].[identity_columns]
CREATE SYNONYM [sys_dwh].[indexes] FOR [' + @dwh_database_name
          + N'].[sys].[indexes]
CREATE SYNONYM [sys_dwh].[index_columns] FOR [' + @dwh_database_name
          + N'].[sys].[index_columns]
CREATE SYNONYM [sys_dwh].[objects] FOR [' + @dwh_database_name
          + N'].[sys].[objects]
CREATE SYNONYM [sys_dwh].[parameters] FOR [' + @dwh_database_name
          + N'].[sys].[parameters]
CREATE SYNONYM [sys_dwh].[schemas] FOR [' + @dwh_database_name
          + N'].[sys].[schemas]
CREATE SYNONYM [sys_dwh].[sp_addextendedproperty] FOR [' + @dwh_database_name
          + N'].[sp_addextendedproperty]
CREATE SYNONYM [sys_dwh].[sp_updateextendedproperty] FOR [' + @dwh_database_name
          + N'].[sp_updateextendedproperty]
CREATE SYNONYM [sys_dwh].[sql_expression_dependencies] FOR [' + @dwh_database_name
          + N'].[sys].[sql_expression_dependencies]
CREATE SYNONYM [sys_dwh].[sql_modules] FOR [' + @dwh_database_name
          + N'].[sys].[sql_modules]
CREATE SYNONYM [sys_dwh].[tables] FOR [' + @dwh_database_name
          + N'].[sys].[tables]
CREATE SYNONYM [sys_dwh].[types] FOR [' + @dwh_database_name + N'].[sys].[types]
'   ;

    Execute sp_executesql @SQLString;
End;

Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'b390291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'PROCEDURE'
  , @level1name = N'usp_connect_database';


Go


