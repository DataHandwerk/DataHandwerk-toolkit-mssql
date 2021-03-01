/*
--Duplicates are possible, if exists alternative path between objects with different depth
--to elimenate them, exclude Referenced_Depth and Referencing_Depth and use DISTINCT


DECLARE @RepoObjectColumn_guid uniqueidentifier

SET @RepoObjectColumn_guid = (SELECT RepoObjectColumn_guid from [repo].[RepoObjectColumn_gross] where RepoObjectColumn_fullname = '[repo].[RepoObjectColumn_gross].[RepoObjectColumn_guid]')

SELECT *
FROM [repo].[ftv_RepoObjectColumn_ReferenceTree](@RepoObjectColumn_guid, DEFAULT, DEFAULT)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

SELECT *
FROM [repo].[ftv_RepoObjectColumn_ReferenceTree](@RepoObjectColumn_guid, 0, 6)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

SELECT *
FROM [repo].[ftv_RepoObjectColumn_ReferenceTree](@RepoObjectColumn_guid, 0, 6)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

SELECT *
FROM [repo].[ftv_RepoObjectColumn_ReferenceTree](@RepoObjectColumn_guid, 100, 100)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]


*/
CREATE FUNCTION [repo].[ftv_RepoObjectColumn_ReferenceTree] (
 @RepoObjectColumn_guid uniqueidentifier
 , @Referenced_Depth INT = 0
 , @Referencing_Depth INT = 0
 )
RETURNS TABLE
AS
RETURN (
  --trees are recursive to get parent child relations
  WITH tree_referenced AS (
    SELECT [FirstNode].*
     , 1 AS [Referenced_Depth]
     , 0 AS [Referencing_Depth]
    FROM graph.RepoObjectColumn_ReferencingReferenced AS FirstNode
    WHERE [Referencing_guid] = @RepoObjectColumn_guid
     AND 1 <= @Referenced_Depth
    
    UNION ALL
    
    SELECT [child].*
     , [Referenced_Depth] = [parent].[Referenced_Depth] + 1
     , 0
    FROM graph.RepoObjectColumn_ReferencingReferenced AS child
    INNER JOIN tree_referenced AS parent
     ON [child].Referencing_guid = [parent].Referenced_guid
    WHERE [parent].[Referenced_Depth] < @Referenced_Depth
    )
   , tree_referencing AS (
    SELECT [FirstNode].*
     , 0 AS [Referenced_Depth]
     , 1 AS [Referencing_Depth]
    FROM graph.RepoObjectColumn_ReferencingReferenced AS FirstNode
    WHERE [Referenced_guid] = @RepoObjectColumn_guid
     AND 1 <= @Referencing_Depth
    
    UNION ALL
    
    SELECT [child].*
     , 0
     , [Referencing_Depth] = [parent].[Referencing_Depth] + 1
    FROM graph.RepoObjectColumn_ReferencingReferenced AS child
    INNER JOIN tree_referencing AS parent
     ON [child].Referenced_guid = [parent].Referencing_guid
    WHERE [parent].[Referencing_Depth] < @Referencing_Depth
    )
  SELECT *
   , @RepoObjectColumn_guid AS RepoObjectColumn_guid
  FROM tree_referenced
  
  UNION
  
  SELECT *
   , @RepoObjectColumn_guid AS RepoObjectColumn_guid
  FROM tree_referencing
  )