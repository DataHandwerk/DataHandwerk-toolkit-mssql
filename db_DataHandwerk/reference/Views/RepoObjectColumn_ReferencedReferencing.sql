

CREATE View [reference].[RepoObjectColumn_ReferencedReferencing]
As
--Select
--    Object2.RepoObject_fullname        As Referenced_fullname
--  , Object2.RepoObject_fullname2       As Referenced_fullname2
--  , Object2.RepoObject_guid            As Referenced_RepoObject_guid
--  , Object2.RepoObject_type            As Referenced_type
--  , Object2.RepoObjectColumn_fullname  As ReferencedColumn_fullname
--  , Object2.RepoObjectColumn_fullname2 As ReferencedColumn_fullname2
--  , Object2.RepoObjectColumn_name      As ReferencedColumn_name
--  , Object2.RepoObjectColumn_type      As ReferencedColumn_type
--  , Object2.RepoObjectColumn_guid      As Referenced_guid
--  , Object1.RepoObject_fullname        As Referencing_fullname
--  , Object1.RepoObject_fullname2       As Referencing_fullname2
--  , Object1.RepoObject_guid            As Referencing_RepoObject_guid
--  , Object1.RepoObject_type            As Referencing_type
--  , Object1.RepoObjectColumn_fullname  As ReferencingColumn_fullname
--  , Object1.RepoObjectColumn_fullname2 As ReferencingColumn_fullname2
--  , Object1.RepoObjectColumn_name      As ReferencingColumn_name
--  , Object1.RepoObjectColumn_type      As ReferencingColumn_type
--  , Object1.RepoObjectColumn_guid      As Referencing_guid
--From
--    graph.RepoObjectColumn As Object1
--  , graph.ReferencedObjectColumn As referenced
--  , graph.RepoObjectColumn As Object2
--Where Match(
--    Object1-(referenced)->Object2);
Select
    Referenced_fullname                 = referenced_ro_fullname
  , Referenced_fullname2                = referenced_ro_fullname2
  , Referenced_RepoObject_guid          = referenced_RepoObject_guid
  , Referenced_type                     = referenced_type
  , ReferencedColumn_fullname           = referenced_roc_fullname
  , ReferencedColumn_fullname2          = referenced_roc_fullname2
  , ReferencedColumn_name               = referenced_column_name
  --, Object2.RepoObjectColumn_type      As ReferencedColumn_type
  , Referenced_guid                     = referenced_RepoObjectColumn_guid
  , referenced_external_AntoraComponent
  , referenced_external_AntoraModule
  , referenced_is_external
  , referenced_AntoraXref               = Concat (
                                                     --* xref:target-page-filename.adoc[link text]
                                                     --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                                                     Cast('* xref:' As NVarchar(Max))
                                                   , referenced_external_AntoraComponent + ':'
                                                   , referenced_external_AntoraModule + ':'
                                                   , docs.fs_cleanStringForFilename ( referenced_ro_fullname2 )
                                                   , '.adoc#column-' + docs.fs_cleanStringForAnchorId ( referenced_column_name )
                                                     + '[+' + referenced_roc_fullname2 + '+]'
                                                   , ' in xref:' + referenced_external_AntoraComponent + ':'
                                                     + referenced_external_AntoraModule + ':' + 'nav/objects-by-schema.adoc[]'
                                                 )
  , Referencing_fullname                = referencing_ro_fullname
  , Referencing_fullname2               = referencing_ro_fullname2
  , Referencing_RepoObject_guid         = referencing_RepoObject_guid
  , Referencing_type                    = referencing_type
  , ReferencingColumn_fullname          = referencing_roc_fullname
  , ReferencingColumn_fullname2         = referencing_roc_fullname2
  , ReferencingColumn_name              = referencing_column_name
  --, Object1.RepoObjectColumn_type      As ReferencingColumn_type
  , Referencing_guid                    = referencing_RepoObjectColumn_guid
  , referencing_external_AntoraComponent
  , referencing_external_AntoraModule
  , referencing_is_external
  , referencing_AntoraXref              = Concat (
                                                     --* xref:target-page-filename.adoc[link text]
                                                     --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                                                     Cast('* xref:' As NVarchar(Max))
                                                   , referencing_external_AntoraComponent + ':'
                                                   , referencing_external_AntoraModule + ':'
                                                   , docs.fs_cleanStringForFilename ( referencing_ro_fullname2 )
                                                   , '.adoc#column-' + docs.fs_cleanStringForAnchorId ( referencing_column_name )
                                                     + '[+' + referencing_roc_fullname2 + '+]'
                                                   , ' in xref:' + referencing_external_AntoraComponent + ':'
                                                     + referencing_external_AntoraModule + ':' + 'nav/objects-by-schema.adoc[]'
                                                 )
