
CREATE View [docs].[RepoObject_IndexList]
As
Select
    ix.parent_RepoObject_guid As RepoObject_guid
  , AntoraIndexList           =
  --
  String_Agg (
                 Concat (
                            --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                            Cast('' As NVarchar(Max))
                          , Char ( 13 ) + Char ( 10 )
                          , '[[index-'
                          , docs.fs_cleanStringForAnchorId ( ix.index_name )
                          , ']]'
                          , Char ( 13 ) + Char ( 10 )
                          , '=== '
                          , docs.fs_cleanStringForLabel ( ix.index_name )
                          , Char ( 13 ) + Char ( 10 )
                          , Char ( 13 ) + Char ( 10 )
                          , '* IndexSemanticGroup: ' + 'xref:index/IndexSemanticGroup.adoc#_'
                            + Replace (
                                          Replace (
                                                      Replace (
                                                                  Lower ( IsNull ( ix.IndexSemanticGroup, 'no_group' ))
                                                                , ' '
                                                                , '_'
                                                              )
                                                    , '__'
                                                    , '_'
                                                  )
                                        , '__'
                                        , '_'
                                      ) + '[' + IsNull ( ix.IndexSemanticGroup, 'no_group' ) + ']'
                          , Char ( 13 ) + Char ( 10 )
                          , '+' + Char ( 13 ) + Char ( 10 )
                          , '--' + Char ( 13 ) + Char ( 10 )
                          , AntoraIndexColumnList
                          , Char ( 13 ) + Char ( 10 )
                          , '--' + Char ( 13 ) + Char ( 10 )
                          , '* PK, Unique, Real: '
                          , is_index_primary_key
                          , ', '
                          , is_index_unique
                          , ', '
                          , is_index_real
                          , Char ( 13 ) + Char ( 10 )
                          , '* ' + fk.referenced_AntoraXref + Char ( 13 ) + Char ( 10 )
                          , Iif(ix.is_index_disabled = 1, '* is disabled' + Char ( 13 ) + Char ( 10 ), Null)
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                ix.is_index_primary_key Desc
                              , ix.is_index_unique Desc
                              , ix.index_name)
  , PumlIndexList             =
  --
  String_Agg (
                 Concat (
                            Cast('' As NVarchar(Max))
                          , Iif(is_index_real = 0, '- ', Null)
                          , Iif(is_index_primary_key = 1, '**', Null)
                          , ix.index_name
                          , Iif(is_index_primary_key = 1, '**', Null)
                          , Char ( 13 ) + Char ( 10 )
                          , '{' + ix.IndexSemanticGroup + '}'
                          , Char ( 13 ) + Char ( 10 )
                          , '..'
                          , Char ( 13 ) + Char ( 10 )
                          , PumlIndexColumnList
                        )
               , Char ( 13 ) + Char ( 10 ) + '--' + Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                ix.is_index_primary_key Desc
                              , ix.is_index_unique Desc
                              , ix.index_name)
From
    repo.Index_gross          As ix
    Left Join
        repo.ForeignKey_gross fk
            On
            fk.referencing_index_guid = ix.index_guid
Group By
    ix.parent_RepoObject_guid;
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '71e2b548-5e96-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_IndexList'
  , @level2type = N'COLUMN'
  , @level2name = N'AntoraIndexList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '70e2b548-5e96-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_IndexList'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '6fe2b548-5e96-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_IndexList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'cbc9519a-6298-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_IndexList'
  , @level2type = N'COLUMN'
  , @level2name = N'PumlIndexList';
