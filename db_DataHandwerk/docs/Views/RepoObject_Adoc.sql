
/*
<<property_start>>Description
`AdocContent` is the content of a page to be used by Antora as partial.

The view xref:docs.repoobject_adoc.adoc[] will persisted into xref:docs.repoobject_adoc_t.adoc[] +
and later exported for Antora by xref:docs.usp_persist_repoobject_adoc_t.adoc[]

One document per RepoObject is generated, it contains all information (but not diagrams) which is used by Antora. 

All Parts of the documentations are tagged, Antora can reference the content using this tags.

* any per RepoObject existing properties in xref:property.repoobjectproperty.adoc[] are extracted as separate tags
* some specific additional tags are extracted from other sources (some lists, some content from xref:repo.repoobject_gross.adoc[])
* a special entry per exported tag is created: `':ExistsProperty--' + Lower ( rop.property_name ) + ':'` which can be used to check the existence of a tag entry

To use additional content in Antora documentation first try to include new properties into xref:property.repoobjectproperty.adoc[]
<<property_end>>
*/
CREATE View docs.RepoObject_Adoc
As
Select
    rof.RepoObject_guid
  , rof.cultures_name
  , is_DocsOutput               = Max ( rof.is_DocsOutput )
  , RepoObject_fullname         = Max ( rof.RepoObject_fullname )
  , RepoObject_fullname2        = Max ( rof.RepoObject_fullname2 )
  , RepoObject_FullDisplayName2 = Max ( rof.RepoObject_FullDisplayName2 )
  , RepoObject_DisplayName      = Max ( rof.RepoObject_DisplayName )
  , RepoObject_translation      = Max ( rof.RepoObject_translation )
  , RepoObject_schema_name      = Max ( rof.RepoObject_schema_name )
  , SysObject_fullname          = Max ( ro.SysObject_fullname )
  , SysObject_fullname2         = Max ( ro.SysObject_fullname2 )
  , SysObject_schema_name       = Max ( ro.SysObject_schema_name )
  , SysObject_type              = Max ( rof.SysObject_type )
  , SysObject_type_name         = Max ( rof.SysObject_type_name )
  , AdocContent                 =
  --
  Concat (
             ''
           --, '= '
           ----, Max ( ro.SysObject_fullname )
           --, Max ( rof.RepoObject_fullname )
           --, Char ( 13 ) + Char ( 10 )
           --
           --, Char ( 13 ) + Char ( 10 )
           --, '== HeaderFullDisplayName'
           --, Char ( 13 ) + Char ( 10 )
           --, Char ( 13 ) + Char ( 10 )
           , '// tag::HeaderFullDisplayName[]'
           , Char ( 13 ) + Char ( 10 )
           , '= ' + Max ( rof.RepoObject_FullDisplayName2 )
           , Char ( 13 ) + Char ( 10 )
           , '// end::HeaderFullDisplayName[]'
           , Char ( 13 ) + Char ( 10 )

           --
           , Char ( 13 ) + Char ( 10 )
           , '== existing_properties' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// tag::existing_properties[]'
           , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , String_Agg (
                            Concat (
                                       Cast('' As NVarchar(Max))
                                     , Case
                                           When Not rop.property_value Is Null
                                               Then
                                               ':ExistsProperty--' + Lower ( rop.property_name ) + ':' + Char ( 13 )
                                               + Char ( 10 )
                                           Else
                                               ''
                                       End
                                   )
                          , ''
                        ) Within Group(Order By
                                           rop_cross.property_name)
           , Case
                 When Max ( ros2.sql_modules_antora ) <> ''
                     Then
                     ':ExistsProperty--sql_modules_definition:' + Char ( 13 ) + Char ( 10 )
             End
           , Case
                 When Max ( ro.SysObject_type ) In
                 ( 'U', 'V' )
                     Then
                     ':ExistsProperty--FK:' + Char ( 13 ) + Char ( 10 )
             End
           , Case
                 When Max ( ilist.AntoraIndexList ) <> ''
                     Then
                     ':ExistsProperty--AntoraIndexList:' + Char ( 13 ) + Char ( 10 )
             End
           , Case
                 When Max ( parlist.AntoraParameterList ) <> ''
                     Then
                     ':ExistsProperty--AntoraParameterList:' + Char ( 13 ) + Char ( 10 )
             End
           , Case
                 --When Max ( ro.SysObject_type ) In
                 --( 'U', 'V', 'IF' )
                 When Max ( clist.AntoraColumnDetails ) <> ''
                     Then
                     ':ExistsProperty--Columns:' + Char ( 13 ) + Char ( 10 )
             End
           , Case
                 When Max ( mlist.AntoraMeasureDetails ) <> ''
                     Then
                     ':ExistsProperty--Measures:' + Char ( 13 ) + Char ( 10 )
             End
           , '// end::existing_properties[]'
           , Char ( 13 ) + Char ( 10 )
           --
           , Char ( 13 ) + Char ( 10 )
           , '== RepoObject_guid' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// tag::RepoObject_guid[]'
           , Char ( 13 ) + Char ( 10 )
           , rof.RepoObject_guid
           , Char ( 13 ) + Char ( 10 )
           , '// end::RepoObject_guid[]'
           , Char ( 13 ) + Char ( 10 )
           --
           , Char ( 13 ) + Char ( 10 )
           , '== RepoObject_FullDisplayName2' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// tag::RepoObject_FullDisplayName2[]'
           , Char ( 13 ) + Char ( 10 )
           , Max ( rof.RepoObject_FullDisplayName2 )
           , Char ( 13 ) + Char ( 10 )
           , '// end::RepoObject_FullDisplayName2[]'
           , Char ( 13 ) + Char ( 10 )
           --
           , Char ( 13 ) + Char ( 10 )
           , '== SysObject_type' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// tag::SysObject_type[]'
           , Char ( 13 ) + Char ( 10 )
           , Max ( rof.SysObject_type )
           , Char ( 13 ) + Char ( 10 )
           , '// end::SysObject_type[]'
           , Char ( 13 ) + Char ( 10 )
           --
           , Char ( 13 ) + Char ( 10 )
           , '== SysObject_type_name' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// tag::SysObject_type_name[]'
           , Char ( 13 ) + Char ( 10 )
           , Max ( rof.SysObject_type_name )
           , Char ( 13 ) + Char ( 10 )
           , '// end::SysObject_type_name[]'
           , Char ( 13 ) + Char ( 10 )
           --
           , Char ( 13 ) + Char ( 10 )
           , '== SysObject_id' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// tag::SysObject_id[]'
           , Char ( 13 ) + Char ( 10 )
           , Max ( ro.SysObject_id )
           , Char ( 13 ) + Char ( 10 )
           , '// end::SysObject_id[]'
           , Char ( 13 ) + Char ( 10 )
           --
           , Char ( 13 ) + Char ( 10 )
           , '== SysObject_modify_date' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// tag::SysObject_modify_date[]'
           , Char ( 13 ) + Char ( 10 )
           , Convert ( NVarchar(20), Max ( ro.SysObject_modify_date ), 120 )
           , Char ( 13 ) + Char ( 10 )
           , '// end::SysObject_modify_date[]'
           , Char ( 13 ) + Char ( 10 )

           --
           , Char ( 13 ) + Char ( 10 )
           , '== AntoraColumnDetails' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// tag::AntoraColumnDetails[]'
           , Char ( 13 ) + Char ( 10 )
           , Max ( clist.AntoraColumnDetails )
           , Char ( 13 ) + Char ( 10 )
           , '// end::AntoraColumnDetails[]'
           , Char ( 13 ) + Char ( 10 )
           --
           , Char ( 13 ) + Char ( 10 )
           , '== AntoraPkColumnTableRows' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// tag::AntoraPkColumnTableRows[]'
           , Char ( 13 ) + Char ( 10 )
           , Max ( clist.AntoraPkColumnTableRows )
           , Char ( 13 ) + Char ( 10 )
           , '// end::AntoraPkColumnTableRows[]'
           , Char ( 13 ) + Char ( 10 )
           --
           , Char ( 13 ) + Char ( 10 )
           , '== AntoraNonPkColumnTableRows' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// tag::AntoraNonPkColumnTableRows[]'
           , Char ( 13 ) + Char ( 10 )
           , Max ( clist.AntoraNonPkColumnTableRows )
           , Char ( 13 ) + Char ( 10 )
           , '// end::AntoraNonPkColumnTableRows[]'
           , Char ( 13 ) + Char ( 10 )

           --
           , Char ( 13 ) + Char ( 10 )
           , '== AntoraIndexList' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// tag::AntoraIndexList[]'
           , Char ( 13 ) + Char ( 10 )
           , Max ( ilist.AntoraIndexList )
           , Char ( 13 ) + Char ( 10 )
           , '// end::AntoraIndexList[]'
           , Char ( 13 ) + Char ( 10 )

           --
           , Char ( 13 ) + Char ( 10 )
           , '== AntoraMeasureDetails' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// tag::AntoraMeasureDetails[]'
           , Char ( 13 ) + Char ( 10 )
           , Max ( mlist.AntoraMeasureDetails )
           , Char ( 13 ) + Char ( 10 )
           , '// end::AntoraMeasureDetails[]'
           , Char ( 13 ) + Char ( 10 )

           --
           , Char ( 13 ) + Char ( 10 )
           , '== AntoraMeasureDescriptions' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           --, '// tag::AntoraMeasureDescriptions[]'
           --, Char ( 13 ) + Char ( 10 )
           , Max ( mdlist.AntoraMeasureDescriptions )
           --, Char ( 13 ) + Char ( 10 )
           --, '// end::AntoraMeasureDescriptions[]'
           , Char ( 13 ) + Char ( 10 )

           --
           , Char ( 13 ) + Char ( 10 )
           , '== AntoraParameterList' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// tag::AntoraParameterList[]'
           , Char ( 13 ) + Char ( 10 )
           , Max ( parlist.AntoraParameterList )
           , Char ( 13 ) + Char ( 10 )
           , '// end::AntoraParameterList[]'
           , Char ( 13 ) + Char ( 10 )

           --
           , Char ( 13 ) + Char ( 10 )
           , '== AntoraXrefCulturesList' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// tag::AntoraXrefCulturesList[]'
           , Char ( 13 ) + Char ( 10 )
           , Max ( axlist.AntoraXrefCulturesList )
           , Char ( 13 ) + Char ( 10 )
           , '// end::AntoraXrefCulturesList[]'
           , Char ( 13 ) + Char ( 10 )
           --
           , Char ( 13 ) + Char ( 10 )
           , '== cultures_count' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// tag::cultures_count[]'
           , Char ( 13 ) + Char ( 10 )
           , Max ( axlist.cultures_count )
           , Char ( 13 ) + Char ( 10 )
           , '// end::cultures_count[]'
           , Char ( 13 ) + Char ( 10 )

           --
           , Char ( 13 ) + Char ( 10 )
           , '== Other tags' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , 'source: property.RepoObjectProperty_cross As rop_cross'
           , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , String_Agg (
                            Concat (
                                       Cast('' As NVarchar(Max))
                                     , Char ( 13 ) + Char ( 10 )
                                     , '=== '
                                     , rop_cross.property_name Collate Database_Default
                                     , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                                     , '// tag::'
                                     , Lower ( rop_cross.property_name ) Collate Database_Default
                                     , '[]'
                                     , Char ( 13 ) + Char ( 10 )
                                     , rop.property_value Collate Database_Default
                                     , Char ( 13 ) + Char ( 10 )
                                     , '// end::'
                                     , Lower ( rop_cross.property_name ) Collate Database_Default
                                     , '[]'
                                     , Char ( 13 ) + Char ( 10 )
                                   )
                          , Char ( 13 ) + Char ( 10 )
                        ) Within Group(Order By
                                           rop_cross.property_name)
           , Char ( 13 ) + Char ( 10 )
           , '== Boolean Attributes' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , 'source: property.RepoObjectProperty WHERE property_int = 1'
           , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// tag::boolean_attributes[]'
           , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , String_Agg (
                            Concat (
                                       Cast('' As NVarchar(Max))
                                     , Case
                                           When rop.property_int = 1
                                               Then
                                               ':' + Lower ( rop.property_name ) + ':' + Char ( 13 ) + Char ( 10 )
                                           Else
                                               ''
                                       End
                                   )
                          , ''
                        ) Within Group(Order By
                                           rop_cross.property_name)
           , Char ( 13 ) + Char ( 10 )
           , '// end::boolean_attributes[]'
           , Char ( 13 ) + Char ( 10 )

           --
           , Char ( 13 ) + Char ( 10 )
           , '== PlantUML diagrams' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '=== PlantUML Entity' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// tag::puml_entity[]'
           , Char ( 13 ) + Char ( 10 )
           , '[plantuml, entity-{docname}, svg, subs=macros]' + Char ( 13 ) + Char ( 10 )
           , '....' + Char ( 13 ) + Char ( 10 )
           , docs.fs_PumlHeaderTopToBottom () + Max ( pumle.RepoObject_Puml )
           , '....' + Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// end::puml_entity[]'
           , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '=== PlantUML Entity 1 1 FK' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// tag::puml_entity_1_1_fk[]'
           , Char ( 13 ) + Char ( 10 )
           , '[plantuml, entity_1_1_fk-{docname}, svg, subs=macros]' + Char ( 13 ) + Char ( 10 )
           , '....' + Char ( 13 ) + Char ( 10 )
           , Max ( puml.PlantumlEntity_1_1_FkRef )
           , '....' + Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// end::puml_entity_1_1_fk[]'
           , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '=== PlantUML 1 1 ObjectRef' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// tag::puml_entity_1_1_objectref[]'
           , Char ( 13 ) + Char ( 10 )
           , '[plantuml, entity_1_1_objectref-{docname}, svg, subs=macros]' + Char ( 13 ) + Char ( 10 )
           , '....' + Char ( 13 ) + Char ( 10 )
           , Max ( puml.PlantumlEntity_1_1_ObjectRef )
           , '....' + Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// end::puml_entity_1_1_objectref[]'
           , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '=== PlantUML 30 0 ObjectRef' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// tag::puml_entity_30_0_objectref[]'
           , Char ( 13 ) + Char ( 10 )
           , '[plantuml, entity_30_0_objectref-{docname}, svg, subs=macros]' + Char ( 13 ) + Char ( 10 )
           , '....' + Char ( 13 ) + Char ( 10 )
           , Max ( puml.PlantumlEntity_30_0_ObjectRef )
           , '....' + Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// end::puml_entity_30_0_objectref[]'
           , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '=== PlantUML 0 30 ObjectRef' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// tag::puml_entity_0_30_objectref[]'
           , Char ( 13 ) + Char ( 10 )
           , '[plantuml, entity_0_30_objectref-{docname}, svg, subs=macros]' + Char ( 13 ) + Char ( 10 )
           , '....' + Char ( 13 ) + Char ( 10 )
           , Max ( puml.PlantumlEntity_0_30_ObjectRef )
           , '....' + Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// end::puml_entity_0_30_objectref[]'
           , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '=== PlantUML 1 1 ColumnRef' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// tag::puml_entity_1_1_colref[]'
           , Char ( 13 ) + Char ( 10 )
           , '[plantuml, entity_1_1_colref-{docname}, svg, subs=macros]' + Char ( 13 ) + Char ( 10 )
           , '....' + Char ( 13 ) + Char ( 10 )
           , Max ( puml.PlantumlEntity_1_1_ColRef )
           , '....' + Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// end::puml_entity_1_1_colref[]'
           , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )

           --
           , Char ( 13 ) + Char ( 10 )
           , '== sql_modules_definition' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// tag::sql_modules_definition[]'
           , Char ( 13 ) + Char ( 10 )
           , '[%collapsible]'
           , Char ( 13 ) + Char ( 10 )
           , '======='
           , Char ( 13 ) + Char ( 10 )
           --indent_sql_modules_definition > 0 should be used if the code contains includes, ifdef and other parts, which should not apply
           , '[source,sql,numbered' + ',indent='
             + Cast(Max ( IsNull ( ro.indent_sql_modules_definition, 0 )) As NVarchar(10)) + ']'
           , Char ( 13 ) + Char ( 10 )
           , '----'
           , Char ( 13 ) + Char ( 10 )
           , Max ( ros2.sql_modules_antora )
           , Char ( 13 ) + Char ( 10 )
           , '----'
           , Char ( 13 ) + Char ( 10 )
           , '======='
           , Char ( 13 ) + Char ( 10 )
           , '// end::sql_modules_definition[]'
           , Char ( 13 ) + Char ( 10 )
           --
           , Char ( 13 ) + Char ( 10 )
         )
  , AdocDescriptionTagsContent  =
  --
  Concat (
             ''
           , '= ' + Max ( rof.RepoObject_FullDisplayName2 )
           , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// tag::description[]'
           , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '// uncomment the following attribute, to hide exported (by AntoraExport) descriptions. Keep the empty line on top of the attribute!'
             + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '//:hide-exported-description:'
           , Char ( 13 ) + Char ( 10 )
           , '// end::description[]'
           , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '== Measures' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , Max ( mdlist.AntoraMeasureDescriptionTagContent )
           , Char ( 13 ) + Char ( 10 )

         --
         )
  , PropertyCount               = Count ( Distinct rop.property_name )
