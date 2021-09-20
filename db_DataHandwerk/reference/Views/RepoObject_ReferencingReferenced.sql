
/*
per referencing RepoObject all directly referenced RepoOobject are listed

can be used in both directions:

* get all referenced per referencing
* get all referencing per referenced

////
old logic:

uses graph tables

* [graph].[RepoObject]
* [graph].[ReferencedObject]

----
Select
    Object1.RepoObject_fullname  As Referencing_fullname
  , Object1.RepoObject_fullname2 As Referencing_fullname2
  , Object1.RepoObject_guid      As Referencing_guid
  , Object1.RepoObject_type      As Referencing_type
  , Object2.RepoObject_fullname  As Referenced_fullname
  , Object2.RepoObject_fullname2 As Referenced_fullname2
  , Object2.RepoObject_guid      As Referenced_guid
  , Object2.RepoObject_type      As Referenced_type
From
    graph.RepoObject As Object1
  , graph.ReferencedObject As referenced
  , graph.RepoObject As Object2
Where Match(
    Object1-(referenced)->Object2);
----
////

*/
CREATE View reference.RepoObject_ReferencedReferencing
As
Select
    T1.referenced_fullname
  , T1.referenced_fullname2
  , Referenced_guid           = T1.referenced_RepoObject_guid
  , referenced_is_DocsOutput  = typ1.is_DocsOutput
  , T1.referenced_type
  , T1.referencing_fullname
  , T1.referencing_fullname2
  , Referencing_guid          = T1.referencing_RepoObject_guid
  , T1.referencing_type
  , referencing_is_DocsOutput = typ2.is_DocsOutput
From
    reference.RepoObject_reference_T As T1
    Left Outer Join
        configT.type                 As typ1
            On
            typ1.type = T1.referenced_type

    Left Outer Join
        configT.type                 As typ2
            On
            typ2.type = T1.referencing_type
Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '714679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencedReferencing'
  , @level2type = N'COLUMN'
  , @level2name = N'Referenced_type';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '704679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencedReferencing'
  , @level2type = N'COLUMN'
  , @level2name = N'Referenced_guid';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6f4679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencedReferencing'
  , @level2type = N'COLUMN'
  , @level2name = N'Referenced_fullname';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6e4679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencedReferencing'
  , @level2type = N'COLUMN'
  , @level2name = N'Referencing_type';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6d4679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencedReferencing'
  , @level2type = N'COLUMN'
  , @level2name = N'Referencing_guid';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6c4679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencedReferencing'
  , @level2type = N'COLUMN'
  , @level2name = N'Referencing_fullname';


Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '414679b8-147c-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencedReferencing';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8371b9ec-0892-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencedReferencing'
  , @level2type = N'COLUMN'
  , @level2name = N'Referencing_fullname2';


Go
Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8471b9ec-0892-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencedReferencing'
  , @level2type = N'COLUMN'
  , @level2name = N'Referenced_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [reference].[RepoObject_reference_T]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedReferencing';




GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'Referenced_guid,Referencing_guid', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'1AFD851C-0496-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.ftv_RepoObject_ReferenceTree.adoc[]
* xref:reference.ftv_RepoObject_ReferenceTree_referenced.adoc[]
* xref:reference.ftv_RepoObject_ReferenceTree_referencing.adoc[]
* xref:reference.ftv_RepoObject_ReferenceTree_via_fullname.adoc[]
* xref:reference.RepoObject_ReferencedList.adoc[]
* xref:reference.RepoObject_ReferencingList.adoc[]
* xref:reference.usp_RepoObject_ReferenceTree_insert.adoc[]
* xref:repo.RepoObject_gross.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedReferencing';




GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.RepoObject_reference_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([referencing_schema_name],''.'',[referencing_entity_name]))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referencing_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[referencing_schema_name],''].['',[referencing_entity_name],'']''))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([referenced_schema_name],''.'',[referenced_entity_name]))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referenced_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[referenced_schema_name],''].['',[referenced_entity_name],'']''))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_reference_T].[referencing_type]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_reference_T].[referencing_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referencing_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_reference_T].[referencing_fullname2]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referencing_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_reference_T].[referencing_fullname]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_reference_T].[referenced_type]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_reference_T].[referenced_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referenced_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_reference_T].[referenced_fullname2]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referenced_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_reference_T].[referenced_fullname]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd3fb2238-8d19-ec11-851e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referencing_is_DocsOutput';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd2fb2238-8d19-ec11-851e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referenced_is_DocsOutput';

