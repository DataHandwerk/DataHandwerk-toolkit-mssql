﻿


/*
PlantUML definition per RepoObject
to be used in composed PlantUML diagrams

you need to persist:
EXEC [docs].[usp_PERSIST_RepoObject_Plantuml_Entity_T]
*/
CREATE View [docs].[RepoObject_Plantuml_Entity]
As
Select
    ro.RepoObject_guid
  , RepoObject_Puml          = Concat (
                                          'entity '
                                        , ro.RepoObject_fullname2
                                        , ' << ' + Trim ( ro.SysObject_type ) + ' >>'
                                        , ' {'
                                        , Char ( 13 ) + Char ( 10 )
                                        , collist.PlantumlPkEntityColumns
                                        , '  --'
                                        , Char ( 13 ) + Char ( 10 )
                                        , collist.PlantumlNonPkEntityColumns
                                        , '}'
                                        , Char ( 13 ) + Char ( 10 )
                                      )
  , RepoObject_PumlOnlyPK    = Concat (
                                          'entity '
                                        , ro.RepoObject_fullname2
                                        , ' << ' + Trim ( ro.SysObject_type ) + ' >>'
                                        , ' {'
                                        , Char ( 13 ) + Char ( 10 )
                                        , collist.PlantumlPkEntityColumns
                                        , '  --'
                                        , Char ( 13 ) + Char ( 10 )
                                        , '}'
                                        , Char ( 13 ) + Char ( 10 )
                                      )
  , RepoObject_PumlOnlyIndex = Concat (
                                          'entity '
                                        , ro.RepoObject_fullname2
                                        , ' << ' + Trim ( ro.SysObject_type ) + ' >>'
                                        , ' {'
                                        , Char ( 13 ) + Char ( 10 )
                                        , indexlist.PumlIndexList
                                        , Char ( 13 ) + Char ( 10 )
                                        , '}'
                                        , Char ( 13 ) + Char ( 10 )
                                      )
From
    docs.RepoObject_OutputFilter    As ro
    Left Join
        docs.RepoObject_ColumnList  collist
            On
            collist.RepoObject_guid   = ro.RepoObject_guid

    Left Join
        docs.RepoObject_IndexList_T indexlist
            On
            indexlist.RepoObject_guid = ro.RepoObject_guid;
Go

Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c1d49d8d-4595-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Plantuml_Entity'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'bcd49d8d-4595-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Plantuml_Entity';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c9c9519a-6298-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Plantuml_Entity'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_PumlOnlyPK';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'cac9519a-6298-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Plantuml_Entity'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_PumlOnlyIndex';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b94f3dbd-7098-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Plantuml_Entity'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_Puml';
