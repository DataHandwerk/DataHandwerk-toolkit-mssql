

/*
<<property_start>>Description
obsolet

defines, which SSAS DMV tables should be imported
<<property_end>>

<<property_start>>exampleUsage
Merge config.SsasDmvTableImport As tgt
Using configT.SsasDmvTableImport As src
On tgt.DmvTableName = src.DmvTableName
When Matched And tgt.isActive <> src.isActive
    Then Update Set
             isActive = src.isActive
When Not Matched By Target
    Then Insert
         (
             DmvTableName
           , isActive
         )
         Values
             (
                 src.DmvTableName
               , src.isActive
             );
<<property_end>>
*/
CREATE   View [configT].[SsasDmvTableImport]
As
--
Select
    DmvTableName = Cast('TMSCHEMA_ANNOTATIONS' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_ATTRIBUTE_HIERARCHIES' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
--import issues
Select
    DmvTableName = Cast('TMSCHEMA_CALCULATION_ITEMS' As NVarchar(128))
  , isActive     = Cast(0 As Bit)
Union All
--import issues
Select
    DmvTableName = Cast('TMSCHEMA_CALCULATION_GROUPS' As NVarchar(128))
  , isActive     = Cast(0 As Bit)
Union All
--type conversion required
--CStr([RefreshedTime]) as [RefreshedTime]
Select
    DmvTableName = Cast('TMSCHEMA_COLUMNS' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_COLUMN_PERMISSIONS' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_CULTURES' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_DATA_SOURCES' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_DETAIL_ROWS_DEFINITIONS' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_EXPRESSIONS' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
--import issues
Select
    DmvTableName = Cast('TMSCHEMA_FORMAT_STRING_DEFINITIONS' As NVarchar(128))
  , isActive     = Cast(0 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_EXTENDED_PROPERTIES' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_HIERARCHIES' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_KPIS' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_LEVELS' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_MEASURES' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_MODEL' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_OBJECT_TRANSLATIONS' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_PARTITIONS' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_PERSPECTIVE_COLUMNS' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_PERSPECTIVE_HIERARCHIES' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_PERSPECTIVE_MEASURES' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_PERSPECTIVE_TABLES' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_PERSPECTIVES' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
--import issues
Select
    DmvTableName = Cast('TMSCHEMA_QUERY_GROUPS' As NVarchar(128))
  , isActive     = Cast(0 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_RELATIONSHIPS' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_ROLE_MEMBERSHIPS' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_ROLES' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_TABLES' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_TABLE_PERMISSIONS' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
Union All
Select
    DmvTableName = Cast('TMSCHEMA_VARIATIONS' As NVarchar(128))
  , isActive     = Cast(1 As Bit)
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eec60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'SsasDmvTableImport', @level2type = N'COLUMN', @level2name = N'isActive';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'edc60313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'SsasDmvTableImport', @level2type = N'COLUMN', @level2name = N'DmvTableName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'cfe6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'SsasDmvTableImport';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'
obsolet

defines, which SSAS DMV tables should be imported', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'SsasDmvTableImport';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'SsasDmvTableImport';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'SsasDmvTableImport';


GO
EXECUTE sp_addextendedproperty @name = N'exampleUsage', @value = N'
Merge config.SsasDmvTableImport As tgt
Using configT.SsasDmvTableImport As src
On tgt.DmvTableName = src.DmvTableName
When Matched And tgt.isActive <> src.isActive
    Then Update Set
             isActive = src.isActive
When Not Matched By Target
    Then Insert
         (
             DmvTableName
           , isActive
         )
         Values
             (
                 src.DmvTableName
               , src.isActive
             );', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'SsasDmvTableImport';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:configT.SsasDmvTableImport_DmvColumnList.adoc[]', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'SsasDmvTableImport';

