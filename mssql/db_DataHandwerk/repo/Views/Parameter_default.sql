


-- Alter View Parameter_default
/*
merge this view into [repo].[Parameter]:

EXEC [repo].[usp_init_parameter]

*/
CREATE VIEW [repo].[Parameter_default]
AS
--
--first [Parameter_default_value] datatype should be SQL_VARIANT to avoid taye casting issues for other entries
SELECT [Parameter_name] = 'persistence_name_suffix'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'default suffix for persistence table which will be added to source object name'
 , [Parameter_default_value] = CAST(N'_T' AS SQL_VARIANT)

UNION ALL

SELECT [Parameter_name] = 'dwh_database_name'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'The database name must be the same as the one used in the synonyms'
 , [Parameter_default_value] = CAST(N'master' AS SYSNAME)

UNION ALL

SELECT [Parameter_name] = 'Hist_ValidFrom_column_name'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'default column name for column - datetime2 GENERATED ALWAYS AS ROW START'
 , [Parameter_default_value] = CAST(N'ValidFrom' AS SYSNAME)

UNION ALL

SELECT [Parameter_name] = 'Hist_ValidTo_column_name'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'default column name for column - datetime2 GENERATED ALWAYS AS ROW END'
 , [Parameter_default_value] = CAST(N'ValidTo' AS SYSNAME)

UNION ALL

SELECT [Parameter_name] = 'Hist_Table_schema'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'default: NULL - The historization table uses the same schema as the table to be historized. otherwise the given schema is used'
 , [Parameter_default_value] = NULL

UNION ALL

SELECT [Parameter_name] = 'Hist_Table_name_suffix'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'default suffix for historization table which will be added to historized object name'
 , [Parameter_default_value] = CAST(N'_hist' AS SYSNAME)

UNION ALL

SELECT [Parameter_name] = 'inherit_property_object_type_u'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'TINYINT; inherit property for object type U (user table): 0 do not inherit, 11 inherit if NULL, 12 inherit if NULL or empty, 21 inherit common column pattern for other, 22 pattern for all, 31 inherit for all'
 , [Parameter_default_value] = CAST(0 AS TINYINT)

UNION ALL

SELECT [Parameter_name] = 'RepoObjectColumn_column_id_OrderBy'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'used in repo.usp_RepoObjectColumn__update_RepoObjectColumn_column_id to define the order of columns'
 , [Parameter_default_value] = CAST(N'
ISNULL([ic].[index_column_id] , 99999) --ensure PK index is sorted before other columns
, [roc].[Repo_is_computed] --computed columns after normal columns
, [roc].[Repo_is_identity] --IDENTITY columns after normal columns, because nothing should be inserted (they are like computed columns)
, [roc].[Repo_generated_always_type]
, [roc].[RepoObjectColumn_name]
' AS NVARCHAR(4000))
--
--the following parameters can have [sub_Parameter]

UNION ALL

SELECT [Parameter_name] = 'inherit_property_object_type_u'
 , [sub_Parameter] = N'MS_Description'
 , [Parameter_desciption] = N'TINYINT; inherit property for object type U (user table): 0 do not inherit, 11 inherit if NULL, 12 inherit if NULL or empty, 21 inherit common column pattern for other, 22 pattern for all, 31 inherit for all'
 , [Parameter_default_value] = CAST(0 AS TINYINT)
--

UNION ALL

SELECT [Parameter_name] = 'inherit_property_object_type_v'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'TINYINT; inherit property for object type V (view): 0 do not inherit, 11 inherit if NULL, 12 inherit if NULL or empty, 21 inherit common column pattern for other, 22 pattern for all, 31 inherit for all'
 , [Parameter_default_value] = CAST(0 AS TINYINT)

UNION ALL

SELECT [Parameter_name] = 'inherit_property_column'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'TINYINT; inherit property for column: 0 do not inherit, 11 inherit if NULL, 12 inherit if NULL or empty, 21 inherit common column pattern for other, 22 pattern for all, 31 inherit for all'
 , [Parameter_default_value] = CAST(0 AS TINYINT)

UNION ALL

SELECT [Parameter_name] = 'inherit_property_object_type_v'
 , [sub_Parameter] = N'MS_Description'
 , [Parameter_desciption] = N'TINYINT; inherit property for object type V (view): 0 do not inherit, 11 inherit if NULL, 12 inherit if NULL or empty, 21 inherit common column pattern for other, 22 pattern for all, 31 inherit for all'
 , [Parameter_default_value] = CAST(0 AS TINYINT)
--

UNION ALL

SELECT [Parameter_name] = 'inherit_property_column'
 , [sub_Parameter] = N'MS_Description'
 , [Parameter_desciption] = N'TINYINT; inherit property for column: 0 do not inherit, 11 inherit if NULL, 12 inherit if NULL or empty, 21 inherit common column pattern for other, 22 pattern for all, 31 inherit for all'
 , [Parameter_default_value] = CAST(0 AS TINYINT)

UNION ALL

SELECT [Parameter_name] = 'inherit_property_column_pattern'
 , [sub_Parameter] = N'MS_Description'
 , [Parameter_desciption] = N'use with "inherit_property_column" = 31 inherit (use pattern). todo: define possible values'
 , [Parameter_default_value] = CAST(N'' AS NVARCHAR(4000))
