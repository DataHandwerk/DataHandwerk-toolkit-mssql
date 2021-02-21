
CREATE VIEW [repo_sys].[ForeignKeyColumn]
AS
SELECT
 --
 fkc.constraint_object_id
 , fkc.constraint_column_id
 , fkc.parent_object_id
 , fkc.parent_column_id
 , fkc.referenced_object_id
 , fkc.referenced_column_id
 , ForeignKey_name = fk.name
 , ForeignKey_fullname
 , ForeignKey_guid
 , referencing_column_name = parent_sc.SysObject_column_name
 , referencing_name = parent_sc.SysObject_name
 , referencing_schema_name = parent_sc.SysObject_schema_name
 , referencing_RepoObject_fullname = fk.parent_RepoObject_fullname
 , referencing_RepoObject_guid = parent_sc.SysObject_RepoObject_guid
 , referencing_RepoObjectColumn_guid = parent_sc.SysObject_RepoObjectColumn_guid
 , referencing_SysObject_fullname = fk.parent_SysObject_fullname
 , referenced_column_name = referenced_sc.SysObject_column_name
 , referenced_name = referenced_sc.SysObject_name
 , referenced_schema_name = referenced_sc.SysObject_schema_name
 , referenced_RepoObject_guid = referenced_sc.SysObject_RepoObject_guid
 , referenced_RepoObjectColumn_guid = referenced_sc.SysObject_RepoObjectColumn_guid
FROM sys_dwh.foreign_key_columns AS fkc
LEFT OUTER JOIN repo_sys.ForeignKey AS fk
 ON fk.object_id = fkc.constraint_object_id
LEFT OUTER JOIN [repo_sys].[SysColumn] parent_sc
 ON parent_sc.SysObject_id = fkc.parent_object_id
  AND parent_sc.SysObject_column_id = fkc.parent_column_id
LEFT OUTER JOIN [repo_sys].[SysColumn] referenced_sc
 ON referenced_sc.SysObject_id = fkc.referenced_object_id
  AND referenced_sc.SysObject_column_id = fkc.referenced_column_id
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3a65ae67-bc72-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKeyColumn', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3965ae67-bc72-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKeyColumn', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3865ae67-bc72-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKeyColumn', @level2type = N'COLUMN', @level2name = N'referenced_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3765ae67-bc72-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKeyColumn', @level2type = N'COLUMN', @level2name = N'referenced_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3665ae67-bc72-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKeyColumn', @level2type = N'COLUMN', @level2name = N'referenced_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3565ae67-bc72-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKeyColumn', @level2type = N'COLUMN', @level2name = N'referencing_SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3465ae67-bc72-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKeyColumn', @level2type = N'COLUMN', @level2name = N'referencing_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3365ae67-bc72-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKeyColumn', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3265ae67-bc72-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKeyColumn', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3165ae67-bc72-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKeyColumn', @level2type = N'COLUMN', @level2name = N'referencing_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3065ae67-bc72-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKeyColumn', @level2type = N'COLUMN', @level2name = N'referencing_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2f65ae67-bc72-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKeyColumn', @level2type = N'COLUMN', @level2name = N'referencing_column_name';


GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2a65ae67-bc72-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKeyColumn', @level2type = N'COLUMN', @level2name = N'referenced_column_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2965ae67-bc72-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKeyColumn', @level2type = N'COLUMN', @level2name = N'referenced_object_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2865ae67-bc72-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKeyColumn', @level2type = N'COLUMN', @level2name = N'parent_column_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2765ae67-bc72-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKeyColumn', @level2type = N'COLUMN', @level2name = N'parent_object_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2665ae67-bc72-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKeyColumn', @level2type = N'COLUMN', @level2name = N'constraint_column_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2565ae67-bc72-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKeyColumn', @level2type = N'COLUMN', @level2name = N'constraint_object_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0865ae67-bc72-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKeyColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c656741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKeyColumn', @level2type = N'COLUMN', @level2name = N'ForeignKey_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c856741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKeyColumn', @level2type = N'COLUMN', @level2name = N'ForeignKey_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c756741b-6373-eb11-84e3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ForeignKeyColumn', @level2type = N'COLUMN', @level2name = N'ForeignKey_fullname';

