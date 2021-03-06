﻿
/*
--Duplicates are possible, if exists alternative path between objects with different depth
--to elimenate them, exclude Referenced_Depth and Referencing_Depth and use DISTINCT


<<property_start>>exampleUsage
DECLARE @RepoObject_guid uniqueidentifier

SET @RepoObject_guid = (SELECT RepoObject_guid from [repo].[RepoObject] where RepoObject_fullname = '[repo].[RepoObject_gross]')

SELECT *
FROM [repo].[ftv_RepoObject_ReferenceTree_referenced](@RepoObject_guid, DEFAULT, DEFAULT)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

SELECT *
FROM [repo].[ftv_RepoObject_ReferenceTree_referenced](@RepoObject_guid, 1, 1)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

SELECT *
FROM [repo].[ftv_RepoObject_ReferenceTree_referenced](@RepoObject_guid, 0, 6)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

SELECT *
FROM [repo].[ftv_RepoObject_ReferenceTree_referenced](@RepoObject_guid, 100, 100)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]
<<property_end>>


*/
create Function [reference].[ftv_RepoObject_ReferenceTree_referenced]
(
    @RepoObject_guid   UniqueIdentifier
  , @Referenced_Depth  Int = 0
  , @Referencing_Depth Int = 0 --has no effect
)
Returns Table
As
Return
(
    --trees are recursive to get parent child relations
    With
    tree_referenced
    As
        (
        Select
            FirstNode.*
          , 1 As Referenced_Depth
          , 0 As Referencing_Depth
        From
            [reference].RepoObject_ReferencingReferenced As FirstNode
        --INNER JOIN [config].[type] t1
        -- ON t1.[type] = FirstNode.Referenced_type
        --INNER JOIN [config].[type] t2
        -- ON t2.[type] = FirstNode.Referencing_type
        Where
            Referencing_guid = @RepoObject_guid
            And 1            <= @Referenced_Depth
        --AND t1.[is_DocsOutput] = 1
        --AND t2.[is_DocsOutput] = 1
        Union All
        Select
            child.*
          , Referenced_Depth = parent.Referenced_Depth + 1
          , 0
        From
            [reference].RepoObject_ReferencingReferenced As child
            Inner Join
                tree_referenced                    As parent
                    On
                    child.Referencing_guid = parent.Referenced_guid
        --INNER JOIN [config].[type] t1
        -- ON t1.[type] = child.Referenced_type
        ----INNER JOIN [config].[type] t2
        ---- ON t2.[type] = child.Referencing_type
        Where
            parent.Referenced_Depth < @Referenced_Depth
        --AND t1.[is_DocsOutput] = 1
        ----AND t2.[is_DocsOutput] = 1
        )
  --,
  --  tree_referencing
  --  As
  --      (
  --      Select
  --          FirstNode.*
  --        , 0 As Referenced_Depth
  --        , 1 As Referencing_Depth
  --      From
  --          graph.RepoObject_ReferencingReferenced As FirstNode
  --      --INNER JOIN [config].[type] t1
  --      -- ON t1.[type] = FirstNode.Referenced_type
  --      --INNER JOIN [config].[type] t2
  --      -- ON t2.[type] = FirstNode.Referencing_type
  --      Where
  --          Referenced_guid = @RepoObject_guid
  --          And 1           <= @Referencing_Depth
  --      --AND t1.[is_DocsOutput] = 1
  --      --AND t2.[is_DocsOutput] = 1
  --      Union All
  --      Select
  --          child.*
  --        , 0
  --        , Referencing_Depth = parent.Referencing_Depth + 1
  --      From
  --          graph.RepoObject_ReferencingReferenced As child
  --          Inner Join
  --              tree_referencing                   As parent
  --                  On
  --                  child.Referenced_guid = parent.Referencing_guid
  --      ----INNER JOIN [config].[type] t1
  --      ---- ON t1.[type] = child.Referenced_type
  --      --INNER JOIN [config].[type] t2
  --      -- ON t2.[type] = child.Referencing_type
  --      Where
  --          parent.Referencing_Depth < @Referencing_Depth
  --      ----AND t1.[is_DocsOutput] = 1
  --      --AND t2.[is_DocsOutput] = 1
  --      )
    Select
        *
      , @RepoObject_guid As RepoObject_guid
    From
        tree_referenced
    --Union
    --Select
    --    *
    --  , @RepoObject_guid As RepoObject_guid
    --From
    --    tree_referencing
);
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '63cda946-459d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ReferenceTree_referenced';

