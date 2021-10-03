
/*
PlantUML definition per RepoObject
to be used in composed PlantUML diagrams

you need to persist:
EXEC [docs].[usp_PERSIST_RepoObject_Plantuml_Entity_T]

it is possible to create interactive SVG diagrams.
But they need to be inline, and big diagrams will not match and it will not be possible to open them in a separate window

Code should be like
entity "[[{site-url}/{page-component-name}/{page-component-version}/{page-module}/config.Parameter.html config.Parameter]]" as config.Parameter << U >> {

But maybe this could be hard coded instead of using inline and parameters? At least to use the "current" version?
page-component-name and page-module could also be hard coded,
but what about the {site-url}?

entity "[[{site-url}/{page-component-name}/current/{page-module}/config.Parameter.html config.Parameter]]" as config.Parameter << U >> {


*/
CREATE View docs.RepoObject_Plantuml_Entity
As
Select
    ro.RepoObject_guid
  , ro.cultures_name
  , RepoObject_Puml                       =
  --
  Concat (
             ro.PumlEntityTopDefault
           , ' {'
           , Char ( 13 ) + Char ( 10 )
           , collist.PlantumlPkEntityColumns
           , Iif(ro.tables_isHidden = 1, '  ..', '  --')
           , Char ( 13 ) + Char ( 10 )
           , collist.PlantumlNonPkEntityColumns
           , Iif(ro.tables_isHidden = 1, '  ..', '  --')
           , Char ( 13 ) + Char ( 10 )
           , collist.PlantumlNonPkHiddenEntityColumns
           , Iif(ro.tables_isHidden = 1, '  ..', '  --')
           , Char ( 13 ) + Char ( 10 )
           , mlist.PlantumlMeasures
           , '}'
           , Char ( 13 ) + Char ( 10 )
         )
  , RepoObject_PumlOnlyPK                 =
  --
  Concat (
             ro.PumlEntityTopDefault
           , ' {'
           , Char ( 13 ) + Char ( 10 )
           , collist.PlantumlPkEntityColumns
           , Iif(ro.tables_isHidden = 1, '  ..', '  --')
           , Char ( 13 ) + Char ( 10 )
           , '}'
           , Char ( 13 ) + Char ( 10 )
         )
  , RepoObject_PumlOnlyPkOrNotHidden      =
  --
  Concat (
             ro.PumlEntityTopDefault
           , ' {'
           , Char ( 13 ) + Char ( 10 )
           , collist.PlantumlPkEntityColumns
           , Iif(ro.tables_isHidden = 1, '  ..', '  --')
           , Char ( 13 ) + Char ( 10 )
           , collist.PlantumlNonPkEntityColumns
           , Iif(ro.tables_isHidden = 1, '  ..', '  --')
           , Char ( 13 ) + Char ( 10 )
           , '}'
           , Char ( 13 ) + Char ( 10 )
         )
  , RepoObject_PumlOnlyPkOrIndex          =
  --
  Concat (
             ro.PumlEntityTopDefault
           , ' {'
           , Char ( 13 ) + Char ( 10 )
           , collist.PlantumlPkEntityColumns
           , Iif(ro.tables_isHidden = 1, '  ..', '  --')
           , Char ( 13 ) + Char ( 10 )
           , collist.PlantumlNonPkIndexColumns
           , Iif(ro.tables_isHidden = 1, '  ..', '  --')
           , Char ( 13 ) + Char ( 10 )
           , '}'
           , Char ( 13 ) + Char ( 10 )
         )
  , RepoObject_PumlOnlyPkOrIndexOrMeasure =
  --
  Concat (
             ro.PumlEntityTopWorkaround
           , ' {'
           , Char ( 13 ) + Char ( 10 )
           , collist.PlantumlPkEntityColumns
           , Iif(ro.tables_isHidden = 1, '  ..', '  --')
           , Char ( 13 ) + Char ( 10 )
           , collist.PlantumlNonPkIndexColumns
           , Iif(ro.tables_isHidden = 1, '  ..', '  --')
           , Char ( 13 ) + Char ( 10 )
           , mlist.PlantumlMeasures
           , '}'
           , Char ( 13 ) + Char ( 10 )
         )
  , RepoObject_PumlOnlyIndex              =
  --
  Concat (
             ro.PumlEntityTopDefault
           , ' {'
           , Char ( 13 ) + Char ( 10 )
           , indexlist.PumlIndexList
           , Char ( 13 ) + Char ( 10 )
           , '}'
           , Char ( 13 ) + Char ( 10 )
         )
  , ro.RepoObject_fullname2
  , ro.RepoObject_schema_name
From
    docs.RepoObject_OutputFilter_T   As ro
    Left Join
        docs.RepoObject_ColumnList_T As collist
            On
            collist.RepoObject_guid     = ro.RepoObject_guid
            And collist.cultures_name   = ro.cultures_name

    Left Join
        docs.RepoObject_IndexList_T  As indexlist
            On
            indexlist.RepoObject_guid   = ro.RepoObject_guid
            And indexlist.cultures_name = ro.cultures_name

    Left Join
        docs.RepoObject_MeasureList  As mlist
            On
            mlist.RepoObject_guid       = ro.RepoObject_guid
            And mlist.cultures_name     = ro.cultures_name
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

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[ftv_get_parameter_value]
* [docs].[fs_cleanStringForPuml]
* [docs].[RepoObject_ColumnList_T]
* [docs].[RepoObject_IndexList_T]
* [docs].[RepoObject_OutputFilter]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity';








GO



GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'0C899DB0-6298-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.RepoObject_Plantuml_Entity_T.adoc[]
* xref:docs.usp_PERSIST_RepoObject_Plantuml_Entity_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.ftv_get_parameter_value.adoc[]
* xref:docs.fs_cleanStringForPuml.adoc[]
* xref:docs.RepoObject_ColumnList_T.adoc[]
* xref:docs.RepoObject_IndexList_T.adoc[]
* xref:docs.RepoObject_OutputFilter.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity';






GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_OutputFilter].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd96d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5c6d05d0-0b08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity', @level2type = N'COLUMN', @level2name = N'RepoObject_PumlOnlyPkOrNotHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f04578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity', @level2type = N'COLUMN', @level2name = N'RepoObject_PumlOnlyPkOrIndex';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '736ce6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_OutputFilter].[RepoObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [docs].[RepoObject_OutputFilter].[RepoObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9b83d451-5c1d-ec11-8522-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity', @level2type = N'COLUMN', @level2name = N'RepoObject_PumlOnlyPkOrIndexOrMeasure';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '580389e1-0622-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity', @level2type = N'COLUMN', @level2name = N'cultures_name';

