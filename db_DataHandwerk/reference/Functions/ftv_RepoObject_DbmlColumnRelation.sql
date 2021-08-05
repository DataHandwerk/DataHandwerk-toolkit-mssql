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
CREATE Function [reference].[ftv_RepoObject_DbmlColumnRelation]
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
            FirstNode.*
          , 1 As Referenced_Depth
          , 0 As Referencing_Depth
        From
            [reference].RepoObjectColumn_ReferencingReferenced As FirstNode
        Where
            Referencing_RepoObject_guid = @RepoObject_guid
            And 1                       <= @Referenced_Depth
        Union All
        Select
            child.*
          , Referenced_Depth = parent.Referenced_Depth + 1
          , 0
        From
            [reference].RepoObjectColumn_ReferencingReferenced As child
            Inner Join
                tree_referenced                          As parent
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
            [reference].RepoObjectColumn_ReferencingReferenced As FirstNode
        Where
            Referenced_guid = @RepoObject_guid
            And 1           <= @Referencing_Depth
        Union All
        Select
            child.*
          , 0
          , Referencing_Depth = parent.Referencing_Depth + 1
        From
            [reference].RepoObjectColumn_ReferencingReferenced As child
            Inner Join
                tree_referencing                         As parent
                    On
                    child.Referenced_guid = parent.Referencing_guid
        Where
            parent.Referencing_Depth < @Referencing_Depth
        )
    Select
        *
      , @RepoObject_guid As RepoObject_guid
    From
        tree_referenced
    Union
    Select
        *
      , @RepoObject_guid As RepoObject_guid
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

