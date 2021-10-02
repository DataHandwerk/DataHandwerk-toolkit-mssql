
CREATE View docs.RepoObject_OutputFilter
As
Select
    ro.RepoObject_guid
  , cultures_name               = IsNull ( tm.cultures_name, '' )
  , ro.SysObject_type
  , ro.SysObject_type_name
  , ro.RepoObject_fullname
  , ro.RepoObject_fullname2
  , RepoObject_FullDisplayName2 = ro.RepoObject_schema_name + '.'
                                  + Coalesce (
                                                 tmt.cultures_translations_model_tables_translatedCaption
                                               , ro.RepoObject_name
                                             )
  , RepoObject_DisplayName      = Coalesce ( tmt.cultures_translations_model_tables_translatedCaption, ro.RepoObject_name )
  , RepoObject_translation      = tmt.cultures_translations_model_tables_translatedCaption
  , ro.RepoObject_schema_name
  , ro.is_DocsOutput
  , ro.RepoObject_name
  , ro.is_external
  , ro.is_ssas
  , ro.tables_isHidden
  , ro.external_AntoraComponent
  , ro.external_AntoraModule
  , ro.external_DatabaseName
  , ro.AntoraComponent
  , ro.AntoraModule
  , PumlEntityTopDefault        =
  --
  Concat (
             'entity '
           ---- puml-link:mycomponent:sqldb:config.Event_isInaktiv.adoc[]
           ---- puml-link:config.Event_isInaktiv.adoc[]
           , '"puml-link:' + ro.AntoraComponent + ':' + ro.AntoraModule + ':'
             + docs.fs_cleanStringForFilename ( ro.RepoObject_fullname2 )
             --default
             + '.adoc[]"'
           , ' as '
           , Iif(ro.is_external = 1, ro.AntoraComponent + '.' + ro.AntoraModule + '.', Null)
           , docs.fs_cleanStringForPuml ( ro.RepoObject_fullname2 )
           , Iif(ro.is_external = 1
               , ' <' + Coalesce ( ro.external_DatabaseName, ro.AntoraComponent + ':' + ro.AntoraModule, '' ) + '> '
               , Null)
           , ' << ' + Iif(ro.is_external = 1, 'external', Trim ( ro.SysObject_type )) + ' >>'
           , Iif(ro.tables_isHidden = 1, ' #line.dotted', Iif(ro.is_external = 1, ' #line.dashed', Null))
         )
  , PumlEntityTopWorkaround     =
  --
  Concat (
             'entity '
           ---- puml-link:mycomponent:sqldb:config.Event_isInaktiv.adoc[]
           ---- puml-link:config.Event_isInaktiv.adoc[]
           , '"puml-link:' + ro.AntoraComponent + ':' + ro.AntoraModule + ':'
             + docs.fs_cleanStringForFilename ( ro.RepoObject_fullname2 )
             ----workaround empty prefix for #10 - prefix=
             + '.adoc[prefix=]"'
           , ' as '
           , Iif(ro.is_external = 1, ro.AntoraComponent + '.' + ro.AntoraModule + '.', Null)
           , docs.fs_cleanStringForPuml ( ro.RepoObject_fullname2 )
           , Iif(ro.is_external = 1
               , ' <' + Coalesce ( ro.external_DatabaseName, ro.AntoraComponent + ':' + ro.AntoraModule, '' ) + '> '
               , Null)
           , ' << ' + Iif(ro.is_external = 1, 'external', Trim ( ro.SysObject_type )) + ' >>'
           , Iif(ro.tables_isHidden = 1, ' #line.dotted', Iif(ro.is_external = 1, ' #line.dashed', Null))
         )
From
    repo.RepoObject_gross                                        As ro
    Left Join
        ssas.model_json_3411_cultures_translations_model_T       As tm
            On
            tm.databasename                                 = ro.RepoObject_schema_name

    Left Join
        ssas.model_json_34111_cultures_translations_model_tables As tmt
            On
            tmt.databasename                                = tm.databasename
            And tmt.cultures_name                           = tm.cultures_name
            And tmt.cultures_translations_model_tables_name = ro.RepoObject_name
Where
    ro.is_DocsOutput      = 1
    And ro.is_DocsExclude = 0
--And ro.is_external    = 0
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '45e90a1e-7495-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_OutputFilter'
  , @level2type = N'COLUMN'
  , @level2name = N'is_DocsOutput';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '607fb592-1293-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_OutputFilter'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '741254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_OutputFilter'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '731254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_OutputFilter'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '721254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_OutputFilter'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_type_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '711254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_OutputFilter'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '701254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_OutputFilter'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'ed5bf6c2-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_OutputFilter';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[RepoObject_gross]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'E38818B0-CA97-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.AntoraNavListPage_by_type.adoc[]
* xref:docs.AntoraNavListRepoObject_by_schema.adoc[]
* xref:docs.AntoraNavListRepoObject_by_schema_type.adoc[]
* xref:docs.AntoraNavListRepoObject_by_type.adoc[]
* xref:docs.RepoObject_Plantuml_Entity.adoc[]
* xref:docs.Unit_1_union.adoc[]
* xref:docs.usp_AntoraExport_ObjectPage.adoc[]
* xref:docs.usp_AntoraExport_ObjectPartialProperties.adoc[]
* xref:docs.usp_AntoraExport_ObjectPuml.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter';




GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoObject_gross.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[SysObject_type_name]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'SysObject_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[SysObject_type]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[RepoObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[RepoObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([RepoObject_schema_name],''.'',[RepoObject_name]))', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_DocsOutput]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'is_DocsOutput';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2c208663-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2d208663-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'is_ssas';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[RepoObject_name]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject_gross].[is_ssas]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'is_ssas';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '32fe2e93-491a-ec11-851f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'tables_isHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a4e80294-161b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'is_external';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7b320d24-681b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'external_DatabaseName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a6e80294-161b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'external_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a5e80294-161b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'external_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a8e80294-161b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a7e80294-161b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e3dcf21e-0222-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'PumlEntityTopWorkaround';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e2dcf21e-0222-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'PumlEntityTopDefault';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '550389e1-0622-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'cultures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a132fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'RepoObject_translation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9f32fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'RepoObject_FullDisplayName2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a032fc8a-c322-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_OutputFilter', @level2type = N'COLUMN', @level2name = N'RepoObject_DisplayName';

