﻿/*
ATTENTION:
[SysObject_RepoObject_guid] has prefix SysObject, because it it the RepoObject_guid stored in repo_sys.extended_properties
but some objects havn't extended properties, for example Triggers
These objects have RepoObject_guid only in [repo].[RepoObject].RepoObject_guid, but they have no SysObject_RepoObject_guid

if we would need RepoObject_guid for these objects (triggers, ...), we would need to change this view somehow join RepoObject_guid
But for now we don't wan't to do.
*/
CREATE VIEW [repo_sys].[sql_expression_dependencies]
AS
--
SELECT [sed].[referencing_id]
 , [sed].[referencing_minor_id]
 , [sed].[referenced_class]
 , [sed].[referenced_id]
 , [sed].[referenced_minor_id]
 , OBJECT_SCHEMA_NAME([sed].[referencing_id], [db].[dwh_database_id]) AS [referencing_schema_name]
 , OBJECT_NAME([sed].[referencing_id], [db].[dwh_database_id]) AS [referencing_entity_name]
 --, COL_NAME([sed].[referencing_id] , [sed].[referencing_minor_id]) AS [referencing_column_name]
 , [ssc].[SysObject_column_name] AS [referencing_column_name]
 , [so].[type] AS [referencing_type]
 , [so].[type_desc] AS [referencing_type_desciption]
 , [so].[SysObject_RepoObject_guid] AS [referencing_RepoObject_guid]
 , [ssc].[SysObject_RepoObjectColumn_guid] AS [referencing_RepoObjectColumn_guid]
 , [sed].[referencing_class]
 , [sed].[referencing_class_desc]
 , [sed].[referenced_server_name]
 , [sed].[referenced_database_name] COLLATE database_default AS [referenced_database_name]
 , [sed].[referenced_schema_name] COLLATE database_default AS [referenced_schema_name]
 , [sed].[referenced_entity_name] COLLATE database_default AS [referenced_entity_name]
 --, COL_NAME([sed].[referenced_id] , [sed].[referenced_minor_id]) AS   [referenced_column_name]
 , [ssc2].[SysObject_column_name] AS [referenced_column_name]
 , [sed].[referenced_class_desc]
 , [so2].[type] AS [referenced_type]
 , [so2].[type_desc] AS [referenced_type_desciption]
 , [so2].[SysObject_RepoObject_guid] AS [referenced_RepoObject_guid]
 , [ssc2].[SysObject_RepoObjectColumn_guid] AS [referenced_RepoObjectColumn_guid]
 , [sed].[is_schema_bound_reference]
 , [sed].[is_caller_dependent]
 , [sed].[is_ambiguous]
 --table columns can be is_computed = 1, these columns should also have a defintion
 , [ssc].[is_computed]
 , [ssc].[definition]
FROM sys_dwh.sql_expression_dependencies AS sed
INNER JOIN repo_sys.SysObject AS so
 ON sed.referencing_id = so.SysObject_id
LEFT JOIN repo_sys.SysObject AS so2
 ON sed.referenced_id = so2.SysObject_id
LEFT JOIN repo_sys.SysColumn AS ssc
 ON sed.referencing_id = ssc.SysObject_id
  AND sed.referencing_minor_id = ssc.SysObject_column_id
LEFT JOIN repo_sys.SysColumn AS ssc2
 ON sed.referenced_id = ssc2.SysObject_id
  AND sed.referenced_minor_id = ssc2.SysObject_column_id
--
CROSS APPLY [config].ftv_dwh_database() AS db
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6190291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b3f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'referencing_type_desciption';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b2f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aff57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'referencing_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b5f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'referencing_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b4f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'abf57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'referencing_minor_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aaf57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'referencing_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b0f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'referencing_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b1f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'referencing_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b7f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'referencing_class_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b6f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'referencing_class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bff57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'referenced_type_desciption';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bef57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b8f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'referenced_server_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'baf57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'referenced_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c1f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c0f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aef57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'referenced_minor_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'adf57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'referenced_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bbf57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'referenced_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b9f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'referenced_database_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bcf57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'referenced_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bdf57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'referenced_class_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'acf57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'referenced_class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c2f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'is_schema_bound_reference';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c5f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'is_computed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c3f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'is_caller_dependent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c4f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'is_ambiguous';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c6f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'definition';


GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo_sys].[SysColumn].[is_computed]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'is_computed';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo_sys].[SysColumn].[definition]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'sql_expression_dependencies', @level2type = N'COLUMN', @level2name = N'definition';

