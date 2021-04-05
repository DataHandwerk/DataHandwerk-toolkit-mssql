
CREATE View [repo].[RepoObject_referencing_level]
As
Select
    --
    Object1.[RepoObject_guid]                                                 As StartingNode_guid
  , Object1.[RepoObject_fullname]                                             As StartingNode_fullname
  , Object1.[RepoObject_fullname2]                                            As StartingNode_fullname2
  , Count (Object2.[RepoObject_fullname]) WITHIN Group(GRAPH PATH)            As referencing_level
  , Last_Value (Object2.[RepoObject_guid]) WITHIN Group(GRAPH PATH)           As LastNode_guid
  , Last_Value (Object2.[RepoObject_fullname]) WITHIN Group(GRAPH PATH)       As LastNode_fullname
  , Last_Value (Object2.[RepoObject_fullname2]) WITHIN Group(GRAPH PATH)      As LastNode_fullname2
  , String_Agg (Object2.[RepoObject_fullname], '->') WITHIN Group(GRAPH PATH) As ListNode
From
    [graph].[RepoObject] As Object1
  , [graph].[ReferencingObject] For PATH As referencing
  , [graph].[RepoObject] For PATH As Object2
Where MATCH(
    SHORTEST_PATH(Object1(-(referencing)->Object2)+))
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3ae90a1e-7495-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_referencing_level', @level2type = N'COLUMN', @level2name = N'ListNode';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '39e90a1e-7495-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_referencing_level', @level2type = N'COLUMN', @level2name = N'LastNode_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '38e90a1e-7495-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_referencing_level', @level2type = N'COLUMN', @level2name = N'LastNode_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '37e90a1e-7495-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_referencing_level', @level2type = N'COLUMN', @level2name = N'LastNode_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '36e90a1e-7495-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_referencing_level', @level2type = N'COLUMN', @level2name = N'referencing_level';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '35e90a1e-7495-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_referencing_level', @level2type = N'COLUMN', @level2name = N'StartingNode_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '34e90a1e-7495-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_referencing_level', @level2type = N'COLUMN', @level2name = N'StartingNode_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '33e90a1e-7495-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_referencing_level', @level2type = N'COLUMN', @level2name = N'StartingNode_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '28e90a1e-7495-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_referencing_level';

