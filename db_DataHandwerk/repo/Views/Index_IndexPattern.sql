
CREATE View repo.Index_IndexPattern
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
    index_guid
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
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[IndexColumn_union]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_IndexPattern';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'index_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_IndexPattern';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'index_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_IndexPattern';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_IndexPattern';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'748AA10A-AB97-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_IndexPattern';


GO
EXECUTE sp_addextendedproperty @name = N'has_execution_plan_issue', @value = N'1', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_IndexPattern';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.usp_Index_Settings.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_IndexPattern';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.IndexColumn_union.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_IndexPattern';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[IndexColumn_union].[index_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Index_IndexPattern', @level2type = N'COLUMN', @level2name = N'index_guid';

