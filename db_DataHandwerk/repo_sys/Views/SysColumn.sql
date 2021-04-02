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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5d90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '15f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'xml_collection_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '27f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'uses_database_collation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '04f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'user_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '03f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'user_type_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '05f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'user_type_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '02f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'system_type_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fff47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'SysObject_type_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fef47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'faf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '01f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'SysObject_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '00f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'SysObject_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fbf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f9f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'SysObject_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fdf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'SysObject_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fcf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'SysObject_column_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2cf57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'seed_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '08f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'scale';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '17f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'rule_object_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '07f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'precision';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '06f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'max_length';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2ef57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'last_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '14f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'is_xml_document';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '18f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'is_sparse';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0cf57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'is_rowguidcol';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '10f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'is_replicated';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '26f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'is_persisted';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0af57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'is_nullable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '11f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'is_non_sql_subscribed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '12f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'is_merge_published';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '22f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'is_masked';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0df57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'is_identity';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '21f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'is_hidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0ff57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'is_filestream';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '13f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'is_dts_replicated';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0ef57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'is_computed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '19f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'is_column_set';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0bf57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'is_ansi_padded';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2df57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'increment_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '24f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'graph_type_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '23f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'graph_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1bf57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'generated_always_type_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1af57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'generated_always_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1df57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'encryption_type_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1cf57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'encryption_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1ef57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'encryption_algorithm_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '25f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'definition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2bf57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'default_parent_column_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '16f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'default_object_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2af57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'default_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '29f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'default_is_system_named';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '28f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'default_definition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1ff57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'column_encryption_key_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '20f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'column_encryption_key_database_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '09f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysColumn', @level2type = N'COLUMN', @level2name = N'collation_name';


GO


