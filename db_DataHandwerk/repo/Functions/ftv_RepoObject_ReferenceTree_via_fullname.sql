/*
--wird wohl gar nicht (mehr) benutzt, sondern nur [repo].[ftv_RepoObject_ReferenceTree]

--Duplicates are possible, if exists alternative path between objects with different depth
--to elimenate them, exclude Referenced_Depth and Referencing_Depth and use DISTINCT


DECLARE @RepoObject_fullname NVARCHAR(261)

SET @RepoObject_fullname = '[repo].[RepoObject_gross]'

SELECT *
FROM [repo].[ftv_RepoObject_ReferenceTree_via_fullname](@RepoObject_fullname, DEFAULT, DEFAULT)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

SELECT *
FROM [repo].[ftv_RepoObject_ReferenceTree_via_fullname](@RepoObject_fullname, 0, 6)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

SELECT *
FROM [repo].[ftv_RepoObject_ReferenceTree_via_fullname](@RepoObject_fullname, 0, 6)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

SELECT *
FROM [repo].[ftv_RepoObject_ReferenceTree_via_fullname](@RepoObject_fullname, 100, 100)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]


*/
Create Function repo.ftv_RepoObject_ReferenceTree_via_fullname
(
    @RepoObject_fullname NVarchar(261)
  , @Referenced_Depth    Int = 0
  , @Referencing_Depth   Int = 0
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
            graph.RepoObject_ReferencingReferenced As FirstNode
        Where
            Referencing_fullname = @RepoObject_fullname
            And 1                <= @Referenced_Depth
        Union All
        Select
            child.*
          , Referenced_Depth = parent.Referenced_Depth + 1
          , 0
        From
            graph.RepoObject_ReferencingReferenced As child
            Inner Join
                tree_referenced                    As parent
                    On
                    child.Referencing_guid = parent.Referenced_guid
        Where
            parent.Referenced_Depth < @Referenced_Depth
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
            graph.RepoObject_ReferencingReferenced As FirstNode
        Where
            Referenced_fullname = @RepoObject_fullname
            And 1               <= @Referencing_Depth
        Union All
        Select
            child.*
          , 0
          , Referencing_Depth = parent.Referencing_Depth + 1
        From
            graph.RepoObject_ReferencingReferenced As child
            Inner Join
                tree_referencing                   As parent
                    On
                    child.Referenced_guid = parent.Referencing_guid
        Where
            parent.Referencing_Depth < @Referencing_Depth
        )
    Select
        *
      , @RepoObject_fullname As RepoObject_fullname
    From
        tree_referenced
    Union
    Select
        *
      , @RepoObject_fullname As RepoObject_fullname
    From
        tree_referencing
);
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '09df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'FUNCTION'
  , @level1name = N'ftv_RepoObject_ReferenceTree_via_fullname';
