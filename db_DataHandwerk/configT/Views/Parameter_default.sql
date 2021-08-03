/*
<<property_start>>MS_Description
* default parameter values are defined (hard coded) in xref:sqldb:config.Parameter_default.adoc[] and available in xref:sqldb:config.Parameter.adoc#column-Parameter_default_value[config.Parameter.Parameter_default_value]
* default parameter values can be overwritten by project specific content using xref:sqldb:config.Parameter.adoc#column-Parameter_value[config.Parameter.Parameter_value]
* resulting content is available in
** xref:sqldb:config.Parameter.adoc#column-Parameter_value_result_int[+config.Parameter.Parameter_value__result_int+]
** xref:sqldb:config.Parameter.adoc#column-Parameter_value_result_nvarchar[+config.Parameter.Parameter_value__result_nvarchar+]
<<property_end>>

<<property_start>>exampleUsage
--merge this view into [config].[Parameter]:

EXEC [config].[usp_init_parameter]
<<property_end>>

<<property_start>>exampleUsage_2
--delete from [config].[Parameter], what not is defined here in this view (Dangerous: possible data loss)
--do not delete based on [sub_Parameter]!
--they can always be added in [config].[Parameter]!

DELETE T
FROM [config].[Parameter] T
WHERE NOT EXISTS (
  SELECT 1
  FROM [configT].[Parameter_default] S
  WHERE S.[Parameter_name] = T.[Parameter_name]
  )
<<property_end>>
*/
CREATE View [configT].[Parameter_default]
As
--
--first [Parameter_default_value] datatype should be SQL_VARIANT to avoid taye casting issues for other entries
Select
    Parameter_name          = 'DUMMY'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'dummy parameter, data type SQL_Variant'
  , Parameter_default_value = Cast(N'' As Sql_Variant)
Union All
Select
    Parameter_name          = 'dwh_database_name'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'The database name must be the same as the one used in the synonyms'
  , Parameter_default_value = Cast(N'master' As sysname)
Union All
Select
    Parameter_name          = 'dwh_readonly'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'when dwh_readonly is 1 then nothing should changed in the dwh database (insert, update, delete). RepoObject synchronization into dwh will not happen. References will not extracted, they use ExtendedProperties, for example in [repo_sys].[SysObject]'
  , Parameter_default_value = Cast(0 As TinyInt)
Union All
Select
    Parameter_name          = 'main enable usp_RepoObjectSource_FirstResultSet'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'execute (or not) usp_RepoObjectSource_FirstResultSet'
  , Parameter_default_value = 0
Union All
Select
    Parameter_name          = 'main enable usp_RepoObject_update_SysObjectQueryPlan'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'execute (or not) usp_RepoObject_update_SysObjectQueryPlan'
  , Parameter_default_value = 0
Union All
Select
    Parameter_name          = 'main enable usp_RepoObjectSource_QueryPlan'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'execute (or not) usp_RepoObjectSource_QueryPlan'
  , Parameter_default_value = 0
Union All
Select
    Parameter_name          = 'persistence_name_suffix'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'default suffix for persistence table which will be added to source object name'
  , Parameter_default_value = Cast(N'_T' As sysname)
Union All
Select
    Parameter_name          = 'Hist_ValidFrom_column_name'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'default column name for column - datetime2 GENERATED ALWAYS AS ROW START'
  , Parameter_default_value = Cast(N'ValidFrom' As sysname)
Union All
Select
    Parameter_name          = 'Hist_ValidTo_column_name'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'default column name for column - datetime2 GENERATED ALWAYS AS ROW END'
  , Parameter_default_value = Cast(N'ValidTo' As sysname)
Union All
Select
    Parameter_name          = 'Hist_Table_schema'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'default: NULL - The historization table uses the same schema as the table to be historized. otherwise the given schema is used'
  , Parameter_default_value = Null
Union All
Select
    Parameter_name          = 'Hist_Table_name_suffix'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'default suffix for historization table which will be added to historized object name'
  , Parameter_default_value = Cast(N'_hist' As sysname)
