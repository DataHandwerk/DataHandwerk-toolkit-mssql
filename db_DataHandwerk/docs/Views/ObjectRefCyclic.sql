





CREATE View docs.ObjectRefCyclic
As
Select
    page_content         =
    --
    Concat (
               '= Cyclic Object References'
             , Char ( 13 ) + Char ( 10 )
             , Char ( 13 ) + Char ( 10 )
             , '== Object List'
             , Char ( 13 ) + Char ( 10 )
             , Char ( 13 ) + Char ( 10 )
             , elist.XrefEntityList
             , Char ( 13 ) + Char ( 10 )
             , Char ( 13 ) + Char ( 10 )
             , '== Object Reference Diagram - Cyclic'
             , Char ( 13 ) + Char ( 10 )
             , '
[plantuml, ObjectRefCyclic, svg]
....
include::partial$puml/ObjectRefCyclic.puml[]
....
'
           )
  , ObjectRefCyclic_Puml =
  --
  Concat (
             --'left to right direction'
             'top to bottom direction'
           , Char ( 13 ) + Char ( 10 )
           , 'hide circle'
           , Char ( 13 ) + Char ( 10 )
           , '''avoide "." issues:'
           , Char ( 13 ) + Char ( 10 )
           , 'set namespaceSeparator none'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , skin.Parameter_value_result
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , elist.PumlEntityOnlyPkList
           , Char ( 13 ) + Char ( 10 )
           , olist.PumlObjectRefList
         )
From
    docs.ObjectRefCyclic_EntityList               As elist
    Cross Join docs.ObjectRefCyclic_ObjectRefList As olist
    Cross Join config.ftv_get_parameter_value ( 'puml_skinparam_class', '' ) As skin
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '87e72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd16d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic', @level2type = N'COLUMN', @level2name = N'page_content';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd26d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic', @level2type = N'COLUMN', @level2name = N'ObjectRefCyclic_Puml';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[ftv_get_parameter_value]
* [docs].[ObjectRefCyclic_EntityList]
* [docs].[ObjectRefCyclic_ObjectRefList]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.ftv_get_parameter_value.adoc[]
* xref:docs.ObjectRefCyclic_EntityList.adoc[]
* xref:docs.ObjectRefCyclic_ObjectRefList.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ObjectRefCyclic';

