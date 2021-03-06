﻿
--contains only PK or UNIQUE
--requirement:
-- - repo.Index_Settings.is_create_constraint = 1
-- - repo.Index_union.is_index_unique = 1
Create View repo.Index_SqlConstraint_PkUq
As
Select
    i.index_guid
  , i.parent_RepoObject_guid
  , SqlConstraint = Concat (   'CONSTRAINT '
                             --todo missing name?
                             , QuoteName ( i.index_name )
                             , ' '
                             , Case
                                   When i.is_index_primary_key = 1
                                       Then
                                       'PRIMARY KEY '
                                   When i.is_index_unique = 1
                                       Then
                                       'UNIQUE '
                               End
                             , Case i.index_type
                                   When 1
                                       Then
                                       'CLUSTERED '
                                   When 2
                                       Then
                                       'NONCLUSTERED '
                               End
                             , '('
                             , ColumnList.ConstraintColumnList
                             , ')'
                           )
-- , i.index_name
-- , i.index_type
-- , i.is_index_unique
-- , i.is_index_primary_key
-- --, i.referenced_index_guid
-- , i.is_index_disabled
----, i.is_index_real
----, i_s.is_create_constraint
From
    repo.Index_union         As i
    Left Outer Join
        repo.Index_Settings  As i_s
            On
            i_s.index_guid        = i.index_guid

    Left Outer Join
        repo.Index_ColumList As ColumnList
            On
            ColumnList.index_guid = i.index_guid
Where
    i_s.is_create_constraint = 1
    And i.is_index_unique    = 1;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '7190291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_SqlConstraint_PkUq';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '87f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_SqlConstraint_PkUq'
  , @level2type = N'COLUMN'
  , @level2name = N'SqlConstraint';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '86f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_SqlConstraint_PkUq'
  , @level2type = N'COLUMN'
  , @level2name = N'parent_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '85f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_SqlConstraint_PkUq'
  , @level2type = N'COLUMN'
  , @level2name = N'index_guid';
Go