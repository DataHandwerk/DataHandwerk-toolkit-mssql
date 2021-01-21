CREATE   VIEW repo.aaa_test_sql_table_column
AS
--
SELECT
       [RepoObjectColumn_name]
     , [sql_table_column_common] = CONCAT(QUOTENAME([RepoObjectColumn_name])
       --
       , ' ' , [Repo_user_type_fullname]
       --CONSTRAINT
       --DEFAULT
       ,CASE
            WHEN [Repo_default_name] <> ''
                 AND ISNULL([Repo_default_is_system_named] , 0) = 0
            THEN CONCAT(' CONSTRAINT ' , [Repo_default_name])
        END
       --
       ,CASE
            WHEN [Repo_default_definition] <> ''
            THEN CONCAT(' DEFAULT ' , [Repo_default_definition])
        END
       --temporal table columns
       ,CASE [Repo_generated_always_type]
            WHEN 1
            THEN ' GENERATED ALWAYS AS ROW START'
            WHEN 2
            THEN ' GENERATED ALWAYS AS ROW END'
        END
       --identity
       ,CASE [Repo_is_identity]
            WHEN 1
            THEN CONCAT(' IDENTITY (' , ISNULL(CAST([Repo_seed_value] AS NVARCHAR(MAX)) , '1') , ', ' , ISNULL(CAST([Repo_increment_value] AS NVARCHAR(MAX)) , '1') , ')')
        END

       --[Repo_is_nullable]
       ,CASE [Repo_is_nullable]
            WHEN 0
            THEN ' NOT'
        END , ' NULL '
       --
       )
     , [sql_table_column_computed] = CASE
                                         WHEN [Repo_is_computed] = 1
                                         THEN CONCAT(QUOTENAME([RepoObjectColumn_name]) , ' AS ' , [Repo_definition] ,
                                                                                                   CASE
                                                                                                       WHEN [Repo_is_persisted] = 1
                                                                                                       THEN ' PERSISTED'
                                                                                                   END
                                     --[Repo_is_nullable]
                                     ,CASE [Repo_is_nullable]
                                          WHEN 0
                                          THEN ' NOT'
                                      END , ' NULL '
                                     --
                                     )
                                     END
     , [sql_table_column_identity] = 'todo'
     , [Repo_is_computed]
     , [Repo_is_persisted]
     , [Repo_is_identity]
     , [Repo_seed_value]
     , [Repo_increment_value]
FROM
     [repo].[RepoObjectColumn] AS roc
     ----
     --ORDER BY
     --         [RepoObjectColumn_name]