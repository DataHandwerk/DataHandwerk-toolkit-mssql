Create View docs.AntoraNavListPage_by_type
As
Select
    type
  , type_desc
  , nav_list = Concat (
                          '= '
                        , type_desc
                        , Char ( 13 ) + Char ( 10 )
                        , Char ( 13 ) + Char ( 10 )
                        , 'include::partial$navlist/navlist-type-' + type + '.adoc[]'
                        , Char ( 13 ) + Char ( 10 )
                      )
From
    config.type t
Where
    ( is_DocsOutput = 1 )
    And Exists
(
    Select
        1
    From
        docs.RepoObject_OutputFilter f
    Where
        f.SysObject_type = t.type
);
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '861293b9-de96-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraNavListPage_by_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8d1293b9-de96-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraNavListPage_by_type'
  , @level2type = N'COLUMN'
  , @level2name = N'type_desc';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8c1293b9-de96-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraNavListPage_by_type'
  , @level2type = N'COLUMN'
  , @level2name = N'type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '8e1293b9-de96-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraNavListPage_by_type'
  , @level2type = N'COLUMN'
  , @level2name = N'nav_list';
