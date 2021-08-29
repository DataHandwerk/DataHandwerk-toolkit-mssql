
CREATE View uspgenerator.GeneratorUspStep_Persistence_IsInactive_setpoint
As
With
ro_u
As
    (
    Select
        usp_id               = u.id
      , u.usp_schema
      , u.usp_name
      , ro.is_persistence_check_duplicate_per_pk
      , ro.is_persistence_check_for_empty_source
      , ro.is_persistence_delete_missing
      , ro.is_persistence_delete_changed
      , ro.is_persistence_insert
      , ro.is_persistence_truncate
      , ro.is_persistence_update_changed
      , source_pk_index_guid = ro_s.pk_index_guid
    From
        repo.RepoObject_gross         As ro
        Inner Join
            uspgenerator.GeneratorUsp As u
                On
                ro.RepoObject_schema_name   = u.usp_schema
                And ro.usp_persistence_name = u.usp_name

        Left Join
            repo.RepoObject_gross     As ro_s
                On
                ro_s.RepoObject_guid        = ro.persistence_source_RepoObject_guid
    )
Select
    --check for empty source
    ro_u.usp_id
  , Number      = 100
  , is_inactive = Case ro_u.is_persistence_check_for_empty_source
                      When 1
                          Then
                          0
                      Else
                          1
                  End
  , ro_u.source_pk_index_guid -- required only for debugging
From
    ro_u
Union All
Select
    --check duplicate per PK
    --also check existing PK
    ro_u.usp_id
  , Number      = 300
  , is_inactive = Case
                      When ro_u.is_persistence_check_duplicate_per_pk = 1
                           And Not ( ro_u.source_pk_index_guid Is Null )
                          Then
                          0
                      Else
                          1
                  End
  , ro_u.source_pk_index_guid
From
    ro_u
Union All
Select
    --truncate persistence target
    ro_u.usp_id
  , Number      = 400
  , is_inactive = Case ro_u.is_persistence_truncate
                      When 1
                          Then
                          0
                      Else
                          1
                  End
  , ro_u.source_pk_index_guid
From
    ro_u
Union All
Select
    --delete persistence target missing in source
    --also do not delete if truncate, because there is nothing to delete after truncate
    --also check existing PK
    ro_u.usp_id
  , Number      = 500
  , is_inactive = Case
                      When ro_u.is_persistence_truncate = 1
                           Or ro_u.is_persistence_delete_missing = 0
                           Or ro_u.source_pk_index_guid Is Null
                          Then
                          1
                      Else
                          0
                  End
  , ro_u.source_pk_index_guid
From
    ro_u
Union All
Select
    --delete persistence target changed
    --also do not delete if truncate, because there is nothing to delete after truncate
    --also check existing PK
    ro_u.usp_id
  , Number      = 550
  , is_inactive = Case
                      When ro_u.is_persistence_truncate = 1
                           Or ro_u.is_persistence_delete_changed = 0
                           Or ro_u.source_pk_index_guid Is Null
                          Then
                          1
                      Else
                          0
                  End
  , ro_u.source_pk_index_guid
From
    ro_u
Union All
Select
    --update changed
    --also du not update after deleting changed or after truncate, because there is nothing to update
    --also check existing PK
    ro_u.usp_id
  , Number      = 600
  , is_inactive = Case
                      When ro_u.is_persistence_truncate = 1
                           Or ro_u.is_persistence_delete_changed = 1
                           Or ro_u.is_persistence_update_changed = 0
                           Or ro_u.source_pk_index_guid Is Null
                          Then
                          1
                      Else
                          0
                  End
  , ro_u.source_pk_index_guid
From
    ro_u
Union All
Select
    --insert missing
    --don't do this, if 'insert all' (in case of truncate)
    --also check existing PK
    ro_u.usp_id
  , Number      = 700
  , is_inactive = Case
                      When ro_u.is_persistence_insert = 1
                           And Not ro_u.is_persistence_truncate = 1
                           And Not ( ro_u.source_pk_index_guid Is Null )
                          Then
                          0
                      Else
                          1
                  End
  , ro_u.source_pk_index_guid
From
    ro_u
Union All
Select
    --insert all
    --only in combination with truncate
    --possible enhancement: maybe some delete all is required, if truncate is not possible?
    ro_u.usp_id
  , Number      = 800
  , is_inactive = Case
                      When ro_u.is_persistence_truncate = 1
                           And ro_u.is_persistence_insert = 1
                          Then
                          0
                      Else
                          1
                  End
  , ro_u.source_pk_index_guid
From
    ro_u
Union All
Select
    --todo:
    --merge
    ro_u.usp_id
  , Number      = 900
  , is_inactive = 1
  , ro_u.source_pk_index_guid
From
    ro_u
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '7f90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_IsInactive_setpoint';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fdf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_IsInactive_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'usp_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fef67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_IsInactive_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'Number';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fff67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_IsInactive_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'is_inactive';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f630c24a-759b-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'VIEW'
  , @level1name = N'GeneratorUspStep_Persistence_IsInactive_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'source_pk_index_guid';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[RepoObject_gross]
* [uspgenerator].[GeneratorUsp]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Persistence_IsInactive_setpoint';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'usp_id', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Persistence_IsInactive_setpoint';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'usp_id', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Persistence_IsInactive_setpoint';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'int', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Persistence_IsInactive_setpoint';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'363BB439-0796-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Persistence_IsInactive_setpoint';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:uspgenerator.usp_GeneratorUsp_insert_update_persistence.adoc[]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Persistence_IsInactive_setpoint';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoObject_gross.adoc[]
* xref:uspgenerator.GeneratorUsp.adoc[]', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUspStep_Persistence_IsInactive_setpoint';

