CREATE SYNONYM [sys_dwh].[extended_properties] FOR [sys].[extended_properties];






GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo_sys.ExtendedProperties.adoc[]', @level0type = N'SCHEMA', @level0name = N'sys_dwh', @level1type = N'SYNONYM', @level1name = N'extended_properties';

