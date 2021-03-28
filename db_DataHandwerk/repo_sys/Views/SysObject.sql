/*
ATTENTION:
[SysObject_RepoObject_guid] has prefix SysObject, because it it the RepoObject_guid stored in repo_sys.extended_properties
but some objects havn't extended properties, for example Triggers
These objects have RepoObject_guid only in [repo].[RepoObject].RepoObject_guid, but they have no SysObject_RepoObject_guid

ATTENTION:
when using synonyms
SCHEMA_NAME([so].schema_id) doesn't return the original schema_name but it runs in the current database 

OBJECT_SCHEMA_NAME muss verwendet werden und die database_id der DWH-Datenbank muss verwendet werden
oder über synonym [sys_dwh].schemas
*/
CREATE VIEW [repo_sys].[SysObject]
AS
--
SELECT [so].object_id AS [SysObject_id]
 , [sch].[name] COLLATE database_default AS [SysObject_schema_name]
 --, OBJECT_SCHEMA_NAME([so].object_id) AS [SysObject_schema_name_]
 , [so].[name] COLLATE database_default AS [SysObject_name]
 , [SysObject_fullname] = CONCAT (
  QUOTENAME([sch].[name])
  , '.'
  , QUOTENAME([so].[name])
  ) COLLATE database_default
 , TRY_CAST([ep].[property_value] AS UNIQUEIDENTIFIER) AS [SysObject_RepoObject_guid]
 , [so].[principal_id]
 , [so].schema_id
 , [so].[parent_object_id]
 , [so].[type] COLLATE database_default AS [type]
 , [so].[type_desc]
 , [so].[create_date]
 , [so].[modify_date]
 , [so].[is_ms_shipped]
 , [so].[is_published]
 , [so].[is_schema_published]
 , [st].[temporal_type]
 , [st].[temporal_type_desc]
 , [st].[history_table_id]
 , [st].[max_column_id_used]
 , [sm].[definition] AS [sql_modules_definition]
FROM sys_dwh.objects AS so
LEFT OUTER JOIN [sys_dwh].schemas AS sch
 ON sch.schema_id = [so].schema_id
LEFT OUTER JOIN repo_sys.[ExtendedProperties] AS ep
 ON ep.major_id = so.object_id
  AND ep.minor_id = 0
  AND ep.property_name = N'RepoObject_guid'
LEFT OUTER JOIN sys_dwh.tables AS st
 ON st.object_id = so.object_id
LEFT OUTER JOIN [sys_dwh].[sql_modules] AS sm
 ON sm.object_id = so.object_id
WHERE [sch].[name] <> 'sys'
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4f90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '73f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'type_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '72f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7af47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'temporal_type_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '79f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'temporal_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6bf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6ef47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'SysObject_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6cf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6af47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'SysObject_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6df47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7df47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'sql_modules_definition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '70f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'schema_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6ff47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'principal_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '71f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'parent_object_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '75f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'modify_date';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7cf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'max_column_id_used';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '78f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'is_schema_published';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '77f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'is_published';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '76f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'is_ms_shipped';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7bf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'history_table_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '74f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'create_date';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'[repo_sys].[ExtendedProperties]
[sys_dwh].[objects]
[sys_dwh].[schemas]
[sys_dwh].[sql_modules]
[sys_dwh].[tables]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject';

