
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
FROM [repo].[ftv_RepoObjectColumn_ReferenceTree](@RepoObjectColumn_guid, 1, 1)
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
CREATE Function reference.ftv_RepoObjectColumn_ReferenceTree
(
    @RepoObjectColumn_guid UniqueIdentifier
  , @Referenced_Depth      Int = 0
  , @Referencing_Depth     Int = 0
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
          , Referenced_Depth  = 1
          , Referencing_Depth = 0
        From
            reference.RepoObjectColumn_ReferencingReferenced As FirstNode
        Where
            FirstNode.Referencing_guid = @RepoObjectColumn_guid
            And 1                      <= @Referenced_Depth
        Union All
        Select
            child.*
          , Referenced_Depth = parent.Referenced_Depth + 1
          , 0
        From
            reference.RepoObjectColumn_ReferencingReferenced As child
            Inner Join
                tree_referenced                              As parent
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
          , Referenced_Depth  = 0
          , Referencing_Depth = 1
        From
            reference.RepoObjectColumn_ReferencingReferenced As FirstNode
        Where
            FirstNode.Referenced_guid = @RepoObjectColumn_guid
            And 1                     <= @Referencing_Depth
        Union All
        Select
            child.*
          , 0
          , Referencing_Depth = parent.Referencing_Depth + 1
        From
            reference.RepoObjectColumn_ReferencingReferenced As child
            Inner Join
                tree_referencing                             As parent
                    On
                    child.Referenced_guid = parent.Referencing_guid
        Where
            parent.Referencing_Depth < @Referencing_Depth
        )
    Select
        *
      , RepoObjectColumn_guid = @RepoObjectColumn_guid
    From
        tree_referenced
    Union
    Select
        *
      , RepoObjectColumn_guid = @RepoObjectColumn_guid
    From
        tree_referencing
);
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '3f4679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'FUNCTION'
  , @level1name = N'ftv_RepoObjectColumn_ReferenceTree';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [reference].[RepoObjectColumn_ReferencingReferenced]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObjectColumn_ReferenceTree';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.RepoObjectColumn_ReferenceTree.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObjectColumn_ReferenceTree';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.RepoObjectColumn_ReferencingReferenced.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObjectColumn_ReferenceTree';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObjectColumn_ReferenceTree';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObjectColumn_ReferenceTree';

