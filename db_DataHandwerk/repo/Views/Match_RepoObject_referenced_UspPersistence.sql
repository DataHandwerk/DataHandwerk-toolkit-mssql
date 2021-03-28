﻿Create View repo.Match_RepoObject_referenced_UspPersistence
As
Select
    -- 
    Q.FirstNode
  , Q.FirstNodeName
  , Q.LastNode
  , Q.LastNodeName
  , Q.ListNodeName
  , ro1.[usp_persistence_RepoObject_guid] As First_usp_persistence_RepoObject_guid
  , ro2.[usp_persistence_RepoObject_guid] As Last_usp_persistence_RepoObject_guid
  , ro1.[usp_persistence_name]            As First_usp_persistence_name
  , ro2.[usp_persistence_name]            As Last_usp_persistence_name
From
(
    Select
        --
        Object1.[RepoObject_guid]                                                 As FirstNode
      , Object1.[RepoObject_fullname]                                             As FirstNodeName
      , String_Agg (Object2.[RepoObject_fullname], '->') WITHIN Group(GRAPH PATH) As ListNodeName
      , Last_Value (Object2.[RepoObject_guid]) WITHIN Group(GRAPH PATH)           As LastNode
      , Last_Value (Object2.[RepoObject_fullname]) WITHIN Group(GRAPH PATH)       As LastNodeName
    From [graph].[RepoObject] As Object1
       , [graph].[ReferencedObject] For PATH As referenced
       , [graph].[RepoObject] For PATH As Object2
    Where MATCH(SHORTEST_PATH(Object1(-(referenced)->Object2)+))
                And Object1.[RepoObject_type] In ( 'u', 'v' )
)                                       As Q
    Left Join [repo].[RepoObject_gross] ro1
        On ro1.RepoObject_guid = Q.FirstNode
    Left Join [repo].[RepoObject_gross] ro2
        On ro2.RepoObject_guid = Q.LastNode
Where ro1.[is_persistence] = 1
      And ro2.[is_persistence] = 1
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1e68f544-e466-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Match_RepoObject_referenced_UspPersistence', @level2type = N'COLUMN', @level2name = N'Last_usp_persistence_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1d68f544-e466-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Match_RepoObject_referenced_UspPersistence', @level2type = N'COLUMN', @level2name = N'First_usp_persistence_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1c68f544-e466-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Match_RepoObject_referenced_UspPersistence', @level2type = N'COLUMN', @level2name = N'Last_usp_persistence_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1b68f544-e466-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Match_RepoObject_referenced_UspPersistence', @level2type = N'COLUMN', @level2name = N'First_usp_persistence_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1a68f544-e466-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Match_RepoObject_referenced_UspPersistence', @level2type = N'COLUMN', @level2name = N'ListNodeName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1968f544-e466-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Match_RepoObject_referenced_UspPersistence', @level2type = N'COLUMN', @level2name = N'LastNodeName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1868f544-e466-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Match_RepoObject_referenced_UspPersistence', @level2type = N'COLUMN', @level2name = N'LastNode';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1768f544-e466-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Match_RepoObject_referenced_UspPersistence', @level2type = N'COLUMN', @level2name = N'FirstNodeName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1668f544-e466-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Match_RepoObject_referenced_UspPersistence', @level2type = N'COLUMN', @level2name = N'FirstNode';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1468f544-e466-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Match_RepoObject_referenced_UspPersistence';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'[graph].[ReferencedObject]
[graph].[RepoObject]
[repo].[RepoObject_gross]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Match_RepoObject_referenced_UspPersistence';

