

/*
we use all Index from repo.IndexColumn__union (real and virtual)
and we use Object references
- currently from [repo].[RepoObjectColumn_reference_union] AS ref  
  but mabe this should be changed

so we get all possible index inheritence into any referencing object

first condition: any column of the referenced index should be a referencing column in the referencing object

second condition: all columns of the referenced index should be a referencing column in the referencing object
this means: "HasFullColumnsInReferencing"


Attention:
a source object can be joined several times
=> a source index can have several target index in the same target object
=> we implement [RowNumberInReferencing]

SELECT
       [index_guid]
     , [index_column_id]
     , [RepoObjectColumn_guid]
     , [referenced_RepoObject_guid]
     , [referenced_RepoObjectColumn_guid]
     , [referencing_RepoObject_guid]
     , COUNT(*) AS [Anz]
FROM
     repo.IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing AS T1
GROUP BY
         [index_guid]
       , [index_column_id]
       , [RepoObjectColumn_guid]
       , [referenced_RepoObject_guid]
       , [referenced_RepoObjectColumn_guid]
       , [referencing_RepoObject_guid]
ORDER BY
         [Anz] DESC


*/
CREATE VIEW [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing]
AS
--
--referencing columns, that inherit an index
--the goal of this view is to include only RepoObjects, which inherit ALL referenced columns of a source index
SELECT
 --[index_guid] is referenced index, [index_column_id] is the column of a referenced index
 [ic].[index_guid]
 , [ic].[index_column_id]
 , [ic].[is_descending_key]
 --, [ic].[RepoObjectColumn_guid] --referenced RepoObjectColumn; redundant; remove it, if not used
 , [ref].[referenced_RepoObject_guid]
 , [ref].[referenced_RepoObjectColumn_guid] --also referenced RepoObjectColumn (as above), left join; but is it possible that it is NULL? No, because of the first EXISTS condition
 , [ref].[referencing_RepoObject_guid]
 , [ref].[referencing_RepoObjectColumn_guid]
 --the same index can be inherited several times into the same referenced object, if a source is used several times
 --for example
 --SELECT A_A = A.A, B_A = B.A from source_1 as A LEFT JOIN source_1 as B ON ... 
 --normaly these indexes should have different columns
 , [RowNumberInReferencing] = ROW_NUMBER() OVER (
  PARTITION BY
  --soure index column
  [ic].[index_guid]
  , [ic].[index_column_id]
  , [ref].[referenced_RepoObject_guid]
  , [ref].[referenced_RepoObjectColumn_guid]
  --taget index, if the same source index column is inherited several times into a target object
  , [ref].[referencing_RepoObject_guid] ORDER BY [ref].[referenced_RepoObjectColumn_guid]
  )
--, roc.[RepoObjectColumn_guid]
FROM repo.IndexColumn_union AS ic
INNER JOIN --todo: maybe use another source for RepoObject references 
 --repo.[RepoObjectColumn_reference_FirstResultSet] AS ref
 [repo].[RepoObjectColumn_reference_union] ref
 ON ref.referenced_RepoObjectColumn_guid = ic.RepoObjectColumn_guid
WHERE
 --first condition: any column of the referenced index should be a referencing column in the referencing objekt
 EXISTS (
  SELECT [roc].[RepoObject_guid]
  FROM [repo].[RepoObjectColumn] AS [roc]
  WHERE
   --[RepoObject_guid] is matching
   --=> some source columns (referenced) are referenced in the target (referencing)
   --but it is possible, that not all source columns are referenced
   --to exclude these RepoObject with incomlete inheritance, the next condition will remove these RepoObject
   [roc].[RepoObject_guid] = [ref].[referencing_RepoObject_guid]
  )
 AND NOT EXISTS
 --second condition: all columns of the referenced index should be a referencing column in the referencing object
 --this means: "HasFullColumnsInReferencing"
 (
  SELECT [roc].[RepoObject_guid]
  FROM [repo].[RepoObjectColumn] AS [roc]
  WHERE
   --[RepoObject_guid] is matching
   [roc].[RepoObject_guid] = [ref].[referencing_RepoObject_guid]
   --but some referencing columns are missing in referencing object
   --this is possible in case of a composed key where not all columns of the source are referenced in the target
   AND [ref].[referencing_RepoObjectColumn_guid] IS NULL
  )

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7b90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f3f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing', @level2type = N'COLUMN', @level2name = N'RowNumberInReferencing';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f1f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing', @level2type = N'COLUMN', @level2name = N'referencing_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f2f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f0f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eff67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'edf67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing', @level2type = N'COLUMN', @level2name = N'is_descending_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ebf67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ecf67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing', @level2type = N'COLUMN', @level2name = N'index_column_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'[repo].[IndexColumn_union]
[repo].[RepoObjectColumn]
[repo].[RepoObjectColumn_reference_union]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing';

