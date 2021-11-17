
CREATE View docs.AntoraNavListPage_by_schema
As
Select
    ro.RepoObject_schema_name
  , rof.cultures_name
  , nav_list =
  --
  Concat (
             '= '
           , ro.RepoObject_schema_name
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '== Description'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , Max ( rs.RepoSchema_description )
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '== Objects'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , 'include::partial$navlist/navlist-schema-' + docs.fs_cleanStringForFilename ( ro.RepoObject_schema_name )
             + '.adoc[]'
           , Char ( 13 ) + Char ( 10 )
           , Iif(Max ( Cast(rs.is_ssas As Int)) = 1
               , Concat (
                            Char ( 13 ) + Char ( 10 )
                          , '== SSAS Relations Diagram'
                          , Char ( 13 ) + Char ( 10 )
                          , Char ( 13 ) + Char ( 10 )
                          , '[plantuml, schema_ssas_er-' + ro.RepoObject_schema_name + ', svg, subs=macros]'
                          , Char ( 13 ) + Char ( 10 )
                          , '....'
                          , Char ( 13 ) + Char ( 10 )
                          --, 'include::partial$puml/schema_ssas_er/'
                          --  + docs.fs_cleanStringForFilename ( ro.RepoObject_schema_name ) + '.puml[]'
                          , Max ( puml.PumlSchemaSsasEr )
                          , Char ( 13 ) + Char ( 10 )
                          , '....'
                          , Char ( 13 ) + Char ( 10 )
                        )
               , Null)
         )
From
    repo.RepoObject                    As ro
    Left Join
        repo.RepoSchema                As rs
            On
            rs.RepoSchema_name     = ro.RepoObject_schema_name

    Left Join
        docs.RepoObject_OutputFilter_T As rof
            On
            rof.RepoObject_guid    = ro.RepoObject_guid

    Left Join
        docs.Schema_puml               As puml
            On
            puml.RepoSchema_guid   = rs.RepoSchema_guid
            And puml.cultures_name = rof.cultures_name
Where
    rof.is_external       = 0
    And rof.is_DocsOutput = 1
Group By
    ro.RepoObject_schema_name
  , rof.cultures_name
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b65a9de2-3799-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraNavListPage_by_schema'
  , @level2type = N'COLUMN'
  , @level2name = N'nav_list';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'b55a9de2-3799-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraNavListPage_by_schema'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'ae5a9de2-3799-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraNavListPage_by_schema';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[RepoObject]
* [repo].[RepoSchema]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListPage_by_schema';


GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoObject.adoc[]
* xref:repo.RepoSchema.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListPage_by_schema';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListPage_by_schema', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListPage_by_schema';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListPage_by_schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '487481bb-0a22-ec11-8524-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListPage_by_schema', @level2type = N'COLUMN', @level2name = N'cultures_name';

