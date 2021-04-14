

/*
alternative columns sort order for documentation:
- PK
- columns by name
*/
CREATE View [docs].[RepoObject_ColumnList]
As
Select
    roc.RepoObject_guid
  , AntoraColumnDetails        = String_Agg (
                                                Concat (
                                                           --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                                                           Cast('' As NVarchar(Max))
                                                         , '[[column-'
                                                         , roc.RepoObjectColumn_name
                                                         , ']]'
                                                         , Char ( 13 ) + Char ( 10 )
                                                         , '=== '
                                                         , roc.RepoObjectColumn_name
                                                         , Char ( 13 ) + Char ( 10 )
                                                         , Char ( 13 ) + Char ( 10 )
                                                         , '[cols="d,m,m,m,m,d"]'
                                                         , Char ( 13 ) + Char ( 10 )
                                                         , '|==='
                                                         , Char ( 13 ) + Char ( 10 )
                                                         , Concat (
                                                                      '|'
                                                                    , roc.index_column_id
                                                                    , Char ( 13 ) + Char ( 10 )
                                                                    , '|'
                                                                    , Iif(roc.is_index_primary_key = 1, '*', '')
                                                                    , roc.RepoObjectColumn_name
                                                                    , Iif(roc.is_index_primary_key = 1, '*', '')
                                                                    , Char ( 13 ) + Char ( 10 )
                                                                    , '|'
                                                                    , roc.Repo_user_type_fullname
                                                                    , Char ( 13 ) + Char ( 10 )
                                                                    , '|'
                                                                    , Iif(Repo_is_nullable = 0, 'NOT NULL', 'NULL')
                                                                    , Char ( 13 ) + Char ( 10 )
                                                                    , '|'
                                                                    , Iif(roc.Repo_is_identity = 1
                                                                        , '(' + Cast(roc.Repo_seed_value As NVarchar(4000))
                                                                          + ','
                                                                          + Cast(roc.Repo_increment_value As NVarchar(4000))
                                                                          + ')'
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
                                                               When roc.Property_ms_description <> ''
                                                                   Then
                                                                   Concat (
                                                                              '.Description'
                                                                            , Char ( 13 ) + Char ( 10 )
                                                                            , '--'
                                                                            , Char ( 13 ) + Char ( 10 )
                                                                            , roc.Property_ms_description
                                                                            , Char ( 13 ) + Char ( 10 )
                                                                            , '--'
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
                                                                            , Iif(roc.Repo_is_persisted = 1
                                                                           , ' (PERSISTED)'
                                                                           , Null)
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
                                                             , roc.index_column_id
                                                             , roc.Repo_is_computed
                                                             , roc.RepoObjectColumn_name)
  , AntoraPkColumnTableRows    = String_Agg (
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
                                                                            , roc.RepoObjectColumn_name
                                                                            , '>>'
                                                                            , '*'
                                                                            , Char ( 13 ) + Char ( 10 )
                                                                            , '|'
                                                                            , roc.Repo_user_type_fullname
                                                                            , Char ( 13 ) + Char ( 10 )
                                                                            , '|'
                                                                            , Iif(Repo_is_nullable = 0, 'NOT NULL', 'NULL')
                                                                            , Char ( 13 ) + Char ( 10 )
                                                                            , '|'
                                                                            , Iif(roc.Repo_is_identity = 1
                                                                                , '('
                                                                                  + Cast(roc.Repo_seed_value As NVarchar(4000))
                                                                                  + ','
                                                                                  + Cast(roc.Repo_increment_value As NVarchar(4000))
                                                                                  + ')'
                                                                                , Null)
                                                                            , Char ( 13 ) + Char ( 10 )
                                                                            , '|'
                                                                            , Iif(roc.Repo_is_computed = 1
                                                                               , Iif(roc.Repo_is_persisted = 1
                                                                                     , 'Persisted'
                                                                                     , 'Calc')
                                                                               , Null)
                                                                            , Char ( 13 ) + Char ( 10 )
                                                                          )
                                                           End
                                                       )
                                              , Char ( 13 ) + Char ( 10 )
                                            ) Within Group(Order By
                                                               roc.is_index_primary_key Desc
                                                             , roc.index_column_id
                                                             , roc.Repo_is_computed
                                                             , roc.RepoObjectColumn_name)
  , AntoraNonPkColumnTableRows = String_Agg (
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
                                                                            , roc.RepoObjectColumn_name
                                                                            , '>>'
                                                                            , Char ( 13 ) + Char ( 10 )
                                                                            , '|'
                                                                            , roc.Repo_user_type_fullname
                                                                            , Char ( 13 ) + Char ( 10 )
                                                                            , '|'
                                                                            , Iif(Repo_is_nullable = 0
                                                                                  , 'NOT NULL'
                                                                                  , 'NULL')
                                                                            , Char ( 13 ) + Char ( 10 )
                                                                            , '|'
                                                                            , Iif(roc.Repo_is_identity = 1
                                                                                , '('
                                                                                  + Cast(roc.Repo_seed_value As NVarchar(4000))
                                                                                  + ','
                                                                                  + Cast(roc.Repo_increment_value As NVarchar(4000))
                                                                                  + ')'
                                                                                , Null)
                                                                            , Char ( 13 ) + Char ( 10 )
                                                                            , '|'
                                                                            , Iif(roc.Repo_is_computed = 1
                                                                                  , Iif(roc.Repo_is_persisted = 1
                                                                                        , 'Persisted'
                                                                                        , 'Calc')
                                                                                  , Null)
                                                                            , Char ( 13 ) + Char ( 10 )
                                                                          )
                                                           End
                                                       )
                                              , Char ( 13 ) + Char ( 10 )
                                            ) Within Group(Order By
                                                               roc.is_index_primary_key Desc
                                                             , roc.index_column_id
                                                             , roc.Repo_is_computed
                                                             , roc.RepoObjectColumn_name)
  , PlantumlPkEntityColumns    = String_Agg (
                                                Concat (
                                                           Cast('' As NVarchar(Max))
                                                         , Case
                                                               When roc.is_index_primary_key = 1
                                                                   Then
                                                                   Concat (
                                                                              '  '
                                                                            --* to identify mandatory attributes
                                                                            , Iif(Repo_is_nullable = 0, '* ', Null)
                                                                            --{static}  => underline, {abstract} => italic
                                                                            , Case
                                                                                  When roc.Repo_is_computed = 1
                                                                                      Then
                                                                                      Iif(roc.Repo_is_persisted = 1
                                                                                       , '{static} '
                                                                                       , '{abstract} ')
                                                                              End
                                                                            --PK in bold
                                                                            , '**'
                                                                            , roc.RepoObjectColumn_name
                                                                            , '**'
                                                                            , ' : '
                                                                            , roc.Repo_user_type_fullname
                                                                            --, CASE 
                                                                            -- WHEN roc.[Repo_is_computed] = 1
                                                                            --  THEN ' <<calc' + IIF(roc.[Repo_is_persisted] = 1, ' (Persisted)', '') + '>>'
                                                                            -- END
                                                                            , Char ( 13 ) + Char ( 10 )
                                                                          )
                                                           End
                                                       )
                                              , ''
                                            ) Within Group(Order By
                                                               roc.is_index_primary_key Desc
                                                             , roc.index_column_id
                                                             , roc.Repo_is_computed
                                                             , roc.RepoObjectColumn_name)
  , PlantumlNonPkEntityColumns = String_Agg (
                                                Concat (
                                                           Cast('' As NVarchar(Max))
                                                         , Case
                                                               When IsNull ( roc.is_index_primary_key, 0 ) = 0
                                                                   Then
                                                                   Concat (
                                                                              '  '
                                                                            --* to identify mandatory attributes
                                                                            , Iif(Repo_is_nullable = 0, '* ', Null)
                                                                            --{static}  => underline, {abstract} => italic
                                                                            , Case
                                                                                  When roc.Repo_is_computed = 1
                                                                                      Then
                                                                                      Iif(roc.Repo_is_persisted = 1
                                                                                          , '{static} '
                                                                                          , '{abstract} ')
                                                                              End
                                                                            , roc.RepoObjectColumn_name
                                                                            , ' : '
                                                                            , roc.Repo_user_type_fullname
                                                                            --, CASE 
                                                                            -- WHEN roc.[Repo_is_computed] = 1
                                                                            --  THEN ' <<calc' + IIF(roc.[Repo_is_persisted] = 1, ' (Persisted)', '') + '>>'
                                                                            -- END
                                                                            , Char ( 13 ) + Char ( 10 )
                                                                          )
                                                           End
                                                       )
                                              , ''
                                            ) Within Group(Order By
                                                               roc.is_index_primary_key Desc
                                                             , roc.index_column_id
                                                             , roc.Repo_is_computed
                                                             , roc.RepoObjectColumn_name)
From
    repo.RepoObjectColumn_gross As roc
Where
    --not [is_query_plan_expression], these are not real columms
    roc.is_query_plan_expression Is Null
    --we need the datatype, or it should be computed
    And
    (
        Not roc.Repo_user_type_fullname Is Null
        Or roc.Repo_is_computed = 1
    )
Group By
    roc.RepoObject_guid;
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
