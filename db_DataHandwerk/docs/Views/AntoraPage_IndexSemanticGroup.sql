Create View docs.AntoraPage_IndexSemanticGroup
As
Select
    page_content = Concat (
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
    fixvalue;
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
