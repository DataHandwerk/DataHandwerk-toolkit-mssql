
CREATE View dbeaver.DataSources_DbSchemaTable_FK
As
Select
    --
    t1.id
  , t1.BulkColumn
  , t1.is_json
  , t1.VirtualModels
  , t1.VirtualModel_key
  , t1.VirtualModel_json
  , t1.VirtualModel_database
  , t1.VirtualModel_database_json
  , t1.VirtualModel_schema
  , t1.VirtualModel_schema_json
  , t1.VirtualModel_table
  , t1.VirtualModel_table_json
  --, [VirtualModel_table_constraints_json]
  , t1.VirtualModel_table_FK_json
  --,[VirtualModel_table_properties_json]
  , j1.*
  , j2.*
From
    dbeaver.DataSources_DbSchemaTable                      As t1
    Cross Apply OpenJson ( t1.VirtualModel_table_FK_json ) As j1
    Cross Apply
    OpenJson ( j1.Value )
    With
    (
        VirtualModel_table_FK_entity NVarchar ( 500 ) N'$.entity'
      , VirtualModel_table_FK_constraint NVarchar ( 500 ) N'$.constraint'
      , VirtualModel_table_FK_attributes_json NVarchar ( Max ) N'$.attributes' As Json
    ) As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dcbe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'VirtualModel_table_FK_attributes_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dbbe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'VirtualModel_table_FK_constraint';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dabe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'VirtualModel_table_FK_entity';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd9be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd8be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd7be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd6be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'VirtualModel_table_FK_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd5be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'VirtualModel_table_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd4be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'VirtualModel_table';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd3be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'VirtualModel_schema_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd2be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'VirtualModel_schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd1be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'VirtualModel_database_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd0be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'VirtualModel_database';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cfbe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'VirtualModel_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cebe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'VirtualModel_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cdbe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'VirtualModels';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ccbe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'is_json';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cbbe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'BulkColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cabe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '99be898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [dbeaver].[DataSources_DbSchemaTable]', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:dbeaver.DataSources_DbSchemaTable.adoc[]', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [dbeaver].[DataSources_DbSchemaTable].[VirtualModels]', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'VirtualModels';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [dbeaver].[DataSources_DbSchemaTable].[VirtualModel_table_json]', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'VirtualModel_table_json';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [dbeaver].[DataSources_DbSchemaTable].[VirtualModel_table_FK_json]', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'VirtualModel_table_FK_json';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [dbeaver].[DataSources_DbSchemaTable].[VirtualModel_table]', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'VirtualModel_table';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [dbeaver].[DataSources_DbSchemaTable].[VirtualModel_schema_json]', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'VirtualModel_schema_json';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [dbeaver].[DataSources_DbSchemaTable].[VirtualModel_schema]', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'VirtualModel_schema';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [dbeaver].[DataSources_DbSchemaTable].[VirtualModel_key]', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'VirtualModel_key';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [dbeaver].[DataSources_DbSchemaTable].[VirtualModel_json]', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'VirtualModel_json';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [dbeaver].[DataSources_DbSchemaTable].[VirtualModel_database_json]', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'VirtualModel_database_json';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [dbeaver].[DataSources_DbSchemaTable].[VirtualModel_database]', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'VirtualModel_database';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [dbeaver].[DataSources_DbSchemaTable].[is_json]', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'is_json';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [dbeaver].[DataSources_DbSchemaTable].[id]', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [dbeaver].[DataSources_DbSchemaTable].[BulkColumn]', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK', @level2type = N'COLUMN', @level2name = N'BulkColumn';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable_FK';

