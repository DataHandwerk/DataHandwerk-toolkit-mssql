﻿CREATE SYNONYM [sys_dwh].[types] FOR [sys].[types];






GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo_sys.parameters.adoc[]
* xref:repo_sys.SysColumn.adoc[]', @level0type = N'SCHEMA', @level0name = N'sys_dwh', @level1type = N'SYNONYM', @level1name = N'types';

