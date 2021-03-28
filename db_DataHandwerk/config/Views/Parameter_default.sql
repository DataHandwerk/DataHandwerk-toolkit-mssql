﻿/*
-- tag::example[]  
--example 1:
--merge this view into [repo].[Parameter]:

EXEC [config].[usp_init_parameter]

--example 2:
--remove, what not is defined here (Dangerous: possible data loss)
--do not delete based on [sub_Parameter]!
--they can always be added!

DELETE T
FROM [repo].[Parameter] T
WHERE NOT EXISTS (
  SELECT 1
  FROM [config].[Parameter_default] S
  WHERE S.[Parameter_name] = T.[Parameter_name]
  )
-- end::example[]  
*/
CREATE VIEW [config].[Parameter_default]
AS
--
--first [Parameter_default_value] datatype should be SQL_VARIANT to avoid taye casting issues for other entries
SELECT [Parameter_name] = 'DUMMY'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'dummy parameter, data type SQL_Variant'
 , [Parameter_default_value] = CAST(N'' AS SQL_VARIANT)

UNION ALL

SELECT [Parameter_name] = 'dwh_database_name'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'The database name must be the same as the one used in the synonyms'
 , [Parameter_default_value] = CAST(N'master' AS SYSNAME)

UNION ALL

SELECT [Parameter_name] = 'main enable usp_RepoObjectSource_FirstResultSet'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'execute (or not) usp_RepoObjectSource_FirstResultSet'
 , [Parameter_default_value] = 0

UNION ALL

SELECT [Parameter_name] = 'main enable usp_RepoObject_update_SysObjectQueryPlan'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'execute (or not) usp_RepoObject_update_SysObjectQueryPlan'
 , [Parameter_default_value] = 0

UNION ALL

SELECT [Parameter_name] = 'main enable usp_RepoObjectSource_QueryPlan'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'execute (or not) usp_RepoObjectSource_QueryPlan'
 , [Parameter_default_value] = 0

UNION ALL

SELECT [Parameter_name] = 'persistence_name_suffix'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'default suffix for persistence table which will be added to source object name'
 , [Parameter_default_value] = CAST(N'_T' AS SYSNAME)

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

SELECT [Parameter_name] = 'Inheritance_StringAggSeparatorSql_column'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'if NULL then only one source is used for inheritance; if not NULL then STRING_AGG( expression, separator ) is used to aggregate all sources. Content is interpreted as TSQL. Good values are ''CHAR(13)+CHAR(10)'' or '''';'''''
 , [Parameter_default_value] = CAST(NULL AS NVARCHAR(4000))

UNION ALL

SELECT [Parameter_name] = 'Inheritance_StringAggSeparatorSql_column'
 , [sub_Parameter] = N'ReferencedObjectColumnList'
 , [Parameter_desciption] = N'if NULL then only one source is used for inheritance; if not NULL then STRING_AGG( expression, separator ) is used to aggregate all sources. Content is interpreted as TSQL. Good values are ''CHAR(13)+CHAR(10)'' or '''';'''''
 , [Parameter_default_value] = CAST(CHAR(13)+CHAR(10) AS NVARCHAR(4000))

UNION ALL

SELECT [Parameter_name] = 'Inheritance_StringAggSeparatorSql_object'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'if NULL then only one source is used for inheritance; if not NULL then STRING_AGG( expression, separator ) is used to aggregate all sources. Content is interpreted as TSQL. Good values are ''CHAR(13)+CHAR(10)'' or '''';'''''
 , [Parameter_default_value] = CAST(NULL AS NVARCHAR(4000))

UNION ALL

SELECT [Parameter_name] = 'Inheritance_StringAggSeparatorSql_object'
 , [sub_Parameter] = N'ReferencedObjectList'
 , [Parameter_desciption] = N'if NULL then only one source is used for inheritance; if not NULL then STRING_AGG( expression, separator ) is used to aggregate all sources. Content is interpreted as TSQL. Good values are ''CHAR(13)+CHAR(10)'' or '''';'''''
 , [Parameter_default_value] = CAST(CHAR(13)+CHAR(10) AS NVARCHAR(4000))

UNION ALL

SELECT [Parameter_name] = 'InheritanceDefinition_column'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'CONCAT arguments to be used with some specific values in [repo].[InheritanceType], for example: ''[RepoObject_name],CHAR(13),CHAR(10),EineNochZuDefinierendeFunktion(''MS_Description'')'''
 , [Parameter_default_value] = CAST(NULL AS NVARCHAR(4000))

UNION ALL

SELECT [Parameter_name] = 'InheritanceDefinition_column'
 , [sub_Parameter] = N'MS_Description'
 , [Parameter_desciption] = N'CONCAT arguments to be used with some specific values in [repo].[InheritanceType], for example: ''[RepoObject_name],CHAR(13),CHAR(10),EineNochZuDefinierendeFunktion(''MS_Description'')'''
 , [Parameter_default_value] = CAST('CAST(COALESCE(referencing.[Repo_definition], repo.fs_get_RepoObjectColumnProperty_nvarchar(referenced.[RepoObjectColumn_guid], ''MS_Description'')) AS NVARCHAR(4000))' AS NVARCHAR(4000))

UNION ALL

SELECT [Parameter_name] = 'InheritanceDefinition_column'
 , [sub_Parameter] = N'ReferencedObjectColumnList'
 , [Parameter_desciption] = N'CONCAT arguments to be used with some specific values in [repo].[InheritanceType], for example: ''[RepoObject_name],CHAR(13),CHAR(10),EineNochZuDefinierendeFunktion(''MS_Description'')'''
 , [Parameter_default_value] = CAST('referenced.[RepoObjectColumn_fullname]' AS NVARCHAR(4000))

