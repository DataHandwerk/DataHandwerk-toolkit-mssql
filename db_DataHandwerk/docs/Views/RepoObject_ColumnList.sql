
/*
alternative columns sort order for documentation:
- PK
- columns by name
*/
CREATE View docs.RepoObject_ColumnList
As
Select
    rof.RepoObject_guid
  , rof.cultures_name
  , AntoraColumnDetails              =
  --
  String_Agg (
                 Concat (
                            --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                            Cast('' As NVarchar(Max))
                          , '[#column-'
                          --, '[id=column-'
                          --, '[[column-' --deprecated
                          , docs.fs_cleanStringForAnchorId ( transl.RepoObjectColumn_DisplayName )
                          --, ']]'
                          , ']'
                          , Char ( 13 ) + Char ( 10 )
                          , '=== '
                          --, transl.RepoObjectColumn_DisplayName
                          , docs.fs_cleanStringForLabel ( transl.RepoObjectColumn_DisplayName )
                          , Char ( 13 ) + Char ( 10 )
                          , Char ( 13 ) + Char ( 10 )
                          , '[cols="d,8m,m,m,m,d"]'
                          , Char ( 13 ) + Char ( 10 )
                          , '|==='
                          , Char ( 13 ) + Char ( 10 )
                          , Concat (
                                       '|'
                                     , roc.index_column_id
                                     , Char ( 13 ) + Char ( 10 )
                                     , '|'
                                     , Iif(roc.is_index_primary_key = 1, '*', '')
                                     , transl.RepoObjectColumn_DisplayName
                                     , Iif(roc.is_index_primary_key = 1, '*', '')
                                     , Char ( 13 ) + Char ( 10 )
                                     , '|'
                                     , roc.Repo_user_type_fullname
                                     , Char ( 13 ) + Char ( 10 )
                                     , '|'
                                     , Iif(roc.Repo_is_nullable = 0, 'NOT NULL', 'NULL')
                                     , Char ( 13 ) + Char ( 10 )
                                     , '|'
                                     , Iif(roc.Repo_is_identity = 1
                                         , '(' + Cast(roc.Repo_seed_value As NVarchar(4000)) + ','
                                           + Cast(roc.Repo_increment_value As NVarchar(4000)) + ')'
                                         , Null)
                                     , Char ( 13 ) + Char ( 10 )
                                     , '|'
                                     , Iif(roc.Repo_is_computed = 1
                                           , Iif(roc.Repo_is_persisted = 1, 'Persisted', 'Calc')
                                           , Null)
                                     , Char ( 13 ) + Char ( 10 )
                                   )
                          , '|==='
                          , Char ( 13 ) + Char ( 10 )
                          , Char ( 13 ) + Char ( 10 )
                          , Case
                                When roc.Description <> ''
                                    Then
                                    Concat (
                                               '.Description'
                                             , Char ( 13 ) + Char ( 10 )
                                             , '--'
                                             , Char ( 13 ) + Char ( 10 )
                                             , roc.Description
                                             , Char ( 13 ) + Char ( 10 )
                                             , '--'
                                             , Char ( 13 ) + Char ( 10 )
                                             --add additional line to get more space
                                             , '{empty} +'
                                             , Char ( 13 ) + Char ( 10 )
                                             , Char ( 13 ) + Char ( 10 )
                                           )
                            End
                          , Case
                                When roc.Repo_default_definition <> ''
                                    Then
                                    Concat (
                                               '.Default: '
                                             , roc.Repo_default_name
                                             , Char ( 13 ) + Char ( 10 )
                                             , '....'
                                             , Char ( 13 ) + Char ( 10 )
                                             , roc.Repo_default_definition
                                             , Char ( 13 ) + Char ( 10 )
                                             , '....'
                                             , Char ( 13 ) + Char ( 10 )
                                             , Char ( 13 ) + Char ( 10 )
                                           )
                            End
                          , Case
                                When roc.Repo_definition <> ''
                                    Then
                                    Concat (
                                               '.Definition'
                                             , Iif(roc.Repo_is_persisted = 1, ' (PERSISTED)', Null)
                                             , Char ( 13 ) + Char ( 10 )
                                             , '....'
                                             , Char ( 13 ) + Char ( 10 )
                                             , roc.Repo_definition
                                             , Char ( 13 ) + Char ( 10 )
                                             , '....'
                                             , Char ( 13 ) + Char ( 10 )
                                             , Char ( 13 ) + Char ( 10 )
                                           )
                            End
                          , Case
                                When roc.has_get_referenced_issue = 1
                                    Then
                                    Concat (
                                               '.has_get_referenced_issue'
                                             , Char ( 13 ) + Char ( 10 )
                                             , '....'
                                             , Char ( 13 ) + Char ( 10 )
                                             , roc.has_get_referenced_issue
                                             , Char ( 13 ) + Char ( 10 )
                                             , '....'
                                             , Char ( 13 ) + Char ( 10 )
                                             , Char ( 13 ) + Char ( 10 )
                                           )
                            End
                          , Case
                                When roc.AntoraReferencedColumnList <> ''
                                    Then
                                    Concat (
                                               '.Referenced Columns'
                                             , Char ( 13 ) + Char ( 10 )
                                             , '--'
                                             , Char ( 13 ) + Char ( 10 )
                                             , roc.AntoraReferencedColumnList
                                             , Char ( 13 ) + Char ( 10 )
                                             , '--'
                                             , Char ( 13 ) + Char ( 10 )
                                             , Char ( 13 ) + Char ( 10 )
                                           )
                            End
                          , Case
                                When roc.AntoraReferencingColumnList <> ''
                                    Then
                                    Concat (
                                               '.Referencing Columns'
                                             , Char ( 13 ) + Char ( 10 )
                                             , '--'
                                             , Char ( 13 ) + Char ( 10 )
                                             , roc.AntoraReferencingColumnList
                                             , Char ( 13 ) + Char ( 10 )
                                             , '--'
                                             , Char ( 13 ) + Char ( 10 )
                                             , Char ( 13 ) + Char ( 10 )
                                           )
                            End
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                roc.is_index_primary_key Desc
                              , roc.tabcol_IsHidden
                              , roc.index_column_id
                              , roc.Repo_is_computed
                              , transl.RepoObjectColumn_DisplayName)
  , AntoraPkColumnTableRows          =
  --
  String_Agg (
                 Concat (
                            --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                            Cast('' As NVarchar(Max))
                          , Case
                                When roc.is_index_primary_key = 1
                                    Then
                                    Concat (
                                               '|'
                                             , roc.index_column_id
                                             , Char ( 13 ) + Char ( 10 )
                                             , '|'
                                             , '*'
                                             , '<<column-'
                                             , docs.fs_cleanStringForAnchorId ( transl.RepoObjectColumn_DisplayName )
                                             , '>>'
                                             , '*'
                                             , Char ( 13 ) + Char ( 10 )
                                             , '|'
                                             , roc.Repo_user_type_fullname
                                             , Char ( 13 ) + Char ( 10 )
                                             , '|'
                                             , Iif(roc.Repo_is_nullable = 0, 'NOT NULL', 'NULL')
                                             , Char ( 13 ) + Char ( 10 )
                                             , '|'
                                             , Iif(roc.Repo_is_identity = 1
                                                 , '(' + Cast(roc.Repo_seed_value As NVarchar(4000)) + ','
                                                   + Cast(roc.Repo_increment_value As NVarchar(4000)) + ')'
                                                 , Null)
                                             , Char ( 13 ) + Char ( 10 )
                                             , '|'
                                             , Iif(roc.Repo_is_computed = 1
                                                   , Iif(roc.Repo_is_persisted = 1, 'Persisted', 'Calc')
                                                   , Null)
                                             , Char ( 13 ) + Char ( 10 )
                                           )
                            End
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                roc.is_index_primary_key Desc
                              , roc.tabcol_IsHidden
                              , roc.index_column_id
                              , roc.Repo_is_computed
                              , transl.RepoObjectColumn_DisplayName)
  , AntoraNonPkColumnTableRows       =
  --
  String_Agg (
                 Concat (
                            --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                            Cast('' As NVarchar(Max))
                          , Case
                                When IsNull ( roc.is_index_primary_key, 0 ) = 0
                                    Then
                                    Concat (
                                               '|'
                                             --, roc.[index_column_id]
                                             , Char ( 13 ) + Char ( 10 )
                                             , '|'
                                             , '<<column-'
                                             , docs.fs_cleanStringForAnchorId ( transl.RepoObjectColumn_DisplayName )
                                             , '>>'
                                             , Char ( 13 ) + Char ( 10 )
                                             , '|'
                                             , roc.Repo_user_type_fullname
                                             , Char ( 13 ) + Char ( 10 )
                                             , '|'
                                             , Iif(roc.Repo_is_nullable = 0, 'NOT NULL', 'NULL')
                                             , Char ( 13 ) + Char ( 10 )
                                             , '|'
                                             , Iif(roc.Repo_is_identity = 1
                                                 , '(' + Cast(roc.Repo_seed_value As NVarchar(4000)) + ','
                                                   + Cast(roc.Repo_increment_value As NVarchar(4000)) + ')'
                                                 , Null)
                                             , Char ( 13 ) + Char ( 10 )
                                             , '|'
                                             , Iif(roc.Repo_is_computed = 1
                                                   , Iif(roc.Repo_is_persisted = 1, 'Persisted', 'Calc')
                                                   , Null)
                                             , Char ( 13 ) + Char ( 10 )
                                           )
                            End
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                roc.is_index_primary_key Desc
                              , roc.tabcol_IsHidden
                              , roc.index_column_id
                              , roc.Repo_is_computed
                              , transl.RepoObjectColumn_DisplayName)
  , PlantumlPkEntityColumns          =
  --
  String_Agg (
                 Concat (
                            Cast('' As NVarchar(Max))
                          , Case
                                When roc.is_index_primary_key = 1
                                    Then
                                    Concat (
                                               '  '
                                             , Case
                                                   When roc.Repo_is_computed = 1
                                                       Then
                                                       --rhombus or triangle
                                                       Iif(roc.Repo_is_persisted = 1, '# ', '~ ')
                                                   Else
                                                       -- '- ' to identify mandatory attributes, but not for calculated columns,
                                                       -- to avoid a mix '- #' or '- ~'
                                                       Iif(roc.Repo_is_nullable = 0, '- ', Null)
                                               End
                                             , Iif(roc.tabcol_IsHidden = 1, '<color:gray>', Null)
                                             --PK in bold
                                             , '**'
                                             , docs.fs_cleanStringForPuml ( transl.RepoObjectColumn_DisplayName )
                                             , '**'
                                             --we add () to get a puml "method" to get unique icons
                                             , ' : (' + roc.Repo_user_type_fullname + ')'
                                             , Iif(roc.tabcol_IsHidden = 1, ' (hidden)', Null)
                                             --, CASE 
                                             -- WHEN roc.[Repo_is_computed] = 1
                                             --  THEN ' <<calc' + IIF(roc.[Repo_is_persisted] = 1, ' (Persisted)', '') + '>>'
                                             -- END
                                             , Iif(roc.tabcol_IsHidden = 1, '</color>', Null)
                                             , Char ( 13 ) + Char ( 10 )
                                           )
                            End
                        )
               , ''
             ) Within Group(Order By
                                roc.is_index_primary_key Desc
                              , roc.tabcol_IsHidden
                              , roc.index_column_id
                              , roc.Repo_is_computed
                              , transl.RepoObjectColumn_DisplayName)
  , PlantumlNonPkEntityColumns       =
  --
  String_Agg (
                 Concat (
                            Cast('' As NVarchar(Max))
                          , Case
                                When IsNull ( roc.is_index_primary_key, 0 ) = 0
                                     And roc.tabcol_IsHidden = 0
                                    Then
                                    Concat (
                                               '  '
                                             , Case
                                                   When roc.Repo_is_computed = 1
                                                       Then
                                                       --rhombus or triangle
                                                       Iif(roc.Repo_is_persisted = 1, '# ', '~ ')
                                                   Else
                                                       -- '- ' to identify mandatory attributes, but not for calculated columns,
                                                       -- to avoid a mix '- #' or '- ~'
                                                       Iif(roc.Repo_is_nullable = 0, '- ', Null)
                                               End
                                             , Iif(roc.tabcol_IsHidden = 1, '<color:gray>', Null)
                                             , docs.fs_cleanStringForPuml ( transl.RepoObjectColumn_DisplayName )
                                             --we add () to get a puml "method" to get unique icons
                                             , ' : (' + roc.Repo_user_type_fullname + ')'
                                             , Iif(roc.tabcol_IsHidden = 1, ' (hidden)', Null)
                                             --, CASE 
                                             -- WHEN roc.[Repo_is_computed] = 1
                                             --  THEN ' <<calc' + IIF(roc.[Repo_is_persisted] = 1, ' (Persisted)', '') + '>>'
                                             -- END
                                             , Iif(roc.tabcol_IsHidden = 1, '</color>', Null)
                                             , Char ( 13 ) + Char ( 10 )
                                           )
                            End
                        )
               , ''
             ) Within Group(Order By
                                roc.is_index_primary_key Desc
                              , roc.tabcol_IsHidden
                              , roc.index_column_id
                              , roc.Repo_is_computed
                              , transl.RepoObjectColumn_DisplayName)
  , PlantumlNonPkIndexColumns        =
  --
  String_Agg (
                 Concat (
                            Cast('' As NVarchar(Max))
                          , Case
                                When IsNull ( roc.is_index_primary_key, 0 ) = 0
                                     And roc.isAnyIndexColumn = 1
                                    Then
                                    Concat (
                                               '  '
                                             , Case
                                                   When roc.Repo_is_computed = 1
                                                       Then
                                                       --rhombus or triangle
                                                       Iif(roc.Repo_is_persisted = 1, '# ', '~ ')
                                                   Else
                                                       -- '- ' to identify mandatory attributes, but not for calculated columns,
                                                       -- to avoid a mix '- #' or '- ~'
                                                       Iif(roc.Repo_is_nullable = 0, '- ', Null)
                                               End
                                             , Iif(roc.tabcol_IsHidden = 1, '<color:gray>', Null)
                                             , docs.fs_cleanStringForPuml ( transl.RepoObjectColumn_DisplayName )
                                             --we add () to get a puml "method" to get unique icons
                                             , ' : (' + roc.Repo_user_type_fullname + ')'
                                             , Iif(roc.tabcol_IsHidden = 1, ' (hidden)', Null)
                                             --, CASE 
                                             -- WHEN roc.[Repo_is_computed] = 1
                                             --  THEN ' <<calc' + IIF(roc.[Repo_is_persisted] = 1, ' (Persisted)', '') + '>>'
                                             -- END
                                             , Iif(roc.tabcol_IsHidden = 1, '</color>', Null)
                                             , Char ( 13 ) + Char ( 10 )
                                           )
                            End
                        )
               , ''
             ) Within Group(Order By
                                roc.is_index_primary_key Desc
                              , roc.tabcol_IsHidden
                              , roc.index_column_id
                              , roc.Repo_is_computed
                              , transl.RepoObjectColumn_DisplayName)
  , PlantumlNonPkHiddenEntityColumns =
  --
  String_Agg (
                 Concat (
                            Cast('' As NVarchar(Max))
                          , Case
                                When IsNull ( roc.is_index_primary_key, 0 ) = 0
                                     And roc.tabcol_IsHidden = 1
                                    Then
                                    Concat (
                                               '  '
                                             , Case
                                                   When roc.Repo_is_computed = 1
                                                       Then
                                                       --rhombus or triangle
                                                       Iif(roc.Repo_is_persisted = 1, '# ', '~ ')
                                                   Else
                                                       -- '- ' to identify mandatory attributes, but not for calculated columns,
                                                       -- to avoid a mix '- #' or '- ~'
                                                       Iif(roc.Repo_is_nullable = 0, '- ', Null)
                                               End
                                             , Iif(roc.tabcol_IsHidden = 1, '<color:gray>', Null)
                                             , docs.fs_cleanStringForPuml ( transl.RepoObjectColumn_DisplayName )
                                             --we add () to get a puml "method" to get unique icons
                                             , ' : (' + roc.Repo_user_type_fullname + ')'
                                             , Iif(roc.tabcol_IsHidden = 1, ' (hidden)', Null)
                                             --, CASE 
                                             -- WHEN roc.[Repo_is_computed] = 1
                                             --  THEN ' <<calc' + IIF(roc.[Repo_is_persisted] = 1, ' (Persisted)', '') + '>>'
                                             -- END
                                             , Iif(roc.tabcol_IsHidden = 1, '</color>', Null)
                                             , Char ( 13 ) + Char ( 10 )
                                           )
                            End
                        )
               , ''
             ) Within Group(Order By
                                roc.is_index_primary_key Desc
                              , roc.tabcol_IsHidden
                              , roc.index_column_id
                              , roc.Repo_is_computed
                              , transl.RepoObjectColumn_DisplayName)
  , PlantumlIndexColumns             =
  --
  String_Agg (
                 Concat (
                            Cast('' As NVarchar(Max))
                          , Case
                                When roc.isAnyIndexColumn = 1
                                    Then
                                    Concat (
                                               '  '
                                             , Case
                                                   When roc.Repo_is_computed = 1
                                                       Then
                                                       --rhombus or triangle
                                                       Iif(roc.Repo_is_persisted = 1, '# ', '~ ')
                                                   Else
                                                       -- '- ' to identify mandatory attributes, but not for calculated columns,
                                                       -- to avoid a mix '- #' or '- ~'
                                                       Iif(roc.Repo_is_nullable = 0, '- ', Null)
                                               End
                                             , Iif(roc.tabcol_IsHidden = 1, '<color:gray>', Null)
                                             , docs.fs_cleanStringForPuml ( transl.RepoObjectColumn_DisplayName )
                                             --we add () to get a puml "method" to get unique icons
                                             , ' : (' + roc.Repo_user_type_fullname + ')'
                                             , Iif(roc.tabcol_IsHidden = 1, ' (hidden)', Null)
                                             --, CASE 
                                             -- WHEN roc.[Repo_is_computed] = 1
                                             --  THEN ' <<calc' + IIF(roc.[Repo_is_persisted] = 1, ' (Persisted)', '') + '>>'
                                             -- END
                                             , Iif(roc.tabcol_IsHidden = 1, '</color>', Null)
                                             , Char ( 13 ) + Char ( 10 )
                                           )
                            End
                        )
               , ''
             ) Within Group(Order By
                                roc.is_index_primary_key Desc
                              , roc.tabcol_IsHidden
                              , roc.index_column_id
                              , roc.Repo_is_computed
                              , transl.RepoObjectColumn_DisplayName)
From
    docs.RepoObject_OutputFilter_T          As rof
    Left Join
        repo.RepoObjectColumn_gross2        As roc
            On
            roc.RepoObject_guid          = rof.RepoObject_guid

    Left Join
        ssas.RepoObjectColumn_translation_T As transl
            On
            transl.RepoObjectColumn_guid = roc.RepoObjectColumn_guid
            And transl.cultures_name     = rof.cultures_name
Where
    --not [is_query_plan_expression], these are not real columms
    roc.is_query_plan_expression Is Null
    --And roc.is_external         = 0
    --we need the datatype, or it should be computed
    And
    (
        Not roc.Repo_user_type_fullname Is Null
        Or roc.Repo_is_computed = 1
        Or rof.is_external      = 1
    )
----exclude system columns like 'RowNumber-2662979B-1795-4F74-8F37-6A1BA8059B61'
----all they have ssas_Type = 3
--And Not roc.ssas_Type = 3
Group By
    rof.RepoObject_guid
  , rof.cultures_name
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e0d49d8d-4595-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ColumnList'
  , @level2type = N'COLUMN'
  , @level2name = N'PlantumlNonPkEntityColumns';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dfd49d8d-4595-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ColumnList'
  , @level2type = N'COLUMN'
  , @level2name = N'PlantumlPkEntityColumns';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ad8b79d5-b993-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ColumnList'
  , @level2type = N'COLUMN'
  , @level2name = N'AntoraNonPkColumnTableRows';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ac8b79d5-b993-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ColumnList'
  , @level2type = N'COLUMN'
  , @level2name = N'AntoraPkColumnTableRows';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c035b4cd-e093-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ColumnList'
  , @level2type = N'COLUMN'
  , @level2name = N'AntoraColumnDetails';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ab8b79d5-b993-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ColumnList'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '9f8b79d5-b993-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ColumnList';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [docs].[fs_cleanStringForAnchorId]
* [docs].[fs_cleanStringForLabel]
* [docs].[fs_cleanStringForPuml]
* [repo].[RepoObjectColumn_gross2]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList';




GO



GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'E88818B0-CA97-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.RepoObject_ColumnList_T.adoc[]
* xref:docs.usp_PERSIST_RepoObject_ColumnList_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList';






GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:docs.fs_cleanStringForAnchorId.adoc[]
* xref:docs.fs_cleanStringForLabel.adoc[]
* xref:docs.fs_cleanStringForPuml.adoc[]
* xref:repo.RepoObjectColumn_gross2.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross2].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';




GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '556d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList', @level2type = N'COLUMN', @level2name = N'PlantumlNonPkHiddenEntityColumns';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ee4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList', @level2type = N'COLUMN', @level2name = N'PlantumlNonPkIndexColumns';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ef4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList', @level2type = N'COLUMN', @level2name = N'PlantumlIndexColumns';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '510389e1-0622-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList', @level2type = N'COLUMN', @level2name = N'cultures_name';

