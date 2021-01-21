
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

CREATE VIEW [repo].[RepoObjectColumn_reference__by_same_predecessors]
AS
--
SELECT
       [roc_r_t2].[referencing_id]
     , [roc_r_t2].[referencing_minor_id]
     , [roc_r_t2].[referencing_node_id]
     , [roc_r_t2].[referencing_RepoObject_guid]
     , [roc_r_t2].[referencing_RepoObjectColumn_guid]
     , [roc_r_t2].[referencing_type]
     , [roc_r_t2].[referencing_schema_name]
     , [roc_r_t2].[referencing_entity_name]
     , [roc_r_t2].[referencing_column_name]
     , [roc_r_t1].[referencing_id] AS                    [referenced_id]
     , [roc_r_t1].[referencing_minor_id] AS              [referenced_minor_id]
     , [roc_r_t1].[referencing_node_id] AS               [referenced_node_id]
     , [ro_r].[referenced_RepoObject_guid]
     , [roc_r_t1].[referencing_RepoObjectColumn_guid] AS [referenced_RepoObjectColumn_guid]
     , [ro_r].[referenced_schema_name]
     , [ro_r].[referenced_entity_name]
     , [roc_r_t1].[referencing_column_name] AS           [referenced_column_name]
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
FROM
     repo.RepoObject_reference__union AS ro_r
     INNER JOIN
     repo.RepoObjectColumn_reference__first_result_set AS roc_r_t2
     ON ro_r.referencing_RepoObject_guid = roc_r_t2.referencing_RepoObject_guid
     INNER JOIN
     repo.RepoObjectColumn_reference__first_result_set AS roc_r_t1
     ON ro_r.referenced_RepoObject_guid = roc_r_t1.referencing_RepoObject_guid
        AND roc_r_t2.referenced_RepoObject_guid = roc_r_t1.referenced_RepoObject_guid
        AND roc_r_t2.referenced_RepoObjectColumn_guid = roc_r_t1.referenced_RepoObjectColumn_guid
--we don't care about [is_hidden] columns or other possible not required entries
--and to ensure all results can be used we ensure RepoObjectColum exists
WHERE  NOT [roc_r_t2].[referencing_RepoObjectColumn_guid] IS NULL
       AND NOT [roc_r_t1].[referencing_RepoObjectColumn_guid] IS NULL