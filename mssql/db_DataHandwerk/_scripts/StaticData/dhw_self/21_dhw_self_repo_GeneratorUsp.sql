﻿/*****START OF DEBUG INFORMATION*****

The primary key column list:
[id]

The INSERT column list:
[id],[usp_schema],[usp_name],[has_logging],[usp_Description]

The UPDATE column list:
 [Target].[usp_schema] = [Source].[usp_schema], 
  [Target].[usp_name] = [Source].[usp_name], 
  [Target].[has_logging] = [Source].[has_logging], 
  [Target].[usp_Description] = [Source].[usp_Description]

The SELECT statement executed to generate the MERGE:
SELECT ' ' + CASE WHEN ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) = 1 THEN ' ' ELSE ',' END + '('+ COALESCE(LTRIM(RTRIM(CONVERT(char, [id]))),'NULL')+',' + COALESCE('N''' + REPLACE([usp_schema],'''','''''')+'''','NULL')+',' + COALESCE('N''' + REPLACE([usp_name],'''','''''')+'''','NULL')+',' + COALESCE(LTRIM(RTRIM(CONVERT(char, [has_logging]))),'NULL')+',' + COALESCE('N''' + REPLACE([usp_Description],'''','''''')+'''','NULL')+')'  FROM [repo].[GeneratorUsp] (NOLOCK) ORDER BY [id]

*****END OF DEBUG INFORMATION*****/


USE [dhw_self]
GO

--MERGE generated by 'sp_generate_merge' stored procedure
--Originally by Vyas (http://vyaskn.tripod.com/code): sp_generate_inserts (build 22)
--Adapted for SQL Server 2008+ by Daniel Nolan (https://twitter.com/dnlnln)

SET NOCOUNT ON

SET IDENTITY_INSERT [repo].[GeneratorUsp] ON

MERGE INTO [repo].[GeneratorUsp] AS [Target]
USING (VALUES
  (1,N'repo',N'usp_sync_guid',1,NULL)
 ,(2,N'repo',N'usp_main',1,N'main procedure')
 ,(3,N'repo',N'usp_GeneratorUsp_insert_update_persistence',1,NULL)
 ,(4,N'repo',N'usp_PERSIST_RepoObject_SqlModules_41_from_T',1,NULL)
 ,(5,N'repo',N'usp_PERSIST_IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T',1,NULL)
 ,(6,N'repo',N'usp_sync_guid_RepoObjectColumn',1,NULL)
 ,(7,N'repo',N'usp_PERSIST_RepoObject_SqlModules_61_SelectIdentifier_Union_T',1,NULL)
 ,(8,N'repo',N'usp_sync_guid_RepoObject',1,NULL)
 ,(9,N'graph',N'usp_PERSIST_RepoObject',1,NULL)
 ,(10,N'graph',N'usp_PERSIST_RepoObjectColumn',1,NULL)
 ,(11,N'graph',N'usp_PERSIST_ProcedureInstance',1,NULL)
 ,(12,N'repo',N'usp_sync_ExtendedProperties_Sys2Repo_InsertUpdate',1,NULL)
 ,(13,N'repo',N'usp_sync_ExtendedProperties_Repo2Sys_InsertUpdate',1,NULL)
 ,(14,N'repo',N'usp_sync_ExtendedProperties_Repo2Sys_Delete',1,NULL)
) AS [Source] ([id],[usp_schema],[usp_name],[has_logging],[usp_Description])
ON ([Target].[id] = [Source].[id])
WHEN MATCHED AND (
	NULLIF([Source].[usp_schema], [Target].[usp_schema]) IS NOT NULL OR NULLIF([Target].[usp_schema], [Source].[usp_schema]) IS NOT NULL OR 
	NULLIF([Source].[usp_name], [Target].[usp_name]) IS NOT NULL OR NULLIF([Target].[usp_name], [Source].[usp_name]) IS NOT NULL OR 
	NULLIF([Source].[has_logging], [Target].[has_logging]) IS NOT NULL OR NULLIF([Target].[has_logging], [Source].[has_logging]) IS NOT NULL OR 
	NULLIF([Source].[usp_Description], [Target].[usp_Description]) IS NOT NULL OR NULLIF([Target].[usp_Description], [Source].[usp_Description]) IS NOT NULL) THEN
 UPDATE SET
  [Target].[usp_schema] = [Source].[usp_schema], 
  [Target].[usp_name] = [Source].[usp_name], 
  [Target].[has_logging] = [Source].[has_logging], 
  [Target].[usp_Description] = [Source].[usp_Description]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([id],[usp_schema],[usp_name],[has_logging],[usp_Description])
 VALUES([Source].[id],[Source].[usp_schema],[Source].[usp_name],[Source].[has_logging],[Source].[usp_Description])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE;

DECLARE @mergeError int
 , @mergeCount int
SELECT @mergeError = @@ERROR, @mergeCount = @@ROWCOUNT
IF @mergeError != 0
 BEGIN
 PRINT 'ERROR OCCURRED IN MERGE FOR [repo].[GeneratorUsp]. Rows affected: ' + CAST(@mergeCount AS VARCHAR(100)); -- SQL should always return zero rows affected
 END
ELSE
 BEGIN
 PRINT '[repo].[GeneratorUsp] rows affected by MERGE: ' + CAST(@mergeCount AS VARCHAR(100));
 END
GO



SET IDENTITY_INSERT [repo].[GeneratorUsp] OFF
SET NOCOUNT OFF
GO
