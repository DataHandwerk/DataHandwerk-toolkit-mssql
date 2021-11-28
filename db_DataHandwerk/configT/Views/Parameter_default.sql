﻿
/*
<<property_start>>Description
include::sqldb:partial$descriptiontags/config.parameter.adoc[tag=description,opts=optional]
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

/*
<<property_start>>additional_reference_csv
dhw,sqldb,configT,Parameter_default,Parameter_name,dhw,sqldb,config,Parameter,Parameter_name
dhw,sqldb,configT,Parameter_default,sub_Parameter,dhw,sqldb,config,Parameter,sub_Parameter
dhw,sqldb,configT,Parameter_default,Parameter_desciption,dhw,sqldb,config,Parameter,Parameter_desciption
dhw,sqldb,configT,Parameter_default,Parameter_default_value,dhw,sqldb,config,Parameter,Parameter_default_value
<<property_end>>
*/

CREATE View configT.Parameter_default
As
--
--first [Parameter_default_value] datatype should be SQL_VARIANT to avoid taye casting issues for other entries
Select
    Parameter_name          = 'DUMMY'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'dummy parameter'
  , Parameter_default_value = Cast(N'' As NVarchar(Max))
Union All
Select
    Parameter_name          = 'dwh_database_name'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'The database name must be the same as the one used in the synonyms'
  , Parameter_default_value = N'master'
Union All
Select
    Parameter_name          = 'dwh_readonly'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'when dwh_readonly is 1 then nothing should changed in the dwh database (insert, update, delete). RepoObject synchronization into dwh will not happen. References will not extracted, they use ExtendedProperties, for example in [repo_sys].[SysObject]'
  , Parameter_default_value = '1'
Union All
Select
    Parameter_name          = 'main enable usp_RepoObjectSource_FirstResultSet'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'execute (or not) usp_RepoObjectSource_FirstResultSet'
  , Parameter_default_value = '0'
Union All
Select
    Parameter_name          = 'main enable usp_RepoObject_update_SysObjectQueryPlan'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'execute (or not) usp_RepoObject_update_SysObjectQueryPlan'
  , Parameter_default_value = '0'
Union All
Select
    Parameter_name          = 'main enable usp_RepoObjectSource_QueryPlan'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'execute (or not) usp_RepoObjectSource_QueryPlan'
  , Parameter_default_value = '0'
Union All
Select
    Parameter_name          = 'sync enable'
  , sub_Parameter           = N'dwh'
  , Parameter_desciption    = N'enable sync with dwh_database_name'
  , Parameter_default_value = '1'
Union All
Select
    Parameter_name          = 'sync enable'
  , sub_Parameter           = N'ssas'
  , Parameter_desciption    = N'enable sync with ssas (read only, just for documentation). Best is to use a separate repository for ssas because of possible naming conflicts'
  , Parameter_default_value = '0'
Union All
Select
    Parameter_name          = 'sync enable'
  , sub_Parameter           = N'ssis'
  , Parameter_desciption    = N'enable sync with ssis (read only, just for documentation)'
  , Parameter_default_value = '0'
Union All
Select
    Parameter_name          = 'persistence_name_suffix'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'default suffix for persistence table which will be added to source object name'
  , Parameter_default_value = N'_T'
Union All
Select
    Parameter_name          = 'Hist_ValidFrom_column_name'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'default column name for column - datetime2 GENERATED ALWAYS AS ROW START'
  , Parameter_default_value = N'SysStartTime'
Union All
Select
    Parameter_name          = 'Hist_ValidTo_column_name'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'default column name for column - datetime2 GENERATED ALWAYS AS ROW END'
  , Parameter_default_value = N'SysEndTime'
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
  , Parameter_default_value = N'_hist'
Union All
Select
    Parameter_name          = 'RepoObjectColumn_column_id_OrderBy'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'used in repo.usp_RepoObjectColumn__update_RepoObjectColumn_column_id to define the order of columns'
  , Parameter_default_value = N'
