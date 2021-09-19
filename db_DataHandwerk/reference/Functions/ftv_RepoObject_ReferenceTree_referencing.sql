
/*
--Duplicates are possible, if exists alternative path between objects with different depth
--to elimenate them, exclude Referenced_Depth and Referencing_Depth and use DISTINCT


<<property_start>>exampleUsage
DECLARE @RepoObject_guid uniqueidentifier

SET @RepoObject_guid = (SELECT RepoObject_guid from [repo].[RepoObject] where RepoObject_fullname = '[repo].[RepoObject_gross]')

SELECT *
FROM [reference].[ftv_RepoObject_ReferenceTree_referencing](@RepoObject_guid, DEFAULT, DEFAULT)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

SELECT *
FROM [reference].[ftv_RepoObject_ReferenceTree_referencing](@RepoObject_guid, 1, 1)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

SELECT *
FROM [reference].[ftv_RepoObject_ReferenceTree_referencing](@RepoObject_guid, 0, 6)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

SELECT *
FROM [reference].[ftv_RepoObject_ReferenceTree_referencing](@RepoObject_guid, 100, 100)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]
<<property_end>>


*/
CREATE Function reference.ftv_RepoObject_ReferenceTree_referencing
(
    @RepoObject_guid   UniqueIdentifier
  , @Referenced_Depth  Int = 0 --has no effect
  , @Referencing_Depth Int = 0
)
Returns Table
As
Return
(
    --trees are recursive to get parent child relations
    With
    --tree_referenced
    --As
    --    (
    --    Select
    --        FirstNode.*
    --      , 1 As Referenced_Depth
    --      , 0 As Referencing_Depth
    --    From
    --        graph.RepoObject_ReferencingReferenced As FirstNode
    --    --INNER JOIN [config].[type] t1
    --    -- ON t1.[type] = FirstNode.Referenced_type
    --    --INNER JOIN [config].[type] t2
    --    -- ON t2.[type] = FirstNode.Referencing_type
    --    Where
    --        Referencing_guid = @RepoObject_guid
    --        And 1            <= @Referenced_Depth
    --    --AND t1.[is_DocsOutput] = 1
    --    --AND t2.[is_DocsOutput] = 1
    --    Union All
    --    Select
    --        child.*
    --      , Referenced_Depth = parent.Referenced_Depth + 1
    --      , 0
    --    From
    --        graph.RepoObject_ReferencingReferenced As child
    --        Inner Join
    --            tree_referenced                    As parent
    --                On
    --                child.Referencing_guid = parent.Referenced_guid
    --    --INNER JOIN [config].[type] t1
    --    -- ON t1.[type] = child.Referenced_type
    --    ----INNER JOIN [config].[type] t2
    --    ---- ON t2.[type] = child.Referencing_type
    --    Where
    --        parent.Referenced_Depth < @Referenced_Depth
    --    --AND t1.[is_DocsOutput] = 1
    --    ----AND t2.[is_DocsOutput] = 1
    --    )
    --,
    tree_referencing
    As
        (
        Select
            FirstNode.referenced_fullname
          , FirstNode.referenced_fullname2
          , FirstNode.Referenced_guid
          , FirstNode.referenced_is_DocsOutput
          , FirstNode.referenced_type
          , FirstNode.referencing_fullname
          , FirstNode.referencing_fullname2
          , FirstNode.Referencing_guid
          , FirstNode.referencing_type
          , FirstNode.referencing_is_DocsOutput
          , Referenced_Depth  = 0
          , Referencing_Depth = 1
        From
            reference.RepoObject_ReferencedReferencing As FirstNode
        --INNER JOIN [config].[type] t1
        -- ON t1.[type] = FirstNode.Referenced_type
        --INNER JOIN [config].[type] t2
        -- ON t2.[type] = FirstNode.Referencing_type
        Where
            FirstNode.Referenced_guid = @RepoObject_guid
            And 1                     <= @Referencing_Depth
        --AND t1.[is_DocsOutput] = 1
        --AND t2.[is_DocsOutput] = 1
        Union All
        Select
            child.referenced_fullname
          , child.referenced_fullname2
          , child.Referenced_guid
          , child.referenced_is_DocsOutput
          , child.referenced_type
          , child.referencing_fullname
          , child.referencing_fullname2
          , child.Referencing_guid
          , child.referencing_type
          , child.referencing_is_DocsOutput
          , 0
          , Referencing_Depth = parent.Referencing_Depth + 1
        From
            reference.RepoObject_ReferencedReferencing As child
            Inner Join
                tree_referencing                       As parent
                    On
                    child.Referenced_guid = parent.Referencing_guid
        ----INNER JOIN [config].[type] t1
        ---- ON t1.[type] = child.Referenced_type
        --INNER JOIN [config].[type] t2
        -- ON t2.[type] = child.Referencing_type
        Where
            parent.Referencing_Depth < @Referencing_Depth
        ----AND t1.[is_DocsOutput] = 1
        --AND t2.[is_DocsOutput] = 1
        )
    --Select
    --    *
    --  , @RepoObject_guid As RepoObject_guid
    --From
    --    tree_referenced
    --Union
    Select
        tree_referencing.referenced_fullname
      , tree_referencing.referenced_fullname2
      , tree_referencing.Referenced_guid
      , tree_referencing.referenced_is_DocsOutput
      , tree_referencing.referenced_type
      , tree_referencing.referencing_fullname
      , tree_referencing.referencing_fullname2
      , tree_referencing.Referencing_guid
      , tree_referencing.referencing_type
      , tree_referencing.referencing_is_DocsOutput
      , tree_referencing.Referenced_Depth
      , tree_referencing.Referencing_Depth
      , RepoObject_guid = @RepoObject_guid
    From
        tree_referencing
);
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '64cda946-459d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ReferenceTree_referencing';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [reference].[RepoObject_ReferencingReferenced]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ReferenceTree_referencing';


GO
EXECUTE sp_addextendedproperty @name = N'exampleUsage', @value = N'
DECLARE @RepoObject_guid uniqueidentifier

SET @RepoObject_guid = (SELECT RepoObject_guid from [repo].[RepoObject] where RepoObject_fullname = ''[repo].[RepoObject_gross]'')

SELECT *
FROM [reference].[ftv_RepoObject_ReferenceTree_referencing](@RepoObject_guid, DEFAULT, DEFAULT)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

SELECT *
FROM [reference].[ftv_RepoObject_ReferenceTree_referencing](@RepoObject_guid, 1, 1)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

SELECT *
FROM [reference].[ftv_RepoObject_ReferenceTree_referencing](@RepoObject_guid, 0, 6)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

SELECT *
FROM [reference].[ftv_RepoObject_ReferenceTree_referencing](@RepoObject_guid, 100, 100)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ReferenceTree_referencing';




GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.RepoObject_ReferenceTree_referencing.adoc[]
* xref:reference.RepoObject_ReferenceTree_referencing_0_30.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ReferenceTree_referencing';




GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.RepoObject_ReferencingReferenced.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ReferenceTree_referencing';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ReferenceTree_referencing';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ReferenceTree_referencing';

