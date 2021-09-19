
/*
Probably unnecessary, since all data is also contained in [reference].[RepoObjectColumn_ReferenceTree].


--Duplicates are possible, if exists alternative path between objects with different depth
--to elimenate them, exclude Referenced_Depth and Referencing_Depth and use DISTINCT

<<property_start>>exampleUsage
DECLARE @RepoObject_guid uniqueidentifier

SET @RepoObject_guid = (SELECT RepoObject_guid from [repo].[RepoObject] where RepoObject_fullname = '[repo].[RepoObject_gross]')

SELECT *
FROM [reference].[ftv_RepoObject_DbmlColumnRelation](@RepoObject_guid, DEFAULT, DEFAULT)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

SELECT *
FROM [reference].[ftv_RepoObject_DbmlColumnRelation](@RepoObject_guid, 1, 1)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]
<<property_end>>

*/
CREATE Function reference.ftv_RepoObject_DbmlColumnRelation
(
    @RepoObject_guid   UniqueIdentifier
  , @Referenced_Depth  Int = 1
  , @Referencing_Depth Int = 1
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
            FirstNode.Referenced_fullname
          , FirstNode.Referenced_fullname2
          , FirstNode.Referenced_RepoObject_guid
          , FirstNode.Referenced_type
          , FirstNode.ReferencedColumn_fullname
          , FirstNode.ReferencedColumn_fullname2
          , FirstNode.ReferencedColumn_name
          , FirstNode.Referenced_guid
          , FirstNode.Referencing_fullname
          , FirstNode.Referencing_fullname2
          , FirstNode.Referencing_RepoObject_guid
          , FirstNode.Referencing_type
          , FirstNode.ReferencingColumn_fullname
          , FirstNode.ReferencingColumn_fullname2
          , FirstNode.ReferencingColumn_name
          , FirstNode.Referencing_guid
          , Referenced_Depth  = 1
          , Referencing_Depth = 0
        From
            reference.RepoObjectColumn_ReferencingReferenced As FirstNode
        Where
            FirstNode.Referencing_RepoObject_guid = @RepoObject_guid
            And 1                                 <= @Referenced_Depth
        Union All
        Select
            child.Referenced_fullname
          , child.Referenced_fullname2
          , child.Referenced_RepoObject_guid
          , child.Referenced_type
          , child.ReferencedColumn_fullname
          , child.ReferencedColumn_fullname2
          , child.ReferencedColumn_name
          , child.Referenced_guid
          , child.Referencing_fullname
          , child.Referencing_fullname2
          , child.Referencing_RepoObject_guid
          , child.Referencing_type
          , child.ReferencingColumn_fullname
          , child.ReferencingColumn_fullname2
          , child.ReferencingColumn_name
          , child.Referencing_guid
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
            FirstNode.Referenced_fullname
          , FirstNode.Referenced_fullname2
          , FirstNode.Referenced_RepoObject_guid
          , FirstNode.Referenced_type
          , FirstNode.ReferencedColumn_fullname
          , FirstNode.ReferencedColumn_fullname2
          , FirstNode.ReferencedColumn_name
          , FirstNode.Referenced_guid
          , FirstNode.Referencing_fullname
          , FirstNode.Referencing_fullname2
          , FirstNode.Referencing_RepoObject_guid
          , FirstNode.Referencing_type
          , FirstNode.ReferencingColumn_fullname
          , FirstNode.ReferencingColumn_fullname2
          , FirstNode.ReferencingColumn_name
          , FirstNode.Referencing_guid
          , Referenced_Depth  = 0
          , Referencing_Depth = 1
        From
            reference.RepoObjectColumn_ReferencingReferenced As FirstNode
        Where
            FirstNode.Referenced_guid = @RepoObject_guid
            And 1                     <= @Referencing_Depth
        Union All
        Select
            child.Referenced_fullname
          , child.Referenced_fullname2
          , child.Referenced_RepoObject_guid
          , child.Referenced_type
          , child.ReferencedColumn_fullname
          , child.ReferencedColumn_fullname2
          , child.ReferencedColumn_name
          , child.Referenced_guid
          , child.Referencing_fullname
          , child.Referencing_fullname2
          , child.Referencing_RepoObject_guid
          , child.Referencing_type
          , child.ReferencingColumn_fullname
          , child.ReferencingColumn_fullname2
          , child.ReferencingColumn_name
          , child.Referencing_guid
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
        tree_referenced.Referenced_fullname
      , tree_referenced.Referenced_fullname2
      , tree_referenced.Referenced_RepoObject_guid
      , tree_referenced.Referenced_type
      , tree_referenced.ReferencedColumn_fullname
      , tree_referenced.ReferencedColumn_fullname2
      , tree_referenced.ReferencedColumn_name
      , tree_referenced.Referenced_guid
      , tree_referenced.Referencing_fullname
      , tree_referenced.Referencing_fullname2
      , tree_referenced.Referencing_RepoObject_guid
      , tree_referenced.Referencing_type
      , tree_referenced.ReferencingColumn_fullname
      , tree_referenced.ReferencingColumn_fullname2
      , tree_referenced.ReferencingColumn_name
      , tree_referenced.Referencing_guid
      , tree_referenced.Referenced_Depth
      , tree_referenced.Referencing_Depth
      , RepoObject_guid = @RepoObject_guid
    From
        tree_referenced
    Union
    Select
        tree_referencing.Referenced_fullname
      , tree_referencing.Referenced_fullname2
      , tree_referencing.Referenced_RepoObject_guid
      , tree_referencing.Referenced_type
      , tree_referencing.ReferencedColumn_fullname
      , tree_referencing.ReferencedColumn_fullname2
      , tree_referencing.ReferencedColumn_name
      , tree_referencing.Referenced_guid
      , tree_referencing.Referencing_fullname
      , tree_referencing.Referencing_fullname2
      , tree_referencing.Referencing_RepoObject_guid
      , tree_referencing.Referencing_type
      , tree_referencing.ReferencingColumn_fullname
      , tree_referencing.ReferencingColumn_fullname2
      , tree_referencing.ReferencingColumn_name
      , tree_referencing.Referencing_guid
      , tree_referencing.Referenced_Depth
      , tree_referencing.Referencing_Depth
      , RepoObject_guid = @RepoObject_guid
    From
        tree_referencing
);
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '9abe898f-9381-eb11-84e9-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'FUNCTION'
  , @level1name = N'ftv_RepoObject_DbmlColumnRelation';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [reference].[RepoObjectColumn_ReferencingReferenced]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_DbmlColumnRelation';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.RepoObjectColumn_ReferencingReferenced.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_DbmlColumnRelation';


GO
EXECUTE sp_addextendedproperty @name = N'exampleUsage', @value = N'
DECLARE @RepoObject_guid uniqueidentifier

SET @RepoObject_guid = (SELECT RepoObject_guid from [repo].[RepoObject] where RepoObject_fullname = ''[repo].[RepoObject_gross]'')

SELECT *
FROM [reference].[ftv_RepoObject_DbmlColumnRelation](@RepoObject_guid, DEFAULT, DEFAULT)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]

SELECT *
FROM [reference].[ftv_RepoObject_DbmlColumnRelation](@RepoObject_guid, 1, 1)
ORDER BY [Referenced_Depth]
 , [Referencing_Depth]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_DbmlColumnRelation';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_DbmlColumnRelation';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_DbmlColumnRelation';