ISNULL([ic].[index_column_id] , 99999) --ensure PK index is sorted before other columns
, [roc].[Repo_is_computed] --computed columns after normal columns
, [roc].[Repo_is_identity] --IDENTITY columns after normal columns, because nothing should be inserted (they are like computed columns)
, [roc].[Repo_generated_always_type]
, [roc].[RepoObjectColumn_name]
'
--
--the following parameters can have [sub_Parameter]
Union All
Select
    Parameter_name          = 'Inheritance_StringAggSeparatorSql_column'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'if NULL then only one source is used for inheritance; if not NULL then STRING_AGG( expression, separator ) is used to aggregate all sources. Content is interpreted as TSQL. Good values are ''CHAR(13)+CHAR(10)'' or '''';'''''
  , Parameter_default_value = Null
Union All
Select
    Parameter_name          = 'Inheritance_StringAggSeparatorSql_column'
  , sub_Parameter           = N'ReferencedObjectColumnList'
  , Parameter_desciption    = N'if NULL then only one source is used for inheritance; if not NULL then STRING_AGG( expression, separator ) is used to aggregate all sources. Content is interpreted as TSQL. Good values are ''CHAR(13)+CHAR(10)'' or '''';'''''
  , Parameter_default_value = Char ( 13 ) + Char ( 10 )
Union All
Select
    Parameter_name          = 'Inheritance_StringAggSeparatorSql_object'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'if NULL then only one source is used for inheritance; if not NULL then STRING_AGG( expression, separator ) is used to aggregate all sources. Content is interpreted as TSQL. Good values are ''CHAR(13)+CHAR(10)'' or '''';'''''
  , Parameter_default_value = Null
Union All
Select
    Parameter_name          = 'Inheritance_StringAggSeparatorSql_object'
  , sub_Parameter           = N'ReferencedObjectList'
  , Parameter_desciption    = N'if NULL then only one source is used for inheritance; if not NULL then STRING_AGG( expression, separator ) is used to aggregate all sources. Content is interpreted as TSQL. Good values are ''CHAR(13)+CHAR(10)'' or '''';'''''
  , Parameter_default_value = Char ( 13 ) + Char ( 10 )
Union All
Select
    Parameter_name          = 'InheritanceDefinition_column'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'CONCAT arguments to be used with some specific values in [config].[InheritanceType], for example: ''[RepoObject_name],CHAR(13),CHAR(10),EineNochZuDefinierendeFunktion(''Description'')'''
  , Parameter_default_value = Null
Union All
Select
    Parameter_name          = 'InheritanceDefinition_column'
  , sub_Parameter           = N'Description'
  , Parameter_desciption    = N'CONCAT arguments to be used with some specific values in [config].[InheritanceType], for example: ''[RepoObject_name],CHAR(13),CHAR(10),EineNochZuDefinierendeFunktion(''Description'')'''
  , Parameter_default_value = 'CAST(COALESCE(referencing.[Repo_definition], property.fs_get_RepoObjectColumnProperty_nvarchar(referenced.[RepoObjectColumn_guid], ''Description'')) AS NVARCHAR(MAX))'
Union All
Select
    Parameter_name          = 'InheritanceDefinition_column'
  , sub_Parameter           = N'ReferencedObjectColumnList'
  , Parameter_desciption    = N'CONCAT arguments to be used with some specific values in [config].[InheritanceType], for example: ''[RepoObject_name],CHAR(13),CHAR(10),EineNochZuDefinierendeFunktion(''Description'')'''
  , Parameter_default_value = '''* '' + referenced.[RepoObjectColumn_fullname]'
Union All
Select
    Parameter_name          = 'InheritanceDefinition_object'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'CONCAT arguments to be used with some specific values in [config].[InheritanceType], use sup_Parameter for specific logic'
  , Parameter_default_value = Null
Union All
Select
    Parameter_name          = 'InheritanceDefinition_object'
  , sub_Parameter           = N'Description'
  , Parameter_desciption    = N'CONCAT arguments, for example: ''property.fs_get_RepoObjectProperty_nvarchar(referenced.[RepoObject_guid],''Description'') + CHAR(13)+CHAR(10)+''''''+CHAR(13)+CHAR(10)'''
  , Parameter_default_value = Null
