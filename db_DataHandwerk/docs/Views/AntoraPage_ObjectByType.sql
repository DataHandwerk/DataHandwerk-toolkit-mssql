

/*
output example:

* Objects by type
** xref:nav/nav-type-U.adoc[]
+
--
include::partial$navlist/navlist-type-U.adoc[]
--

*/
Create View docs.AntoraPage_ObjectByType
As
Select
    partial_content = Concat (
                                 '* Objects by type'
                               , Char ( 13 ) + Char ( 10 )
                               , String_Agg (
                                                Concat (
                                                           '** xref:nav/nav-type-' + ct.type + '.adoc[]'
                                                         , Char ( 13 ) + Char ( 10 )
                                                         , '+'
                                                         , Char ( 13 ) + Char ( 10 )
                                                         , '--'
                                                         , Char ( 13 ) + Char ( 10 )
                                                         , 'include::partial$navlist/navlist-type-' + ct.type
                                                           + '.adoc[]'
                                                         , Char ( 13 ) + Char ( 10 )
                                                         , '--'
                                                       )
                                              , Char ( 13 ) + Char ( 10 )
                                            ) Within Group(Order By
                                                               ct.type_desc Desc)
                             )
From
    config.type                              ct
    --only existing objects
    Inner Join
        docs.AntoraNavListRepoObject_by_type existing
            On
            existing.type = ct.type
Group By
    is_DocsOutput
Having
    ( is_DocsOutput = 1 );
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
