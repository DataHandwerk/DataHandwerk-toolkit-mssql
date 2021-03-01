

CREATE VIEW [graph].[RepoObjectColumn_ReferencingReferenced]
AS
SELECT Object2.[RepoObject_fullname] AS Referenced_fullname
 , Object2.[RepoObject_guid] AS Referenced_RepoObject_guid
 , Object2.[RepoObject_type] AS Referenced_type
 , Object2.[RepoObjectColumn_fullname] AS ReferencedColumn_fullname
 , Object2.[RepoObjectColumn_guid] AS Referenced_guid
 , Object1.[RepoObject_fullname] AS Referencing_fullname
 , Object2.[RepoObject_guid] AS Referencing_RepoObject_guid
 , Object1.[RepoObject_type] AS Referencing_type
 , Object1.[RepoObjectColumn_fullname] AS ReferencingColumn_fullname
 , Object1.[RepoObjectColumn_guid] AS Referencing_guid
FROM [graph].[RepoObjectColumn] AS Object1
 , [graph].[ReferencedObjectColumn] AS referenced
 , [graph].[RepoObjectColumn] AS Object2
WHERE MATCH(Object1 - (referenced) - > Object2)