﻿
CREATE View [reference].[RepoObjectColumn_ReferencingList]
As
Select
    ror.Referenced_guid
  , AntoraReferencingColumnList            =
  --
  String_Agg (
                 Concat (
                            --* xref:target-page-filename.adoc[link text]
                            --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                            Cast('* xref:' As NVarchar(Max))
                          , ror.Referencing_fullname2
                          , '.adoc#column-' + docs.fs_cleanStringForAnchorId ( ror.ReferencingColumn_name ) + '[+'
                            + ror.ReferencingColumn_fullname2 + '+]'
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                ror.Referencing_fullname)
  , Max ( ror.Referenced_fullname )        As Referenced_fullname
  , Max ( ror.Referenced_fullname2 )       As Referenced_fullname2
  , Max ( ror.ReferencedColumn_fullname )  As ReferencedColumn_fullname
  , Max ( ror.ReferencedColumn_fullname2 ) As ReferencedColumn_fullname2
  , Max ( ror.Referenced_type )            As Referenced_type
From
    [reference].RepoObjectColumn_ReferencingReferenced As ror
Group By
    ror.Referenced_guid;
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ce35b4cd-e093-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingList'
  , @level2type = N'COLUMN'
  , @level2name = N'Referenced_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'cd35b4cd-e093-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingList'
  , @level2type = N'COLUMN'
  , @level2name = N'ReferencedColumn_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'cc35b4cd-e093-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingList'
  , @level2type = N'COLUMN'
  , @level2name = N'ReferencedColumn_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'cb35b4cd-e093-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingList'
  , @level2type = N'COLUMN'
  , @level2name = N'Referenced_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ca35b4cd-e093-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingList'
  , @level2type = N'COLUMN'
  , @level2name = N'Referenced_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c935b4cd-e093-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingList'
  , @level2type = N'COLUMN'
  , @level2name = N'AntoraReferencingColumnList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'c835b4cd-e093-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingList'
  , @level2type = N'COLUMN'
  , @level2name = N'Referenced_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'b735b4cd-e093-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_ReferencingList';
