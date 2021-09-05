
CREATE View repo.Index_ColumList
As
Select
    col.index_guid
  , AntoraIndexColumnList      =
  --
  String_Agg (
                 Concat (
                            Cast(N'' As NVarchar(Max))
                          , '* <<column-' + col.SysObject_column_name + '>>; '
                          , col.SysObject_column_user_type_fullname
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                col.index_column_id)
  --ColumnList doesn't contain Asc and Desc
  , ColumnList                 =
  --
  String_Agg ( Concat (
                          --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                          Cast(' ' As NVarchar(Max)), QuoteName ( col.SysObject_column_name )
                      )
             , ','
             ) Within Group(Order By
                                col.index_column_id)
  --ConstraintColumnList contains Asc and Desc
  , ConstraintColumnList       =
  --
  String_Agg (
                 Concat (
                            --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                            Cast(' ' As NVarchar(Max))
                          , QuoteName ( col.SysObject_column_name )
                          , Case col.is_descending_key
                                When 1
                                    Then
                                    ' DESC'
                                Else
                                    ' ASC'
                            End
                        )
               , ','
             ) Within Group(Order By
                                col.index_column_id)
  , DbmlIndexColumnList        =
  --
  String_Agg ( Concat (
                          --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                          Cast(' ' As NVarchar(Max)), QuoteName ( col.SysObject_column_name, '"' )
                      )
             , ','
             ) Within Group(Order By
                                col.index_column_id)
  , PersistenceWhereColumnList =
  --
  Stuff (
            String_Agg (
                           Concat (
                                      --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                                      Cast('AND T.' As NVarchar(Max))
                                    , QuoteName ( col.SysObject_column_name )
                                    , ' = S.'
                                    , QuoteName ( col.SysObject_column_name )
                                    , Char ( 13 )
                                    , Char ( 10 )
                                  )
                         , ''
                       ) Within Group(Order By
                                          col.index_column_id)
          , 1
          , 4
          , Null
        )
  , PumlIndexColumnList        =
  --
  String_Agg (
                 Concat (
                            Cast(N'' As NVarchar(Max))
                          , col.SysObject_column_name + '; '
                          , col.SysObject_column_user_type_fullname
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                col.index_column_id)
From
    repo.IndexColumn_union As col
Group By
    col.index_guid
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '6890291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_ColumList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '12f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_ColumList'
  , @level2type = N'COLUMN'
  , @level2name = N'PersistenceWhereColumnList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '0ff67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_ColumList'
  , @level2type = N'COLUMN'
  , @level2name = N'index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '11f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_ColumList'
  , @level2type = N'COLUMN'
  , @level2name = N'ConstraintColumnList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '10f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_ColumList'
  , @level2type = N'COLUMN'
  , @level2name = N'ColumnList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3adf2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_ColumList'
  , @level2type = N'COLUMN'
  , @level2name = N'DbmlIndexColumnList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '799c578a-0194-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_ColumList'
  , @level2type = N'COLUMN'
  , @level2name = N'AntoraIndexColumnList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ccc9519a-6298-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_ColumList'
  , @level2type = N'COLUMN'
  , @level2name = N'PumlIndexColumnList';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[IndexColumn_union]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_ColumList';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'index_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_ColumList';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'index_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_ColumList';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_ColumList';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'678AA10A-AB97-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_ColumList';


GO
EXECUTE sp_addextendedproperty @name = N'has_execution_plan_issue', @value = N'1', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_ColumList';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.Index_gross.adoc[]
* xref:repo.Index_SqlConstraint_PkUq.adoc[]
* xref:uspgenerator.GeneratorUspStep_Persistence.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_ColumList';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.IndexColumn_union.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_ColumList';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[IndexColumn_union].[index_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_ColumList', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_ColumList';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_ColumList';

