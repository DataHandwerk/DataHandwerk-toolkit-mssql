﻿CREATE SYNONYM [sys_dwh].[parameters] FOR [sys].[parameters];






GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo_sys.ExtendedProperties.adoc[]
* xref:repo_sys.parameters.adoc[]', @level0type = N'SCHEMA', @level0name = N'sys_dwh', @level1type = N'SYNONYM', @level1name = N'parameters';

