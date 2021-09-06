CREATE SYNONYM [sys_dwh].[indexes] FOR [sys].[indexes];








GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo_sys.ExtendedProperties.adoc[]
* xref:repo_sys.Index_unique.adoc[]
* xref:repo_sys.IndexColumn_unique.adoc[]', @level0type = N'SCHEMA', @level0name = N'sys_dwh', @level1type = N'SYNONYM', @level1name = N'indexes';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sys_dwh', @level1type = N'SYNONYM', @level1name = N'indexes';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'sys_dwh', @level1type = N'SYNONYM', @level1name = N'indexes';

