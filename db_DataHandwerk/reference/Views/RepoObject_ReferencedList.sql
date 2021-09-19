
CREATE View reference.RepoObject_ReferencedList
As
Select
    ror.Referencing_guid
  , AntoraReferencedList  =
  --
  String_Agg ( Concat (
                          --* xref:target-page-filename.adoc[link text]
                          --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                          Cast('* xref:' As NVarchar(Max)), ror.referenced_fullname2, '.adoc[]'
                      --, QuoteName(ror.[Referenced_fullname])
                      --, ' '
                      --, CHAR(13)
                      --, CHAR(10)
                      )
             , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                ror.referenced_fullname)
  , Referencing_fullname  = Max ( ror.referencing_fullname )
  , Referencing_fullname2 = Max ( ror.referencing_fullname2 )
  , Referencing_type      = Max ( ror.referencing_type )
From
    reference.RepoObject_ReferencedReferencing As ror
Where
    ror.referenced_is_DocsOutput = 1
Group By
    ror.Referencing_guid
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '631254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencedList'
  , @level2type = N'COLUMN'
  , @level2name = N'AntoraReferencedList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '621254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencedList'
  , @level2type = N'COLUMN'
  , @level2name = N'Referencing_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '611254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencedList'
  , @level2type = N'COLUMN'
  , @level2name = N'Referencing_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '601254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencedList'
  , @level2type = N'COLUMN'
  , @level2name = N'Referencing_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5f1254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencedList'
  , @level2type = N'COLUMN'
  , @level2name = N'Referencing_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'e85bf6c2-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencedList';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [reference].[RepoObject_ReferencingReferenced]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedList';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.RepoObject_gross2.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedList';




GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.RepoObject_ReferencingReferenced.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_ReferencingReferenced].[Referencing_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedList', @level2type = N'COLUMN', @level2name = N'Referencing_guid';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedList';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_ReferencingReferenced].[Referencing_fullname]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedList', @level2type = N'COLUMN', @level2name = N'Referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[referencing_schema_name],''].['',[referencing_entity_name],'']''))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencedList', @level2type = N'COLUMN', @level2name = N'Referencing_fullname';

