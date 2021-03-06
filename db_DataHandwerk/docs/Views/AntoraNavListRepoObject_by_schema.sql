﻿Create View docs.AntoraNavListRepoObject_by_schema
As
Select
    RepoObject_schema_name
  , nav_list = String_Agg (
                              Concat (
                                         --* xref:target-page-filename.adoc[link text]
                                         --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                                         Cast('* xref:' As NVarchar(Max)), ro.RepoObject_fullname2, '.adoc[]'
                                     )
                            , Char ( 13 ) + Char ( 10 )
                          ) Within Group(Order By
                                             ro.RepoObject_fullname2)
From
    docs.RepoObject_OutputFilter ro
Group By
    RepoObject_schema_name;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '9c8b79d5-b993-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraNavListRepoObject_by_schema';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a58b79d5-b993-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraNavListRepoObject_by_schema'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a68b79d5-b993-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraNavListRepoObject_by_schema'
  , @level2type = N'COLUMN'
  , @level2name = N'nav_list';
