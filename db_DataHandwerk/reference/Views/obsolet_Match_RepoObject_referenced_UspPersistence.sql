
/*
<<property_start>>MS_Description
* detects references between persistence procedures
* uses referenced stored in xref:sqldb:graph.ReferencedObject.adoc[]
* to get only relations between persistence tables the result set is limited:
+
[source,sql]
------
Where
    ro1.[is_persistence]     = 1
    And ro2.[is_persistence] = 1;
------
* FirstNode and LastNode are the persistence tables
* First_usp_persistence and Last_usp_persistence are the related persistence proccedures +
each persistence table has a related persistence procedure
<<property_end>>

*/
CREATE View [reference].[obsolet_Match_RepoObject_referenced_UspPersistence]
As
Select
    ro1.usp_persistence_name            As First_usp_persistence_name
  , ro1.usp_persistence_RepoObject_guid As First_usp_persistence_RepoObject_guid
  , ro2.usp_persistence_name            As Last_usp_persistence_name
  , ro2.usp_persistence_RepoObject_guid As Last_usp_persistence_RepoObject_guid
  , ro1.RepoObject_guid                 As FirstNode
  , ro1.RepoObject_schema_name          As FirstNode_schema_name
  , ro1.RepoObject_fullname             As FirstNodeName
  --, Q.FirstNodeName
  , ro2.RepoObject_guid                 As LastNode
  , ro2.RepoObject_schema_name          As LastNode_schema_name
  , ro2.RepoObject_fullname             As LastNodeName
--, Q.LastNodeName
--, Q.ListNodeName
From
(
    Select
        --
        Object1.RepoObject_guid                                             As FirstNode
      , Object1.RepoObject_fullname                                         As FirstNodeName
      --, String_Agg ( Object2.RepoObject_fullname, '->' ) Within Group(GRAPH Path) As ListNodeName
      , Last_Value ( Object2.RepoObject_guid ) WITHIN Group(GRAPH Path)     As LastNode
      , Last_Value ( Object2.RepoObject_fullname ) WITHIN Group(GRAPH Path) As LastNodeName
    From
        [graph].[RepoObject] As Object1
      , [graph].[ReferencedObject] For Path As referenced
      , [graph].[RepoObject] For Path As Object2
    Where Match(
        SHORTEST_PATH(Object1(-(referenced)->Object2)+))
        And Object1.[RepoObject_type] In
            ( 'u', 'v' )
)                                 As Q
    Left Join
        [repo].[RepoObject_gross] ro1
            On
            ro1.RepoObject_guid = Q.FirstNode

    Left Join
        [repo].[RepoObject_gross] ro2
            On
            ro2.RepoObject_guid = Q.LastNode
Where
    ro1.[is_persistence]     = 1
    And ro2.[is_persistence] = 1;
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1e68f544-e466-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'obsolet_Match_RepoObject_referenced_UspPersistence'
  , @level2type = N'COLUMN'
  , @level2name = N'Last_usp_persistence_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1d68f544-e466-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'obsolet_Match_RepoObject_referenced_UspPersistence'
  , @level2type = N'COLUMN'
  , @level2name = N'First_usp_persistence_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1c68f544-e466-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'obsolet_Match_RepoObject_referenced_UspPersistence'
  , @level2type = N'COLUMN'
  , @level2name = N'Last_usp_persistence_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1b68f544-e466-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'obsolet_Match_RepoObject_referenced_UspPersistence'
  , @level2type = N'COLUMN'
  , @level2name = N'First_usp_persistence_RepoObject_guid';
Go


Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1968f544-e466-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'obsolet_Match_RepoObject_referenced_UspPersistence'
  , @level2type = N'COLUMN'
  , @level2name = N'LastNodeName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1868f544-e466-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'obsolet_Match_RepoObject_referenced_UspPersistence'
  , @level2type = N'COLUMN'
  , @level2name = N'LastNode';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1768f544-e466-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'obsolet_Match_RepoObject_referenced_UspPersistence'
  , @level2type = N'COLUMN'
  , @level2name = N'FirstNodeName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '1668f544-e466-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'obsolet_Match_RepoObject_referenced_UspPersistence'
  , @level2type = N'COLUMN'
  , @level2name = N'FirstNode';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '1468f544-e466-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'obsolet_Match_RepoObject_referenced_UspPersistence';
Go
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '54514649-189d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'obsolet_Match_RepoObject_referenced_UspPersistence', @level2type = N'COLUMN', @level2name = N'LastNode_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '53514649-189d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'obsolet_Match_RepoObject_referenced_UspPersistence', @level2type = N'COLUMN', @level2name = N'FirstNode_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [graph].[ReferencedObject]
* [graph].[RepoObject]
* [repo].[RepoObject_gross]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'obsolet_Match_RepoObject_referenced_UspPersistence';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'FirstNode,LastNode', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'obsolet_Match_RepoObject_referenced_UspPersistence';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'obsolet_Match_RepoObject_referenced_UspPersistence';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'413E7A02-0A96-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'obsolet_Match_RepoObject_referenced_UspPersistence';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'
* detects references between persistence procedures
* uses referenced stored in xref:sqldb:graph.ReferencedObject.adoc[]
* to get only relations between persistence tables the result set is limited:
+
[source,sql]
------
Where
    ro1.[is_persistence]     = 1
    And ro2.[is_persistence] = 1;
------
* FirstNode and LastNode are the persistence tables
* First_usp_persistence and Last_usp_persistence are the related persistence proccedures +
each persistence table has a related persistence procedure', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'obsolet_Match_RepoObject_referenced_UspPersistence';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.Reference_UspPersistence.adoc[]
* xref:repo.usp_main.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'obsolet_Match_RepoObject_referenced_UspPersistence';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:graph.ReferencedObject.adoc[]
* xref:graph.RepoObject.adoc[]
* xref:repo.RepoObject_gross.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'obsolet_Match_RepoObject_referenced_UspPersistence';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(''usp_PERSIST_''+[RepoObject_name])', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'obsolet_Match_RepoObject_referenced_UspPersistence', @level2type = N'COLUMN', @level2name = N'Last_usp_persistence_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(''usp_PERSIST_''+[RepoObject_name])', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'obsolet_Match_RepoObject_referenced_UspPersistence', @level2type = N'COLUMN', @level2name = N'First_usp_persistence_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'obsolet_Match_RepoObject_referenced_UspPersistence', @level2type = N'COLUMN', @level2name = N'LastNodeName';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'obsolet_Match_RepoObject_referenced_UspPersistence', @level2type = N'COLUMN', @level2name = N'FirstNodeName';

