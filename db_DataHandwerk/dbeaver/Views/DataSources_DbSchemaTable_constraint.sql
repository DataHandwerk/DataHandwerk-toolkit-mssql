
CREATE VIEW [dbeaver].[DataSources_DbSchemaTable_constraint]
AS
SELECT
 --
 [id]
 , [BulkColumn]
 , [is_json]
 , [VirtualModels]
 , [VirtualModel_key]
 , [VirtualModel_json]
 , [VirtualModel_database]
 , [VirtualModel_database_json]
 , [VirtualModel_schema]
 , [VirtualModel_schema_json]
 , [VirtualModel_table]
 , [VirtualModel_table_json]
 , [VirtualModel_table_constraints_json]
 --,[VirtualModel_table_FK_json]
 --,[VirtualModel_table_properties_json]
 , j1.*
 , j2.*
FROM [dbeaver].DataSources_DbSchemaTable t1
CROSS APPLY OPENJSON(t1.[VirtualModel_table_constraints_json]) j1
CROSS APPLY OPENJSON(j1.[value]) WITH (
  VirtualModel_table_constraint_type NVARCHAR(MAX) N'$.type'
  , VirtualModel_table_constraint_attributes_json NVARCHAR(MAX) N'$.attributes' AS JSON
  ) j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c9be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_constraint', @level2type = N'COLUMN', @level2name = N'VirtualModel_table_constraint_attributes_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c8be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_constraint', @level2type = N'COLUMN', @level2name = N'VirtualModel_table_constraint_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c7be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_constraint', @level2type = N'COLUMN', @level2name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c6be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_constraint', @level2type = N'COLUMN', @level2name = N'value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c5be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_constraint', @level2type = N'COLUMN', @level2name = N'key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c4be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_constraint', @level2type = N'COLUMN', @level2name = N'VirtualModel_table_constraints_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c3be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_constraint', @level2type = N'COLUMN', @level2name = N'VirtualModel_table_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c2be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_constraint', @level2type = N'COLUMN', @level2name = N'VirtualModel_table';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c1be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_constraint', @level2type = N'COLUMN', @level2name = N'VirtualModel_schema_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c0be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_constraint', @level2type = N'COLUMN', @level2name = N'VirtualModel_schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bfbe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_constraint', @level2type = N'COLUMN', @level2name = N'VirtualModel_database_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bebe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_constraint', @level2type = N'COLUMN', @level2name = N'VirtualModel_database';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bdbe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_constraint', @level2type = N'COLUMN', @level2name = N'VirtualModel_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bcbe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_constraint', @level2type = N'COLUMN', @level2name = N'VirtualModel_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bbbe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_constraint', @level2type = N'COLUMN', @level2name = N'VirtualModels';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'babe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_constraint', @level2type = N'COLUMN', @level2name = N'is_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b9be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_constraint', @level2type = N'COLUMN', @level2name = N'BulkColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b8be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_constraint', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '98be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_constraint';

