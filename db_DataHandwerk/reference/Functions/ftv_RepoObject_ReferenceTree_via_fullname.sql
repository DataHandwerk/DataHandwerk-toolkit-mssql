
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
CREATE Function reference.ftv_RepoObject_ReferenceTree_via_fullname
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
          , Referenced_Depth  = 1
          , Referencing_Depth = 0
        From
            reference.RepoObject_ReferencedReferencing As FirstNode
        Where
            FirstNode.referencing_fullname = @RepoObject_fullname
            And 1                          <= @Referenced_Depth
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
          , Referenced_Depth = parent.Referenced_Depth + 1
          , 0
        From
            reference.RepoObject_ReferencedReferencing As child
            Inner Join
                tree_referenced                        As parent
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
        Where
            FirstNode.referenced_fullname = @RepoObject_fullname
            And 1                         <= @Referencing_Depth
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
        Where
            parent.Referencing_Depth < @Referencing_Depth
        )
    Select
        tree_referenced.referenced_fullname
      , tree_referenced.referenced_fullname2
      , tree_referenced.Referenced_guid
      , tree_referenced.referenced_is_DocsOutput
      , tree_referenced.referenced_type
      , tree_referenced.referencing_fullname
      , tree_referenced.referencing_fullname2
      , tree_referenced.Referencing_guid
      , tree_referenced.referencing_type
      , tree_referenced.referencing_is_DocsOutput
      , tree_referenced.Referenced_Depth
      , tree_referenced.Referencing_Depth
      , RepoObject_fullname = @RepoObject_fullname
    From
        tree_referenced
    Union
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
      , RepoObject_fullname = @RepoObject_fullname
    From
        tree_referencing
);
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '09df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'FUNCTION'
  , @level1name = N'ftv_RepoObject_ReferenceTree_via_fullname';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [reference].[RepoObject_ReferencingReferenced]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ReferenceTree_via_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'has_get_referenced_issue', @value = N'1', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ReferenceTree_via_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.RepoObject_ReferencingReferenced.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ReferenceTree_via_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ReferenceTree_via_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ReferenceTree_via_fullname';

