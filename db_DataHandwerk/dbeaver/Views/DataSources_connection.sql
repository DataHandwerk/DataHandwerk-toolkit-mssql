

CREATE View dbeaver.DataSources_connection
As
Select
    --
    j1.*
  , j2.*
  , connection_key  = j3.[Key]
  , connection_json = j3.Value
  , j4.*
From
    dbeaver.DataSources As j1
    Cross Apply
    OpenJson ( j1.BulkColumn )
    With
    (
        connections NVarchar ( Max ) N'$.connections' As Json
    )                   As j2
    Cross Apply OpenJson ( j2.connections ) As j3
    Cross Apply
    OpenJson ( j3.Value )
    With
    (
        connection_provider NVarchar ( 100 ) N'$.provider'
      , connection_driver NVarchar ( 100 ) N'$.driver'
      , conection_name NVarchar ( 100 ) N'$.name'
    ) As j4
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a8be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_connection', @level2type = N'COLUMN', @level2name = N'conection_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a7be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_connection', @level2type = N'COLUMN', @level2name = N'connection_driver';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a6be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_connection', @level2type = N'COLUMN', @level2name = N'connection_provider';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a5be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_connection', @level2type = N'COLUMN', @level2name = N'connection_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a4be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_connection', @level2type = N'COLUMN', @level2name = N'connection_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a3be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_connection', @level2type = N'COLUMN', @level2name = N'connections';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a2be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_connection', @level2type = N'COLUMN', @level2name = N'is_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a1be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_connection', @level2type = N'COLUMN', @level2name = N'BulkColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a0be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_connection', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '96be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_connection';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [dbeaver].[DataSources]', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_connection';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:dbeaver.DataSources.adoc[]', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_connection';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_connection';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_connection';

