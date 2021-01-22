
-- Alter View RepoObject_reference__persistence
CREATE VIEW [repo].[RepoObject_reference__persistence]
AS
--
SELECT
       [referencing_id] = [ro_t].[SysObject_id]
     , [referencing_node_id] = [ro_t].[node_id]
     , [referenced_id] = [ro_s].[SysObject_id]
     , [referenced_node_id] = [ro_s].[node_id]
     , [referencing_RepoObject_guid] = [rop].[target_RepoObject_guid]
     , [referenced_RepoObject_guid] = [rop].[source_RepoObject_guid]
     , [referencing_type] = [ro_t].[SysObject_type]
     , [referencing_schema_name] = [ro_t].[SysObject_schema_name]
     , [referencing_entity_name] = [ro_t].[SysObject_name]
     , [referenced_schema_name] = [ro_s].[SysObject_schema_name]
     , [referenced_entity_name] = [ro_s].[SysObject_name]
     , [referenced_type] = [ro_s].[SysObject_type]
     , [InformationSource] = 'repo.RepoObject_persistence'
FROM
     repo.RepoObject_persistence AS rop
     INNER JOIN
     repo.RepoObject AS ro_t
     ON ro_t.RepoObject_guid = rop.target_RepoObject_guid
     INNER JOIN
     repo.RepoObject AS ro_s
     ON ro_s.RepoObject_guid = rop.source_RepoObject_guid
GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO


