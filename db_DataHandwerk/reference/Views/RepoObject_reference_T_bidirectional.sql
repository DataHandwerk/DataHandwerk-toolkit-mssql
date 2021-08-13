
CREATE View [reference].[RepoObject_reference_T_bidirectional]
As
Select
    T1.referenced_RepoObject_guid
  , T1.referencing_RepoObject_guid
  , T1.referenced_entity_name
  , T1.referenced_schema_name
  , T1.referenced_type
  , T1.referencing_entity_name
  , T1.referencing_schema_name
  , T1.referencing_type
  , T1.referenced_fullname
  , T1.referenced_fullname2
  , T1.referencing_fullname
  , T1.referencing_fullname2
  , rop1.is_persistence         As referenced_is_persistence
  , rop1.source_RepoObject_guid As referenced_source_RepoObject_guid
  , rop2.is_persistence         As referencing_is_persistence
  , rop2.source_RepoObject_guid As referencing_source_RepoObject_guid
From
    reference.RepoObject_reference_T     As T1
    Inner Join
        reference.RepoObject_reference_T As T2
            On
            T1.referenced_RepoObject_guid      = T2.referencing_RepoObject_guid
            And T1.referencing_RepoObject_guid = T2.referenced_RepoObject_guid

    Left Join
        [repo].[RepoObject_persistence]  rop1
            On
            rop1.target_RepoObject_guid        = T1.referenced_RepoObject_guid

    Left Join
        [repo].[RepoObject_persistence]  rop2
            On
            rop2.target_RepoObject_guid        = T1.referencing_RepoObject_guid;