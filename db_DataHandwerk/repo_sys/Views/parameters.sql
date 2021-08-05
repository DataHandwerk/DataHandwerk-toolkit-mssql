CREATE VIEW repo_sys.[parameters]
AS
SELECT [par].object_id
 , [par].[name]
 , [par].[parameter_id]
 , [par].[system_type_id]
 , [par].[user_type_id]
 , [par].[max_length]
 , [par].[precision]
 , [par].[scale]
 , [par].[is_output]
 , [par].[is_cursor_ref]
 , [par].[has_default_value]
 , [par].[is_xml_document]
 , [par].[default_value]
 , [par].[xml_collection_id]
 , [par].[is_readonly]
 , [par].[is_nullable]
 , [par].[encryption_type]
 , [par].[encryption_type_desc]
 , [par].[encryption_algorithm_name]
 , [par].[column_encryption_key_id]
 , [par].[column_encryption_key_database_name]
 -- code for [user_type_name]: https://stackoverflow.com/questions/9179990/where-do-i-find-sql-server-metadata-for-column-datatypes
 , [user_type_name] = [tp].[name] COLLATE database_default
 , [user_type_fullname] = CASE 
  WHEN [tp].[name] IN (
    'varchar'
    , 'char'
    , 'varbinary'
    , 'binary'
    )
   THEN [tp].[name] + '(' + IIF([par].[max_length] = - 1, 'max', CAST([par].[max_length] AS VARCHAR(25))) + ')'
  WHEN [tp].[name] IN (
    'nvarchar'
    , 'nchar'
    )
   THEN [tp].[name] + '(' + IIF([par].[max_length] = - 1, 'max', CAST([par].[max_length] / 2 AS VARCHAR(25))) + ')'
  WHEN [tp].[name] IN (
    'decimal'
    , 'numeric'
    )
   THEN [tp].[name] + '(' + CAST([par].[precision] AS VARCHAR(25)) + ', ' + CAST([par].[scale] AS VARCHAR(25)) + ')'
  WHEN [tp].[name] IN ('datetime2')
   THEN [tp].[name] + '(' + CAST([par].[scale] AS VARCHAR(25)) + ')'
  ELSE [tp].[name]
  END COLLATE database_default
 , so.SysObject_fullname
 , so.SysObject_fullname2
 , so.SysObject_name
 , so.SysObject_RepoObject_guid
 , so.SysObject_schema_name
 , SysObject_type = so.type
FROM [sys_dwh].[parameters] AS par
LEFT OUTER JOIN sys_dwh.types AS tp
 ON tp.user_type_id = par.user_type_id
LEFT OUTER JOIN [repo_sys].[SysObject] so
 ON so.SysObject_id = par.object_id
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0f7e7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0e7e7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0d7e7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'SysObject_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0c7e7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0b7e7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0a7e7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '097e7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'user_type_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '087e7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'user_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '077e7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'column_encryption_key_database_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '067e7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'column_encryption_key_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '057e7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'encryption_algorithm_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '047e7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'encryption_type_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '037e7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'encryption_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '027e7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'is_nullable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '017e7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'is_readonly';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '007e7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'xml_collection_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ff7d7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'default_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fe7d7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'is_xml_document';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fd7d7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'has_default_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fc7d7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'is_cursor_ref';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fb7d7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'is_output';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fa7d7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'scale';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f97d7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'precision';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f87d7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'max_length';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f77d7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'user_type_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f67d7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'system_type_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f57d7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'parameter_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f47d7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f37d7a91-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'object_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9cdfbe88-ca97-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo_sys].[SysObject]
* [sys_dwh].[parameters]
* [sys_dwh].[types]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.RepoObject_ParameterList.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo_sys.SysObject.adoc[]
* xref:sys_dwh.parameters.adoc[]
* xref:sys_dwh.types.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[SysObject].[type]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[SysObject].[SysObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[SysObject].[SysObject_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'SysObject_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[SysObject].[SysObject_name]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[SysObject].[SysObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[SysObject].[SysObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'parameters', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';

