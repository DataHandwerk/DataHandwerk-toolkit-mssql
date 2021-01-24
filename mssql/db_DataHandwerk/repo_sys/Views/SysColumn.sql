CREATE VIEW [repo_sys].[SysColumn]
AS
--
SELECT [sc].object_id AS [SysObject_id]
 , OBJECT_SCHEMA_NAME([sc].object_id, [db].[dwh_database_id]) AS [SysObject_schema_name]
 , OBJECT_NAME([sc].object_id, [db].[dwh_database_id]) AS [SysObject_name]
 , [sc].[column_id] AS [SysObject_column_id]
 , [sc].[name] COLLATE database_default AS [SysObject_column_name]
 , [so].[type] AS [SysObject_type]
 , [so].[type_desc] AS [SysObject_type_desc]
 , TRY_CAST([ep].[property_value] AS UNIQUEIDENTIFIER) AS [SysObject_RepoObject_guid]
 , TRY_CAST([ep2].[property_value] AS UNIQUEIDENTIFIER) AS [SysObject_RepoObjectColumn_guid]
 , [sc].[system_type_id]
 , [sc].[user_type_id]
 -- code for [user_type_name]: https://stackoverflow.com/questions/9179990/where-do-i-find-sql-server-metadata-for-column-datatypes
 , [user_type_name] = [tp].[name] COLLATE database_default
 , [user_type_fullname] = CASE 
  WHEN [tp].[name] IN (
    'varchar'
    , 'char'
    , 'varbinary'
    , 'binary'
    )
   THEN [tp].[name] + '(' + IIF([sc].[max_length] = - 1, 'max', CAST([sc].[max_length] AS VARCHAR(25))) + ')'
  WHEN [tp].[name] IN (
    'nvarchar'
    , 'nchar'
    )
   THEN [tp].[name] + '(' + IIF([sc].[max_length] = - 1, 'max', CAST([sc].[max_length] / 2 AS VARCHAR(25))) + ')'
  WHEN [tp].[name] IN (
    'decimal'
    , 'numeric'
    )
   THEN [tp].[name] + '(' + CAST([sc].[precision] AS VARCHAR(25)) + ', ' + CAST([sc].[scale] AS VARCHAR(25)) + ')'
  WHEN [tp].[name] IN ('datetime2')
   THEN [tp].[name] + '(' + CAST([sc].[scale] AS VARCHAR(25)) + ')'
  ELSE [tp].[name]
  END COLLATE database_default
 , [sc].[max_length]
 , [sc].[precision]
 , [sc].[scale]
 , [sc].[collation_name]
 , [sc].[is_nullable]
 , [sc].[is_ansi_padded]
 , [sc].[is_rowguidcol]
 , [sc].[is_identity]
 , [sc].[is_computed]
 , [sc].[is_filestream]
 , [sc].[is_replicated]
 , [sc].[is_non_sql_subscribed]
 , [sc].[is_merge_published]
 , [sc].[is_dts_replicated]
 , [sc].[is_xml_document]
 , [sc].[xml_collection_id]
 , [sc].[default_object_id]
 , [sc].[rule_object_id]
 , [sc].[is_sparse]
 , [sc].[is_column_set]
 , [sc].[generated_always_type]
 , [sc].[generated_always_type_desc]
 , [sc].[encryption_type]
 , [sc].[encryption_type_desc]
 , [sc].[encryption_algorithm_name]
 , [sc].[column_encryption_key_id]
 , [sc].[column_encryption_key_database_name]
 , [sc].[is_hidden]
 , [sc].[is_masked]
 , [sc].[graph_type]
 , [sc].[graph_type_desc]
 , [scc].[definition] COLLATE database_default AS [definition]
 , [scc].[is_persisted]
 , [scc].[uses_database_collation]
 , [sdc].[definition] COLLATE database_default AS [default_definition]
 , [sdc].[is_system_named] AS [default_is_system_named]
 , [sdc].[name] COLLATE database_default AS [default_name]
 , [sdc].[parent_column_id] AS [default_parent_column_id]
 , [sic].[seed_value]
 , [sic].[increment_value]
 , [sic].last_value
--, [sic].[is_not_for_replication]
--, CAST(CASE
--           WHEN [sc].[name] = 'SysStartTime'
--                AND [tp].[name] = 'datetime2'
--           THEN 1
--           WHEN [sc].[name] = 'SysEndTime'
--                AND [tp].[name] = 'datetime2'
--           THEN 2
--       END AS TINYINT) AS                                        [temporal_column_type]
FROM sys_dwh.columns AS sc
LEFT OUTER JOIN repo_sys.[ExtendedProperties] AS ep
 ON ep.major_id = sc.object_id
  AND ep.minor_id = 0
  AND ep.property_name = N'RepoObject_guid'
LEFT OUTER JOIN repo_sys.[ExtendedProperties] AS ep2
 ON ep2.major_id = sc.object_id
  AND ep2.minor_id = sc.column_id
  AND ep2.property_name = N'RepoObjectColumn_guid'
LEFT OUTER JOIN repo_sys.SysObject AS so
 ON so.SysObject_id = sc.object_id
LEFT OUTER JOIN sys_dwh.types AS tp
 ON sc.user_type_id = tp.user_type_id
LEFT OUTER JOIN sys_dwh.computed_columns AS scc
 ON scc.object_id = sc.object_id
  AND scc.[column_id] = sc.[column_id]
LEFT OUTER JOIN sys_dwh.default_constraints AS sdc
 ON sc.default_object_id = sdc.object_id
LEFT OUTER JOIN [sys_dwh].identity_columns AS sic
 ON sic.object_id = sc.object_id
  AND sic.[column_id] = sc.[column_id]
--
CROSS APPLY repo.ftv_dwh_database() AS db
WHERE OBJECT_SCHEMA_NAME([sc].object_id, [db].[dwh_database_id]) <> 'sys'
GO


