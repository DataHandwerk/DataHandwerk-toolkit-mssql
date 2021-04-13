
--required colums depening on [repo].[RepoObject_persistence]
--WHERE rop.[has_history_columns] = 1  OR rop.[has_history] = 1
Create View repo.RepoObjectColumn_HistValidColums_setpoint
As
Select
    rop.target_RepoObject_guid                          As RepoObject_guid
  , Cast(p.Parameter_value__result_nvarchar As sysname) As RepoObjectColumn_name
  , ValidList.Repo_generated_always_type
  , 0                                                   As Repo_is_nullable
  , 'DATETIME2'                                         As Repo_user_type_name
  , 'datetime2(7)'                                      As Repo_user_type_fullname
From
    repo.RepoObject_persistence rop
    Cross Join
    (
        Select
            'Hist_ValidFrom_column_name' As Parameter_name
          , 1                            As Repo_generated_always_type
        Union All
        Select
            'Hist_ValidTo_column_name' As Parameter_name
          , 2                          As Repo_generated_always_type
    )                           ValidList
    Cross Apply [config].ftv_get_parameter_value ( ValidList.Parameter_name, Default ) p
Where
    rop.has_history_columns = 1
    Or rop.has_history      = 1;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '4390291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_HistValidColums_setpoint';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '15f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_HistValidColums_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '14f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_HistValidColums_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '18f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_HistValidColums_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_user_type_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '19f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_HistValidColums_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_user_type_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '17f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_HistValidColums_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_is_nullable';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '16f47926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_HistValidColums_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'Repo_generated_always_type';
Go