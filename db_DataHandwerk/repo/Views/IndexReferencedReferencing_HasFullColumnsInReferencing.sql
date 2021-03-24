﻿


/*
HasFullColumnsInReferencing:
Filter repo.IndexReferencedReferencing
all columns, existing in referenced, should also exist in referencing
in other words, the referenced index is completely contained in the referencing object 

keep in mind, that a [source_index_guid] can be inherited into several [referenced_index_guid]
if the source object is used several times but target columns are different

Thats why we have [RowNumberInReferencing] and [RowNumberInReferencing_Target]

But [RowNumberInReferencing_Target] is a bit hard to understand. it is the [RowNumberInReferencing] stored before (in earlier runs) into [repo].[Index_virtual]
the same index can be inherited several times into the same referenced object, if a source is used several times
for example
SELECT A_A = A.A, B_A = B.A from source_1 as A LEFT JOIN source_1 as B ON ... 
normaly these indexes should have different columns

Issue:
if [repo].[Index_virtual].[referenced_index_guid] is missing, then it could be contained in repo.IndexReferencedReferencing
but [referenced_index_guid] is NULL in this case

How we could / should create a missing but possible [repo].[Index_virtual].[referenced_index_guid]?
=> in usp_index_inheritance
not only insert, but also update of [repo].[Index_virtual].[referenced_index_guid] if it is NULL but it has a source_index here in this view
*/
CREATE VIEW [repo].[IndexReferencedReferencing_HasFullColumnsInReferencing]
AS
--
SELECT [T1].[source_index_guid]
 , [T1].[source_index_type]
 , [T1].[referenced_RepoObject_guid]
 , [T1].[referencing_RepoObject_guid]
 , [T1].[referenced_index_guid]
 , [T1].[RowNumberInReferencing_Target]
 , [T2].[RowNumberInReferencing]
 , [T3].[referencing_IndexPatternColumnGuid]
FROM repo.IndexReferencedReferencing AS T1
INNER JOIN [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T] AS [T2]
 ON [T1].[source_index_guid] = [T2].[index_guid]
  AND [T1].[referenced_RepoObject_guid] = [T2].[referenced_RepoObject_guid]
  AND [T1].[referencing_RepoObject_guid] = [T2].[referencing_RepoObject_guid]
LEFT JOIN [repo].[Index_referencing_IndexPatternColumnGuid] AS T3
 ON T3.[source_index_guid] = [T1].[source_index_guid]
  AND T3.[referencing_RepoObject_guid] = [T1].[referencing_RepoObject_guid]

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8590291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing_HasFullColumnsInReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2cf77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing_HasFullColumnsInReferencing', @level2type = N'COLUMN', @level2name = N'source_index_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2bf77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing_HasFullColumnsInReferencing', @level2type = N'COLUMN', @level2name = N'source_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '30f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing_HasFullColumnsInReferencing', @level2type = N'COLUMN', @level2name = N'RowNumberInReferencing_Target';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '31f77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing_HasFullColumnsInReferencing', @level2type = N'COLUMN', @level2name = N'RowNumberInReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2ef77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing_HasFullColumnsInReferencing', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2df77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing_HasFullColumnsInReferencing', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2ff77926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing_HasFullColumnsInReferencing', @level2type = N'COLUMN', @level2name = N'referenced_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6dce8eb8-5f62-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing_HasFullColumnsInReferencing', @level2type = N'COLUMN', @level2name = N'referencing_IndexPatternColumnGuid';
