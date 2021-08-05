﻿CREATE View [reference].RepoObject_referenced_level
As
Select
    Object1.RepoObject_guid                                                     As StartingNode_guid
  , Object1.RepoObject_fullname                                                 As StartingNode_fullname
  , Object1.RepoObject_fullname2                                                As StartingNode_fullname2
  , Count ( Object2.RepoObject_fullname ) WITHIN Group(GRAPH Path)              As referenced_level
  , Last_Value ( Object2.[RepoObject_guid] ) Within Group(GRAPH Path)           As LastNode_guid
  , Last_Value ( Object2.[RepoObject_fullname] ) Within Group(GRAPH Path)       As LastNode_fullname
  , Last_Value ( Object2.[RepoObject_fullname2] ) Within Group(GRAPH Path)      As LastNode_fullname2
  , String_Agg ( Object2.[RepoObject_fullname], '->' ) Within Group(GRAPH Path) As ListNode
From
    [graph].[RepoObject] As Object1
  , [graph].[ReferencedObject] For Path As referenced
  , [graph].[RepoObject] For Path As Object2
Where Match(
    SHORTEST_PATH(Object1(-(referenced)->Object2)+));
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '32e90a1e-7495-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_referenced_level'
  , @level2type = N'COLUMN'
  , @level2name = N'ListNode';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '31e90a1e-7495-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_referenced_level'
  , @level2type = N'COLUMN'
  , @level2name = N'LastNode_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '30e90a1e-7495-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_referenced_level'
  , @level2type = N'COLUMN'
  , @level2name = N'LastNode_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2fe90a1e-7495-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_referenced_level'
  , @level2type = N'COLUMN'
  , @level2name = N'LastNode_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2ee90a1e-7495-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_referenced_level'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_level';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2de90a1e-7495-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_referenced_level'
  , @level2type = N'COLUMN'
  , @level2name = N'StartingNode_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2ce90a1e-7495-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_referenced_level'
  , @level2type = N'COLUMN'
  , @level2name = N'StartingNode_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '2be90a1e-7495-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_referenced_level'
  , @level2type = N'COLUMN'
  , @level2name = N'StartingNode_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '27e90a1e-7495-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_referenced_level';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [graph].[ReferencedObject]
* [graph].[RepoObject]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_referenced_level';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'StartingNode_guid,LastNode_guid,referenced_level', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_referenced_level';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,uniqueidentifier,int', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_referenced_level';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'E6C342F4-0D96-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_referenced_level';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.RepoObject_referenced_level_T.adoc[]
* xref:reference.usp_PERSIST_RepoObject_referenced_level_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_referenced_level';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:graph.ReferencedObject.adoc[]
* xref:graph.RepoObject.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_referenced_level';

