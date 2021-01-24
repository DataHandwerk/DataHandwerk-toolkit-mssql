/*
example

[repo].[usp_connect_database]
@dwh_database_name = 'dwh_PerformanceAnalytics'

[repo].[usp_connect_database]
@dwh_database_name = 'WideWorldImporters-test'


*/
CREATE PROCEDURE [repo].[usp_connect_database] (@dwh_database_name NVARCHAR(128))
AS
--
--ensure existence of required parameters like 'dwh_database_name'
EXEC [repo].[usp_init_parameter]

--ensure [repo].[spt_values] is filled, otherwise extended properties will not be written into database
EXEC [repo].[usp_init_spt_values]

DECLARE @dwh_database_name_old NVARCHAR(128) = (
  SELECT [repo].[fs_dwh_database_name]()
  )

EXEC [repo].[usp_parameter__insert_update] @Parameter_name = 'dwh_database_name'
 , @Parameter_value = @dwh_database_name

--this required every time, in case synonyms are corrupt or new synonyms have been added
--IF @dwh_database_name <> ISNULL(@dwh_database_name_old , '')
BEGIN
 DECLARE @SQLString NVARCHAR(4000)
 DECLARE @ParmDefinition NVARCHAR(500)

 SET @SQLString = 
  '
DROP SYNONYM  IF EXISTS [sys_dwh].[columns]
DROP SYNONYM  IF EXISTS [sys_dwh].[computed_columns]
DROP SYNONYM  IF EXISTS [sys_dwh].[default_constraints]
DROP SYNONYM  IF EXISTS [sys_dwh].[dm_exec_describe_first_result_set]
DROP SYNONYM  IF EXISTS [sys_dwh].[dm_sql_referenced_entities]
DROP SYNONYM  IF EXISTS [sys_dwh].[extended_properties]
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

CREATE SYNONYM [sys_dwh].[columns] FOR [' 
  + @dwh_database_name + '].[sys].[columns]
CREATE SYNONYM [sys_dwh].[computed_columns] FOR [' + @dwh_database_name + '].[sys].[computed_columns]
CREATE SYNONYM [sys_dwh].[default_constraints] FOR [' + @dwh_database_name + '].[sys].[default_constraints]
CREATE SYNONYM [sys_dwh].[dm_exec_describe_first_result_set] FOR [' + @dwh_database_name + '].[sys].[dm_exec_describe_first_result_set]
CREATE SYNONYM [sys_dwh].[dm_sql_referenced_entities] FOR [' + @dwh_database_name + '].[sys].[dm_sql_referenced_entities]
CREATE SYNONYM [sys_dwh].[extended_properties] FOR [' + @dwh_database_name + '].[sys].[extended_properties]
CREATE SYNONYM [sys_dwh].[identity_columns] FOR [' + @dwh_database_name + '].[sys].[identity_columns]
CREATE SYNONYM [sys_dwh].[indexes] FOR [' + @dwh_database_name + '].[sys].[indexes]
CREATE SYNONYM [sys_dwh].[index_columns] FOR [' + @dwh_database_name + '].[sys].[index_columns]
CREATE SYNONYM [sys_dwh].[objects] FOR [' + @dwh_database_name + 
  '].[sys].[objects]
CREATE SYNONYM [sys_dwh].[parameters] FOR [' + @dwh_database_name + '].[sys].[parameters]
CREATE SYNONYM [sys_dwh].[schemas] FOR [' + @dwh_database_name + '].[sys].[schemas]
CREATE SYNONYM [sys_dwh].[sp_addextendedproperty] FOR [' + @dwh_database_name + '].[sp_addextendedproperty]
CREATE SYNONYM [sys_dwh].[sp_updateextendedproperty] FOR [' + @dwh_database_name + '].[sp_updateextendedproperty]
CREATE SYNONYM [sys_dwh].[sql_expression_dependencies] FOR [' + @dwh_database_name + '].[sys].[sql_expression_dependencies]
CREATE SYNONYM [sys_dwh].[sql_modules] FOR [' + @dwh_database_name + '].[sys].[sql_modules]
CREATE SYNONYM [sys_dwh].[tables] FOR [' + @dwh_database_name + '].[sys].[tables]
CREATE SYNONYM [sys_dwh].[types] FOR [' + @dwh_database_name + '].[sys].[types]

'

 EXECUTE sp_executesql @SQLString
END
