
CREATE VIEW [repo].[dbeaver_DataSources_connection]
AS
SELECT
 --
 j1.*
 , j2.*
 , j3.[key] AS connection_key
 , j3.value AS connection_json
 , J4.*
FROM [repo].[dbeaver_DataSources] j1
CROSS APPLY OPENJSON(BulkColumn) WITH (connections NVARCHAR(MAX) N'$.connections' AS JSON) j2
CROSS APPLY OPENJSON(j2.connections) j3
CROSS APPLY OPENJSON(j3.value) WITH (
  connection_provider NVARCHAR(100) N'$.provider'
  , connection_driver NVARCHAR(100) N'$.driver'
  , conection_name NVARCHAR(100) N'$.name'
  ) j4
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a8be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'dbeaver_DataSources_connection', @level2type = N'COLUMN', @level2name = N'conection_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a7be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'dbeaver_DataSources_connection', @level2type = N'COLUMN', @level2name = N'connection_driver';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a6be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'dbeaver_DataSources_connection', @level2type = N'COLUMN', @level2name = N'connection_provider';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a5be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'dbeaver_DataSources_connection', @level2type = N'COLUMN', @level2name = N'connection_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a4be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'dbeaver_DataSources_connection', @level2type = N'COLUMN', @level2name = N'connection_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a3be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'dbeaver_DataSources_connection', @level2type = N'COLUMN', @level2name = N'connections';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a2be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'dbeaver_DataSources_connection', @level2type = N'COLUMN', @level2name = N'is_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a1be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'dbeaver_DataSources_connection', @level2type = N'COLUMN', @level2name = N'BulkColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a0be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'dbeaver_DataSources_connection', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '96be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'dbeaver_DataSources_connection';

