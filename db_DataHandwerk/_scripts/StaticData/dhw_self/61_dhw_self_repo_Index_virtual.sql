﻿/*****START OF DEBUG INFORMATION*****

The primary key column list:
[index_guid]

The INSERT column list:
[index_guid],[index_name],[index_type],[is_index_disabled],[is_index_primary_key],[is_index_unique],[parent_RepoObject_guid],[referenced_index_guid],[RowNumberInReferencing]

The UPDATE column list:
 [Target].[index_name] = [Source].[index_name], 
  [Target].[index_type] = [Source].[index_type], 
  [Target].[is_index_disabled] = [Source].[is_index_disabled], 
  [Target].[is_index_primary_key] = [Source].[is_index_primary_key], 
  [Target].[is_index_unique] = [Source].[is_index_unique], 
  [Target].[parent_RepoObject_guid] = [Source].[parent_RepoObject_guid], 
  [Target].[referenced_index_guid] = [Source].[referenced_index_guid], 
  [Target].[RowNumberInReferencing] = [Source].[RowNumberInReferencing]

The SELECT statement executed to generate the MERGE:
SELECT ' ' + CASE WHEN ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) = 1 THEN ' ' ELSE ',' END + '('+ COALESCE('N''' + REPLACE(CONVERT(char(36),RTRIM([index_guid])),'''','''''')+'''','NULL')+',' + COALESCE('N''' + REPLACE([index_name],'''','''''')+'''','NULL')+',' + COALESCE(LTRIM(RTRIM(CONVERT(char, [index_type]))),'NULL')+',' + COALESCE(LTRIM(RTRIM(CONVERT(char, [is_index_disabled]))),'NULL')+',' + COALESCE(LTRIM(RTRIM(CONVERT(char, [is_index_primary_key]))),'NULL')+',' + COALESCE(LTRIM(RTRIM(CONVERT(char, [is_index_unique]))),'NULL')+',' + COALESCE('N''' + REPLACE(CONVERT(char(36),RTRIM([parent_RepoObject_guid])),'''','''''')+'''','NULL')+',' + COALESCE('N''' + REPLACE(CONVERT(char(36),RTRIM([referenced_index_guid])),'''','''''')+'''','NULL')+',' + COALESCE(LTRIM(RTRIM(CONVERT(char, [RowNumberInReferencing]))),'NULL')+')'  FROM [repo].[Index_virtual] (NOLOCK) ORDER BY [index_guid]

*****END OF DEBUG INFORMATION*****/


USE [dhw_self]
GO

