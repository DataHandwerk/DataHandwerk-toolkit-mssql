﻿Create View docs.AntoraNavListRepoObject_by_type
As
Select
    type      = SysObject_type
  , type_name = SysObject_type_name
  , nav_list  = String_Agg (
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
    SysObject_type
  , SysObject_type_name;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '9b8b79d5-b993-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraNavListRepoObject_by_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a38b79d5-b993-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraNavListRepoObject_by_type'
  , @level2type = N'COLUMN'
  , @level2name = N'type_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a28b79d5-b993-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraNavListRepoObject_by_type'
  , @level2type = N'COLUMN'
  , @level2name = N'type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a48b79d5-b993-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraNavListRepoObject_by_type'
  , @level2type = N'COLUMN'
  , @level2name = N'nav_list';
