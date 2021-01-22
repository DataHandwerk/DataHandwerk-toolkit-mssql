
CREATE VIEW [repo].[RepoObject_reference__union]
AS
--
SELECT
       [T1].[referencing_id]
     , [T1].[referencing_node_id]
     , [T1].[referenced_id]
     , [T1].[referenced_node_id]
     , [T1].[referencing_RepoObject_guid]
     , [T1].[referenced_RepoObject_guid]
     , [T1].[referencing_type]
     , [T1].[referencing_schema_name]
     , [T1].[referencing_entity_name]
     , [T1].[referenced_schema_name]
     , [T1].[referenced_entity_name]
     , [T1].[referenced_type]
     , [T1].[InformationSource]
FROM
     repo.RepoObject_reference__sql_expression_dependencies AS T1
UNION ALL
SELECT
       [T2].[referencing_id]
     , [T2].[referencing_node_id]
     , [T2].[referenced_id]
     , [T2].[referenced_node_id]
     , [T2].[referencing_RepoObject_guid]
     , [T2].[referenced_RepoObject_guid]
     , [T2].[referencing_type]
     , [T2].[referencing_schema_name]
     , [T2].[referencing_entity_name]
     , [T2].[referenced_schema_name]
     , [T2].[referenced_entity_name]
     , [T2].[referenced_type]
     , [T2].[InformationSource]
FROM
     repo.RepoObject_reference__persistence AS T2
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


