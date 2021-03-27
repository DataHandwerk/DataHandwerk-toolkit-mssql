CREATE VIEW [dbeaver].DataSources_DbSchemaTable
AS
SELECT
 --
 j1.*
 , j2.*
 , j3.[key] AS VirtualModel_key
 , j3.value AS VirtualModel_json
 , J4.[key] AS VirtualModel_database
 , j4.value AS VirtualModel_database_json
 , j5.[key] AS VirtualModel_schema
 , j5.value AS VirtualModel_schema_json
 , SUBSTRING(j6.[key], 2, 500) AS VirtualModel_table
 , j6.value AS VirtualModel_table_json
 , j7.*
FROM [repo].[dbeaver_DataSources] j1
CROSS APPLY OPENJSON(BulkColumn) WITH (VirtualModels NVARCHAR(MAX) N'$."virtual-models"' AS JSON) j2
CROSS APPLY OPENJSON(j2.VirtualModels) j3
CROSS APPLY OPENJSON(j3.value) j4
CROSS APPLY OPENJSON(j4.value) j5
CROSS APPLY OPENJSON(j5.value) j6
CROSS APPLY OPENJSON(j6.value) WITH (
  VirtualModel_table_constraints_json NVARCHAR(max) N'$.constraints' AS JSON
  , VirtualModel_table_FK_json NVARCHAR(max) N'$."foreign-keys"' AS JSON
  , VirtualModel_table_properties_json NVARCHAR(max) N'$.properties' AS JSON
  ) j7
WHERE [is_json] = 1
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b7be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable', @level2type = N'COLUMN', @level2name = N'VirtualModel_table_properties_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b6be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable', @level2type = N'COLUMN', @level2name = N'VirtualModel_table_FK_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b5be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable', @level2type = N'COLUMN', @level2name = N'VirtualModel_table_constraints_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b4be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable', @level2type = N'COLUMN', @level2name = N'VirtualModel_table_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b3be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable', @level2type = N'COLUMN', @level2name = N'VirtualModel_table';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b2be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable', @level2type = N'COLUMN', @level2name = N'VirtualModel_schema_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b1be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable', @level2type = N'COLUMN', @level2name = N'VirtualModel_schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b0be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable', @level2type = N'COLUMN', @level2name = N'VirtualModel_database_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'afbe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable', @level2type = N'COLUMN', @level2name = N'VirtualModel_database';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aebe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable', @level2type = N'COLUMN', @level2name = N'VirtualModel_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'adbe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable', @level2type = N'COLUMN', @level2name = N'VirtualModel_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'acbe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable', @level2type = N'COLUMN', @level2name = N'VirtualModels';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'abbe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable', @level2type = N'COLUMN', @level2name = N'is_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aabe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable', @level2type = N'COLUMN', @level2name = N'BulkColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a9be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '97be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable';

