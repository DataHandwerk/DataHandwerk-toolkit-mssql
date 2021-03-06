﻿--invalid code for sql_variant!
/*
USE [dhw_self]
GO

--MERGE generated by 'sp_generate_merge' stored procedure
--Originally by Vyas (http://vyaskn.tripod.com/code): sp_generate_inserts (build 22)
--Adapted for SQL Server 2008+ by Daniel Nolan (https://twitter.com/dnlnln)

SET NOCOUNT ON

MERGE INTO [repo].[Parameter] AS [Target]
USING (VALUES
  (N'',N'',NULL,NULL,NULL)
 ,(N'DUMMY',N'',N'dummy parameter, data type SQL_Variant',,NULL)
 ,(N'dwh_database_name',N'',N'The database name must be the same as the one used in the synonyms',master,dhw_self)
 ,(N'Hist_Table_name_suffix',N'',N'default suffix for historization table which will be added to historized object name',_hist,NULL)
 ,(N'Hist_Table_schema',N'',N'default: NULL - The historization table uses the same schema as the table to be historized. otherwise the given schema is used',NULL,NULL)
 ,(N'Hist_ValidFrom_column_name',N'',N'default column name for column - datetime2 GENERATED ALWAYS AS ROW START',ValidFrom,NULL)
 ,(N'Hist_ValidTo_column_name',N'',N'default column name for column - datetime2 GENERATED ALWAYS AS ROW END',ValidTo,NULL)
 ,(N'Inheritance_StringAggSeparatorSql_column',N'',N'if NULL then only one source is used for inheritance; if not NULL then STRING_AGG( expression, separator ) is used to aggregate all sources. Content is interpreted as TSQL. Good values are ''CHAR(13)+CHAR(10)'' or '''';''''',NULL,NULL)
 ,(N'Inheritance_StringAggSeparatorSql_column',N'ReferencedObjectColumnList',N'if NULL then only one source is used for inheritance; if not NULL then STRING_AGG( expression, separator ) is used to aggregate all sources. Content is interpreted as TSQL. Good values are ''CHAR(13)+CHAR(10)'' or '''';''''',
,NULL)
 ,(N'Inheritance_StringAggSeparatorSql_object',N'',N'if NULL then only one source is used for inheritance; if not NULL then STRING_AGG( expression, separator ) is used to aggregate all sources. Content is interpreted as TSQL. Good values are ''CHAR(13)+CHAR(10)'' or '''';''''',NULL,NULL)
 ,(N'Inheritance_StringAggSeparatorSql_object',N'ReferencedObjectList',N'if NULL then only one source is used for inheritance; if not NULL then STRING_AGG( expression, separator ) is used to aggregate all sources. Content is interpreted as TSQL. Good values are ''CHAR(13)+CHAR(10)'' or '''';''''',
,NULL)
 ,(N'InheritanceDefinition_column',N'',N'CONCAT arguments to be used with some specific values in [repo].[InheritanceType], for example: ''[RepoObject_name],CHAR(13),CHAR(10),EineNochZuDefinierendeFunktion(''MS_Description'')''',NULL,NULL)
 ,(N'InheritanceDefinition_column',N'MS_Description',N'CONCAT arguments to be used with some specific values in [repo].[InheritanceType], for example: ''[RepoObject_name],CHAR(13),CHAR(10),EineNochZuDefinierendeFunktion(''MS_Description'')''',CAST(COALESCE(referencing.[Rep,NULL)
 ,(N'InheritanceDefinition_column',N'ReferencedObjectColumnList',N'CONCAT arguments to be used with some specific values in [repo].[InheritanceType], for example: ''[RepoObject_name],CHAR(13),CHAR(10),EineNochZuDefinierendeFunktion(''MS_Description'')''',referenced.[RepoObjectColumn_f,NULL)
 ,(N'InheritanceDefinition_object',N'',N'CONCAT arguments to be used with some specific values in [repo].[InheritanceType], for example: ''[RepoObject_name],CHAR(13),CHAR(10),EineNochZuDefinierendeFunktion(''MS_Description'')''',NULL,NULL)
 ,(N'InheritanceDefinition_object',N'MS_Description',N'CONCAT arguments to be used with some specific values in [repo].[InheritanceType], for example: ''[RepoObject_name],CHAR(13),CHAR(10),EineNochZuDefinierendeFunktion(''MS_Description'')''',NULL,NULL)
 ,(N'InheritanceDefinition_object',N'ReferencedObjectList',N'CONCAT arguments to be used with some specific values in [repo].[InheritanceType], for example: ''[RepoObject_name],CHAR(13),CHAR(10),EineNochZuDefinierendeFunktion(''MS_Description'')''',referenced.[RepoObject_fullnam,NULL)
 ,(N'InheritanceType_column',N'',N'TINYINT; InheritanceType for column: possible values in [repo].[InheritanceType]',0,NULL)
 ,(N'InheritanceType_column',N'MS_Description',N'TINYINT; InheritanceType for column: possible values in [repo].[InheritanceType]',0,12)
 ,(N'InheritanceType_column',N'ReferencedObjectColumnList',N'TINYINT; InheritanceType for object: possible values in [repo].[InheritanceType]',14,NULL)
 ,(N'InheritanceType_object',N'',N'TINYINT; InheritanceType for object: possible values in [repo].[InheritanceType]',0,NULL)
 ,(N'InheritanceType_object',N'MS_Description',N'TINYINT; InheritanceType for object: possible values in [repo].[InheritanceType]',0,NULL)
 ,(N'InheritanceType_object',N'ReferencedObjectList',N'TINYINT; InheritanceType for object: possible values in [repo].[InheritanceType]',14,NULL)
 ,(N'main enable usp_RepoObject_update_SysObjectQueryPlan',N'',N'execute (or not) usp_RepoObject_update_SysObjectQueryPlan',0,NULL)
 ,(N'main enable usp_RepoObjectSource_FirstResultSet',N'',N'execute (or not) usp_RepoObjectSource_FirstResultSet',0,NULL)
 ,(N'main enable usp_RepoObjectSource_QueryPlan',N'',N'execute (or not) usp_RepoObjectSource_QueryPlan',0,NULL)
 ,(N'persistence_name_suffix',N'',N'default suffix for persistence table which will be added to source object name',_T,NULL)
 ,(N'RepoObjectColumn_column_id_OrderBy',N'',N'used in repo.usp_RepoObjectColumn__update_RepoObjectColumn_column_id to define the order of columns',
ISNULL([ic].[index_column_id,NULL)
) AS [Source] ([Parameter_name],[sub_Parameter],[Parameter_desciption],[Parameter_default_value],[Parameter_value])
ON ([Target].[Parameter_name] = [Source].[Parameter_name] AND [Target].[sub_Parameter] = [Source].[sub_Parameter])
WHEN MATCHED AND (
	NULLIF([Source].[Parameter_desciption], [Target].[Parameter_desciption]) IS NOT NULL OR NULLIF([Target].[Parameter_desciption], [Source].[Parameter_desciption]) IS NOT NULL OR 
	NULLIF([Source].[Parameter_default_value], [Target].[Parameter_default_value]) IS NOT NULL OR NULLIF([Target].[Parameter_default_value], [Source].[Parameter_default_value]) IS NOT NULL OR 
	NULLIF([Source].[Parameter_value], [Target].[Parameter_value]) IS NOT NULL OR NULLIF([Target].[Parameter_value], [Source].[Parameter_value]) IS NOT NULL) THEN
 UPDATE SET
  [Target].[Parameter_desciption] = [Source].[Parameter_desciption], 
  [Target].[Parameter_default_value] = [Source].[Parameter_default_value], 
  [Target].[Parameter_value] = [Source].[Parameter_value]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([Parameter_name],[sub_Parameter],[Parameter_desciption],[Parameter_default_value],[Parameter_value])
 VALUES([Source].[Parameter_name],[Source].[sub_Parameter],[Source].[Parameter_desciption],[Source].[Parameter_default_value],[Source].[Parameter_value])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE;

DECLARE @mergeError int
 , @mergeCount int
SELECT @mergeError = @@ERROR, @mergeCount = @@ROWCOUNT
IF @mergeError != 0
 BEGIN
 PRINT 'ERROR OCCURRED IN MERGE FOR [repo].[Parameter]. Rows affected: ' + CAST(@mergeCount AS VARCHAR(100)); -- SQL should always return zero rows affected
 END
ELSE
 BEGIN
 PRINT '[repo].[Parameter] rows affected by MERGE: ' + CAST(@mergeCount AS VARCHAR(100));
 END
GO


SET NOCOUNT OFF
GO

*/