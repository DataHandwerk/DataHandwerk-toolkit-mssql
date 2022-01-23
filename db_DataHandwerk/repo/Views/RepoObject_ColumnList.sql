

CREATE View [repo].[RepoObject_ColumnList]
As
Select
    --roc is the persistence target!
    roc.RepoObject_guid
  , CreateColumnList                  =
  --
  Concat (
             String_Agg (
                            Concat (
                                       --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                                       Cast('' As NVarchar(Max))
                                     , Case
                                           When 1 = 1
                                               Then
                                               Concat (
                                                          --
                                                          Cast('' As NVarchar(Max))
                                                        , QuoteName ( roc.RepoObjectColumn_name )
                                                        , ' '
                                                        , Case roc.Repo_is_computed
                                                              When 1
                                                                  Then
                                                                  Concat (
                                                                             'AS '
                                                                           , roc.Repo_definition
                                                                           , Case
                                                                                 When roc.Repo_is_persisted = 1
                                                                                     Then
                                                                                     ' PERSISTED'
                                                                             End
                                                                         )
                                                              Else
                                                                  Concat (
                                                                             roc.Repo_user_type_fullname
                                                                           --CONSTRAINT
                                                                           --DEFAULT
                                                                           , Case
                                                                                 When roc.Repo_default_name <> ''
                                                                                      And IsNull (
                                                                                                     roc.Repo_default_is_system_named
                                                                                                   , 0
                                                                                                 ) = 0
                                                                                     Then
                                                                                     Concat (
                                                                                                ' CONSTRAINT '
                                                                                              , roc.Repo_default_name
                                                                                            )
                                                                             End
                                                                           --
                                                                           , Case
                                                                                 When roc.Repo_default_definition <> ''
                                                                                     Then
                                                                                     Concat (
                                                                                                ' DEFAULT '
                                                                                              , roc.Repo_default_definition
                                                                                            )
                                                                             End
                                                                           --temporal table columns
                                                                           , Case roc.Repo_generated_always_type
                                                                                 When 1
                                                                                     Then
                                                                                     ' GENERATED ALWAYS AS ROW START'
                                                                                 When 2
                                                                                     Then
                                                                                     ' GENERATED ALWAYS AS ROW END'
                                                                             End
                                                                           --IDENTITY
                                                                           --, CASE roc.Repo_is_identity
                                                                           -- WHEN 1
                                                                           --  THEN ' IDENTITY ' + CASE 
                                                                           --    WHEN NOT roc.[Repo_seed_value] IS NULL
                                                                           --     AND NOT roc.[Repo_increment_value] IS NULL
                                                                           --     THEN CONCAT (
                                                                           --       '('
                                                                           --       , CAST(roc.[Repo_seed_value] AS NVARCHAR(max))
                                                                           --       , ', '
                                                                           --       , CAST(roc.[Repo_increment_value] AS NVARCHAR(max))
                                                                           --       , ')'
                                                                           --       )
                                                                           --    END
                                                                           -- END
                                                                           , Case roc.Repo_is_identity
                                                                                 When 1
                                                                                     Then
                                                                                     Concat (
                                                                                                ' IDENTITY ('
                                                                                              , IsNull (
                                                                                                           Cast(roc.Repo_seed_value As NVarchar(Max))
                                                                                                         , '1'
                                                                                                       )
                                                                                              , ', '
                                                                                              , IsNull (
                                                                                                           Cast(roc.Repo_increment_value As NVarchar(Max))
                                                                                                         , '1'
                                                                                                       )
                                                                                              , ')'
                                                                                            )
                                                                             End
                                                                           , Case
                                                                                 When roc.Repo_is_nullable = 0
                                                                                      Or roc.Repo_generated_always_type >= 1
                                                                                     Then
                                                                                     ' NOT'
                                                                             End
                                                                           , ' NULL '
                                                                         )
                                                          End
                                                        , Char ( 13 ) + Char ( 10 )
                                                      )
                                       End
                                   )
                          , ', '
                        ) Within Group(Order By
                                           roc.RepoObjectColumn_column_id)
           , Iif(
                 Max ( rop.ExecutionLogId_action ) In
                 ( 'i', 'u' )
               , ', ' + Max ( persistence_ExecutionLogId_ColumnName.Parameter_value_result ) + ' bigint NULL'
                 + Char ( 13 ) + Char ( 10 )
               , '')
         )
  , TemporalTableColumnList           =
  --
  Concat (
             String_Agg (
                            Concat (
                                       --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                                       Cast('' As NVarchar(Max))
                                     , Case
                                           When roc.Repo_generated_always_type In
                                           ( 1, 2 )
                                               Then
                                               Concat (
                                                          Iif(roc.Repo_generated_always_type = 2, ', ', '')
                                                        , QuoteName ( roc.RepoObjectColumn_name )
                                                        , ' '
                                                        , Concat (
                                                                     roc.Repo_user_type_fullname
                                                                   --temporal table columns
                                                                   , Case roc.Repo_generated_always_type
                                                                         When 1
                                                                             Then
                                                                             ' GENERATED ALWAYS AS ROW START'
                                                                         When 2
                                                                             Then
                                                                             ' GENERATED ALWAYS AS ROW END'
                                                                     End
                                                                   , Char ( 13 ) + Char ( 10 )
                                                                   , Case roc.Repo_generated_always_type
                                                                         When 1
                                                                             Then
                                                                             ' CONSTRAINT [DF_' + roc.RepoObject_name
                                                                             + '_' + roc.RepoObjectColumn_name
                                                                             + '] DEFAULT SYSUTCDATETIME()'
                                                                         When 2
                                                                             Then
                                                                             ' CONSTRAINT [DF_' + roc.RepoObject_name
                                                                             + '_' + roc.RepoObjectColumn_name
                                                                             + '] DEFAULT CONVERT(DATETIME2, ''9999-12-31 23:59:59.9999999'')'
                                                                     End
                                                                 )
                                                        , Char ( 13 ) + Char ( 10 )
                                                      )
                                       End
                                   )
                          , ''
                        ) Within Group(Order By
                                           roc.RepoObjectColumn_column_id)
           , Iif(
                 Max ( rop.ExecutionLogId_action ) In
                 ( 'i', 'u' )
               , ', ' + Max ( persistence_ExecutionLogId_ColumnName.Parameter_value_result ) + ' bigint NULL'
                 + Char ( 13 ) + Char ( 10 )
               , '')
         )
  , DbmlColumnList                    =
  --
  Concat (
             String_Agg (
                            Concat (
                                       --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                                       Cast('' As NVarchar(Max))
                                     , QuoteName ( roc.RepoObjectColumn_name, '"' )
                                     , ' '
                                     , roc.Repo_user_type_fullname
                                     , ' '
                                     , '['
                                     --null or not null
                                     , Case
                                           When roc.Repo_is_nullable = 0
                                                Or roc.Repo_generated_always_type >= 1
                                               Then
                                               'not'
                                       End
                                     , ' null'
                                     --primary key or pk
                                     , Case
                                           When roc.is_index_primary_key = 1
                                               Then
                                               ', pk'
                                       End
                                     --unique
                                     --default: some_value
                                     --Attention: 
                                     --number value starts blank: default: 123 or default: 123.456
                                     --string value starts with single quotes: default: 'some string value'
                                     --expression value is wrapped with parenthesis: default: `now() - interval '5 days'`
                                     --boolean (true/false/null): default: false or default: null
                                     --
                                     , Case
                                           When roc.Repo_default_definition <> ''
                                               Then
                                               Concat ( ', default: ', QuoteName ( roc.Repo_default_definition, '`' ))
                                       End
                                     --increment
                                     , Case roc.Repo_is_identity
                                           When 1
                                               Then
                                               ', increment'
                                       End
                                     --note: 'string to add notes'
                                     , Case
                                           When Not roc.Description Is Null
                                               Then
                                               ', Note: ''''''' + Char ( 13 ) + Char ( 10 )
                                               + Replace ( Replace ( roc.Description, '\', '\\' ), '''''''', '\''''''' )
                                               + Char ( 13 ) + Char ( 10 ) + ''''''''
                                       End
                                     , ']'
                                   )
                          , Char ( 13 ) + Char ( 10 )
                        ) Within Group(Order By
                                           roc.RepoObjectColumn_column_id)
           , Iif(
                 Max ( rop.ExecutionLogId_action ) In
                 ( 'i', 'u' )
               , ', ' + Max ( persistence_ExecutionLogId_ColumnName.Parameter_value_result ) + ' bigint NULL'
                 + Char ( 13 ) + Char ( 10 )
               , '')
         )
  , PersistenceCompareColumnList      =
  --
  Stuff (
            String_Agg (
                           Concat (
                                      --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                                      Cast('' As NVarchar(Max))
                                    , ''
                                    , Case
                                          When
                                    --source should exists
                                    Not roc.persistence_source_RepoObjectColumn_guid Is Null
                                    --roc is the target colum. A column which should be ignored could or could not exist in the target
                                    --it it exists, it needs to be exluded
                                    --if not, it will not be in the list of columns
                                    And IsNull ( roc.is_persistence_Ignore, 0 ) = 0
                                    And IsNull ( roc.is_persistence_NoCompareButUpdate, 0 ) = 0
                                    And IsNull ( roc.is_persistence_NoCompareNoUpdate, 0 ) = 0
                                    And IsNull ( roc.is_query_plan_expression, 0 ) = 0
                                    And roc.Repo_generated_always_type = 0
                                    And roc.Repo_is_computed = 0
                                    And roc.Repo_is_identity = 0
                                    --do not compare PK
                                    --issue: if the source column is marked as PK but the target column is not marked as PK, then this column is included
                                    --to avoid this we would need to analyze also the source column properties
                                    --or we could set [is_persistence_no_check] = 1
                                    And roc.is_index_primary_key Is Null
                                              Then
                                              Concat (
                                                         'OR T.'
                                                       , QuoteName ( roc.RepoObjectColumn_name )
                                                       , ' <> S.'
                                                       , QuoteName ( roc.RepoObjectColumn_name )
                                                       , Case
                                                             When roc.Repo_is_nullable = 1
                                                                 Then
                                                                 Concat (
                                                                            ' OR (S.'
                                                                          , QuoteName ( roc.RepoObjectColumn_name )
                                                                          , ' IS NULL AND NOT T.'
                                                                          , QuoteName ( roc.RepoObjectColumn_name )
                                                                          , ' IS NULL)'
                                                                          , ' OR (NOT S.'
                                                                          , QuoteName ( roc.RepoObjectColumn_name )
                                                                          , ' IS NULL AND T.'
                                                                          , QuoteName ( roc.RepoObjectColumn_name )
                                                                          , ' IS NULL)'
                                                                        )
                                                         End
                                                       , Char ( 13 ) + Char ( 10 )
                                                     )
                                      End
                                  )
                         , ''
                       ) Within Group(Order By
                                          roc.RepoObjectColumn_column_id)
          , 1
          , 3
          , '   '
        )
  , PersistenceInsertColumnList       =
  --
  Concat (
             Stuff (
                       String_Agg (
                                      Concat (
                                                 --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                                                 Cast('' As NVarchar(Max))
                                               , ''
                                               , Case
                                                     When
                                               --source should exists
                                               Not roc.persistence_source_RepoObjectColumn_guid Is Null
                                               --roc is the target colum. A column which should be ignored could or could not exist in the target
                                               --it it exists, it needs to be exluded
                                               --if not, it will not be in the list of columns
                                               And IsNull ( roc.is_persistence_Ignore, 0 ) = 0
                                               And IsNull ( roc.is_query_plan_expression, 0 ) = 0
                                               And roc.Repo_generated_always_type = 0
                                               And roc.Repo_is_computed = 0
                                               And roc.Repo_is_identity = 0
                                                         Then
                                                         Concat (
                                                                    ', '
                                                                  , QuoteName ( roc.RepoObjectColumn_name )
                                                                  , Char ( 13 ) + Char ( 10 )
                                                                )
                                                 End
                                             )
                                    , ''
                                  ) Within Group(Order By
                                                     roc.RepoObjectColumn_column_id)
                     , 1
                     , 2
                     , '  '
                   )
           , Iif(
                 Max ( rop.ExecutionLogId_action ) In
                 ( 'i', 'u' )
               , ', ' + Max ( persistence_ExecutionLogId_ColumnName.Parameter_value_result )
                 --+ ' = @current_execution_log_id'
                 --
                 + Char ( 13 ) + Char ( 10 )
               , '')
         )
  , PersistenceInsertColumnListSource =
  --
  Concat (
             Stuff (
                       String_Agg (
                                      Concat (
                                                 --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                                                 Cast('' As NVarchar(Max))
                                               , ''
                                               , Case
                                                     When
                                               --source should exists
                                               Not roc.persistence_source_RepoObjectColumn_guid Is Null
                                               --roc is the target colum. A column which should be ignored could or could not exist in the target
                                               --it it exists, it needs to be exluded
                                               --if not, it will not be in the list of columns
                                               And IsNull ( roc.is_persistence_Ignore, 0 ) = 0
                                               And IsNull ( roc.is_query_plan_expression, 0 ) = 0
                                               And roc.Repo_generated_always_type = 0
                                               And roc.Repo_is_computed = 0
                                               And roc.Repo_is_identity = 0
                                                         Then
                                                         Concat (
                                                                    ', '
                                                                  , QuoteName ( roc.RepoObjectColumn_name )
                                                                  , Char ( 13 ) + Char ( 10 )
                                                                )
                                                 End
                                             )
                                    , ''
                                  ) Within Group(Order By
                                                     roc.RepoObjectColumn_column_id)
                     , 1
                     , 2
                     , '  '
                   )
           , Iif(
                 Max ( rop.ExecutionLogId_action ) In
                 ( 'i', 'u' )
               , ', ' + Max ( persistence_ExecutionLogId_ColumnName.Parameter_value_result )
                 --source column should use the variable, but the target doesn't contain this part
                 + ' = @current_execution_log_id'
                 --
                 + Char ( 13 ) + Char ( 10 )
               , '')
         )
  , PersistenceUpdateColumnList       =
  --
  Concat (
             Stuff (
                       String_Agg (
                                      Concat (
                                                 --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                                                 Cast('' As NVarchar(Max))
                                               , ''
                                               , Case
                                                     When
                                               --source should exists
                                               Not roc.persistence_source_RepoObjectColumn_guid Is Null
                                               --roc is the target colum. A column which should be ignored could or could not exist in the target
                                               --it it exists, it needs to be exluded
                                               --if not, it will not be in the list of columns
                                               And IsNull ( roc.is_persistence_Ignore, 0 ) = 0
                                               ----is_persistence_NoCompareButUpdate => they should not be compared, but updated! That's why commented out
                                               --And IsNull ( roc.is_persistence_NoCompareButUpdate, 0 ) = 0
                                               And IsNull ( roc.is_persistence_NoCompareNoUpdate, 0 ) = 0
                                               And IsNull ( roc.is_query_plan_expression, 0 ) = 0
                                               And roc.Repo_generated_always_type = 0
                                               And roc.Repo_is_computed = 0
                                               And roc.Repo_is_identity = 0
                                                         Then
                                                         Concat (
                                                                    ', T.'
                                                                  , QuoteName ( roc.RepoObjectColumn_name )
                                                                  , ' = S.'
                                                                  , QuoteName ( roc.RepoObjectColumn_name )
                                                                  , Char ( 13 ) + Char ( 10 )
                                                                )
                                                 End
                                             )
                                    , ''
                                  ) Within Group(Order By
                                                     roc.RepoObjectColumn_column_id)
                     , 1
                     , 2
                     , '  '
                   )
           , Iif(
                 Max ( rop.ExecutionLogId_action ) In
                 ( 'u' )
               , ', T.' + Max ( persistence_ExecutionLogId_ColumnName.Parameter_value_result )
                 + ' = @current_execution_log_id' + Char ( 13 ) + Char ( 10 )
               , '')
         )
  , RepoObject_fullname         = Max ( roc.RepoObject_fullname )
From
    --Columns of the persistence target object
    repo.RepoObjectColumn_gross2                                                              As roc
    Left Join
        repo.RepoObject_persistence                                                           As rop
            On
            rop.target_RepoObject_guid = roc.RepoObject_guid
    Cross Join config.ftv_get_parameter_value ( 'persistence_ExecutionLogId_ColumnName', '' ) As persistence_ExecutionLogId_ColumnName
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
    roc.RepoObject_guid
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '6f90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ColumnList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '80f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ColumnList'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '84f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ColumnList'
  , @level2type = N'COLUMN'
  , @level2name = N'PersistenceUpdateColumnList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '83f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ColumnList'
  , @level2type = N'COLUMN'
  , @level2name = N'PersistenceInsertColumnList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '82f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ColumnList'
  , @level2type = N'COLUMN'
  , @level2name = N'PersistenceCompareColumnList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '81f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ColumnList'
  , @level2type = N'COLUMN'
  , @level2name = N'CreateColumnList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3cdf2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ColumnList'
  , @level2type = N'COLUMN'
  , @level2name = N'DbmlColumnList';
Go
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[RepoObjectColumn_gross2]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList';




GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.RepoObject_gross2.adoc[]
* xref:repo.RepoObject_SqlCreateTable.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList';




GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoObjectColumn_gross2.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross2].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';




GO



GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2e535aab-3250-ec11-8532-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList', @level2type = N'COLUMN', @level2name = N'TemporalTableColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '31393564-ae7b-ec11-8541-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '30393564-ae7b-ec11-8541-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_ColumnList', @level2type = N'COLUMN', @level2name = N'PersistenceInsertColumnListSource';

