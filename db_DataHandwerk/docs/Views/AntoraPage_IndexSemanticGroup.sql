
CREATE View docs.AntoraPage_IndexSemanticGroup
As
Select
    page_content =
    --
    Concat (
               '= Index SemanticGroup'
             , Char ( 13 ) + Char ( 10 )
             , String_Agg ( AntoraIndexSemanticgroup, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                  IsNull (
                                                                                                             IndexSemanticGroup
                                                                                                           , 'zzzzzzz'
                                                                                                         ))
           )
From
    docs.AntoraIndexSemanticgroup
Group By
    fixvalue
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '8a1293b9-de96-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraPage_IndexSemanticGroup';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '961293b9-de96-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraPage_IndexSemanticGroup'
  , @level2type = N'COLUMN'
  , @level2name = N'page_content';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [docs].[AntoraIndexSemanticgroup]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraPage_IndexSemanticGroup';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'page_content', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraPage_IndexSemanticGroup';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(max)', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraPage_IndexSemanticGroup';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'3B01F906-1699-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraPage_IndexSemanticGroup';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:docs.AntoraIndexSemanticgroup.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraPage_IndexSemanticGroup';