From
    docs.RepoObject_OutputFilter_T_gross       As rof
    Left Join
        repo.RepoObject_gross                  As ro
            On
            ro.RepoObject_guid             = rof.RepoObject_guid

    Left Join
        repo.RepoObject_sat2_T                 As ros2
            On
            ros2.RepoObject_guid           = rof.RepoObject_guid

    Left Join
        property.RepoObjectProperty_cross      As rop_cross
            On
            rop_cross.RepoObject_guid      = rof.RepoObject_guid

    Left Join
        property.RepoObjectProperty            As rop
            On
            rop.RepoObject_guid            = rop_cross.RepoObject_guid
            And rop.property_name          = rop_cross.property_name
    --AND NOT rop.[property_nvarchar] IS NULL

    Left Join
        docs.RepoObject_ColumnList_T           As clist
            On
            clist.RepoObject_guid          = rof.RepoObject_guid
            And clist.cultures_name        = rof.cultures_name

    Left Join
        docs.RepoObject_IndexList_T            As ilist
            On
            ilist.RepoObject_guid          = rof.RepoObject_guid
            And ilist.cultures_name        = rof.cultures_name

    Left Join
        docs.RepoObject_MeasureList            As mlist
            On
            mlist.RepoObject_guid          = rof.RepoObject_guid
            And mlist.cultures_name        = rof.cultures_name

    --Attention, different join for mdlist, because external descriptions will be used only from pseudo table '_measures'

    Left Join
        docs.RepoObject_MeasureDescriptionList As mdlist
            On
            mdlist.FilenameRelatedMeasures = rof.FilenameRelatedMeasures
            And mdlist.cultures_name       = rof.cultures_name

    Left Join
        docs.RepoObject_ParameterList          As parlist
            On
            parlist.RepoObject_guid        = ro.RepoObject_guid

    Left Join
        docs.RepoObject_AntoraXrefCulturesList As axlist
            On
            axlist.RepoObject_guid         = ro.RepoObject_guid

    Left Join
        docs.RepoObject_Plantuml_Entity_T      As pumle
            On
            pumle.RepoObject_guid          = rof.RepoObject_guid
            And pumle.cultures_name        = rof.cultures_name

    Left Join
        docs.RepoObject_Plantuml_T             As puml
            On
            puml.RepoObject_guid           = rof.RepoObject_guid
            And puml.cultures_name         = rof.cultures_name
