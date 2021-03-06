﻿/*****START OF DEBUG INFORMATION*****

The primary key column list:
[id]

The INSERT column list:
[id],[Name],[Description],[is_active]

The UPDATE column list:
 [Target].[Name] = [Source].[Name], 
  [Target].[Description] = [Source].[Description], 
  [Target].[is_active] = [Source].[is_active]

The SELECT statement executed to generate the MERGE:
SELECT ' ' + CASE WHEN ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) = 1 THEN ' ' ELSE ',' END + '('+ COALESCE(LTRIM(RTRIM(CONVERT(char, [id]))),'NULL')+',' + COALESCE('N''' + REPLACE([Name],'''','''''')+'''','NULL')+',' + COALESCE('N''' + REPLACE([Description],'''','''''')+'''','NULL')+',' + COALESCE(LTRIM(RTRIM(CONVERT(char, [is_active]))),'NULL')+')'  FROM [repo].[Workflow] (NOLOCK) ORDER BY [id]

*****END OF DEBUG INFORMATION*****/


USE [dhw_self]
GO

--MERGE generated by 'sp_generate_merge' stored procedure
--Originally by Vyas (http://vyaskn.tripod.com/code): sp_generate_inserts (build 22)
--Adapted for SQL Server 2008+ by Daniel Nolan (https://twitter.com/dnlnln)

SET NOCOUNT ON

SET IDENTITY_INSERT [repo].[Workflow] ON

MERGE INTO [repo].[Workflow] AS [Target]
USING (SELECT [id],[Name],[Description],[is_active] FROM [repo].[Workflow] WHERE 1 = 0 -- Empty dataset (source table contained no rows at time of MERGE generation) 
) AS [Source] ([id],[Name],[Description],[is_active])
ON ([Target].[id] = [Source].[id])
WHEN MATCHED AND (
	NULLIF([Source].[Name], [Target].[Name]) IS NOT NULL OR NULLIF([Target].[Name], [Source].[Name]) IS NOT NULL OR 
	NULLIF([Source].[Description], [Target].[Description]) IS NOT NULL OR NULLIF([Target].[Description], [Source].[Description]) IS NOT NULL OR 
	NULLIF([Source].[is_active], [Target].[is_active]) IS NOT NULL OR NULLIF([Target].[is_active], [Source].[is_active]) IS NOT NULL) THEN
 UPDATE SET
  [Target].[Name] = [Source].[Name], 
  [Target].[Description] = [Source].[Description], 
  [Target].[is_active] = [Source].[is_active]
WHEN NOT MATCHED BY TARGET THEN
 INSERT([id],[Name],[Description],[is_active])
 VALUES([Source].[id],[Source].[Name],[Source].[Description],[Source].[is_active])
WHEN NOT MATCHED BY SOURCE THEN 
 DELETE;

DECLARE @mergeError int
 , @mergeCount int
SELECT @mergeError = @@ERROR, @mergeCount = @@ROWCOUNT
IF @mergeError != 0
 BEGIN
 PRINT 'ERROR OCCURRED IN MERGE FOR [repo].[Workflow]. Rows affected: ' + CAST(@mergeCount AS VARCHAR(100)); -- SQL should always return zero rows affected
 END
ELSE
 BEGIN
 PRINT '[repo].[Workflow] rows affected by MERGE: ' + CAST(@mergeCount AS VARCHAR(100));
 END
GO



SET IDENTITY_INSERT [repo].[Workflow] OFF
SET NOCOUNT OFF
GO
