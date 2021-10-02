
/*
<<property_start>>Description
PlantUML for all entities to be included into the reference diagram, defined by  @Referenced_Depth and @Referencing_Depth +

relations between these entities are generated in +
xref:sqldb:docs.repoobject_plantuml_objectreflist_1_1.adoc[], xref:sqldb:docs.repoobject_plantuml_objectreflist_0_30.adoc[], xref:sqldb:docs.repoobject_plantuml_objectreflist_30_0.adoc[] 
<<property_end>>

<<property_start>>exampleUsage
SELECT
    ro.RepoObject_guid
  , ro.RepoObject_fullname2
  , ro_p.PumlEntityList
FROM
    repo.RepoObject                                                                                   ro
    CROSS APPLY [docs].[ftv_RepoObject_Reference_PlantUml_EntityRefList] ( ro.RepoObject_guid, 1, 1 ) ro_p
ORDER BY
    ro.RepoObject_fullname2;
<<property_end>>


Msg 8624, Level 16, State 1, Line 19
Internal Query Processor Error: The query processor could not produce a query plan. For more information, contact Customer Support Services.

=> we need to persist [repo].[RepoObject_referenced_level_T] and [repo].[RepoObject_referencing_level_T]

remember to persist the source before:

EXEC [repo].[usp_PERSIST_RepoObject_referenced_level_T]
EXEC [repo].[usp_PERSIST_RepoObject_referencing_level_T]
EXEC [docs].[usp_PERSIST_RepoObject_Plantuml_Entity_T]

check:

SELECT * from [docs].[ftv_RepoObject_Reference_PlantUml_EntityRefList]('69CE8EB8-5F62-EB11-84DC-A81E8446D5B0', 1, 1)

*/
CREATE Function [docs].[ftv_RepoObject_Reference_PlantUml_EntityRefList]
(
    @RepoObject_guid   UniqueIdentifier
  , @Referenced_Depth  Int = 1
  , @Referencing_Depth Int = 1
)
Returns Table
As
Return
(
    With
    ro
    As
        (
        Select
            ro_guid        = @RepoObject_guid
          , Node_guid      = @RepoObject_guid
          , Node_fullname2 = RepoObject_fullname2
        From
            repo.RepoObject
        Where
            RepoObject_guid = @RepoObject_guid
        Union
        --referenced objects
        Select
            RepoObject_guid
          , Referenced_guid
          , referenced_fullname2
        From
            reference.RepoObject_ReferenceTree
        Where
            RepoObject_guid       = @RepoObject_guid
            And Referenced_Depth  <= @Referenced_Depth
            And Referencing_Depth <= @Referencing_Depth
            And Referencing_Depth = 0
        Union
        --referencing objects
        Select
            RepoObject_guid
          , Referencing_guid
          , referencing_fullname2
        From
            reference.RepoObject_ReferenceTree
        Where
            RepoObject_guid       = @RepoObject_guid
            And Referencing_Depth <= @Referencing_Depth
            And Referenced_Depth  = 0

        ----referenced objects
        --Select
        --    [RepoObject_guid]
        --  , [Referenced_guid]
        --  , [Referenced_fullname2]
        --From
        --    [reference].[RepoObject_ReferenceTree_30_0_T]
        --Where
        --    [RepoObject_guid]      = @RepoObject_guid
        --    And [Referenced_Depth] <= @Referenced_Depth
        --Union
        ----referencing objects
        --Select
        --    [RepoObject_guid]
        --  , [Referencing_guid]
        --  , [Referencing_fullname2]
        --From
        --    [reference].[RepoObject_ReferenceTree_0_30_T]
        --Where
        --    [RepoObject_guid]       = @RepoObject_guid
        --    And [Referencing_Depth] <= @Referencing_Depth
        ----
        ----old logic, based on graph tables:
        --Union
        --Select
        --    StartingNode_guid
        --  , LastNode_guid
        --  , LastNode_fullname2
        --From
        --    [reference].RepoObject_referenced_level_T
        --Where
        --    StartingNode_guid    = @RepoObject_guid
        --    And referenced_level <= @Referenced_Depth
        --Union
        --Select
        --    StartingNode_guid
        --  , LastNode_guid
        --  , LastNode_fullname2
        --From
        --    [reference].RepoObject_referencing_level_T
        --Where
        --    StartingNode_guid     = @RepoObject_guid
        --    And referencing_level <= @Referencing_Depth
        )
    Select
        ro.ro_guid
      , Referenced_Depth     = @Referenced_Depth
      , Referencing_Depth    = @Referencing_Depth
      , PumlEntityList       = String_Agg ( rop.RepoObject_Puml, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                             ro.Node_fullname2)
      , PumlEntityOnlyPkList = String_Agg ( rop.RepoObject_PumlOnlyPK, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                                   ro.Node_fullname2)
    From
        ro
        Inner Join
            docs.RepoObject_Plantuml_Entity_T As rop
                On
                rop.RepoObject_guid = ro.Node_guid
    Group By
        ro.ro_guid
);
Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '2be63abf-9395-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'FUNCTION'
  , @level1name = N'ftv_RepoObject_Reference_PlantUml_EntityRefList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [docs].[RepoObject_Plantuml_Entity_T]
* [reference].[RepoObject_ReferenceTree]
* [repo].[RepoObject]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_Reference_PlantUml_EntityRefList';




GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.RepoObject_Plantuml.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_Reference_PlantUml_EntityRefList';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:docs.RepoObject_Plantuml_Entity_T.adoc[]
* xref:reference.RepoObject_ReferenceTree.adoc[]
* xref:repo.RepoObject.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_Reference_PlantUml_EntityRefList';






GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'
PlantUML for all entities to be included into the reference diagram, defined by  @Referenced_Depth and @Referencing_Depth +

relations between these entities are generated in +
xref:sqldb:docs.RepoObject_Plantuml_ObjectRefList_1_1.adoc[], xref:sqldb:docs.RepoObject_Plantuml_ObjectRefList_0_30.adoc[], xref:sqldb:docs.RepoObject_Plantuml_ObjectRefList_30_0.adoc[] ', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_Reference_PlantUml_EntityRefList';


GO
EXECUTE sp_addextendedproperty @name = N'exampleUsage', @value = N'
SELECT
    ro.RepoObject_guid
  , ro.RepoObject_fullname2
  , ro_p.PumlEntityList
FROM
    repo.RepoObject                                                                                   ro
    CROSS APPLY [docs].[ftv_RepoObject_Reference_PlantUml_EntityRefList] ( ro.RepoObject_guid, 1, 1 ) ro_p
ORDER BY
    ro.RepoObject_fullname2;', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_Reference_PlantUml_EntityRefList';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_Reference_PlantUml_EntityRefList';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_Reference_PlantUml_EntityRefList';

