/*
--based on [repo].[RepoObjectColumn_ReferenceTree]
--return referenced and referencing RepoObject
--Default:
--@Referenced_Depth = 1
--@Referencing_Depth

DECLARE @RepoObject_guid uniqueidentifier

SET @RepoObject_guid = (SELECT RepoObject_guid from [repo].[RepoObject] where RepoObject_fullname = '[repo].[RepoObject_gross]')

SELECT *
FROM [repo].[ftv_RepoObject_ColumReferenceRepoObject](@RepoObject_guid, DEFAULT, DEFAULT)

SELECT *
FROM [repo].[ftv_RepoObject_ColumReferenceRepoObject](@RepoObject_guid, 1, 1)

*/
CREATE FUNCTION [repo].[ftv_RepoObject_ColumReferenceRepoObject] (
 @RepoObject_guid UNIQUEIDENTIFIER
 , @Referenced_Depth INT = 1
 , @Referencing_Depth INT = 1
 )
RETURNS TABLE
AS
RETURN (
  WITH ro AS (
    --all RepoObject which are [Referenced_RepoObject_guid] or [Referencing_RepoObject_guid]
    SELECT DISTINCT [Referenced_fullname] AS [RepoObject_fullname]
     , [Referenced_RepoObject_guid] AS [RepoObject_guid]
     , [Referenced_type] AS [RepoObject_type]
     , NULL AS [DbmlRelation]
     , @RepoObject_guid AS [Parameter_RepoObject_guid]
    FROM [repo].[RepoObjectColumn_ReferenceTree]
    WHERE [Referenced_RepoObject_guid] = @RepoObject_guid
    
    UNION
    
    SELECT DISTINCT [Referencing_fullname]
     , [Referencing_RepoObject_guid]
     , [Referencing_type]
     , NULL AS [DbmlRelation]
     , @RepoObject_guid
    FROM [repo].[RepoObjectColumn_ReferenceTree]
    WHERE [Referencing_RepoObject_guid] = @RepoObject_guid
    
    UNION
    
    --add all referenced
    SELECT DISTINCT [rt].[Referenced_fullname]
     , [rt].[Referenced_RepoObject_guid]
     , [rt].[Referenced_type]
     , [rs].[DbmlRelation]
     , @RepoObject_guid
    FROM [repo].[RepoObjectColumn_ReferenceTree] AS rt
    LEFT JOIN [repo].[RepoObjectColumn_RelationScript] AS rs
     ON rs.referenced_RepoObject_guid = rt.[Referenced_RepoObject_guid]
      AND rs.referencing_RepoObject_guid = @RepoObject_guid
    WHERE [rt].[Referencing_RepoObject_guid] = @RepoObject_guid
     AND [Referenced_Depth] <= @Referenced_Depth
     AND [Referencing_Depth] = 0
    
    UNION
    
    --add all referenced
    SELECT DISTINCT [rt].[Referencing_fullname]
     , [rt].[Referencing_RepoObject_guid]
     , [rt].[Referencing_type]
     , [rs].[DbmlRelation]
     , @RepoObject_guid
    FROM [repo].[RepoObjectColumn_ReferenceTree] AS rt
    LEFT JOIN [repo].[RepoObjectColumn_RelationScript] AS rs
     ON rs.referenced_RepoObject_guid = @RepoObject_guid
      AND rs.referencing_RepoObject_guid = rt.[Referencing_RepoObject_guid]
    WHERE [rt].[Referenced_RepoObject_guid] = @RepoObject_guid
     AND [Referenced_Depth] = 0
     AND [Referencing_Depth] <= @Referencing_Depth
    )
  --
  SELECT [ro].[RepoObject_fullname]
   , [ro].[RepoObject_guid]
   , [ro].[RepoObject_type]
   , [dbml].[DbmlTable] AS [Dbml]
   , [ro].[Parameter_RepoObject_guid]
  FROM ro
  LEFT JOIN [repo].[RepoObject_SqlCreateTable] AS dbml
   ON dbml.RepoObject_guid = ro.RepoObject_guid
  
  UNION
  
  SELECT NULL
   , [ro].[Parameter_RepoObject_guid]
   , NULL
   , [ro].[DbmlRelation]
   , [ro].[Parameter_RepoObject_guid]
  FROM [ro]
  WHERE NOT [ro].[DbmlRelation] IS NULL
   --
  )
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9bbe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ColumReferenceRepoObject';

