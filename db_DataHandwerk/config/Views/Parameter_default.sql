




/*
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
 , [Parameter_default_value] = CAST('''* '' + referenced.[RepoObjectColumn_fullname]' AS NVARCHAR(4000))

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
 , [Parameter_default_value] = CAST('''* '' + referenced.[RepoObject_fullname]' AS NVARCHAR(4000))

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


UNION ALL

SELECT [Parameter_name] = 'puml_skinparam_class'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'skinparam class for generated PlantUML files. <<xxx>> - object type, see: [config].[type]'
 , [Parameter_default_value] = CAST(N'
skinparam class {
  BackgroundColor White
  BackgroundColor<<FN>> Yellow
  BackgroundColor<<FS>> Yellow
  BackgroundColor<<FT>> LightGray
  BackgroundColor<<IF>> Yellow
  BackgroundColor<<IS>> Yellow
  BackgroundColor<<P>> Aqua
  BackgroundColor<<PC>> Aqua
  BackgroundColor<<SN>> Yellow
  BackgroundColor<<SO>> SlateBlue
  BackgroundColor<<TF>> LightGray
  BackgroundColor<<TR>> Tomato
  BackgroundColor<<U>> White
  BackgroundColor<<V>> WhiteSmoke
  BackgroundColor<<X>> Aqua
}
' as NVARCHAR(4000))

UNION ALL

SELECT [Parameter_name] = 'Adoc_AntoraDocModulFolder'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'Antora export folder, will be extended by ''partials\'', ''pages\'', ''examples\'', ''images\'' and so on'
 , [Parameter_default_value] = CAST(N'D:\Repos\GitHub\MyOrganisation\MyProject-docs\docs\modules\sqldb\' as NVARCHAR(4000))

UNION ALL

SELECT [Parameter_name] = 'Adoc_AntoraPageTemplate'
 , [sub_Parameter] = N''
 , [Parameter_desciption] = N'content of an final Antora Page'
 , [Parameter_default_value] = CAST(N'
include::partial$template/master-page-1.adoc[]
include::partial$template/master-page-2.adoc[]
' AS NVARCHAR(4000))

UNION ALL

SELECT [Parameter_name] = 'Adoc_AntoraPageTemplate'
 , [sub_Parameter] = N'1'
 , [Parameter_desciption] = N'template for Antora pages which gets Content via include from Partials, using tags. Attention! NVARCHAR(4000), use sub_Parameter for biger content - nvarchar(max) is incompatible with sql_variant'
 , [Parameter_default_value] = CAST(N'= {docname}

include::partial${docname}.adoc[tag=existing_properties]

type:
include::partial${docname}.adoc[tag=SysObject_type]
(
include::partial${docname}.adoc[tag=SysObject_type_name]
), modify_date:
include::partial${docname}.adoc[tag=SysObject_modify_date]

RepoObject_guid:
include::partial${docname}.adoc[tag=RepoObject_guid]

ifdef::ExistsProperty--is_repo_managed[]
is_repo_managed:
include::partial${docname}.adoc[tag=is_repo_managed]
endif::ExistsProperty--is_repo_managed[]

ifdef::ExistsProperty--MS_Description[]

== Description

include::partial${docname}.adoc[tag=MS_Description]

endif::ExistsProperty--MS_Description[]

ifdef::ExistsProperty--UspExamples[]

== UspExamples

====
[source,sql]
----
include::partial${docname}.adoc[tag=UspExamples]
----
====

endif::ExistsProperty--UspExamples[]

ifdef::ExistsProperty--AntoraParameterList[]

== Parameters

include::partial${docname}.adoc[tag=AntoraParameterList]

endif::ExistsProperty--AntoraParameterList[]

ifdef::ExistsProperty--AdocUspSteps[]

== Procedure steps

include::partial${docname}.adoc[tag=AdocUspSteps]

endif::ExistsProperty--AdocUspSteps[]

ifdef::ExistsProperty--pk_index_guid[]

== PK

PK SemanticGroup:
include::partial${docname}.adoc[tag=pk_IndexSemanticGroup]

//PK Column Name(s):
//include::partial${docname}.adoc[tag=pk_IndexPatternColumnName]

//PK Column Datatype(s):
//include::partial${docname}.adoc[tag=pk_IndexPatternColumnDatatype]

.PK columns of {docname}
[cols="d,m,m,m,m,d"]
|===
|PK|Column Name|Data Type|NULL?|ID|Calc

include::partial${docname}.adoc[tag=AntoraPkColumnTableRows]

|===

endif::ExistsProperty--pk_index_guid[]

ifdef::ExistsProperty--Columns[]

== Columns

.Columns of {docname}
[cols="d,m,m,m,m,d"]
|===
|PK|Column Name|Data Type|NULL?|ID|Calc

include::partial${docname}.adoc[tag=AntoraPkColumnTableRows]

include::partial${docname}.adoc[tag=AntoraNonPkColumnTableRows]

|===

endif::ExistsProperty--Columns[]

ifdef::ExistsProperty--is_persistence,ExistsProperty--has_history,ExistsProperty--has_history_columns[]

== Persistence, History Table

* persistence source:
include::partial${docname}.adoc[tag=persistence_source_RepoObject_xref]
* is_persistence:
include::partial${docname}.adoc[tag=is_persistence]
* is_persistence_check_duplicate_per_pk:
include::partial${docname}.adoc[tag=is_persistence_check_duplicate_per_pk]
* is_persistence_check_for_empty_source:
include::partial${docname}.adoc[tag=is_persistence_check_for_empty_source]
* is_persistence_delete_changed:
include::partial${docname}.adoc[tag=is_persistence_delete_changed]
* is_persistence_delete_missing:
include::partial${docname}.adoc[tag=is_persistence_delete_missing]
* is_persistence_insert:
include::partial${docname}.adoc[tag=is_persistence_insert]
* is_persistence_truncate:
include::partial${docname}.adoc[tag=is_persistence_truncate]
* is_persistence_update_changed:
include::partial${docname}.adoc[tag=is_persistence_update_changed]
* has_history:
include::partial${docname}.adoc[tag=has_history]
* has_history_columns:
include::partial${docname}.adoc[tag=has_history_columns]

endif::ExistsProperty--is_persistence,ExistsProperty--has_history,ExistsProperty--has_history_columns[]

' AS NVARCHAR(4000))

UNION ALL

SELECT [Parameter_name] = 'Adoc_AntoraPageTemplate'
 , [sub_Parameter] = N'2'
 , [Parameter_desciption] = N'template for Antora pages which gets Content via include from Partials, using tags. Attention! NVARCHAR(4000), use sub_Parameter for biger content - nvarchar(max) is incompatible with sql_variant'
 , [Parameter_default_value] = CAST(N'
== References

ifdef::ExistsProperty--AntoraReferencedList[]

=== Referenced Objects

include::partial${docname}.adoc[tag=AntoraReferencedList]
endif::ExistsProperty--AntoraReferencedList[]

ifdef::ExistsProperty--AntoraReferencingList[]

=== Referencing Objects

include::partial${docname}.adoc[tag=AntoraReferencingList]
endif::ExistsProperty--AntoraReferencingList[]

=== Column Reference Diagram

[plantuml, entity_1_1_colref-{docname}, svg]
....
include::partial$puml/entity_1_1_colref/{docname}.puml[]
....

ifdef::ExistsProperty--AntoraIndexList[]

== Indexes

include::partial${docname}.adoc[tag=AntoraIndexList]

endif::ExistsProperty--AntoraIndexList[]

ifdef::ExistsProperty--Columns[]

== Column Details

include::partial${docname}.adoc[tag=AntoraColumnDetails]

endif::ExistsProperty--Columns[]

ifdef::ExistsProperty--sql_modules_definition[]

== sql_modules_definition

.{docname} script
include::partial${docname}.adoc[tag=sql_modules_definition]
endif::ExistsProperty--sql_modules_definition[]

' AS NVARCHAR(4000))

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

