CREATE SYNONYM [sys_dwh].[dm_sql_referenced_entities] FOR [sys].[dm_sql_referenced_entities];








GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo_sys.ColumnReference.adoc[]
* xref:repo_sys.RepoObjectReferenced.adoc[]', @level0type = N'SCHEMA', @level0name = N'sys_dwh', @level1type = N'SYNONYM', @level1name = N'dm_sql_referenced_entities';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sys_dwh', @level1type = N'SYNONYM', @level1name = N'dm_sql_referenced_entities';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sys_dwh', @level1type = N'SYNONYM', @level1name = N'dm_sql_referenced_entities';

