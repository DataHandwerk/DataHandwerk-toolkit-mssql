

CREATE View [docs].[AntoraIndexSemanticgroupPatterndatatype]
As
Select
    i.IndexSemanticGroup
  , i.IndexPatternColumnDatatype
  , rof.cultures_name
  , AntoraIndexSemanticgroupPatterndatatype =
  --
  String_Agg (
                 Concat (
                            Cast(N'' As NVarchar(Max))
                          --** xref:aaa.bbb.adoc#index-pk_ccc[aaa.bbb - pk_abc]
                          , '** xref:' + docs.fs_cleanStringForFilename ( i.RepoObject_fullname2 ) + '.adoc#'
                            + 'index-' + docs.fs_cleanStringForAnchorId ( i.index_name ) + '['
                            + docs.fs_cleanStringForLabel ( i.RepoObject_fullname2 ) + ' - '
                            + docs.fs_cleanStringForLabel ( i.index_name ) + '] +'
                          , Char ( 13 ) + Char ( 10 )
                          , i.IndexPatternColumnName
                          , ' +'
                          , Char ( 13 ) + Char ( 10 )
                          , i.IndexPatternColumnDatatype
                          , ' +'
                          , Char ( 13 ) + Char ( 10 )
                          , 'PK, Unique, Real: '
                          , i.is_index_primary_key
                          , ', '
                          , i.is_index_unique
                          , ', '
                          , i.is_index_real
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                i.RepoObject_fullname2)
From
    repo.Index_gross                   As i
    Left Join
        docs.RepoObject_OutputFilter_T As rof
            On
            rof.RepoObject_guid = i.parent_RepoObject_guid
Where
    Not rof.cultures_name Is Null
Group By
    i.IndexSemanticGroup
  , i.IndexPatternColumnDatatype
  , rof.cultures_name
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
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [docs].[fs_cleanStringForAnchorId]
* [docs].[fs_cleanStringForLabel]
* [repo].[Index_gross]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraIndexSemanticgroupPatterndatatype';




GO



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


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraIndexSemanticgroupPatterndatatype';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraIndexSemanticgroupPatterndatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '04d67baa-5925-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraIndexSemanticgroupPatterndatatype', @level2type = N'COLUMN', @level2name = N'cultures_name';

