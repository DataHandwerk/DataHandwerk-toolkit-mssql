CREATE SYNONYM [sys_dwh].[sql_expression_dependencies] FOR [sys].[sql_expression_dependencies];






GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo_sys.sql_expression_dependencies.adoc[]', @level0type = N'SCHEMA', @level0name = N'sys_dwh', @level1type = N'SYNONYM', @level1name = N'sql_expression_dependencies';