UNION ALL

SELECT [Parameter_name] = 'InheritanceDefinition_object'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'CONCAT arguments to be used with some specific values in [repo].[InheritanceType], for example: ''[RepoObject_name],CHAR(13),CHAR(10),EineNochZuDefinierendeFunktion(''MS_Description'')'''
 , [Parameter_default_value] = CAST(NULL AS NVARCHAR(4000))

UNION ALL

SELECT [Parameter_name] = 'InheritanceDefinition_object'
 , [sub_Parameter] = N'MS_Description'
 , [Parameter_desciption] = N'CONCAT arguments to be used with some specific values in [repo].[InheritanceType], for example: ''[RepoObject_name],CHAR(13),CHAR(10),EineNochZuDefinierendeFunktion(''MS_Description'')'''
 , [Parameter_default_value] = CAST(NULL AS NVARCHAR(4000))

UNION ALL

SELECT [Parameter_name] = 'InheritanceDefinition_object'
 , [sub_Parameter] = N'ReferencedObjectList'
 , [Parameter_desciption] = N'CONCAT arguments to be used with some specific values in [repo].[InheritanceType], for example: ''[RepoObject_name],CHAR(13),CHAR(10),EineNochZuDefinierendeFunktion(''MS_Description'')'''
 , [Parameter_default_value] = CAST('referenced.[RepoObject_fullname]' AS NVARCHAR(4000))

UNION ALL

SELECT [Parameter_name] = 'InheritanceType_column'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'TINYINT; InheritanceType for column: possible values in [repo].[InheritanceType]'
 , [Parameter_default_value] = CAST(0 AS TINYINT)

UNION ALL

SELECT [Parameter_name] = 'InheritanceType_column'
 , [sub_Parameter] = N'MS_Description'
 , [Parameter_desciption] = N'TINYINT; InheritanceType for column: possible values in [repo].[InheritanceType]'
 , [Parameter_default_value] = CAST(0 AS TINYINT)

UNION ALL

SELECT [Parameter_name] = 'InheritanceType_column'
 , [sub_Parameter] = N'ReferencedObjectColumnList'
 , [Parameter_desciption] = N'TINYINT; InheritanceType for object: possible values in [repo].[InheritanceType]'
 , [Parameter_default_value] = CAST(14 AS TINYINT)

UNION ALL

SELECT [Parameter_name] = 'InheritanceType_object'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'TINYINT; InheritanceType for object: possible values in [repo].[InheritanceType]'
 , [Parameter_default_value] = CAST(0 AS TINYINT)

UNION ALL

SELECT [Parameter_name] = 'InheritanceType_object'
 , [sub_Parameter] = N'MS_Description'
 , [Parameter_desciption] = N'TINYINT; InheritanceType for object: possible values in [repo].[InheritanceType]'
 , [Parameter_default_value] = CAST(0 AS TINYINT)

UNION ALL

SELECT [Parameter_name] = 'InheritanceType_object'
 , [sub_Parameter] = N'ReferencedObjectList'
 , [Parameter_desciption] = N'TINYINT; InheritanceType for object: possible values in [repo].[InheritanceType]'
 , [Parameter_default_value] = CAST(14 AS TINYINT)

----todo: Warum sollte es eine Unterscheidung zwischen Sichten und Tabellen geben?
--UNION ALL

--SELECT [Parameter_name] = 'InheritanceType_object_type_u'
-- , [sub_Parameter] = N''
-- , [Parameter_desciption] = N'TINYINT; InheritanceType for object type U (user table): possible values in [repo].[InheritanceType]'
-- , [Parameter_default_value] = CAST(0 AS TINYINT)

--UNION ALL

--SELECT [Parameter_name] = 'InheritanceType_object_type_u'
-- , [sub_Parameter] = N'MS_Description'
-- , [Parameter_desciption] = N'TINYINT; InheritanceType for object type U (user table): possible values in [repo].[InheritanceType]'
-- , [Parameter_default_value] = CAST(0 AS TINYINT)
----

--UNION ALL

--SELECT [Parameter_name] = 'InheritanceType_object_type_v'
-- , [sub_Parameter] = N''
-- , [Parameter_desciption] = N'TINYINT; InheritanceType for object type V (view): possible values in [repo].[InheritanceType]'
-- , [Parameter_default_value] = CAST(0 AS TINYINT)

--UNION ALL

--SELECT [Parameter_name] = 'InheritanceType_object_type_v'
-- , [sub_Parameter] = N'MS_Description'
-- , [Parameter_desciption] = N'TINYINT; InheritanceType for object type V (view): possible values in [repo].[InheritanceType]'
-- , [Parameter_default_value] = CAST(0 AS TINYINT)

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'dd8f291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'VIEW', @level1name = N'Parameter_default';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '83f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'VIEW', @level1name = N'Parameter_default', @level2type = N'COLUMN', @level2name = N'sub_Parameter';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '82f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'VIEW', @level1name = N'Parameter_default', @level2type = N'COLUMN', @level2name = N'Parameter_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '84f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'VIEW', @level1name = N'Parameter_default', @level2type = N'COLUMN', @level2name = N'Parameter_desciption';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '85f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'VIEW', @level1name = N'Parameter_default', @level2type = N'COLUMN', @level2name = N'Parameter_default_value';
