﻿CREATE SCHEMA [logs]
    AUTHORIZATION [dbo];
























GO
EXECUTE sp_addextendedproperty @name = N'RepoSchema_guid', @value = '2099d297-86a3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'logs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'contains xref:sqldb:logs.ExecutionLog.adoc[] and related objects', @level0type = N'SCHEMA', @level0name = N'logs';

