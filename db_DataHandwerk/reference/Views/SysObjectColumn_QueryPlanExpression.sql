﻿Create View [reference].SysObjectColumn_QueryPlanExpression
As
--
Select
    referencing_RepoObject_guid                        As RepoObject_guid
  , Try_Cast(Right(referencing_column_name, 4) As Int) As SysObjectColumn_column_id
  , referencing_column_name                            As SysObjectColumn_name
From
    [reference].RepoObjectColumn_reference_QueryPlan
Where
    is_target_column_name_expression = 1
Union
Select
    referenced_RepoObject_guid
  , Try_Cast(Right(referenced_column_name, 4) As Int) As SysObjectColumn_column_id
  , referenced_column_name
From
    [reference].RepoObjectColumn_reference_QueryPlan
Where
    is_source_column_name_expression = 1
    And Not referenced_RepoObject_guid Is Null;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '6d90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'SysObjectColumn_QueryPlanExpression';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7ff67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'SysObjectColumn_QueryPlanExpression'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7ef67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'SysObjectColumn_QueryPlanExpression'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObjectColumn_column_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7df67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'SysObjectColumn_QueryPlanExpression'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go