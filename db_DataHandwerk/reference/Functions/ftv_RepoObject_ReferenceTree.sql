
/*
<<property_start>>MS_Description
NOTE: Duplicates are possible, if exists alternative path between objects with different depth +
to elimenate them, exclude `Referenced_Depth` and `Referencing_Depth` and use `DISTINCT`
<<property_end>>

<<property_start>>exampleUsage
DECLARE @RepoObject_guid uniqueidentifier

SET @RepoObject_guid = (SELECT RepoObject_guid from [repo].[RepoObject] where RepoObject_fullname = '[repo].[RepoObject_gross]')

SELECT *
FROM [reference].[ftv_RepoObject_ReferenceTree](@RepoObject_guid, DEFAULT, DEFAULT)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

SELECT *
FROM [reference].[ftv_RepoObject_ReferenceTree](@RepoObject_guid, 1, 1)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

-- Starting from @RepoObject_guid the result contains only referencing objects up to a depth of 6
-- start node is @RepoObject_guid, end node is Referencing_...

SELECT *
FROM [reference].[ftv_RepoObject_ReferenceTree](@RepoObject_guid, 0, 6)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

-- Starting from @RepoObject_guid the result contains only referenced objects up to a depth of 30
-- start node is @RepoObject_guid, end node is Referenced_...

SELECT *
FROM [reference].[ftv_RepoObject_ReferenceTree](@RepoObject_guid, 30, 0)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

SELECT *
FROM [reference].[ftv_RepoObject_ReferenceTree](@RepoObject_guid, 0, 50)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

--The next query is very slow!

SELECT *
FROM [reference].[ftv_RepoObject_ReferenceTree](@RepoObject_guid, 100, 100)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]
<<property_end>>


*/
CREATE Function [reference].[ftv_RepoObject_ReferenceTree]
(
    @RepoObject_guid   UniqueIdentifier
  , @Referenced_Depth  Int = 0
  , @Referencing_Depth Int = 0
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
  ,
    tree_referencing
    As
        (
        Select
            FirstNode.*
          , 0 As Referenced_Depth
          , 1 As Referencing_Depth
        From
            [reference].RepoObject_ReferencingReferenced As FirstNode
        --INNER JOIN [config].[type] t1
        -- ON t1.[type] = FirstNode.Referenced_type
        --INNER JOIN [config].[type] t2
        -- ON t2.[type] = FirstNode.Referencing_type
        Where
            Referenced_guid = @RepoObject_guid
            And 1           <= @Referencing_Depth
        --AND t1.[is_DocsOutput] = 1
        --AND t2.[is_DocsOutput] = 1
        Union All
        Select
            child.*
          , 0
          , Referencing_Depth = parent.Referencing_Depth + 1
        From
            [reference].RepoObject_ReferencingReferenced As child
            Inner Join
                tree_referencing                   As parent
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
    Select
        *
      , @RepoObject_guid As RepoObject_guid
    From
        tree_referenced
    Union ALL
    Select
        *
      , @RepoObject_guid As RepoObject_guid
    From
        tree_referencing
);
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '0adf2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'FUNCTION'
  , @level1name = N'ftv_RepoObject_ReferenceTree';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [reference].[RepoObject_ReferencingReferenced]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ReferenceTree';


GO
EXECUTE sp_addextendedproperty @name = N'has_get_referenced_issue', @value = N'1', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ReferenceTree';


GO
EXECUTE sp_addextendedproperty @name = N'exampleUsage', @value = N'
DECLARE @RepoObject_guid uniqueidentifier

SET @RepoObject_guid = (SELECT RepoObject_guid from [repo].[RepoObject] where RepoObject_fullname = ''[repo].[RepoObject_gross]'')

SELECT *
FROM [reference].[ftv_RepoObject_ReferenceTree](@RepoObject_guid, DEFAULT, DEFAULT)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

SELECT *
FROM [reference].[ftv_RepoObject_ReferenceTree](@RepoObject_guid, 1, 1)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

-- Starting from @RepoObject_guid the result contains only referencing objects up to a depth of 6
-- start node is @RepoObject_guid, end node is Referencing_...

SELECT *
FROM [reference].[ftv_RepoObject_ReferenceTree](@RepoObject_guid, 0, 6)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

-- Starting from @RepoObject_guid the result contains only referenced objects up to a depth of 30
-- start node is @RepoObject_guid, end node is Referenced_...

SELECT *
FROM [reference].[ftv_RepoObject_ReferenceTree](@RepoObject_guid, 30, 0)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

SELECT *
FROM [reference].[ftv_RepoObject_ReferenceTree](@RepoObject_guid, 0, 50)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

--The next query is very slow!

SELECT *
FROM [reference].[ftv_RepoObject_ReferenceTree](@RepoObject_guid, 100, 100)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ReferenceTree';














GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.RepoObject_ReferenceTree.adoc[]
* xref:reference.RepoObject_ReferenceTree_0_30.adoc[]
* xref:reference.RepoObject_ReferenceTree_30_0.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ReferenceTree';




GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.RepoObject_ReferencingReferenced.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ReferenceTree';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'
NOTE: Duplicates are possible, if exists alternative path between objects with different depth +
to elimenate them, exclude `Referenced_Depth` and `Referencing_Depth` and use `DISTINCT`', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ReferenceTree';

