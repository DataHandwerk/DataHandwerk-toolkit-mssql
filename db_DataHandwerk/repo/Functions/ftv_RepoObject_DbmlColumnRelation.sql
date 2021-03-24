/*
Wahrscheinlich unnötig, da auch alle Daten in [repo].[RepoObjectColumn_ReferenceTree] enthalten sind


--Duplicates are possible, if exists alternative path between objects with different depth
--to elimenate them, exclude Referenced_Depth and Referencing_Depth and use DISTINCT


DECLARE @RepoObject_guid uniqueidentifier

SET @RepoObject_guid = (SELECT RepoObject_guid from [repo].[RepoObject] where RepoObject_fullname = '[repo].[RepoObject_gross]')

SELECT *
FROM [repo].[ftv_RepoObject_DbmlColumnRelation](@RepoObject_guid, DEFAULT, DEFAULT)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

SELECT *
FROM [repo].[ftv_RepoObject_DbmlColumnRelation](@RepoObject_guid, 1, 1)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]


*/
CREATE FUNCTION [repo].[ftv_RepoObject_DbmlColumnRelation] (
 @RepoObject_guid uniqueidentifier
 , @Referenced_Depth INT = 1
 , @Referencing_Depth INT = 1
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
    WHERE [Referencing_RepoObject_guid] = @RepoObject_guid
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
    WHERE [Referenced_guid] = @RepoObject_guid
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
   , @RepoObject_guid AS RepoObject_guid
  FROM tree_referenced
  
  UNION
  
  SELECT *
   , @RepoObject_guid AS RepoObject_guid
  FROM tree_referencing
  )
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9abe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_DbmlColumnRelation';

