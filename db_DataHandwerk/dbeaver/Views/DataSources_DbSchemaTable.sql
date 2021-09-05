
CREATE View dbeaver.DataSources_DbSchemaTable
As
Select
    --
    j1.*
  , j2.*
  , VirtualModel_key           = j3.[Key]
  , VirtualModel_json          = j3.Value
  , VirtualModel_database      = j4.[Key]
  , VirtualModel_database_json = j4.Value
  , VirtualModel_schema        = j5.[Key]
  , VirtualModel_schema_json   = j5.Value
  , VirtualModel_table         = Substring ( j6.[Key], 2, 500 )
  , VirtualModel_table_json    = j6.Value
  , j7.*
From
    dbeaver.DataSources As j1
    Cross Apply
    OpenJson ( j1.BulkColumn )
    With
    (
        VirtualModels NVarchar ( Max ) N'$."virtual-models"' As Json
    )                   As j2
    Cross Apply OpenJson ( j2.VirtualModels ) As j3
    Cross Apply OpenJson ( j3.Value ) As j4
    Cross Apply OpenJson ( j4.Value ) As j5
    Cross Apply OpenJson ( j5.Value ) As j6
    Cross Apply
    OpenJson ( j6.Value )
    With
    (
        VirtualModel_table_constraints_json NVarchar ( Max ) N'$.constraints' As Json
      , VirtualModel_table_FK_json NVarchar ( Max ) N'$."foreign-keys"' As Json
      , VirtualModel_table_properties_json NVarchar ( Max ) N'$.properties' As Json
    ) As j7
Where
    j1.is_json = 1
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


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [dbeaver].[DataSources]', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:dbeaver.DataSources_DbSchemaTable_constraint.adoc[]
* xref:dbeaver.DataSources_DbSchemaTable_FK.adoc[]', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:dbeaver.DataSources.adoc[]', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'dbeaver', @level1type = N'VIEW', @level1name = N'DataSources_DbSchemaTable';

