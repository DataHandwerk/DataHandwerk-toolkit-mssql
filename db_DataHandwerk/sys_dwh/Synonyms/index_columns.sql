CREATE SYNONYM [sys_dwh].[index_columns] FOR [sys].[index_columns];








GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo_sys.IndexColumn_unique.adoc[]', @level0type = N'SCHEMA', @level0name = N'sys_dwh', @level1type = N'SYNONYM', @level1name = N'index_columns';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sys_dwh', @level1type = N'SYNONYM', @level1name = N'index_columns';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sys_dwh', @level1type = N'SYNONYM', @level1name = N'index_columns';

