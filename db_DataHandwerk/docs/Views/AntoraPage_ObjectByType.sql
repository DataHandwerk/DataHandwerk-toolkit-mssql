
/*
output example:

* Objects by type
** xref:nav/nav-type-U.adoc[]
+
--
include::partial$navlist/navlist-type-U.adoc[]
--

*/
CREATE View docs.AntoraPage_ObjectByType
As
Select
    existing.cultures_name
  , partial_content = Concat (
                                 '* Objects by type'
                               , Char ( 13 ) + Char ( 10 )
                               , String_Agg (
                                                Concat (
                                                           '** xref:nav/nav-type-'
                                                           + docs.fs_cleanStringForFilename ( ct.type ) + '.adoc[]'
                                                         , Char ( 13 ) + Char ( 10 )
                                                         , '+'
                                                         , Char ( 13 ) + Char ( 10 )
                                                         , '--'
                                                         , Char ( 13 ) + Char ( 10 )
                                                         , 'include::partial$navlist/navlist-type-'
                                                           + docs.fs_cleanStringForFilename ( ct.type ) + '.adoc[]'
                                                         , Char ( 13 ) + Char ( 10 )
                                                         , '--'
                                                       )
                                              , Char ( 13 ) + Char ( 10 )
                                            ) Within Group(Order By
                                                               ct.type_desc Desc)
                             )
  , page_content
  --
                    = Concat (
                                 '= ' + config.fs_dwh_database_name () + ' - Objects by type'
                               , Char ( 13 ) + Char ( 10 )
                               , Char ( 13 ) + Char ( 10 )
                               , String_Agg (
                                                'include::nav-type-' + docs.fs_cleanStringForFilename ( ct.type )
                                                + '.adoc[leveloffset=+1]'
                                              , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                                            ) Within Group(Order By
                                                               ct.type_desc Desc)
                             )
From
    configT.type                             As ct
    --only existing objects
    Inner Join
        docs.AntoraNavListRepoObject_by_type As existing
            On
            existing.type = ct.type
Where
    ( ct.is_DocsOutput = 1 )
Group By
    existing.cultures_name
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '871293b9-de96-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraPage_ObjectByType';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8f1293b9-de96-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraPage_ObjectByType'
  , @level2type = N'COLUMN'
  , @level2name = N'partial_content';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [configT].[type]
* [docs].[AntoraNavListRepoObject_by_type]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraPage_ObjectByType';




GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:configT.type.adoc[]
* xref:docs.AntoraNavListRepoObject_by_type.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraPage_ObjectByType';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraPage_ObjectByType';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraPage_ObjectByType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '07d67baa-5925-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraPage_ObjectByType', @level2type = N'COLUMN', @level2name = N'page_content';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '06d67baa-5925-ec11-8527-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraPage_ObjectByType', @level2type = N'COLUMN', @level2name = N'cultures_name';