From
    reference.RepoObjectColumn_reference_T
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5af74f6d-791d-ec11-8522-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referencing_AntoraXref';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '59f74f6d-791d-ec11-8522-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referencing_is_external';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '58f74f6d-791d-ec11-8522-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referencing_external_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '57f74f6d-791d-ec11-8522-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referencing_external_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4d4679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referencing_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_T].[referencing_RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referencing_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b935b4cd-e093-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'ReferencingColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_T].[referencing_column_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'ReferencingColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5e1254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'ReferencingColumn_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_T].[referencing_roc_fullname2]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'ReferencingColumn_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([referencing_schema_name],''.'',[referencing_entity_name],''.'',[referencing_column_name]))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'ReferencingColumn_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4b4679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'ReferencingColumn_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_T].[referencing_roc_fullname]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'ReferencingColumn_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[referencing_schema_name],''].['',[referencing_entity_name],''].['',[referencing_column_name],'']''))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'ReferencingColumn_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4a4679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_T].[referencing_type]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '494679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_T].[referencing_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5d1254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referencing_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_T].[referencing_ro_fullname2]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referencing_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([referencing_schema_name],''.'',[referencing_entity_name]))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referencing_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '484679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_T].[referencing_ro_fullname]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[referencing_schema_name],''].['',[referencing_entity_name],'']''))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '56f74f6d-791d-ec11-8522-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referenced_AntoraXref';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '55f74f6d-791d-ec11-8522-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referenced_is_external';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '54f74f6d-791d-ec11-8522-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referenced_external_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '53f74f6d-791d-ec11-8522-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referenced_external_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '474679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referenced_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_T].[referenced_RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referenced_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b835b4cd-e093-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'ReferencedColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_T].[referenced_column_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'ReferencedColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5c1254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'ReferencedColumn_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_T].[referenced_roc_fullname2]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'ReferencedColumn_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([referenced_schema_name],''.'',[referenced_entity_name],''.'',[referenced_column_name]))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'ReferencedColumn_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '454679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'ReferencedColumn_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_T].[referenced_roc_fullname]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'ReferencedColumn_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[referenced_schema_name],''].['',[referenced_entity_name],''].['',[referenced_column_name],'']''))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'ReferencedColumn_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '444679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_T].[referenced_type]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '434679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_T].[referenced_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5b1254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referenced_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_T].[referenced_ro_fullname2]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referenced_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([referenced_schema_name],''.'',[referenced_entity_name]))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referenced_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '424679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_T].[referenced_ro_fullname]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[referenced_schema_name],''].['',[referenced_entity_name],'']''))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing', @level2type = N'COLUMN', @level2name = N'Referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'3e4679b8-147c-eb11-84e6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [reference].[RepoObjectColumn_reference_T]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'Referenced_guid,Referencing_guid', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'639AAC57-0496-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.ftv_RepoObject_DbmlColumnRelation.adoc[]
* xref:reference.ftv_RepoObjectColumn_ReferenceTree.adoc[]
* xref:reference.RepoObjectColumn_ReferencedList.adoc[]
* xref:reference.RepoObjectColumn_ReferencingList.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.RepoObjectColumn_reference_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_ReferencedReferencing';

