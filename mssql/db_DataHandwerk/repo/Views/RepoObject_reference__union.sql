
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
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'ce1120ff-ac4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference__union', @level2type = N'COLUMN', @level2name = N'InformationSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'd51120ff-ac4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference__union', @level2type = N'COLUMN', @level2name = N'referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'cf1120ff-ac4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference__union', @level2type = N'COLUMN', @level2name = N'referenced_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'd31120ff-ac4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference__union', @level2type = N'COLUMN', @level2name = N'referenced_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'd61120ff-ac4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference__union', @level2type = N'COLUMN', @level2name = N'referencing_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'da1120ff-ac4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference__union', @level2type = N'COLUMN', @level2name = N'referencing_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'd41120ff-ac4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference__union', @level2type = N'COLUMN', @level2name = N'referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'd21120ff-ac4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference__union', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'd91120ff-ac4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference__union', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'd11120ff-ac4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference__union', @level2type = N'COLUMN', @level2name = N'referenced_node_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'd01120ff-ac4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference__union', @level2type = N'COLUMN', @level2name = N'referenced_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'd81120ff-ac4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference__union', @level2type = N'COLUMN', @level2name = N'referencing_node_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'd71120ff-ac4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference__union', @level2type = N'COLUMN', @level2name = N'referencing_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'c01120ff-ac4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_reference__union';

