CREATE VIEW repo.aaa_test_sql_table_column
AS
--
SELECT [RepoObjectColumn_name]
 , [sql_table_column_common] = CONCAT (
  QUOTENAME([RepoObjectColumn_name])
  --
  , ' '
  , [Repo_user_type_fullname]
  --CONSTRAINT
  --DEFAULT
  , CASE 
   WHEN [Repo_default_name] <> ''
    AND ISNULL([Repo_default_is_system_named], 0) = 0
    THEN CONCAT (
      ' CONSTRAINT '
      , [Repo_default_name]
      )
   END
  --
  , CASE 
   WHEN [Repo_default_definition] <> ''
    THEN CONCAT (
      ' DEFAULT '
      , [Repo_default_definition]
      )
   END
  --temporal table columns
  , CASE [Repo_generated_always_type]
   WHEN 1
    THEN ' GENERATED ALWAYS AS ROW START'
   WHEN 2
    THEN ' GENERATED ALWAYS AS ROW END'
   END
  --identity
  , CASE [Repo_is_identity]
   WHEN 1
    THEN CONCAT (
      ' IDENTITY ('
      , ISNULL(CAST([Repo_seed_value] AS NVARCHAR(MAX)), '1')
      , ', '
      , ISNULL(CAST([Repo_increment_value] AS NVARCHAR(MAX)), '1')
      , ')'
      )
   END
  --[Repo_is_nullable]
  , CASE [Repo_is_nullable]
   WHEN 0
    THEN ' NOT'
   END
  , ' NULL '
  --
  )
 , [sql_table_column_computed] = CASE 
  WHEN [Repo_is_computed] = 1
   THEN CONCAT (
     QUOTENAME([RepoObjectColumn_name])
     , ' AS '
     , [Repo_definition]
     , CASE 
      WHEN [Repo_is_persisted] = 1
       THEN ' PERSISTED'
      END
     --[Repo_is_nullable]
     , CASE [Repo_is_nullable]
      WHEN 0
       THEN ' NOT'
      END
     , ' NULL '
     --
     )
  END
 , [sql_table_column_identity] = 'todo'
 , [Repo_is_computed]
 , [Repo_is_persisted]
 , [Repo_is_identity]
 , [Repo_seed_value]
 , [Repo_increment_value]
FROM [repo].[RepoObjectColumn] AS roc
 ----
 --ORDER BY
 --         [RepoObjectColumn_name]

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b990291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'aaa_test_sql_table_column';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '58f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'aaa_test_sql_table_column', @level2type = N'COLUMN', @level2name = N'sql_table_column_identity';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '57f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'aaa_test_sql_table_column', @level2type = N'COLUMN', @level2name = N'sql_table_column_computed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '56f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'aaa_test_sql_table_column', @level2type = N'COLUMN', @level2name = N'sql_table_column_common';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '55f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'aaa_test_sql_table_column', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5cf77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'aaa_test_sql_table_column', @level2type = N'COLUMN', @level2name = N'Repo_seed_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5af77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'aaa_test_sql_table_column', @level2type = N'COLUMN', @level2name = N'Repo_is_persisted';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5bf77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'aaa_test_sql_table_column', @level2type = N'COLUMN', @level2name = N'Repo_is_identity';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '59f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'aaa_test_sql_table_column', @level2type = N'COLUMN', @level2name = N'Repo_is_computed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5df77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'aaa_test_sql_table_column', @level2type = N'COLUMN', @level2name = N'Repo_increment_value';