Group By
    rof.RepoObject_guid
  , rof.cultures_name
Having
    Max ( Cast(rof.is_external As Int)) = 0
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'd5e0b563-4291-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5a1254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_type_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dae0b563-4291-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5a5c44d7-1193-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '591254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd9e0b563-4291-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '595c44d7-1193-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd7e0b563-4291-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '581254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd8e0b563-4291-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dce0b563-4291-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc'
  , @level2type = N'COLUMN'
  , @level2name = N'PropertyCount';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dbe0b563-4291-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc'
  , @level2type = N'COLUMN'
  , @level2name = N'AdocContent';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '43e90a1e-7495-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc'
  , @level2type = N'COLUMN'
  , @level2name = N'is_DocsOutput';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [docs].[RepoObject_ColumnList_T]
* [docs].[RepoObject_IndexList_T]
* [docs].[RepoObject_ParameterList]
* [property].[RepoObjectProperty]
* [property].[RepoObjectProperty_cross]
* [repo].[RepoObject_gross2]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc';






GO



GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'C28818B0-CA97-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.RepoObject_Adoc_T.adoc[]
* xref:docs.usp_PERSIST_RepoObject_Adoc_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:docs.RepoObject_ColumnList_T.adoc[]
* xref:docs.RepoObject_IndexList_T.adoc[]
* xref:docs.RepoObject_ParameterList.adoc[]
* xref:property.RepoObjectProperty.adoc[]
* xref:property.RepoObjectProperty_cross.adoc[]
* xref:repo.RepoObject_gross2.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross2].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross2].[is_DocsOutput]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc', @level2type = N'COLUMN', @level2name = N'is_DocsOutput';




GO



GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5a0389e1-0622-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc', @level2type = N'COLUMN', @level2name = N'cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '66871b6d-cf22-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc', @level2type = N'COLUMN', @level2name = N'RepoObject_translation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '64871b6d-cf22-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc', @level2type = N'COLUMN', @level2name = N'RepoObject_FullDisplayName2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '65871b6d-cf22-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc', @level2type = N'COLUMN', @level2name = N'RepoObject_DisplayName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fd641888-fd45-ec11-852f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc', @level2type = N'COLUMN', @level2name = N'AdocDescriptionTagsContent';

