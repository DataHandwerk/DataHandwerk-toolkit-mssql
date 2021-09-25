﻿
/*
output example partial_content:

* Objects by schema
** xref:nav/nav-schema-dbo.adoc[]
+
--
include::partial$navlist/navlist-schema_dbo.adoc[]
--

output example page_content:

= Objects by schema

include::nav-schema-CFG.adoc[leveloffset=+1]

include::nav-schema-Config.adoc[leveloffset=+1]

include::nav-schema-ConfigH.adoc[leveloffset=+1]

*/
CREATE View docs.AntoraPage_ObjectBySchema
As
Select
    partial_content
    --
    = Concat (
                 '* xref:nav/objects-by-schema.adoc[]'
               , Char ( 13 ) + Char ( 10 )
               , String_Agg (
                                Concat (
                                           '** xref:nav/nav-schema-' + ro.RepoObject_schema_name + '.adoc[]'
                                         , Char ( 13 ) + Char ( 10 )
                                         , '+'
                                         , Char ( 13 ) + Char ( 10 )
                                         , '--'
                                         , Char ( 13 ) + Char ( 10 )
                                         , 'include::partial$navlist/navlist-schema-' + ro.RepoObject_schema_name
                                           + '.adoc[]'
                                         , Char ( 13 ) + Char ( 10 )
                                         , '--'
                                       )
                              , Char ( 13 ) + Char ( 10 )
                            ) Within Group(Order By
                                               ro.RepoObject_schema_name)
             )
  , page_content
  --
    = Concat (
                 Iif(Max ( ro.is_ssas ) = 1
                 , '= SSAS Tabular Models'
                 , '= ' + config.fs_dwh_database_name () + ' - Objects by schema')
               , Char ( 13 ) + Char ( 10 )
               , Char ( 13 ) + Char ( 10 )
               , String_Agg (
                                'include::nav-schema-' + ro.RepoObject_schema_name + '.adoc[leveloffset=+1]'
                              , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                            ) Within Group(Order By
                                               ro.RepoObject_schema_name)
             )
From
    docs.AntoraNavListRepoObject_by_schema As ro
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b75a9de2-3799-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraPage_ObjectBySchema'
  , @level2type = N'COLUMN'
  , @level2name = N'partial_content';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'af5a9de2-3799-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraPage_ObjectBySchema';

GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b07159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraPage_ObjectBySchema', @level2type = N'COLUMN', @level2name = N'page_content';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [docs].[AntoraNavListRepoObject_by_schema]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraPage_ObjectBySchema';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:docs.AntoraNavListRepoObject_by_schema.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraPage_ObjectBySchema';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraPage_ObjectBySchema';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraPage_ObjectBySchema';

