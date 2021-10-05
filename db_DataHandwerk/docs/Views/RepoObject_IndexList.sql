
CREATE View docs.RepoObject_IndexList
As
Select
    RepoObject_guid = ix.parent_RepoObject_guid
  , rof.cultures_name
  , AntoraIndexList =
  --
  String_Agg (
                 Concat (
                            --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                            Cast('' As NVarchar(Max))
                          , Char ( 13 ) + Char ( 10 )
                          , '[#index-'
                          --, '[id=index-'
                          --, '[[index-' --deprecated
                          , docs.fs_cleanStringForAnchorId ( ix.index_name )
                          --, ']]'
                          , ']'
                          , Char ( 13 ) + Char ( 10 )
                          , '=== '
                          --, ix.index_name
                          , docs.fs_cleanStringForLabel ( ix.index_name )
                          , Char ( 13 ) + Char ( 10 )
                          , Char ( 13 ) + Char ( 10 )
                          , '* IndexSemanticGroup: ' + 'xref:other/indexsemanticgroup.adoc#'
                            + docs.fs_cleanStringForAnchorId ( IsNull ( ix.IndexSemanticGroup, '(no group)' )) + '['
                            + IsNull ( ix.IndexSemanticGroup, 'no_group' ) + ']'
                          , Char ( 13 ) + Char ( 10 )
                          , '+' + Char ( 13 ) + Char ( 10 )
                          , '--' + Char ( 13 ) + Char ( 10 )
                          , ix.AntoraIndexColumnList
                          , Char ( 13 ) + Char ( 10 )
                          , '--' + Char ( 13 ) + Char ( 10 )
                          , '* PK, Unique, Real: '
                          , ix.is_index_primary_key
                          , ', '
                          , ix.is_index_unique
                          , ', '
                          , ix.is_index_real
                          , Char ( 13 ) + Char ( 10 )
                          , '* ' + fk.referenced_AntoraXref + Char ( 13 ) + Char ( 10 )
                          , Iif(ix.is_index_disabled = 1, '* is disabled' + Char ( 13 ) + Char ( 10 ), Null)
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                ix.is_index_primary_key Desc
                              , ix.is_index_unique Desc
                              , ix.index_name)
  , PumlIndexList   =
  --
  String_Agg (
                 Concat (
                            Cast('' As NVarchar(Max))
                          , Iif(ix.is_index_real = 0, '- ', Null)
                          , Iif(ix.is_index_primary_key = 1, '**', Null)
                          , docs.fs_cleanStringForPuml ( ix.index_name )
                          , Iif(ix.is_index_primary_key = 1, '**', Null)
                          , Char ( 13 ) + Char ( 10 )
                          , '"' + ix.IndexSemanticGroup + '"'
                          , Char ( 13 ) + Char ( 10 )
                          , '..'
                          , Char ( 13 ) + Char ( 10 )
                          , ix.PumlIndexColumnList
                        )
               , Char ( 13 ) + Char ( 10 ) + '--' + Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                ix.is_index_primary_key Desc
                              , ix.is_index_unique Desc
                              , ix.index_name)
From
    repo.Index_gross                   As ix
    Left Join
        repo.ForeignKey_gross          As fk
            On
            fk.referencing_index_guid = ix.index_guid

    Left Join
        docs.RepoObject_OutputFilter_T As rof
            On
            rof.RepoObject_guid       = ix.parent_RepoObject_guid
Where
    Not rof.cultures_name Is Null
Group By
    ix.parent_RepoObject_guid
  , rof.cultures_name
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

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [docs].[fs_cleanStringForAnchorId]
* [docs].[fs_cleanStringForLabel]
* [docs].[fs_cleanStringForPuml]
* [repo].[ForeignKey_gross]
* [repo].[Index_gross]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_IndexList';




GO



GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_IndexList';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_IndexList';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'FF97B507-1799-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_IndexList';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.RepoObject_IndexList_T.adoc[]
* xref:docs.usp_PERSIST_RepoObject_IndexList_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_IndexList';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:docs.fs_cleanStringForAnchorId.adoc[]
* xref:docs.fs_cleanStringForLabel.adoc[]
* xref:docs.fs_cleanStringForPuml.adoc[]
* xref:repo.ForeignKey_gross.adoc[]
* xref:repo.Index_gross.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_IndexList';




GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_IndexList';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_IndexList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[parent_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_IndexList', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5b0389e1-0622-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_IndexList', @level2type = N'COLUMN', @level2name = N'cultures_name';

