/*
If a view is the target of a persistence to write to the data source of the view via this view, then this reverse reference is also to be displayed and used
*/
CREATE View [reference].[RepoObject_reference_persistence_target_as_source]
As
Select
    [referenced_id]               = [referencing_id]
  , [referencing_id]              = [referenced_id]
  , [referenced_entity_name]      = [referencing_entity_name]
  , [referenced_fullname]         = [referencing_fullname]
  --, [referenced_node_id]          = [referencing_node_id]
  , [referenced_RepoObject_guid]  = [referencing_RepoObject_guid]
  , [referenced_schema_name]      = [referencing_schema_name]
  , [referenced_type]             = [referencing_type]
  , [referencing_entity_name]     = [referenced_entity_name]
  , [referencing_fullname]        = [referenced_fullname]
  --, [referencing_node_id]         = [referenced_node_id]
  , [referencing_RepoObject_guid] = [referenced_RepoObject_guid]
  , [referencing_schema_name]     = [referenced_schema_name]
  , [referencing_type]            = [referenced_type]
  , [InformationSource]           = 'persistence_target_as_source'
From
    [reference].[RepoObject_reference_SqlExpressionDependencies] ref
    Left Join
        repo.RepoObject_gross                                    ro
            On
            ro.RepoObject_guid = ref.referencing_RepoObject_guid
Where
    ro.is_persistence = 1;