﻿/*
Index hat folgende Eindeutigkeiten

- RepoObject_guid
- Schema.NameDesIndex - kann sich aber ändern, wenn der Index umbenannt wird
- Parent-Objekt (Tabelle) + NameDesIndex - kann sich auch ändern
- object_id des Index in der Datenbank
  - hier in der Sicht nicht enthalten, müsste oder könnte man joinen über sys.Object oder sys.key_constraints
  - ist aber wenig nützlich, wenn es auch virtuelle Index geben soll, die nicht in der Datenbank erstellt werden können und somit keine object_id bekommen

Kombination mit virtuellen Index

- Schema.NameDesIndex müssen auch für die UNION aus echten und virtuellen Index unique sein 
- Ablage
  - eine gemeinsame Tabelle (UK einfach möglich)
  - separate Tabellen und UNION ALL
    - wenn WITH SCHEMABINDING, dann wäre auch ein UK möglich
	  - da die Quellen aber System-Sichten sind, geht SCHEMABINDING nicht
	- man bräuchte sich nur um die Tabelle mit den virtuellen Index kümmern, die echten wären immer über diese Sicht aktuell  
	  zumindest nach einem sync der guid wegen repo_sys.SysColumn_RepoObjectColumn_via_column_name

semantische Gruppen müssen aber ebenfalls (und vor allem) den echten Index zugeordnet werden, dafür wird also eh eine Tabelle benötigt

*/
CREATE VIEW [repo_sys].[IndexColumn_unique]
AS
--
SELECT [index_guid] = [sc_ro].[RepoObject_guid]
 , [sic].[index_column_id]
 , [sic].[is_descending_key]
 , [sc_roc].[RepoObjectColumn_guid] --could by empty for new Objects, execute [repo].[usp_sync_guid]
 , [parent_RepoObject_guid] = [sc_roc].[RepoObject_guid] --could by empty for new Objects, execute [repo].[usp_sync_guid]
 , [index_name] = [si].[name] COLLATE database_default
 , [parent_schema_name] = [sc_roc].[SysObject_schema_name]
 , [parent_SysObject_name] = [sc_roc].[SysObject_name]
 , [sc_roc].[SysObject_column_name]
 , [sc_roc].[user_type_fullname] AS [SysObject_column_user_type_fullname]
 , [si].[is_unique] AS [is_index_unique]
 , [si].[is_primary_key] AS [is_index_primary_key]
 , [parent_SysObject_fullname] = [sc_roc].[SysObject_fullname]
 , [is_index_real] = CAST(1 AS BIT)
 , [sic].[index_id]
--, [sic].[key_ordinal]
--, [si].[type] AS                   [index_type]
--, [si].[type_desc] AS              [index_type_desc]
--, [si].[is_unique_constraint] AS   [is_index_unique_constraint]
--  --
--, [sic].object_id
--, [sic].[column_id]
--, [sic].[partition_ordinal]
--, [sic].[is_included_column]
--, [sic].[column_store_order_ordinal]
--  --, [si].[data_space_id]
--  --, [si].[ignore_dup_key]
--, [si].[fill_factor]
--, [si].[is_padded]
--, [si].[is_disabled]
--, [si].[is_hypothetical]
--, [si].[is_ignored_in_optimization]
--, [si].[allow_row_locks]
--, [si].[allow_page_locks]
--, [si].[has_filter]
--, [si].[filter_definition]
--, [si].[compression_delay]
--, [si].[suppress_dup_key_messages]
--, [si].[auto_created]
--, [si].[optimize_for_sequential_key]
FROM sys_dwh.index_columns AS sic
INNER JOIN sys_dwh.indexes AS si
 ON sic.object_id = si.object_id
  AND sic.index_id = si.index_id
INNER JOIN repo.SysColumn_RepoObjectColumn_via_name AS sc_roc
 ON sic.object_id = sc_roc.SysObject_id
  AND sic.column_id = sc_roc.SysObject_column_id
LEFT JOIN repo.SysObject_RepoObject_via_name AS sc_ro
 ON sc_ro.SysObject_name = si.name COLLATE database_default
  AND sc_ro.SysObject_schema_name = sc_roc.SysObject_schema_name
WHERE [si].[is_unique] = 1
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6090291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'IndexColumn_unique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a4f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'IndexColumn_unique', @level2type = N'COLUMN', @level2name = N'SysObject_column_user_type_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a3f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'IndexColumn_unique', @level2type = N'COLUMN', @level2name = N'SysObject_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9ef57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'IndexColumn_unique', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a2f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'IndexColumn_unique', @level2type = N'COLUMN', @level2name = N'parent_SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a7f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'IndexColumn_unique', @level2type = N'COLUMN', @level2name = N'parent_SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a1f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'IndexColumn_unique', @level2type = N'COLUMN', @level2name = N'parent_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9ff57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'IndexColumn_unique', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a5f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'IndexColumn_unique', @level2type = N'COLUMN', @level2name = N'is_index_unique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a8f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'IndexColumn_unique', @level2type = N'COLUMN', @level2name = N'is_index_real';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a6f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'IndexColumn_unique', @level2type = N'COLUMN', @level2name = N'is_index_primary_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9df57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'IndexColumn_unique', @level2type = N'COLUMN', @level2name = N'is_descending_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a0f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'IndexColumn_unique', @level2type = N'COLUMN', @level2name = N'index_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a9f57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'IndexColumn_unique', @level2type = N'COLUMN', @level2name = N'index_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9bf57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'IndexColumn_unique', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9cf57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'IndexColumn_unique', @level2type = N'COLUMN', @level2name = N'index_column_id';


GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[SysColumn_RepoObjectColumn_via_name].[SysObject_column_name]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'IndexColumn_unique', @level2type = N'COLUMN', @level2name = N'SysObject_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[SysColumn_RepoObjectColumn_via_name].[SysObject_name]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'IndexColumn_unique', @level2type = N'COLUMN', @level2name = N'parent_SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[SysColumn_RepoObjectColumn_via_name].[SysObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'IndexColumn_unique', @level2type = N'COLUMN', @level2name = N'parent_SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[SysColumn_RepoObjectColumn_via_name].[SysObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'IndexColumn_unique', @level2type = N'COLUMN', @level2name = N'parent_schema_name';