--MERGE generated by 'sp_generate_merge' stored procedure
--Originally by Vyas (http://vyaskn.tripod.com/code): sp_generate_inserts (build 22)
--Adapted for SQL Server 2008+ by Daniel Nolan (https://twitter.com/dnlnln)

SET NOCOUNT ON

MERGE INTO [repo].[Index_virtual] AS [Target]
USING (VALUES
  (N'8419C175-6962-EB11-84DC-A81E8446D5B0',N'idx_ExecutionLog_gross__1',1,0,0,0,N'BB90291C-9D61-EB11-84DC-A81E8446D5B0',N'1E90291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'8519C175-6962-EB11-84DC-A81E8446D5B0',N'idx_ExecutionLog_parent__1',1,0,0,0,N'BD90291C-9D61-EB11-84DC-A81E8446D5B0',N'1E90291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'8619C175-6962-EB11-84DC-A81E8446D5B0',N'idx_ExecutionLog_parent__2',1,0,0,0,N'BD90291C-9D61-EB11-84DC-A81E8446D5B0',N'1E90291C-9D61-EB11-84DC-A81E8446D5B0',2)
 ,(N'8719C175-6962-EB11-84DC-A81E8446D5B0',N'idx_ExecutionLog_plantUML_Sequence_start_stop__1',1,0,0,0,N'BF90291C-9D61-EB11-84DC-A81E8446D5B0',N'1E90291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'8819C175-6962-EB11-84DC-A81E8446D5B0',N'idx_ExecutionLog_plantUML_Sequence_start_stop__2',1,0,0,0,N'BF90291C-9D61-EB11-84DC-A81E8446D5B0',N'1E90291C-9D61-EB11-84DC-A81E8446D5B0',2)
 ,(N'8919C175-6962-EB11-84DC-A81E8446D5B0',N'idx_ExecutionLog_plantUML_Sequence_start_stop__3',1,0,0,0,N'BF90291C-9D61-EB11-84DC-A81E8446D5B0',N'1E90291C-9D61-EB11-84DC-A81E8446D5B0',3)
 ,(N'8D19C175-6962-EB11-84DC-A81E8446D5B0',N'idx_RepoObject_SqlModules_10_statement__2',1,0,0,0,N'F58F291C-9D61-EB11-84DC-A81E8446D5B0',N'2A90291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'8E19C175-6962-EB11-84DC-A81E8446D5B0',N'idx_RepoObject_SqlModules_39_object__2',1,0,0,0,N'0190291C-9D61-EB11-84DC-A81E8446D5B0',N'2A90291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'8F19C175-6962-EB11-84DC-A81E8446D5B0',N'idx_RepoObject_SqlModules_Repo_Sys__2',1,0,0,0,N'5390291C-9D61-EB11-84DC-A81E8446D5B0',N'2A90291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'9019C175-6962-EB11-84DC-A81E8446D5B0',N'idx_RepoObject_SqlModules_990_obsolet__1',1,0,0,0,N'C390291C-9D61-EB11-84DC-A81E8446D5B0',N'2A90291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'9219C175-6962-EB11-84DC-A81E8446D5B0',N'idx_IndexColumn_virtual_gross__1',1,0,0,0,N'0690291C-9D61-EB11-84DC-A81E8446D5B0',N'3690291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'9319C175-6962-EB11-84DC-A81E8446D5B0',N'idx_Index_virtual_SysObject__4',1,0,0,0,N'0790291C-9D61-EB11-84DC-A81E8446D5B0',N'3690291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'9419C175-6962-EB11-84DC-A81E8446D5B0',N'idx_IndexColumn_virtual_referenced_setpoint__1',1,0,0,0,N'7D90291C-9D61-EB11-84DC-A81E8446D5B0',N'3690291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'9519C175-6962-EB11-84DC-A81E8446D5B0',N'idx_GeneratorUsp_filter_persistence__1',1,0,0,0,N'DF8F291C-9D61-EB11-84DC-A81E8446D5B0',N'3A90291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'9619C175-6962-EB11-84DC-A81E8446D5B0',N'idx_GeneratorUspStep_Sql__1',1,0,0,0,N'4590291C-9D61-EB11-84DC-A81E8446D5B0',N'3A90291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'9719C175-6962-EB11-84DC-A81E8446D5B0',N'idx_GeneratorUsp_SqlUsp__1',1,0,0,0,N'4990291C-9D61-EB11-84DC-A81E8446D5B0',N'3A90291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'9819C175-6962-EB11-84DC-A81E8446D5B0',N'idx_GeneratorUsp_filter_persistence__2',2,0,0,0,N'DF8F291C-9D61-EB11-84DC-A81E8446D5B0',N'3C90291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'9919C175-6962-EB11-84DC-A81E8446D5B0',N'idx_GeneratorUsp_SqlUsp__2',2,0,0,0,N'4990291C-9D61-EB11-84DC-A81E8446D5B0',N'3C90291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'9C19C175-6962-EB11-84DC-A81E8446D5B0',N'idx_RepoObjectColumn_reference_Persistence__5',1,0,0,0,N'0290291C-9D61-EB11-84DC-A81E8446D5B0',N'4090291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'9D19C175-6962-EB11-84DC-A81E8446D5B0',N'idx_RepoObjectColumn_reference_Persistence__6',1,0,0,0,N'0290291C-9D61-EB11-84DC-A81E8446D5B0',N'4090291C-9D61-EB11-84DC-A81E8446D5B0',2)
 ,(N'9E19C175-6962-EB11-84DC-A81E8446D5B0',N'idx_RepoObject_persistence_column__5',1,0,0,0,N'0490291C-9D61-EB11-84DC-A81E8446D5B0',N'4090291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'9F19C175-6962-EB11-84DC-A81E8446D5B0',N'idx_IndexColumn_virtual_gross__2',1,0,0,0,N'0690291C-9D61-EB11-84DC-A81E8446D5B0',N'4090291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'A019C175-6962-EB11-84DC-A81E8446D5B0',N'idx_RepoObjectColumnProperty_sys_repo__2',1,0,0,0,N'5590291C-9D61-EB11-84DC-A81E8446D5B0',N'4090291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'A119C175-6962-EB11-84DC-A81E8446D5B0',N'idx_SysColumn_RepoObjectColumn_via_guid__2',1,0,0,0,N'5E90291C-9D61-EB11-84DC-A81E8446D5B0',N'4090291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'A219C175-6962-EB11-84DC-A81E8446D5B0',N'idx_SysColumn_RepoObjectColumn_via_name__2',1,0,0,0,N'5F90291C-9D61-EB11-84DC-A81E8446D5B0',N'4090291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'A319C175-6962-EB11-84DC-A81E8446D5B0',N'idx_RepoObjectColumn_gross__6',1,0,0,0,N'6990291C-9D61-EB11-84DC-A81E8446D5B0',N'4090291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'A419C175-6962-EB11-84DC-A81E8446D5B0',N'idx_RepoObjectColumn_MissingSource_TypeV__2',1,0,0,0,N'8390291C-9D61-EB11-84DC-A81E8446D5B0',N'4090291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'A519C175-6962-EB11-84DC-A81E8446D5B0',N'idx_check_IndexColumn_virtual_referenced_setpoint__1',1,0,0,0,N'8990291C-9D61-EB11-84DC-A81E8446D5B0',N'4090291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'A619C175-6962-EB11-84DC-A81E8446D5B0',N'idx_RepoObjectColumn_reference_Persistence__7',2,0,0,0,N'0290291C-9D61-EB11-84DC-A81E8446D5B0',N'4290291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'A719C175-6962-EB11-84DC-A81E8446D5B0',N'idx_RepoObjectColumn_reference_Persistence__8',2,0,0,0,N'0290291C-9D61-EB11-84DC-A81E8446D5B0',N'4290291C-9D61-EB11-84DC-A81E8446D5B0',2)
 ,(N'A819C175-6962-EB11-84DC-A81E8446D5B0',N'idx_RepoObject_persistence_column__6',2,0,0,0,N'0490291C-9D61-EB11-84DC-A81E8446D5B0',N'4290291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'A919C175-6962-EB11-84DC-A81E8446D5B0',N'idx_IndexColumn_virtual_gross__3',2,0,0,0,N'0690291C-9D61-EB11-84DC-A81E8446D5B0',N'4290291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'AB19C175-6962-EB11-84DC-A81E8446D5B0',N'idx_SysColumn_RepoObjectColumn_via_guid__3',2,0,0,0,N'5E90291C-9D61-EB11-84DC-A81E8446D5B0',N'4290291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'AC19C175-6962-EB11-84DC-A81E8446D5B0',N'idx_SysColumn_RepoObjectColumn_via_name__3',2,0,0,0,N'5F90291C-9D61-EB11-84DC-A81E8446D5B0',N'4290291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'AD19C175-6962-EB11-84DC-A81E8446D5B0',N'idx_RepoObjectColumn_gross__7',2,0,0,0,N'6990291C-9D61-EB11-84DC-A81E8446D5B0',N'4290291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'AE19C175-6962-EB11-84DC-A81E8446D5B0',N'idx_RepoObjectColumn_MissingSource_TypeV__3',2,0,0,0,N'8390291C-9D61-EB11-84DC-A81E8446D5B0',N'4290291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'AF19C175-6962-EB11-84DC-A81E8446D5B0',N'idx_check_IndexColumn_virtual_referenced_setpoint__2',2,0,0,0,N'8990291C-9D61-EB11-84DC-A81E8446D5B0',N'4290291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'B219C175-6962-EB11-84DC-A81E8446D5B0',N'idx_RepoObject_persistence_column__7',2,0,0,0,N'0490291C-9D61-EB11-84DC-A81E8446D5B0',N'4290291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'B319C175-6962-EB11-84DC-A81E8446D5B0',N'idx_SysColumn_RepoObjectColumn_via_guid__4',2,0,0,0,N'5E90291C-9D61-EB11-84DC-A81E8446D5B0',N'4290291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'B419C175-6962-EB11-84DC-A81E8446D5B0',N'idx_SysColumn_RepoObjectColumn_via_name__4',2,0,0,0,N'5F90291C-9D61-EB11-84DC-A81E8446D5B0',N'4290291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'B719C175-6962-EB11-84DC-A81E8446D5B0',N'idx_check_IndexColumn_virtual_referenced_setpoint__3',2,0,0,0,N'8990291C-9D61-EB11-84DC-A81E8446D5B0',N'4290291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'B819C175-6962-EB11-84DC-A81E8446D5B0',N'idx_check_IndexColumn_virtual_referenced_setpoint__4',2,0,0,0,N'8990291C-9D61-EB11-84DC-A81E8446D5B0',N'4290291C-9D61-EB11-84DC-A81E8446D5B0',2)
 ,(N'B919C175-6962-EB11-84DC-A81E8446D5B0',N'idx_SysColumn_RepoObjectColumn_via_guid__5',2,0,0,0,N'5E90291C-9D61-EB11-84DC-A81E8446D5B0',N'4490291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'BA19C175-6962-EB11-84DC-A81E8446D5B0',N'idx_SysColumn_RepoObjectColumn_via_name__5',2,0,0,0,N'5F90291C-9D61-EB11-84DC-A81E8446D5B0',N'4490291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'BB19C175-6962-EB11-84DC-A81E8446D5B0',N'idx_RepoObjectColumn_gross__9',2,0,0,0,N'6990291C-9D61-EB11-84DC-A81E8446D5B0',N'4490291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'BC19C175-6962-EB11-84DC-A81E8446D5B0',N'idx_RepoObjectColumn_MissingSource_TypeV__5',2,0,0,0,N'8390291C-9D61-EB11-84DC-A81E8446D5B0',N'4490291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'BD19C175-6962-EB11-84DC-A81E8446D5B0',N'idx_check_IndexColumn_virtual_referenced_setpoint__5',2,0,0,0,N'8990291C-9D61-EB11-84DC-A81E8446D5B0',N'4490291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'BE19C175-6962-EB11-84DC-A81E8446D5B0',N'idx_check_IndexColumn_virtual_referenced_setpoint__6',2,0,0,0,N'8990291C-9D61-EB11-84DC-A81E8446D5B0',N'4490291C-9D61-EB11-84DC-A81E8446D5B0',2)
 ,(N'BF19C175-6962-EB11-84DC-A81E8446D5B0',N'idx_RepoObject_persistence_column__8',2,0,0,0,N'0490291C-9D61-EB11-84DC-A81E8446D5B0',N'4490291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'C019C175-6962-EB11-84DC-A81E8446D5B0',N'idx_SysColumn_RepoObjectColumn_via_guid__6',2,0,0,0,N'5E90291C-9D61-EB11-84DC-A81E8446D5B0',N'4490291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'C119C175-6962-EB11-84DC-A81E8446D5B0',N'idx_SysColumn_RepoObjectColumn_via_name__6',2,0,0,0,N'5F90291C-9D61-EB11-84DC-A81E8446D5B0',N'4490291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'C419C175-6962-EB11-84DC-A81E8446D5B0',N'idx_aaa_test_sql_table_column__1',2,0,0,0,N'B990291C-9D61-EB11-84DC-A81E8446D5B0',N'4490291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'C519C175-6962-EB11-84DC-A81E8446D5B0',N'idx_RepoObject_reference_persistence__5',1,0,0,0,N'F38F291C-9D61-EB11-84DC-A81E8446D5B0',N'4890291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'C619C175-6962-EB11-84DC-A81E8446D5B0',N'idx_RepoObjectColumn_reference_Persistence__11',1,0,0,0,N'0290291C-9D61-EB11-84DC-A81E8446D5B0',N'4890291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'C719C175-6962-EB11-84DC-A81E8446D5B0',N'idx_RepoObject_persistence_column__9',1,0,0,0,N'0490291C-9D61-EB11-84DC-A81E8446D5B0',N'4890291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'C819C175-6962-EB11-84DC-A81E8446D5B0',N'idx_RepoObject_persistence_ObjectNames__5',1,0,0,0,N'0590291C-9D61-EB11-84DC-A81E8446D5B0',N'4890291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'C919C175-6962-EB11-84DC-A81E8446D5B0',N'idx_RepoObjectColumn_HistValidColums_setpoint__1',1,0,0,0,N'4390291C-9D61-EB11-84DC-A81E8446D5B0',N'4890291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'CA19C175-6962-EB11-84DC-A81E8446D5B0',N'idx_IndexColumn_virtual_gross__4',1,0,0,0,N'0690291C-9D61-EB11-84DC-A81E8446D5B0',N'4C90291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'E0CE9178-6B62-EB11-84DC-A81E8446D5B0',N'idx_RepoObjectColumn_reference_QueryPlan__10',2,0,0,0,N'6C90291C-9D61-EB11-84DC-A81E8446D5B0',N'BB19C175-6962-EB11-84DC-A81E8446D5B0',1)
 ,(N'E5CE9178-6B62-EB11-84DC-A81E8446D5B0',N'idx_RepoObject_ColumnList__2',2,0,0,0,N'6F90291C-9D61-EB11-84DC-A81E8446D5B0',N'BB19C175-6962-EB11-84DC-A81E8446D5B0',1)
 ,(N'EFCE9178-6B62-EB11-84DC-A81E8446D5B0',N'idx_check_IndexColumn_virtual_referenced_setpoint__1',1,0,0,0,N'8990291C-9D61-EB11-84DC-A81E8446D5B0',N'9419C175-6962-EB11-84DC-A81E8446D5B0',1)
 ,(N'FDCE9178-6B62-EB11-84DC-A81E8446D5B0',N'idx_RepoObjectColumn_reference_FirstResultSet__2',2,0,0,0,N'6B90291C-9D61-EB11-84DC-A81E8446D5B0',N'BB19C175-6962-EB11-84DC-A81E8446D5B0',1)
 ,(N'FFCE9178-6B62-EB11-84DC-A81E8446D5B0',N'idx_RepoObjectColumn_reference_QueryPlan__12',1,0,0,0,N'6C90291C-9D61-EB11-84DC-A81E8446D5B0',N'A319C175-6962-EB11-84DC-A81E8446D5B0',1)
 ,(N'00CF9178-6B62-EB11-84DC-A81E8446D5B0',N'idx_RepoObjectColumn_reference_QueryPlan__13',1,0,0,0,N'6C90291C-9D61-EB11-84DC-A81E8446D5B0',N'A319C175-6962-EB11-84DC-A81E8446D5B0',2)
 ,(N'01CF9178-6B62-EB11-84DC-A81E8446D5B0',N'idx_RepoObjectColumn_reference_QueryPlan__14',2,0,0,0,N'6C90291C-9D61-EB11-84DC-A81E8446D5B0',N'AD19C175-6962-EB11-84DC-A81E8446D5B0',1)
 ,(N'02CF9178-6B62-EB11-84DC-A81E8446D5B0',N'idx_RepoObjectColumn_reference_QueryPlan__15',2,0,0,0,N'6C90291C-9D61-EB11-84DC-A81E8446D5B0',N'AD19C175-6962-EB11-84DC-A81E8446D5B0',2)
 ,(N'05CF9178-6B62-EB11-84DC-A81E8446D5B0',N'idx_RepoObjectColumn_reference_FirstResultSet__4',1,0,0,0,N'6B90291C-9D61-EB11-84DC-A81E8446D5B0',N'A319C175-6962-EB11-84DC-A81E8446D5B0',1)
 ,(N'06CF9178-6B62-EB11-84DC-A81E8446D5B0',N'idx_RepoObjectColumn_reference_FirstResultSet__5',1,0,0,0,N'6B90291C-9D61-EB11-84DC-A81E8446D5B0',N'A319C175-6962-EB11-84DC-A81E8446D5B0',2)
 ,(N'07CF9178-6B62-EB11-84DC-A81E8446D5B0',N'idx_RepoObjectColumn_reference_FirstResultSet__6',2,0,0,0,N'6B90291C-9D61-EB11-84DC-A81E8446D5B0',N'AD19C175-6962-EB11-84DC-A81E8446D5B0',1)
 ,(N'08CF9178-6B62-EB11-84DC-A81E8446D5B0',N'idx_RepoObjectColumn_reference_FirstResultSet__7',2,0,0,0,N'6B90291C-9D61-EB11-84DC-A81E8446D5B0',N'AD19C175-6962-EB11-84DC-A81E8446D5B0',2)
 ,(N'D9427A38-4265-EB11-84DD-A81E8446D5B0',N'idx_RepoObject_SqlModules_72_reference_NoTableAlias__2',2,0,0,0,N'137E4BE1-8F64-EB11-84DD-A81E8446D5B0',N'4490291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'DA427A38-4265-EB11-84DD-A81E8446D5B0',N'idx_RepoObject_SqlModules_72_reference_NoTableAlias__3',2,0,0,0,N'137E4BE1-8F64-EB11-84DD-A81E8446D5B0',N'4490291C-9D61-EB11-84DC-A81E8446D5B0',2)
 ,(N'DB427A38-4265-EB11-84DD-A81E8446D5B0',N'idx_RepoObject_SqlModules_71_reference_ExpliciteTableAlias__1',2,0,0,0,N'0D813EBD-7764-EB11-84DD-A81E8446D5B0',N'4490291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'DC427A38-4265-EB11-84DD-A81E8446D5B0',N'idx_RepoObject_SqlModules_71_reference_ExpliciteTableAlias__2',2,0,0,0,N'0D813EBD-7764-EB11-84DD-A81E8446D5B0',N'4490291C-9D61-EB11-84DC-A81E8446D5B0',2)
 ,(N'DF427A38-4265-EB11-84DD-A81E8446D5B0',N'idx_RepoObject_SqlModules_72_reference_NoTableAlias__4',1,0,0,0,N'137E4BE1-8F64-EB11-84DD-A81E8446D5B0',N'4090291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'E0427A38-4265-EB11-84DD-A81E8446D5B0',N'idx_RepoObject_SqlModules_72_reference_NoTableAlias__5',1,0,0,0,N'137E4BE1-8F64-EB11-84DD-A81E8446D5B0',N'4090291C-9D61-EB11-84DC-A81E8446D5B0',2)
 ,(N'E3427A38-4265-EB11-84DD-A81E8446D5B0',N'idx_RepoObject_SqlModules_71_reference_ExpliciteTableAlias__4',1,0,0,0,N'0D813EBD-7764-EB11-84DD-A81E8446D5B0',N'4090291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'E4427A38-4265-EB11-84DD-A81E8446D5B0',N'idx_RepoObject_SqlModules_71_reference_ExpliciteTableAlias__5',1,0,0,0,N'0D813EBD-7764-EB11-84DD-A81E8446D5B0',N'4090291C-9D61-EB11-84DC-A81E8446D5B0',2)
 ,(N'E7427A38-4265-EB11-84DD-A81E8446D5B0',N'idx_RepoObjectColumn_S__2',2,0,0,0,N'A99FCDB3-3265-EB11-84DD-A81E8446D5B0',N'BB19C175-6962-EB11-84DC-A81E8446D5B0',1)
 ,(N'EC427A38-4265-EB11-84DD-A81E8446D5B0',N'PK_RepoObjectColumn_S',1,0,1,1,N'A99FCDB3-3265-EB11-84DD-A81E8446D5B0',N'A319C175-6962-EB11-84DC-A81E8446D5B0',1)
 ,(N'EF427A38-4265-EB11-84DD-A81E8446D5B0',N'idx_RepoObject_persistence_ForInput__1',1,0,0,0,N'88813D1C-6662-EB11-84DC-A81E8446D5B0',N'4890291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'4EC2589C-5265-EB11-84DD-A81E8446D5B0',N'idx_RepoObjectColumn__4',2,0,0,0,N'89EFC212-B764-EB11-84DD-A81E8446D5B0',N'E7427A38-4265-EB11-84DD-A81E8446D5B0',1)
 ,(N'166B6592-EF66-EB11-84DD-A81E8446D5B0',N'PK_ProcedureInstance_S',2,0,1,1,N'32C1E60F-ED66-EB11-84DD-A81E8446D5B0',N'7834CB25-1E66-EB11-84DD-A81E8446D5B0',1)
 ,(N'1D6B6592-EF66-EB11-84DD-A81E8446D5B0',N'idx_RepoObjectColumn_reference_SqlModules__1',2,0,0,0,N'D28F8F21-4265-EB11-84DD-A81E8446D5B0',N'4290291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'1E6B6592-EF66-EB11-84DD-A81E8446D5B0',N'idx_RepoObjectColumn_reference_SqlModules__2',2,0,0,0,N'D28F8F21-4265-EB11-84DD-A81E8446D5B0',N'4290291C-9D61-EB11-84DC-A81E8446D5B0',2)
 ,(N'A7C621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_RepoObjectProperty_sys_repo__1',1,0,0,0,N'5790291C-9D61-EB11-84DC-A81E8446D5B0',N'ED8F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'A8C621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_RepoObject_SqlModules_72_reference_NoTableAlias__1',1,0,0,0,N'137E4BE1-8F64-EB11-84DD-A81E8446D5B0',N'ED8F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'A9C621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_Index_virtual_SysObject__1',2,0,0,0,N'0790291C-9D61-EB11-84DC-A81E8446D5B0',N'EF8F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'ABC621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_RepoObject_gross__1',1,0,0,0,N'7790291C-9D61-EB11-84DC-A81E8446D5B0',N'ED8F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'ADC621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_SysObject_RepoObject_via_guid__1',2,0,0,0,N'5B90291C-9D61-EB11-84DC-A81E8446D5B0',N'F18F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'AFC621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_RepoObjectReferencing__1',1,0,0,0,N'0A90291C-9D61-EB11-84DC-A81E8446D5B0',N'ED8F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'B4C621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_RepoObject_RequiredRepoObjectMerge__1',2,0,0,0,N'52230F14-2E66-EB11-84DD-A81E8446D5B0',N'F18F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'B8C621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_RepoObject_RequiredRepoObjectMerge__5',1,0,0,0,N'52230F14-2E66-EB11-84DD-A81E8446D5B0',N'ED8F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'BAC621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_RepoObject_SqlModules_71_reference_ExpliciteTableAlias__1',1,0,0,0,N'0D813EBD-7764-EB11-84DD-A81E8446D5B0',N'ED8F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'BBC621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_RepoObject_SqlModules_Repo_Sys__1',1,0,0,0,N'5390291C-9D61-EB11-84DC-A81E8446D5B0',N'ED8F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'BCC621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_RepoObject_gross__3',2,0,0,0,N'7790291C-9D61-EB11-84DC-A81E8446D5B0',N'EF8F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'BEC621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_RepoObject_gross__5',2,0,0,0,N'7790291C-9D61-EB11-84DC-A81E8446D5B0',N'F18F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'C0C621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_RepoObjectColumn_gross__1',2,0,0,0,N'6990291C-9D61-EB11-84DC-A81E8446D5B0',N'EF8F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'C2C621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_Index_real_unique__1',2,0,0,0,N'0890291C-9D61-EB11-84DC-A81E8446D5B0',N'EF8F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'C4C621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_SysObject_RepoObject_via_name__1',2,0,0,0,N'5990291C-9D61-EB11-84DC-A81E8446D5B0',N'F18F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'C6C621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_Index_real_unique__3',1,0,0,0,N'0890291C-9D61-EB11-84DC-A81E8446D5B0',N'ED8F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'C7C621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_RepoObjectColumn_reference_SqlModules__1',2,0,0,0,N'D28F8F21-4265-EB11-84DD-A81E8446D5B0',N'EF8F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'C8C621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_RepoObjectColumn_reference_SqlModules__2',2,0,0,0,N'D28F8F21-4265-EB11-84DD-A81E8446D5B0',N'EF8F291C-9D61-EB11-84DC-A81E8446D5B0',2)
 ,(N'CBC621A8-0867-EB11-84DD-A81E8446D5B0',N'PK_RepoObject_S',1,0,1,1,N'A89FCDB3-3265-EB11-84DD-A81E8446D5B0',N'ED8F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'CCC621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_RepoObject_RequiredRepoObjectMerge__7',2,0,0,0,N'52230F14-2E66-EB11-84DD-A81E8446D5B0',N'EF8F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'CEC621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_RepoObject_RequiredRepoObjectMerge__9',2,0,0,0,N'52230F14-2E66-EB11-84DD-A81E8446D5B0',N'EF8F291C-9D61-EB11-84DC-A81E8446D5B0',2)
 ,(N'CFC621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_SysObject_RepoObject_via_name__3',2,0,0,0,N'5990291C-9D61-EB11-84DC-A81E8446D5B0',N'EF8F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'D1C621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_SysObject_RepoObject_via_name__5',1,0,0,0,N'5990291C-9D61-EB11-84DC-A81E8446D5B0',N'ED8F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'D3C621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_SysObject_RepoObject_via_guid__3',2,0,0,0,N'5B90291C-9D61-EB11-84DC-A81E8446D5B0',N'EF8F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'D5C621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_RepoObject_reference_persistence__1',2,0,0,0,N'F38F291C-9D61-EB11-84DC-A81E8446D5B0',N'EF8F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'D6C621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_RepoObject_reference_persistence__2',2,0,0,0,N'F38F291C-9D61-EB11-84DC-A81E8446D5B0',N'EF8F291C-9D61-EB11-84DC-A81E8446D5B0',2)
 ,(N'D9C621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_SysObject_RepoObject_via_guid__5',1,0,0,0,N'5B90291C-9D61-EB11-84DC-A81E8446D5B0',N'ED8F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'DBC621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_RepoObjectColumn_gross__3',2,0,0,0,N'6990291C-9D61-EB11-84DC-A81E8446D5B0',N'F18F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'DDC621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_RepoObjectColumn_reference_Persistence__1',2,0,0,0,N'0290291C-9D61-EB11-84DC-A81E8446D5B0',N'EF8F291C-9D61-EB11-84DC-A81E8446D5B0',1)
 ,(N'DEC621A8-0867-EB11-84DD-A81E8446D5B0',N'idx_RepoObjectColumn_reference_Persistence__2',2,0,0,0,N'0290291C-9D61-EB11-84DC-A81E8446D5B0',N'EF8F291C-9D61-EB11-84DC-A81E8446D5B0',2)
 ,(N'ADB7BA42-0B67-EB11-84DD-A81E8446D5B0',N'idx_Index_gross__1',2,0,0,0,N'8790291C-9D61-EB11-84DC-A81E8446D5B0',N'BCC621A8-0867-EB11-84DD-A81E8446D5B0',1)
 ,(N'432CC058-426D-EB11-84E2-A81E8446D5B0',N'idx_ProcedureInstance__1',2,0,0,0,N'2AC1E60F-ED66-EB11-84DD-A81E8446D5B0',N'166B6592-EF66-EB11-84DD-A81E8446D5B0',1)
 ,(N'442CC058-426D-EB11-84E2-A81E8446D5B0',N'idx_ProcedureInstance__2',2,0,0,0,N'2AC1E60F-ED66-EB11-84DD-A81E8446D5B0',N'166B6592-EF66-EB11-84DD-A81E8446D5B0',1)
) AS [Source] ([index_guid],[index_name],[index_type],[is_index_disabled],[is_index_primary_key],[is_index_unique],[parent_RepoObject_guid],[referenced_index_guid],[RowNumberInReferencing])
ON ([Target].[index_guid] = [Source].[index_guid])
WHEN MATCHED AND (
	NULLIF([Source].[index_name], [Target].[index_name]) IS NOT NULL OR NULLIF([Target].[index_name], [Source].[index_name]) IS NOT NULL OR 
	NULLIF([Source].[index_type], [Target].[index_type]) IS NOT NULL OR NULLIF([Target].[index_type], [Source].[index_type]) IS NOT NULL OR 
	NULLIF([Source].[is_index_disabled], [Target].[is_index_disabled]) IS NOT NULL OR NULLIF([Target].[is_index_disabled], [Source].[is_index_disabled]) IS NOT NULL OR 
	NULLIF([Source].[is_index_primary_key], [Target].[is_index_primary_key]) IS NOT NULL OR NULLIF([Target].[is_index_primary_key], [Source].[is_index_primary_key]) IS NOT NULL OR 
	NULLIF([Source].[is_index_unique], [Target].[is_index_unique]) IS NOT NULL OR NULLIF([Target].[is_index_unique], [Source].[is_index_unique]) IS NOT NULL OR 
	NULLIF([Source].[parent_RepoObject_guid], [Target].[parent_RepoObject_guid]) IS NOT NULL OR NULLIF([Target].[parent_RepoObject_guid], [Source].[parent_RepoObject_guid]) IS NOT NULL OR 
	NULLIF([Source].[referenced_index_guid], [Target].[referenced_index_guid]) IS NOT NULL OR NULLIF([Target].[referenced_index_guid], [Source].[referenced_index_guid]) IS NOT NULL OR 
	NULLIF([Source].[RowNumberInReferencing], [Target].[RowNumberInReferencing]) IS NOT NULL OR NULLIF([Target].[RowNumberInReferencing], [Source].[RowNumberInReferencing]) IS NOT NULL) THEN
 UPDATE SET
  [Target].[index_name] = [Source].[index_name], 
  [Target].[index_type] = [Source].[index_type], 
  [Target].[is_index_disabled] = [Source].[is_index_disabled], 
  [Target].[is_index_primary_key] = [Source].[is_index_primary_key], 
  [Target].[is_index_unique] = [Source].[is_index_unique], 
  [Target].[parent_RepoObject_guid] = [Source].[parent_RepoObject_guid], 
  [Target].[referenced_index_guid] = [Source].[referenced_index_guid], 
  [Target].[RowNumberInReferencing] = [Source].[RowNumberInReferencing]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([index_guid],[index_name],[index_type],[is_index_disabled],[is_index_primary_key],[is_index_unique],[parent_RepoObject_guid],[referenced_index_guid],[RowNumberInReferencing])
 VALUES([Source].[index_guid],[Source].[index_name],[Source].[index_type],[Source].[is_index_disabled],[Source].[is_index_primary_key],[Source].[is_index_unique],[Source].[parent_RepoObject_guid],[Source].[referenced_index_guid],[Source].[RowNumberInReferencing])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE;

DECLARE @mergeError int
 , @mergeCount int
SELECT @mergeError = @@ERROR, @mergeCount = @@ROWCOUNT
IF @mergeError != 0
 BEGIN
 PRINT 'ERROR OCCURRED IN MERGE FOR [repo].[Index_virtual]. Rows affected: ' + CAST(@mergeCount AS VARCHAR(100)); -- SQL should always return zero rows affected
 END
ELSE
 BEGIN
 PRINT '[repo].[Index_virtual] rows affected by MERGE: ' + CAST(@mergeCount AS VARCHAR(100));
 END
GO


SET NOCOUNT OFF
GO