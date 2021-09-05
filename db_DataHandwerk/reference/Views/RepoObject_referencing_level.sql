
/*
Select
    --
    Object1.RepoObject_guid                                                     As StartingNode_guid
  , Object1.RepoObject_fullname                                                 As StartingNode_fullname
  , Object1.RepoObject_fullname2                                                As StartingNode_fullname2
  , Count ( Object2.RepoObject_fullname ) WITHIN Group(GRAPH Path)              As referencing_level
  , Last_Value ( Object2.[RepoObject_guid] ) Within Group(GRAPH Path)           As LastNode_guid
  , Last_Value ( Object2.[RepoObject_fullname] ) Within Group(GRAPH Path)       As LastNode_fullname
  , Last_Value ( Object2.[RepoObject_fullname2] ) Within Group(GRAPH Path)      As LastNode_fullname2
  , String_Agg ( Object2.[RepoObject_fullname], '->' ) Within Group(GRAPH Path) As ListNode
From
    [graph].[RepoObject] As Object1
  , [graph].[ReferencingObject] For Path As referencing
  , [graph].[RepoObject] For Path As Object2
Where Match(
    SHORTEST_PATH(Object1(-(referencing)->Object2)+));
*/
CREATE View reference.RepoObject_referencing_level
As
Select
    a = 1
Go


Go


Go


Go


Go


Go


Go


Go


Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '28e90a1e-7495-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_referencing_level';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [graph].[ReferencingObject]
* [graph].[RepoObject]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_referencing_level';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'StartingNode_guid,LastNode_guid,referencing_level', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_referencing_level';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,uniqueidentifier,int', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_referencing_level';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'AD489125-0E96-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_referencing_level';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.RepoObject_referencing_level_T.adoc[]
* xref:reference.usp_PERSIST_RepoObject_referencing_level_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_referencing_level';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:graph.ReferencingObject.adoc[]
* xref:graph.RepoObject.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_referencing_level';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '25d989df-5af7-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_referencing_level', @level2type = N'COLUMN', @level2name = N'a';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_referencing_level';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_referencing_level';

