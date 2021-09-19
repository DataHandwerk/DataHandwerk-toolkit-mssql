
CREATE View reference.RepoObject_ReferencingList
As
Select
    ror.Referenced_guid
  , AntoraReferencingList =
  --
  String_Agg ( Concat (
                          --* xref:target-page-filename.adoc[link text]
                          --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                          Cast('* xref:' As NVarchar(Max)), ror.referencing_fullname2, '.adoc[]'
                      --, QuoteName(ror.[Referencing_fullname])
                      --, ' '
                      --, CHAR(13)
                      --, CHAR(10)
                      )
             , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                ror.referencing_fullname)
  , Referenced_fullname   = Max ( ror.referenced_fullname )
  , Referenced_fullname2  = Max ( ror.referenced_fullname2 )
  , Referenced_type       = Max ( ror.referenced_type )
From
    reference.RepoObject_ReferencedReferencing As ror
Where
    ror.referencing_is_DocsOutput = 1
Group By
    ror.Referenced_guid
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '681254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencingList'
  , @level2type = N'COLUMN'
  , @level2name = N'AntoraReferencingList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '671254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencingList'
  , @level2type = N'COLUMN'
  , @level2name = N'Referenced_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '661254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencingList'
  , @level2type = N'COLUMN'
  , @level2name = N'Referenced_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '651254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencingList'
  , @level2type = N'COLUMN'
  , @level2name = N'Referenced_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '641254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencingList'
  , @level2type = N'COLUMN'
  , @level2name = N'Referenced_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'e95bf6c2-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ReferencingList';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [reference].[RepoObject_ReferencingReferenced]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencingList';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.RepoObject_gross2.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencingList';




GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.RepoObject_ReferencingReferenced.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencingList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_ReferencingReferenced].[Referenced_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencingList', @level2type = N'COLUMN', @level2name = N'Referenced_guid';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencingList';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencingList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_ReferencingReferenced].[Referenced_fullname]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencingList', @level2type = N'COLUMN', @level2name = N'Referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[referenced_schema_name],''].['',[referenced_entity_name],'']''))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ReferencingList', @level2type = N'COLUMN', @level2name = N'Referenced_fullname';

