﻿CREATE SCHEMA [sys_dwh]
    AUTHORIZATION [dbo];


















































































































































































































GO
EXECUTE sp_addextendedproperty @name = N'RepoSchema_guid', @value = '1899d297-86a3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_dwh';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'* contains only synonyms to connect a repository database and a dwh database
* connect repo datatabase to dwh database using synonyms executing the stored procedure xref:sqldb:config.usp_connect_database.adoc[]
+
.connect repository database to the dwh database ''WideWorldImporters''
====
[source,sql]
----
include::sqldb:partial$config.usp_connect_database.adoc[tag=exampleusage]
----
====
', @level0type = N'SCHEMA', @level0name = N'sys_dwh';

