Create View repo.Index_IndexPattern
As
--
Select
    index_guid
  , IndexPatternColumnName     = String_Agg ( SysObject_column_name, ',' ) Within Group(Order By
                                                                                            index_column_id)
  , IndexPatternColumnDatatype = String_Agg ( SysObject_column_user_type_fullname, ',' ) Within Group(Order By
                                                                                                          index_column_id)
From
    repo.IndexColumn_union
Where
    Not index_guid Is Null
Group By
    index_guid;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '6a90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_IndexPattern';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4af67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_IndexPattern'
  , @level2type = N'COLUMN'
  , @level2name = N'IndexPatternColumnName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4bf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_IndexPattern'
  , @level2type = N'COLUMN'
  , @level2name = N'IndexPatternColumnDatatype';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '49f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'Index_IndexPattern'
  , @level2type = N'COLUMN'
  , @level2name = N'index_guid';
Go