
/*
output example:

* Objects by schema
** xref:nav/nav-schema-dbo.adoc[]
+
--
include::partial$navlist/navlist-schema_dbo.adoc[]
--

*/
Create View docs.AntoraPage_ObjectBySchema
As
Select
    partial_content = Concat (
                                 '* Objects by schema'
                               , Char ( 13 ) + Char ( 10 )
                               , String_Agg (
                                                Concat (
                                                           '** xref:nav/nav-schema-' + RepoObject_schema_name
                                                           + '.adoc[]'
                                                         , Char ( 13 ) + Char ( 10 )
                                                         , '+'
                                                         , Char ( 13 ) + Char ( 10 )
                                                         , '--'
                                                         , Char ( 13 ) + Char ( 10 )
                                                         , 'include::partial$navlist/navlist-schema-'
                                                           + RepoObject_schema_name + '.adoc[]'
                                                         , Char ( 13 ) + Char ( 10 )
                                                         , '--'
                                                       )
                                              , Char ( 13 ) + Char ( 10 )
                                            ) Within Group(Order By
                                                               RepoObject_schema_name)
                             )
From
    docs.AntoraNavListRepoObject_by_schema ro;
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
