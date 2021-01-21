
-- Alter View RepoObjectColumn_reference__persistence

CREATE VIEW [repo].[RepoObjectColumn_reference__persistence]
AS
--
SELECT
       [referencing_id] = [ro_t].[SysObject_id]
     , [referencing_minor_id] = [roc_t].[SysObjectColumn_column_id]
     , [referencing_node_id] = [ro_t].[node_id]
     , [referenced_id] = [ro_s].[SysObject_id]
     , [referenced_minor_id] = [roc_s].[SysObjectColumn_column_id]
     , [referenced_node_id] = [ro_s].[node_id]
     , [referencing_RepoObject_guid] = [rop].[target_RepoObject_guid]
     , [referencing_RepoObjectColumn_guid] = [roc_t].[RepoObjectColumn_guid]
     , [referenced_RepoObject_guid] = [rop].[source_RepoObject_guid]
     , [referenced_RepoObjectColumn_guid] = [roc_s].[RepoObjectColumn_guid]
       --Target = referencing: Repo Names or Sys Names?
       --it is possible, that only Repo Objects exists, but they are not yet in the database
       --or they could have other names in the database
       --if they doesn't exist in the database guid are used as names
       -- => Sys Names are fine
     , [referencing_type] = [ro_t].[SysObject_type]
     , [referencing_schema_name] = [ro_t].[SysObject_schema_name]
     , [referencing_entity_name] = [ro_t].[SysObject_name]
     , [referencing_column_name] = [roc_t].[SysObjectColumn_name]
       --Source = referenced: Source should exists and we should use Sys Names
     , [referenced_schema_name] = [ro_s].[SysObject_schema_name]
     , [referenced_entity_name] = [ro_s].[SysObject_name]
     , [referenced_column_name] = [roc_s].[SysObjectColumn_name]
     , [referenced_type] = [ro_s].[SysObject_type]
     , [InformationSource] = 'repo.RepoObject_persistence'
       --persisted basic columns which are inherited are not computed
     , [is_computed] = CAST(0 AS BIT)
     , [definition] = CAST(NULL AS NVARCHAR(MAX))
     , [is_referencing_object_equal_referenced_object] = CAST(CASE
                                                                  WHEN [rop].[target_RepoObject_guid] = [rop].[source_RepoObject_guid]
                                                                  THEN 1
                                                                  ELSE 0
                                                              END AS BIT)
     , [is_referenced_object] = CAST(1 AS BIT)
FROM
     repo.RepoObject_persistence AS rop
     INNER JOIN
     repo.RepoObject AS ro_s
     ON ro_s.RepoObject_guid = rop.source_RepoObject_guid
     INNER JOIN
     repo.RepoObject AS ro_t
     ON ro_t.RepoObject_guid = rop.target_RepoObject_guid
     INNER JOIN
     repo.RepoObjectColumn AS roc_s
     ON roc_s.RepoObject_guid = rop.source_RepoObject_guid
     INNER JOIN
     repo.RepoObjectColumn AS roc_t
     ON roc_t.RepoObject_guid = rop.target_RepoObject_guid
        AND roc_t.[persistence_source_RepoObjectColumn_guid] = roc_s.RepoObjectColumn_guid