
Create View repo.RepoObject_sat2
As
Select
    ro.RepoObject_guid
  , ColumnList.CreateColumnList
  , ColumnList.DbmlColumnList
  , ColumnList.PersistenceCompareColumnList
  , ColumnList.PersistenceInsertColumnList
  , ColumnList.PersistenceUpdateColumnList
  , SqlModules.sql_modules_definition
  , sql_modules_antora = Replace (
                                     Replace (
                                                 Replace ( SqlModules.sql_modules_definition, 'include::', '\include::' )
                                               , 'ifdef::'
                                               , '\ifdef::'
                                             )
                                   , 'endif::'
                                   , '\endif::'
                                 )
  , SqlModules.sql_modules_formatted
  , SqlModules.sql_modules_formatted2
  , ro_referenced.AntoraReferencedList
  , ro_referencing.AntoraReferencingList
--, ext_referenced.AntoraExternalReferencedList
--, ext_referencing.AntoraExternalReferencingList
--, AntoraModule       = AntoraModule.Parameter_value_result
--, AntoraComponent    = AntoraComponent.Parameter_value_result
From
    repo.RepoObject_gross                       As ro
    Left Outer Join
        repo.RepoObject_ColumnList              As ColumnList
            On
            ColumnList.RepoObject_guid     = ro.RepoObject_guid

    Left Outer Join
        sqlparse.RepoObject_SqlModules_Repo_Sys As SqlModules
            On
            SqlModules.RepoObject_guid     = ro.RepoObject_guid

    Left Join
        reference.RepoObject_ReferencedList     As ro_referenced
            On
            ro_referenced.Referencing_guid = ro.RepoObject_guid

    Left Join
        reference.RepoObject_ReferencingList    As ro_referencing
            On
            ro_referencing.Referenced_guid = ro.RepoObject_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1f896e49-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_sat2', @level2type = N'COLUMN', @level2name = N'AntoraReferencingList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1e896e49-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_sat2', @level2type = N'COLUMN', @level2name = N'AntoraReferencedList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1d896e49-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_sat2', @level2type = N'COLUMN', @level2name = N'sql_modules_formatted2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1c896e49-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_sat2', @level2type = N'COLUMN', @level2name = N'sql_modules_formatted';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1b896e49-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_sat2', @level2type = N'COLUMN', @level2name = N'sql_modules_antora';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1a896e49-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_sat2', @level2type = N'COLUMN', @level2name = N'sql_modules_definition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '19896e49-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_sat2', @level2type = N'COLUMN', @level2name = N'PersistenceUpdateColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '18896e49-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_sat2', @level2type = N'COLUMN', @level2name = N'PersistenceInsertColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '17896e49-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_sat2', @level2type = N'COLUMN', @level2name = N'PersistenceCompareColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '16896e49-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_sat2', @level2type = N'COLUMN', @level2name = N'DbmlColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '15896e49-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_sat2', @level2type = N'COLUMN', @level2name = N'CreateColumnList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '14896e49-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_sat2', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a385af41-f924-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_sat2';

