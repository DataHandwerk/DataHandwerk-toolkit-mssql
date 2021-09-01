
/*
--check

Select
    Distinct
    j2.[Key]
  , j2.Type
From
    ssas.model_json_20                              As T1
    Cross Apply OpenJson ( T1.l2_relationships_ja ) As j1
    Cross Apply OpenJson ( j1.Value ) As j2
order by
    j2.[Key]
  , j2.Type
Go
*/
CREATE View ssas.model_json_32_relationships
As
Select
    T1.databasename
  , j2.relationships_name
  , j2.relationships_crossFilteringBehavior
  , j2.relationships_fromCardinality
  , j2.relationships_fromColumn
  , j2.relationships_fromTable
  , j2.relationships_isActive
  , j2.relationships_toCardinality
  , j2.relationships_toColumn
  , j2.relationships_toTable
From
    ssas.model_json_20                              As T1
    Cross Apply OpenJson ( T1.l2_relationships_ja ) As j1
    Cross Apply
    OpenJson ( j1.Value )
    With
    (
        relationships_name NVarchar ( 500 ) N'$.name'
      , relationships_crossFilteringBehavior NVarchar ( 500 ) N'$.crossFilteringBehavior'
      , relationships_fromCardinality NVarchar ( 500 ) N'$.fromCardinality'
      , relationships_fromColumn NVarchar ( 500 ) N'$.fromColumn'
      , relationships_fromTable NVarchar ( 500 ) N'$.fromTable'
      , relationships_isActive Bit N'$.isActive'
      , relationships_toCardinality NVarchar ( 500 ) N'$.toCardinality' --currently not in my models, but it could exists for 1:1 relationships?
      , relationships_toColumn NVarchar ( 500 ) N'$.toColumn'
      , relationships_toTable NVarchar ( 500 ) N'$.toTable'
    ) As j2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4d60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_32_relationships', @level2type = N'COLUMN', @level2name = N'relationships_toTable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4c60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_32_relationships', @level2type = N'COLUMN', @level2name = N'relationships_toColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4b60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_32_relationships', @level2type = N'COLUMN', @level2name = N'relationships_toCardinality';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4a60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_32_relationships', @level2type = N'COLUMN', @level2name = N'relationships_isActive';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4960d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_32_relationships', @level2type = N'COLUMN', @level2name = N'relationships_fromTable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4860d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_32_relationships', @level2type = N'COLUMN', @level2name = N'relationships_fromColumn';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4760d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_32_relationships', @level2type = N'COLUMN', @level2name = N'relationships_fromCardinality';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4660d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_32_relationships', @level2type = N'COLUMN', @level2name = N'relationships_crossFilteringBehavior';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4560d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_32_relationships', @level2type = N'COLUMN', @level2name = N'relationships_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4460d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_32_relationships', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f95fd8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_32_relationships';

