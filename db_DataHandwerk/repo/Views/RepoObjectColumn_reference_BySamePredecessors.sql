/*
repo.RepoObjectColumn_reference__first_result_set
for view columns the referenced columns in a predecessor table is shown, not the referenced colum in a predecessor view
but we are looking for the referenced column in a predecessor view

example

create view view_1
as
select
aaa
from table_1

create view view_2
as
select
aaa
from view_1

repo.RepoObjectColumn_reference__first_result_set result in 2 columns references
referencing -> referenced

dbo.view_1.aaa -> dbo.table_1.aaa : roc_r_t1
dbo.view_2.aaa -> dbo.table_1.aaa : roc_r_t2


we combine with object reference ro_r

view_2 -> view_1

We are looking for common predecessors:
dbo.table_1.aaa

and we get what we need:
dbo.view_2.aaa -> dbo.view_1.aaa

*/
CREATE VIEW [repo].[RepoObjectColumn_reference_BySamePredecessors]
AS
--
SELECT [roc_r_t2].[referencing_id]
 , [roc_r_t2].[referencing_minor_id]
 , [roc_r_t2].[referencing_node_id]
 , [roc_r_t2].[referencing_RepoObject_guid]
 , [roc_r_t2].[referencing_RepoObjectColumn_guid]
 , [roc_r_t2].[referencing_type]
 , [roc_r_t2].[referencing_schema_name]
 , [roc_r_t2].[referencing_entity_name]
 , [roc_r_t2].[referencing_column_name]
 , [roc_r_t1].[referencing_id] AS [referenced_id]
 , [roc_r_t1].[referencing_minor_id] AS [referenced_minor_id]
 , [roc_r_t1].[referencing_node_id] AS [referenced_node_id]
 , [ro_r].[referenced_RepoObject_guid]
 , [roc_r_t1].[referencing_RepoObjectColumn_guid] AS [referenced_RepoObjectColumn_guid]
 , [ro_r].[referenced_schema_name]
 , [ro_r].[referenced_entity_name]
 , [roc_r_t1].[referencing_column_name] AS [referenced_column_name]
 , [ro_r].[referenced_type]
 , [roc_r_t2].[InformationSource]
 , [roc_r_t2].[is_hidden]
 , [is_computed] = CAST(0 AS BIT)
 , [definition] = CAST(NULL AS NVARCHAR(MAX))
 , [is_referencing_object_equal_referenced_object] = CAST(CASE 
   WHEN [roc_r_t2].[referencing_RepoObject_guid] = [ro_r].[referenced_RepoObject_guid]
    THEN 1
   ELSE 0
   END AS BIT)
 , [is_referenced_object] = CAST(1 AS BIT)
FROM repo.[RepoObject_reference_union] AS ro_r
INNER JOIN repo.[RepoObjectColumn_reference_FirstResultSet] AS roc_r_t2
 ON ro_r.referencing_RepoObject_guid = roc_r_t2.referencing_RepoObject_guid
INNER JOIN repo.[RepoObjectColumn_reference_FirstResultSet] AS roc_r_t1
 ON ro_r.referenced_RepoObject_guid = roc_r_t1.referencing_RepoObject_guid
  AND roc_r_t2.referenced_RepoObject_guid = roc_r_t1.referenced_RepoObject_guid
  AND roc_r_t2.referenced_RepoObjectColumn_guid = roc_r_t1.referenced_RepoObjectColumn_guid
--we don't care about [is_hidden] columns or other possible not required entries
--and to ensure all results can be used we ensure RepoObjectColum exists
WHERE NOT [roc_r_t2].[referencing_RepoObjectColumn_guid] IS NULL
 AND NOT [roc_r_t1].[referencing_RepoObjectColumn_guid] IS NULL

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7390291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8df67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors', @level2type = N'COLUMN', @level2name = N'referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8ef67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors', @level2type = N'COLUMN', @level2name = N'referencing_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8cf67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors', @level2type = N'COLUMN', @level2name = N'referencing_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8bf67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8af67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors', @level2type = N'COLUMN', @level2name = N'referencing_node_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '89f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors', @level2type = N'COLUMN', @level2name = N'referencing_minor_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '88f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors', @level2type = N'COLUMN', @level2name = N'referencing_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8ff67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors', @level2type = N'COLUMN', @level2name = N'referencing_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '90f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors', @level2type = N'COLUMN', @level2name = N'referencing_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '99f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors', @level2type = N'COLUMN', @level2name = N'referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '96f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors', @level2type = N'COLUMN', @level2name = N'referenced_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '95f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '94f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '93f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors', @level2type = N'COLUMN', @level2name = N'referenced_node_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '92f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors', @level2type = N'COLUMN', @level2name = N'referenced_minor_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '91f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors', @level2type = N'COLUMN', @level2name = N'referenced_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '97f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors', @level2type = N'COLUMN', @level2name = N'referenced_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '98f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors', @level2type = N'COLUMN', @level2name = N'referenced_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9ef67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors', @level2type = N'COLUMN', @level2name = N'is_referencing_object_equal_referenced_object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9ff67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors', @level2type = N'COLUMN', @level2name = N'is_referenced_object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9bf67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors', @level2type = N'COLUMN', @level2name = N'is_hidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9cf67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors', @level2type = N'COLUMN', @level2name = N'is_computed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9af67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors', @level2type = N'COLUMN', @level2name = N'InformationSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9df67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_BySamePredecessors', @level2type = N'COLUMN', @level2name = N'definition';

