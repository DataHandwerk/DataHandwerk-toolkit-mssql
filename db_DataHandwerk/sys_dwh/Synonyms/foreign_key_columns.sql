﻿CREATE SYNONYM [sys_dwh].[foreign_key_columns] FOR [master].[sys].[foreign_key_columns];


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e28f291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_dwh', @level1type = N'SYNONYM', @level1name = N'foreign_key_columns';