Union All
Select
    Parameter_name          = 'RepoObjectColumn_column_id_OrderBy'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'used in repo.usp_RepoObjectColumn__update_RepoObjectColumn_column_id to define the order of columns'
  , Parameter_default_value = Cast(N'
ISNULL([ic].[index_column_id] , 99999) --ensure PK index is sorted before other columns
, [roc].[Repo_is_computed] --computed columns after normal columns
, [roc].[Repo_is_identity] --IDENTITY columns after normal columns, because nothing should be inserted (they are like computed columns)
, [roc].[Repo_generated_always_type]
, [roc].[RepoObjectColumn_name]
' As NVarchar(4000))
--
--the following parameters can have [sub_Parameter]

Union All
Select
    Parameter_name          = 'Inheritance_StringAggSeparatorSql_column'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'if NULL then only one source is used for inheritance; if not NULL then STRING_AGG( expression, separator ) is used to aggregate all sources. Content is interpreted as TSQL. Good values are ''CHAR(13)+CHAR(10)'' or '''';'''''
  , Parameter_default_value = Cast(Null As NVarchar(4000))
Union All
Select
    Parameter_name          = 'Inheritance_StringAggSeparatorSql_column'
  , sub_Parameter           = N'ReferencedObjectColumnList'
  , Parameter_desciption    = N'if NULL then only one source is used for inheritance; if not NULL then STRING_AGG( expression, separator ) is used to aggregate all sources. Content is interpreted as TSQL. Good values are ''CHAR(13)+CHAR(10)'' or '''';'''''
  , Parameter_default_value = Cast(Char ( 13 ) + Char ( 10 ) As NVarchar(4000))
Union All
Select
    Parameter_name          = 'Inheritance_StringAggSeparatorSql_object'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'if NULL then only one source is used for inheritance; if not NULL then STRING_AGG( expression, separator ) is used to aggregate all sources. Content is interpreted as TSQL. Good values are ''CHAR(13)+CHAR(10)'' or '''';'''''
  , Parameter_default_value = Cast(Null As NVarchar(4000))
Union All
Select
    Parameter_name          = 'Inheritance_StringAggSeparatorSql_object'
  , sub_Parameter           = N'ReferencedObjectList'
  , Parameter_desciption    = N'if NULL then only one source is used for inheritance; if not NULL then STRING_AGG( expression, separator ) is used to aggregate all sources. Content is interpreted as TSQL. Good values are ''CHAR(13)+CHAR(10)'' or '''';'''''
  , Parameter_default_value = Cast(Char ( 13 ) + Char ( 10 ) As NVarchar(4000))
Union All
Select
    Parameter_name          = 'InheritanceDefinition_column'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'CONCAT arguments to be used with some specific values in [config].[InheritanceType], for example: ''[RepoObject_name],CHAR(13),CHAR(10),EineNochZuDefinierendeFunktion(''MS_Description'')'''
  , Parameter_default_value = Cast(Null As NVarchar(4000))
Union All
Select
    Parameter_name          = 'InheritanceDefinition_column'
  , sub_Parameter           = N'MS_Description'
  , Parameter_desciption    = N'CONCAT arguments to be used with some specific values in [config].[InheritanceType], for example: ''[RepoObject_name],CHAR(13),CHAR(10),EineNochZuDefinierendeFunktion(''MS_Description'')'''
  , Parameter_default_value = Cast('CAST(COALESCE(referencing.[Repo_definition], property.fs_get_RepoObjectColumnProperty_nvarchar(referenced.[RepoObjectColumn_guid], ''MS_Description'')) AS NVARCHAR(4000))' As NVarchar(4000))
Union All
Select
    Parameter_name          = 'InheritanceDefinition_column'
  , sub_Parameter           = N'ReferencedObjectColumnList'
  , Parameter_desciption    = N'CONCAT arguments to be used with some specific values in [config].[InheritanceType], for example: ''[RepoObject_name],CHAR(13),CHAR(10),EineNochZuDefinierendeFunktion(''MS_Description'')'''
  , Parameter_default_value = Cast('''* '' + referenced.[RepoObjectColumn_fullname]' As NVarchar(4000))
Union All
Select
    Parameter_name          = 'InheritanceDefinition_object'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'CONCAT arguments to be used with some specific values in [config].[InheritanceType], for example: ''[RepoObject_name],CHAR(13),CHAR(10),EineNochZuDefinierendeFunktion(''MS_Description'')'''
  , Parameter_default_value = Cast(Null As NVarchar(4000))
Union All
Select
    Parameter_name          = 'InheritanceDefinition_object'
  , sub_Parameter           = N'MS_Description'
  , Parameter_desciption    = N'CONCAT arguments to be used with some specific values in [config].[InheritanceType], for example: ''[RepoObject_name],CHAR(13),CHAR(10),EineNochZuDefinierendeFunktion(''MS_Description'')'''
  , Parameter_default_value = Cast(Null As NVarchar(4000))
Union All
Select
    Parameter_name          = 'InheritanceDefinition_object'
  , sub_Parameter           = N'ReferencedObjectList'
  , Parameter_desciption    = N'CONCAT arguments to be used with some specific values in [config].[InheritanceType], for example: ''[RepoObject_name],CHAR(13),CHAR(10),EineNochZuDefinierendeFunktion(''MS_Description'')'''
  , Parameter_default_value = Cast('''* '' + referenced.[RepoObject_fullname]' As NVarchar(4000))
Union All
Select
    Parameter_name          = 'InheritanceType_column'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'TINYINT; InheritanceType for column: possible values in [config].[InheritanceType]'
  , Parameter_default_value = Cast(0 As TinyInt)
Union All
Select
    Parameter_name          = 'InheritanceType_column'
  , sub_Parameter           = N'MS_Description'
  , Parameter_desciption    = N'TINYINT; InheritanceType for column: possible values in [config].[InheritanceType]'
  , Parameter_default_value = Cast(0 As TinyInt)
Union All
Select
    Parameter_name          = 'InheritanceType_column'
  , sub_Parameter           = N'ReferencedObjectColumnList'
  , Parameter_desciption    = N'TINYINT; InheritanceType for object: possible values in [config].[InheritanceType]'
  , Parameter_default_value = Cast(14 As TinyInt)
Union All
Select
    Parameter_name          = 'InheritanceType_object'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'TINYINT; InheritanceType for object: possible values in [config].[InheritanceType]'
  , Parameter_default_value = Cast(0 As TinyInt)
Union All
Select
    Parameter_name          = 'InheritanceType_object'
  , sub_Parameter           = N'MS_Description'
  , Parameter_desciption    = N'TINYINT; InheritanceType for object: possible values in [config].[InheritanceType]'
  , Parameter_default_value = Cast(0 As TinyInt)
Union All
Select
    Parameter_name          = 'InheritanceType_object'
  , sub_Parameter           = N'ReferencedObjectList'
  , Parameter_desciption    = N'TINYINT; InheritanceType for object: possible values in [config].[InheritanceType]'
  , Parameter_default_value = Cast(14 As TinyInt)

----todo: Warum sollte es eine Unterscheidung zwischen Sichten und Tabellen geben?
--UNION ALL

--SELECT [Parameter_name] = 'InheritanceType_object_type_u'
-- , [sub_Parameter] = N''
-- , [Parameter_desciption] = N'TINYINT; InheritanceType for object type U (user table): possible values in [config].[InheritanceType]'
-- , [Parameter_default_value] = CAST(0 AS TINYINT)

--UNION ALL

--SELECT [Parameter_name] = 'InheritanceType_object_type_u'
-- , [sub_Parameter] = N'MS_Description'
-- , [Parameter_desciption] = N'TINYINT; InheritanceType for object type U (user table): possible values in [config].[InheritanceType]'
-- , [Parameter_default_value] = CAST(0 AS TINYINT)


--UNION ALL

--SELECT [Parameter_name] = 'InheritanceType_object_type_v'
-- , [sub_Parameter] = N''
-- , [Parameter_desciption] = N'TINYINT; InheritanceType for object type V (view): possible values in [config].[InheritanceType]'
-- , [Parameter_default_value] = CAST(0 AS TINYINT)

--UNION ALL

--SELECT [Parameter_name] = 'InheritanceType_object_type_v'
-- , [sub_Parameter] = N'MS_Description'
-- , [Parameter_desciption] = N'TINYINT; InheritanceType for object type V (view): possible values in [config].[InheritanceType]'
-- , [Parameter_default_value] = CAST(0 AS TINYINT)


Union All
Select
    Parameter_name          = 'puml_skinparam_class'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'skinparam class for generated PlantUML files. <<xxx>> - object type, see: [config].[type]'
  , Parameter_default_value = Cast(N'
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
' As NVarchar(4000))
Union All
Select
    Parameter_name          = 'Adoc_AntoraDocModulFolder'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'Antora export folder, will be extended by ''partials\'', ''pages\'', ''examples\'', ''images\'' and so on'
  , Parameter_default_value = Cast(N'D:\Repos\GitHub\MyOrganisation\MyProject-docs\docs\modules\sqldb\' As NVarchar(4000))
Union All
Select
    Parameter_name          = 'Adoc_AntoraPageTemplate'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'content of an final Antora Page'
  , Parameter_default_value = Cast(N'
include::partial$template/master-page-1.adoc[]
include::partial$template/master-page-examples.adoc[]
include::partial$template/master-page-4.adoc[]
include::partial$template/master-page-5.adoc[]
' As NVarchar(4000))
Union All
Select
    Parameter_name          = 'Adoc_AntoraPageTemplate'
  , sub_Parameter           = N'1'
  , Parameter_desciption    = N'template for Antora pages which gets Content via include from Partials, using tags. Attention! NVARCHAR(4000), use sub_Parameter for biger content - nvarchar(max) is incompatible with sql_variant'
  , Parameter_default_value = Cast(N'= {docname}

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

include::partial${docname}.adoc[tag=ms_description]

endif::ExistsProperty--ms_description[]
' As NVarchar(4000))
Union All
Select
    Parameter_name          = 'Adoc_AntoraPageTemplate'
  , sub_Parameter           = N'4'
  , Parameter_desciption    = N'template for Antora pages which gets Content via include from Partials, using tags. Attention! NVARCHAR(4000), use sub_Parameter for biger content - nvarchar(max) is incompatible with sql_variant'
  , Parameter_default_value = Cast(N'
ifdef::ExistsProperty--AntoraParameterList[]

== Parameters

include::partial${docname}.adoc[tag=AntoraParameterList]

endif::ExistsProperty--AntoraParameterList[]

ifdef::ExistsProperty--adocuspsteps[]

== Procedure steps

include::partial${docname}.adoc[tag=adocuspsteps]

endif::ExistsProperty--adocuspsteps[]

//ifdef::ExistsProperty--pk_index_guid[]
//
//== PK
//
//PK SemanticGroup:
//include::partial${docname}.adoc[tag=pk_indexsemanticgroup]
//
//PK Column Name(s):
//include::partial${docname}.adoc[tag=pk_indexpatterncolumnname]
//
//PK Column Datatype(s):
//include::partial${docname}.adoc[tag=pk_indexpatterncolumndatatype]
//
//.PK columns of {docname}
//[cols="d,m,m,m,m,d"]
//|===
//|PK|Column Name|Data Type|NULL?|ID|Calc
//
//include::partial${docname}.adoc[tag=AntoraPkColumnTableRows]
//
//|===
//
//endif::ExistsProperty--pk_index_guid[]

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
include::partial${docname}.adoc[tag=persistence_source_repoobject_xref]
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

ifdef::ExistsProperty--FK[]

== Foreign Key Diagram

[plantuml, entity_1_1_fk-{docname}, svg]
....
include::partial$puml/entity_1_1_fk/{docname}.puml[]
....

endif::ExistsProperty--FK[]
' As NVarchar(4000))
Union All
Select
    Parameter_name          = 'Adoc_AntoraPageTemplate'
  , sub_Parameter           = N'5'
  , Parameter_desciption    = N'template for Antora pages which gets Content via include from Partials, using tags. Attention! NVARCHAR(4000), use sub_Parameter for biger content - nvarchar(max) is incompatible with sql_variant'
  , Parameter_default_value = Cast(N'

== References

ifdef::ExistsProperty--antorareferencedlist[]

=== Referenced Objects

include::partial${docname}.adoc[tag=antorareferencedlist]
endif::ExistsProperty--antorareferencedlist[]

ifdef::ExistsProperty--antorareferencinglist[]

=== Referencing Objects

include::partial${docname}.adoc[tag=antorareferencinglist]
endif::ExistsProperty--antorareferencinglist[]

=== Object Reference Diagram

[plantuml, entity_1_1_objectref-{docname}, svg]
....
include::partial$puml/entity_1_1_objectref/{docname}.puml[]
....

=== Object Reference Diagram - Referenced

[plantuml, entity_30_0_objectref-{docname}, svg]
....
include::partial$puml/entity_30_0_objectref/{docname}.puml[]
....

=== Object Reference Diagram - Referencing

[plantuml, entity_0_30_objectref-{docname}, svg]
....
include::partial$puml/entity_0_30_objectref/{docname}.puml[]
....

ifdef::ExistsProperty--Columns[]

=== Column Reference Diagram

[plantuml, entity_1_1_colref-{docname}, svg]
....
include::partial$puml/entity_1_1_colref/{docname}.puml[]
....

endif::ExistsProperty--Columns[]

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
' As NVarchar(4000))

Union All
Select
    Parameter_name          = 'Adoc_AntoraDocSnippet'
  , sub_Parameter           = N'antora-export-prerequisites'
  , Parameter_desciption    = N'Documentation snippet for Antora export documentation.'
  , Parameter_default_value = Cast(N'
[discrete]
=== Prerequisites

* export folders should exist, no error message is generated, if they are missing
+
[source,sql]
----
SELECT [config].[fs_get_parameter_value](''Adoc_AntoraDocModulFolder'', '''')
+ ''pages\''
UNION ALL
SELECT [config].[fs_get_parameter_value](''Adoc_AntoraDocModulFolder'', '''')
+ ''pages\index\''
UNION ALL
SELECT [config].[fs_get_parameter_value](''Adoc_AntoraDocModulFolder'', '''')
+ ''pages\nav\''
UNION ALL
SELECT [config].[fs_get_parameter_value](''Adoc_AntoraDocModulFolder'', '''')
+ ''partials\docsnippet\''
UNION ALL
SELECT [config].[fs_get_parameter_value](''Adoc_AntoraDocModulFolder'', '''')
+ ''partials\navlist\''
UNION ALL
SELECT [config].[fs_get_parameter_value](''Adoc_AntoraDocModulFolder'', '''')
+ ''partials\puml\entity_0_30_objectref\''
UNION ALL
SELECT [config].[fs_get_parameter_value](''Adoc_AntoraDocModulFolder'', '''')
+ ''partials\puml\entity_1_1_colref\''
UNION ALL
SELECT [config].[fs_get_parameter_value](''Adoc_AntoraDocModulFolder'', '''')
+ ''partials\puml\entity_1_1_fk\''
UNION ALL
SELECT [config].[fs_get_parameter_value](''Adoc_AntoraDocModulFolder'', '''')
+ ''partials\puml\entity_1_1_objectref\''
UNION ALL
SELECT [config].[fs_get_parameter_value](''Adoc_AntoraDocModulFolder'', '''')
+ ''partials\puml\entity_30_0_objectref\''
UNION ALL
SELECT [config].[fs_get_parameter_value](''Adoc_AntoraDocModulFolder'', '''')
+ ''partials\template\''
----
+
* uses `xp_cmdshell`, to call `bcp`, you need to enable:
+
====
[source,sql]
----
--before executing the procedure:
--Temporarily or permanently enable xp_cmdshell
sp_configure ''show advanced options''
 , 1;

RECONFIGURE
GO

sp_configure ''xp_cmdshell''
 , 1;

RECONFIGURE
GO

EXEC docs.usp_AntoraExport

--you can also disable later again:
--Disable xp_cmdshell
sp_configure ''xp_cmdshell''
 , 0

RECONFIGURE
GO

sp_configure ''show advanced options''
 , 0

RECONFIGURE
GO
----
====
' As NVarchar(4000))
;

Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'dd8f291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'configT'
  , @level1type = N'VIEW'
  , @level1name = N'Parameter_default';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '83f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'configT'
  , @level1type = N'VIEW'
  , @level1name = N'Parameter_default'
  , @level2type = N'COLUMN'
  , @level2name = N'sub_Parameter';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '82f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'configT'
  , @level1type = N'VIEW'
  , @level1name = N'Parameter_default'
  , @level2type = N'COLUMN'
  , @level2name = N'Parameter_name';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '84f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'configT'
  , @level1type = N'VIEW'
  , @level1name = N'Parameter_default'
  , @level2type = N'COLUMN'
  , @level2name = N'Parameter_desciption';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '85f17926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'configT'
  , @level1type = N'VIEW'
  , @level1name = N'Parameter_default'
  , @level2type = N'COLUMN'
  , @level2name = N'Parameter_default_value';

