Create View repo.GeneratorUspStep_Persistence_IsInactive_setpoint
As
With
ro_u
As
    (
    Select
        u.id               As usp_id
      , u.usp_schema
      , u.usp_name
      , ro.is_persistence_check_duplicate_per_pk
      , ro.is_persistence_check_for_empty_source
      , ro.is_persistence_delete_missing
      , ro.is_persistence_delete_changed
      , ro.is_persistence_insert
      , ro.is_persistence_truncate
      , ro.is_persistence_update_changed
      , ro_s.pk_index_guid As source_pk_index_guid
    From
        repo.RepoObject_gross     As ro
        Inner Join
            repo.GeneratorUsp     As u
                On
                ro.RepoObject_schema_name   = u.usp_schema
                And ro.usp_persistence_name = u.usp_name

        Left Join
            repo.RepoObject_gross As ro_s
                On
                ro_s.RepoObject_guid        = ro.persistence_source_RepoObject_guid
    )
Select
    --check for empty source
    usp_id
  , Number              = 100
  , is_inactive         = Case is_persistence_check_for_empty_source
                              When 1
                                  Then
                                  0
                              Else
                                  1
                          End
  , source_pk_index_guid -- required only for debugging
From
    ro_u
Union All
Select
    --check duplicate per PK
    --also check existing PK
    usp_id
  , Number              = 300
  , is_inactive         = Case
                              When is_persistence_check_duplicate_per_pk = 1
                                   And Not ( source_pk_index_guid Is Null )
                                  Then
                                  0
                              Else
                                  1
                          End
  , source_pk_index_guid
From
    ro_u
Union All
Select
    --truncate persistence target
    usp_id
  , Number              = 400
  , is_inactive         = Case is_persistence_truncate
                              When 1
                                  Then
                                  0
                              Else
                                  1
                          End
  , source_pk_index_guid
From
    ro_u
Union All
Select
    --delete persistence target missing in source
    --also do not delete if truncate, because there is nothing to delete after truncate
    --also check existing PK
    usp_id
  , Number              = 500
  , is_inactive         = Case
                              When is_persistence_truncate = 1
                                   Or is_persistence_delete_missing = 0
                                   Or source_pk_index_guid Is Null
                                  Then
                                  1
                              Else
                                  0
                          End
  , source_pk_index_guid
From
    ro_u
Union All
Select
    --delete persistence target changed
    --also do not delete if truncate, because there is nothing to delete after truncate
    --also check existing PK
    usp_id
  , Number              = 550
  , is_inactive         = Case
                              When is_persistence_truncate = 1
                                   Or is_persistence_delete_changed = 0
                                   Or source_pk_index_guid Is Null
                                  Then
                                  1
                              Else
                                  0
                          End
  , source_pk_index_guid
From
    ro_u
Union All
Select
    --update changed
    --also du not update after deleting changed or after truncate, because there is nothing to update
    --also check existing PK
    usp_id
  , Number              = 600
  , is_inactive         = Case
                              When is_persistence_truncate = 1
                                   Or is_persistence_delete_changed = 1
                                   Or is_persistence_update_changed = 0
                                   Or source_pk_index_guid Is Null
                                  Then
                                  1
                              Else
                                  0
                          End
  , source_pk_index_guid
From
    ro_u
Union All
Select
    --insert missing
    --don't do this, if 'insert all' (in case of truncate)
    --also check existing PK
    usp_id
  , Number              = 700
  , is_inactive         = Case
                              When is_persistence_insert = 1
                                   And Not is_persistence_truncate = 1
                                   And Not ( source_pk_index_guid Is Null )
                                  Then
                                  0
                              Else
                                  1
                          End
  , source_pk_index_guid
From
    ro_u
Union All
Select
    --insert all
    --only in combination with truncate
    --possible enhancement: maybe some delete all is required, if truncate is not possible?
    usp_id
  , Number              = 800
  , is_inactive         = Case
                              When is_persistence_truncate = 1
                                   And is_persistence_insert = 1
                                  Then
                                  0
                              Else
                                  1
                          End
  , source_pk_index_guid
From
    ro_u;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '7f90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_IsInactive_setpoint';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fdf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_IsInactive_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'usp_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fef67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_IsInactive_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'Number';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fff67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_IsInactive_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'is_inactive';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f630c24a-759b-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_IsInactive_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'source_pk_index_guid';
