﻿CREATE SCHEMA [config]
    AUTHORIZATION [dbo];




























































































GO
EXECUTE sp_addextendedproperty @name = N'RepoSchema_guid', @value = '1d99d297-86a3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Connection with DWH database and various settings for the behavior of the processes in the repository.

main objects

* xref:sqldb:config.usp_connect_database.adoc[]
* xref:sqldb:config.Parameter.adoc[]', @level0type = N'SCHEMA', @level0name = N'config';