Union All
Select
    Parameter_name          = 'InheritanceDefinition_object'
  , sub_Parameter           = N'ReferencedObjectList'
  , Parameter_desciption    = N'CONCAT arguments to be used with some specific values in [config].[InheritanceType], for example: ''''* '''' + referenced.[RepoObject_fullname]'
  , Parameter_default_value = '''* '' + referenced.[RepoObject_fullname]'
Union All
Select
    Parameter_name          = 'InheritanceType_column'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'TINYINT; InheritanceType for column: possible values in [config].[InheritanceType]'
  , Parameter_default_value = '0'
Union All
Select
    Parameter_name          = 'InheritanceType_column'
  , sub_Parameter           = N'Description'
  , Parameter_desciption    = N'TINYINT; InheritanceType for column: possible values in [config].[InheritanceType]'
  , Parameter_default_value = '0'
Union All
Select
    Parameter_name          = 'InheritanceType_column'
  , sub_Parameter           = N'ReferencedObjectColumnList'
  , Parameter_desciption    = N'TINYINT; InheritanceType for object: possible values in [config].[InheritanceType]'
  , Parameter_default_value = '14'
Union All
Select
    Parameter_name          = 'InheritanceType_object'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'TINYINT; InheritanceType for object: possible values in [config].[InheritanceType]'
  , Parameter_default_value = '0'
Union All
Select
    Parameter_name          = 'InheritanceType_object'
  , sub_Parameter           = N'Description'
  , Parameter_desciption    = N'TINYINT; InheritanceType for object: possible values in [config].[InheritanceType]'
  , Parameter_default_value = '0'
Union All
Select
    Parameter_name          = 'InheritanceType_object'
  , sub_Parameter           = N'ReferencedObjectList'
  , Parameter_desciption    = N'TINYINT; InheritanceType for object: possible values in [config].[InheritanceType]'
  , Parameter_default_value = '14'
Union All
Select
    Parameter_name          = 'sqlpackage'
  , sub_Parameter           = N'ProgrammFolder'
  , Parameter_desciption    = N'Folder, where sqlpackage.exe is located'
  , Parameter_default_value = 'C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\Extensions\Microsoft\SQLDB\DAC\150'
Union All
Select
    Parameter_name          = 'sqlpackage'
  , sub_Parameter           = N'TargetFolder'
  , Parameter_desciption    = N'default Folder, where dacpac should be extracted'
  , Parameter_default_value = 'D:\Repos\aaa\bbb\ccc\dhw_dacpac'
Union All
Select
    Parameter_name          = 'puml_skinparam_class'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'skinparam class for generated PlantUML files. <<xxx>> - object type, see: [config].[type]'
  , Parameter_default_value = N'
skinparam class {
  BackgroundColor White
  BackgroundColor<<FN>> Yellow
  BackgroundColor<<FS>> Yellow
  BackgroundColor<<FT>> LightGray
  BackgroundColor<<IF>> Yellow
  BackgroundColor<<IS>> Yellow
  BackgroundColor<<P>>  Aqua
  BackgroundColor<<PC>> Aqua
  BackgroundColor<<SN>> Yellow
  BackgroundColor<<SO>> SlateBlue
  BackgroundColor<<TF>> LightGray
  BackgroundColor<<TR>> Tomato
  BackgroundColor<<U>>  White
  BackgroundColor<<V>>  WhiteSmoke
  BackgroundColor<<X>>  Aqua
  BackgroundColor<<external>> AliceBlue
}
'
Union All
Select
    Parameter_name          = 'puml_skinparam_component'
  , sub_Parameter           = N'ssis_task'
  , Parameter_desciption    = N'skinparam component for generated PlantUML files for SSIS task components.'
  , Parameter_default_value = N'
skinparam component {
    backgroundColor<<Microsoft.ASExecuteDDLTask>>   Aqua
    backgroundColor<<Microsoft.DTSProcessingTask>>  DeepSkyBlue
    backgroundColor<<Microsoft.ExecutePackageTask>> Yellow
    backgroundColor<<Microsoft.ExecuteSQLTask>>     Khaki
    backgroundColor<<Microsoft.ExpressionTask>>     Pink
    backgroundColor<<Microsoft.Pipeline>>           LightCyan
    backgroundColor<<Microsoft.ScriptTask>>         LightGreen
    backgroundColor<<STOCK:FOREACHLOOP>>            LightGray
    backgroundColor<<STOCK:SEQUENCE>>               White
}
'
Union All
Select
    Parameter_name          = 'puml_footer'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'footer content for PlantUML diagrams, needs to be valid. Syntax: "footer whatever content of the footer"'
  , Parameter_default_value = N''
Union All
Select
    Parameter_name          = 'puml_footer'
  , sub_Parameter           = N'interactive'
  , Parameter_desciption    = N'footer content for PlantUML diagrams, needs to be valid. Syntax: "footer whatever content of the footer"'
  , Parameter_default_value = N'footer The diagram is interactive and contains links.'
Union All
Select
    Parameter_name          = 'AntoraComponent'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'Antora: component name, defined in Antora.yml in the Antora component folder (the folder, containing the folder ''modules'').'
  , Parameter_default_value = N'mycomponent'
Union All
Select
    Parameter_name          = 'AntoraComponentFolder'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'Antora component folder (the folder, containing the folder ''modules''), will be extended by ''\modules\'' AntoraModule and on next level by ''partials\'', ''pages\'', ''examples\'', ''images\'''
  , Parameter_default_value = N'D:\Repos\GitHub\MyOrganisation\MyProject-docs\docs'
Union All
Select
    Parameter_name          = 'AntoraModule'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'Antora: named modul to contain the exported documentation; not used for ssis documentation, which is configured in [ssis].[Project]'
  , Parameter_default_value = N'sqldb'
Union All
Select
    Parameter_name          = 'AntoraDeleteFilesInModuleFolders'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'delete all files in the subfolder pages and partials; we need to delete in these subfolders to keep the file nav.doc'
  , Parameter_default_value = N'0'
Union All
Select
    Parameter_name          = 'AntoraSiteUrl'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'Antora: Site Url to be used in docs.unit to create links to docs. examples: https://DataHandwerk.gitlab.io file:///D:/Repos/gitlab/DataHandwerk/datahandwerk.gitlub.io/local'
  , Parameter_default_value = N'https://docs.myproject.io'
Union All
Select
    Parameter_name          = 'AntoraVersion'
  , sub_Parameter           = N''
  , Parameter_desciption    = N'maybe this is obsolete! Antora: define a specific version required in the URL; or use playbook settings urls: latest_version_segment: current'
  , Parameter_default_value = N'current'
Union All
Select
    Parameter_name          = 'AntoraPageTemplate'
  , sub_Parameter           = N'object_page_content'
  , Parameter_desciption    = N'content of an final Antora Page'
  , Parameter_default_value =
  --we need to avoid lines starting with 'include'
  --  'include::partial$template/master-page-1.adoc[]
  --include::partial$template/master-page-examples.adoc[]
  --include::partial$template/master-page-4.adoc[]
  --include::partial$template/master-page-5_references.adoc[]
  --include::partial$template/master-page-6.adoc[]
  --'
  Concat (
             Cast(N'' As NVarchar(Max))
           , 'include::partial$template/master-page-1.adoc[]' + Char ( 13 ) + Char ( 10 )
           , 'include::partial$template/master-page-examples.adoc[]' + Char ( 13 ) + Char ( 10 )
           , 'include::partial$template/master-page-4.adoc[]' + Char ( 13 ) + Char ( 10 )
           , 'include::partial$template/master-page-5_references.adoc[]' + Char ( 13 ) + Char ( 10 )
           , 'include::partial$template/master-page-6.adoc[]' + Char ( 13 ) + Char ( 10 )
         )
Union All
Select
    Parameter_name          = 'AntoraPageTemplate'
  , sub_Parameter           = N'1'
  , Parameter_desciption    = N'template for Antora pages which gets Content via include from Partials, using tags.'
  , Parameter_default_value =
  --
  'include::partial$content/{docname}.adoc[tag=HeaderFullDisplayName]
' + 'include::partial$content/{docname}.adoc[tag=existing_properties]
' + 'include::partial$content/{docname}.adoc[tag=boolean_attributes]

type:
' + 'include::partial$content/{docname}.adoc[tag=SysObject_type]
(
' + 'include::partial$content/{docname}.adoc[tag=SysObject_type_name]
), modify_date:
' + 'include::partial$content/{docname}.adoc[tag=SysObject_modify_date]

RepoObject_guid:
' + 'include::partial$content/{docname}.adoc[tag=RepoObject_guid]

' + 'ifdef::is_repo_managed[]
is_repo_managed: 1
' + 'endif::is_repo_managed[]

' + 'ifdef::is_ssas[]
is_ssas: 1

== Translations

' + 'include::partial$content/{docname}.adoc[tag=AntoraXrefCulturesList]

' + 'endif::is_ssas[]

' + 'ifdef::ExistsProperty--uspgenerator_usp_id[]
uspgenerator_usp_id:
' + 'include::partial$content/{docname}.adoc[tag=uspgenerator_usp_id]

' + 'endif::ExistsProperty--uspgenerator_usp_id[]
' + 'ifdef::ExistsProperty--inheritancetype[]
InheritanceType:
' + 'include::partial$content/{docname}.adoc[tag=inheritancetype]

' + 'endif::ExistsProperty--inheritancetype[]

== Description

' + 'include::partial$descriptiontags/{docname}.adoc[tag=description,opts=optional]

//the following attribute could be set in the include above to enable or disable the usage of exported descriptions
' + 'ifndef::hide-exported-description[]

' + 'include::partial$content/{docname}.adoc[tag=description,opts=optional]

' + 'endif::hide-exported-description[]

'
Union All
Select
    Parameter_name          = 'AntoraPageTemplate'
  , sub_Parameter           = N'4'
  , Parameter_desciption    = N'template for Antora pages which gets Content via include from Partials, using tags.'
  , Parameter_default_value =
  --
  'ifdef::ExistsProperty--AntoraParameterList[]

== Parameters

' + 'include::partial$content/{docname}.adoc[tag=AntoraParameterList]

' + 'endif::ExistsProperty--AntoraParameterList[]

' + 'ifdef::ExistsProperty--adocuspsteps[]

== Procedure steps

uspgenerator_usp_id:
' + 'include::partial$content/{docname}.adoc[tag=uspgenerator_usp_id]

' + 'include::partial$content/{docname}.adoc[tag=adocuspsteps]

' + 'endif::ExistsProperty--adocuspsteps[]

//ifdef::ExistsProperty--pk_index_guid[]
//
//== PK
//
//PK SemanticGroup:
//include::partial$content/{docname}.adoc[tag=pk_indexsemanticgroup]
//
//PK Column Name(s):
//include::partial$content/{docname}.adoc[tag=pk_indexpatterncolumnname]
//
//PK Column Datatype(s):
//include::partial$content/{docname}.adoc[tag=pk_indexpatterncolumndatatype]
//
//.PK columns of {docname}
//[cols="d,8m,m,m,m,d"]
//|===
//|PK|Column Name|Data Type|NULL?|ID|Calc
//
//include::partial$content/{docname}.adoc[tag=AntoraPkColumnTableRows]
//
//|===
//
//endif::ExistsProperty--pk_index_guid[]

== Entity Diagram

' + 'include::partial$content/{docname}.adoc[tag=puml_entity,opts=optional]

//[plantuml, entity-{docname}, svg, subs=macros]
//....
//include::partial$puml/entity/{docname}.puml[]
//....

' + 'ifdef::ExistsProperty--Columns[]

== Columns

.Columns of {doctitle}
[cols="d,8m,m,m,m,d"]
|===
|PK|Column Name|Data Type|NULL?|ID|Calc

' + 'include::partial$content/{docname}.adoc[tag=AntoraPkColumnTableRows]

' + 'include::partial$content/{docname}.adoc[tag=AntoraNonPkColumnTableRows]

|===

' + 'endif::ExistsProperty--Columns[]

' + 'ifdef::ExistsProperty--is_persistence,ExistsProperty--has_history,ExistsProperty--has_history_columns[]

== Persistence, History Table

* persistence source:
' + 'include::partial$content/{docname}.adoc[tag=persistence_source_repoobject_xref]
* is_persistence:
' + 'include::partial$content/{docname}.adoc[tag=is_persistence]
* is_persistence_check_duplicate_per_pk:
' + 'include::partial$content/{docname}.adoc[tag=is_persistence_check_duplicate_per_pk]
* is_persistence_check_for_empty_source:
' + 'include::partial$content/{docname}.adoc[tag=is_persistence_check_for_empty_source]
* is_persistence_delete_changed:
' + 'include::partial$content/{docname}.adoc[tag=is_persistence_delete_changed]
* is_persistence_delete_missing:
' + 'include::partial$content/{docname}.adoc[tag=is_persistence_delete_missing]
* is_persistence_insert:
' + 'include::partial$content/{docname}.adoc[tag=is_persistence_insert]
* is_persistence_truncate:
' + 'include::partial$content/{docname}.adoc[tag=is_persistence_truncate]
* is_persistence_update_changed:
' + 'include::partial$content/{docname}.adoc[tag=is_persistence_update_changed]
* has_history:
' + 'include::partial$content/{docname}.adoc[tag=has_history]
* has_history_columns:
' + 'include::partial$content/{docname}.adoc[tag=has_history_columns]

' + 'endif::ExistsProperty--is_persistence,ExistsProperty--has_history,ExistsProperty--has_history_columns[]

' + 'ifndef::is_ssas[]
' + 'ifdef::ExistsProperty--FK[]

== Foreign Key Diagram

' + 'include::partial$content/{docname}.adoc[tag=puml_entity_1_1_fk,opts=optional]

//[plantuml, entity_1_1_fk-{docname}, svg, subs=macros]
//....
//include::partial$puml/entity_1_1_fk/{docname}.puml[]
//....

' + 'endif::ExistsProperty--FK[]
' + 'endif::is_ssas[]

'
Union All
Select
    Parameter_name          = 'AntoraPageTemplate'
  , sub_Parameter           = N'5_references'
  , Parameter_desciption    = N'template for Antora pages which gets Content via include from Partials, using tags.'
  , Parameter_default_value =
  --
  '
== References

' + 'ifdef::ExistsProperty--antorareferencedlist[]

=== Referenced Objects

' + 'include::partial$content/{docname}.adoc[tag=antorareferencedlist]
' + 'endif::ExistsProperty--antorareferencedlist[]

' + 'ifdef::ExistsProperty--antorareferencinglist[]

=== Referencing Objects

' + 'include::partial$content/{docname}.adoc[tag=antorareferencinglist]
' + 'endif::ExistsProperty--antorareferencinglist[]

=== Object Reference Diagram - 1 1

' + 'include::partial$content/{docname}.adoc[tag=puml_entity_1_1_objectref,opts=optional]

//[plantuml, entity_1_1_objectref-{docname}, svg, subs=macros]
//....
//include::partial$puml/entity_1_1_objectref/{docname}.puml[]
//....

' + 'ifndef::is_ssas[]

=== Object Reference Diagram - Referenced - 30 0

' + 'include::partial$content/{docname}.adoc[tag=puml_entity_30_0_objectref,opts=optional]

//[plantuml, entity_30_0_objectref-{docname}, svg, subs=macros]
//....
//include::partial$puml/entity_30_0_objectref/{docname}.puml[]
//....

=== Object Reference Diagram - Referencing - 0 30

' + 'include::partial$content/{docname}.adoc[tag=puml_entity_0_30_objectref,opts=optional]

//[plantuml, entity_0_30_objectref-{docname}, svg, subs=macros]
//....
//include::partial$puml/entity_0_30_objectref/{docname}.puml[]
//....

' + 'endif::is_ssas[]
' + 'ifdef::ExistsProperty--Columns[]

=== Column Reference Diagram

' + 'include::partial$content/{docname}.adoc[tag=puml_entity_1_1_colref,opts=optional]

//[plantuml, entity_1_1_colref-{docname}, svg, subs=macros]
//....
//include::partial$puml/entity_1_1_colref/{docname}.puml[]
//....

' + 'endif::ExistsProperty--Columns[]

'
Union All
Select
    Parameter_name          = 'AntoraPageTemplate'
  , sub_Parameter           = N'6'
  , Parameter_desciption    = N'template for Antora pages which gets Content via include from Partials, using tags.'
  , Parameter_default_value =
  --
  '

' + 'ifdef::ExistsProperty--AntoraIndexList[]

== Indexes

' + 'include::partial$content/{docname}.adoc[tag=AntoraIndexList]

' + 'endif::ExistsProperty--AntoraIndexList[]

' + 'ifdef::ExistsProperty--Columns[]

== Column Details

' + 'include::partial$content/{docname}.adoc[tag=AntoraColumnDetails]

' + 'endif::ExistsProperty--Columns[]

' + 'ifdef::ExistsProperty--Measures[]

== Measure Details

' + 'include::partial$content/{docname}.adoc[tag=AntoraMeasureDetails]

' + 'endif::ExistsProperty--Measures[]

' + 'ifdef::ExistsProperty--sql_modules_definition[]

== sql_modules_definition

.{doctitle} script
' + 'include::partial$content/{docname}.adoc[tag=sql_modules_definition]
' + 'endif::ExistsProperty--sql_modules_definition[]
'
Union All
Select
    Parameter_name          = 'AntoraPageTemplate'
  , sub_Parameter           = N'ssis_page_content'
  , Parameter_desciption    = N'content of an final Antora Page for ssis package documentation'
  , Parameter_default_value =
  --
  'include::partial$template/master-page-ssis.adoc[]
'
Union All
Select
    Parameter_name          = 'AntoraPageTemplate'
  , sub_Parameter           = N'ssis'
  , Parameter_desciption    = N'template for Antora pages which gets Content via include from Partials, using tags.'
  , Parameter_default_value =
  --
  'include::partial$content/{docname}.adoc[tag=HeaderFullDisplayName]

== Package Properties

' + 'include::partial$content/{docname}.adoc[tag=GeneralList]

== Description

' + 'include::partial$content/{docname}.adoc[tag=PackageDescription]

== Control Flow Diagram

' + 'include::partial$content/{docname}.adoc[tag=PumlPackageControlFlows]

== Tasks

' + 'include::partial$content/{docname}.adoc[tag=TaskList]

== Parameters

' + 'include::partial$content/{docname}.adoc[tag=ParameterList]

== Variables

' + 'include::partial$content/{docname}.adoc[tag=VariableList]

== Project Connections

' + 'include::partial$content/{docname}.adoc[tag=ProjectConnectionList]

== Package Connections

' + 'include::partial$content/{docname}.adoc[tag=ConnectionList]

'

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'dd8f291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'Parameter_default';


GO



GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'Parameter_name,sub_Parameter', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'Parameter_default';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'varchar(52),nvarchar(27)', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'Parameter_default';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'14E2E7E8-FB95-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'Parameter_default';


GO



GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'Parameter_default';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'Parameter_default';


GO
EXECUTE sp_addextendedproperty @name = N'exampleUsage_2', @value = N'
--delete from [config].[Parameter], what not is defined here in this view (Dangerous: possible data loss)
--do not delete based on [sub_Parameter]!
--they can always be added in [config].[Parameter]!

DELETE T
FROM [config].[Parameter] T
WHERE NOT EXISTS (
  SELECT 1
  FROM [configT].[Parameter_default] S
  WHERE S.[Parameter_name] = T.[Parameter_name]
  )', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'Parameter_default';


GO
EXECUTE sp_addextendedproperty @name = N'exampleUsage', @value = N'
--merge this view into [config].[Parameter]:

EXEC [config].[usp_init_parameter]', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'Parameter_default';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:config.usp_init_parameter.adoc[]', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'Parameter_default';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '83f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'Parameter_default', @level2type = N'COLUMN', @level2name = N'sub_Parameter';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '82f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'Parameter_default', @level2type = N'COLUMN', @level2name = N'Parameter_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '84f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'Parameter_default', @level2type = N'COLUMN', @level2name = N'Parameter_desciption';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '85f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'Parameter_default', @level2type = N'COLUMN', @level2name = N'Parameter_default_value';

