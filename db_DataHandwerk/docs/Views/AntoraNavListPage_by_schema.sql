
CREATE View docs.AntoraNavListPage_by_schema
As
Select
    ro.RepoObject_schema_name
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
           , Max ( rs.RepoSchema_ms_description )
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '== Objects'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , 'include::partial$navlist/navlist-schema-' + ro.RepoObject_schema_name + '.adoc[]'
           , Char ( 13 ) + Char ( 10 )
           , Iif(Max ( Cast(rs.is_ssas As Int)) = 1
               , Concat (
                            Char ( 13 ) + Char ( 10 )
                          , '== SSAS Relations Diagram'
                          , Char ( 13 ) + Char ( 10 )
                          , Char ( 13 ) + Char ( 10 )
                          , '[plantuml, schema_ssas_er-' + ro.RepoObject_schema_name + ', svg]'
                          , Char ( 13 ) + Char ( 10 )
                          , '....'
                          , Char ( 13 ) + Char ( 10 )
                          , 'include::partial$puml/schema_ssas_er/' + ro.RepoObject_schema_name + '.puml[]'
                          , Char ( 13 ) + Char ( 10 )
                          , '....'
                          , Char ( 13 ) + Char ( 10 )
                        )
               , Null)
         )
From
    repo.RepoObject     As ro
    Left Join
        repo.RepoSchema As rs
            On
            rs.RepoSchema_name = ro.RepoObject_schema_name
Group By
    ro.RepoObject_schema_name
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
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'schema_name', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListPage_by_schema';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_schema_name', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListPage_by_schema';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'nvarchar(128)', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListPage_by_schema';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = '5a47b240-e299-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListPage_by_schema';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoObject.adoc[]
* xref:repo.RepoSchema.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListPage_by_schema';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraNavListPage_by_schema', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';

