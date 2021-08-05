
CREATE View docs.AntoraIndexSemanticgroupPatterndatatype
As
Select
    IndexSemanticGroup
  , IndexPatternColumnDatatype
  , AntoraIndexSemanticgroupPatterndatatype =
  --
  String_Agg (
                 Concat (
                            Cast(N'' As NVarchar(Max))
                          --** xref:aaa.bbb.adoc#index-pk_ccc[aaa.bbb - pk_abc]
                          , '** xref:' + RepoObject_fullname2 + '.adoc#' + 'index-'
                            + docs.fs_cleanStringForAnchorId ( index_name ) + '['
                            + docs.fs_cleanStringForLabel ( RepoObject_fullname2 ) + ' - '
                            + docs.fs_cleanStringForLabel ( index_name ) + '] +'
                          , Char ( 13 ) + Char ( 10 )
                          , IndexPatternColumnName
                          , ' +'
                          , Char ( 13 ) + Char ( 10 )
                          , IndexPatternColumnDatatype
                          , ' +'
                          , Char ( 13 ) + Char ( 10 )
                          , 'PK, Unique, Real: '
                          , is_index_primary_key
                          , ', '
                          , is_index_unique
                          , ', '
                          , is_index_real
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                RepoObject_fullname2)
From
    repo.Index_gross
Group By
    IndexSemanticGroup
  , IndexPatternColumnDatatype;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '881293b9-de96-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraIndexSemanticgroupPatterndatatype';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '901293b9-de96-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraIndexSemanticgroupPatterndatatype'
  , @level2type = N'COLUMN'
  , @level2name = N'IndexSemanticGroup';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '911293b9-de96-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraIndexSemanticgroupPatterndatatype'
  , @level2type = N'COLUMN'
  , @level2name = N'IndexPatternColumnDatatype';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '921293b9-de96-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraIndexSemanticgroupPatterndatatype'
  , @level2type = N'COLUMN'
  , @level2name = N'AntoraIndexSemanticgroupPatterndatatype';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[Index_gross]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraIndexSemanticgroupPatterndatatype';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'IndexSemanticGroup,IndexPatternColumnDatatype', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraIndexSemanticgroupPatterndatatype';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'IndexSemanticGroup,IndexPatternColumnDatatype', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraIndexSemanticgroupPatterndatatype';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(512),nvarchar(4000)', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraIndexSemanticgroupPatterndatatype';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'39BF89B0-1599-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraIndexSemanticgroupPatterndatatype';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.AntoraIndexSemanticgroup.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraIndexSemanticgroupPatterndatatype';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:docs.fs_cleanStringForAnchorId.adoc[]
* xref:docs.fs_cleanStringForLabel.adoc[]
* xref:repo.Index_gross.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraIndexSemanticgroupPatterndatatype';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[IndexSemanticGroup]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraIndexSemanticgroupPatterndatatype', @level2type = N'COLUMN', @level2name = N'IndexSemanticGroup';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_gross].[IndexPatternColumnDatatype]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraIndexSemanticgroupPatterndatatype', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnDatatype';

