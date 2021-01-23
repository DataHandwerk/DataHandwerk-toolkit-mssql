
/*
we use all Index from repo.IndexColumn__union (real and virtual)
and we use Object references
- currently from repo.RepoObjectColumn_reference__dm_exec_describe_first_result_set AS ref  
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
--columns, that inherit an index
--only RepoObjects are included which inherit ALL columns of a source index
SELECT
       [ic].[index_guid]
     , [ic].[index_column_id]
     , [ic].[is_descending_key]
     , [ic].[RepoObjectColumn_guid]
     , [ref].[referenced_RepoObject_guid]
     , [ref].[referenced_RepoObjectColumn_guid]
     , [ref].[referencing_RepoObjectColumn_guid]
     , [ref].[referencing_RepoObject_guid]
     , [RowNumberInReferencing] = ROW_NUMBER() OVER(PARTITION BY [ic].[index_guid]
                                                               , [ic].[index_column_id]
                                                               , [ic].[RepoObjectColumn_guid]
                                                               , [ref].[referenced_RepoObject_guid]
                                                               , [ref].[referenced_RepoObjectColumn_guid]
                                                               , [ref].[referencing_RepoObject_guid]
       ORDER BY
                [ref].[referenced_RepoObjectColumn_guid])

--, roc.[RepoObjectColumn_guid]
FROM
     repo.IndexColumn_union AS ic
     LEFT JOIN --todo: maybe use another source for RepoObject references 
     repo.[RepoObjectColumn_reference_FirstResultSet] AS ref
     ON ref.referenced_RepoObjectColumn_guid = ic.RepoObjectColumn_guid
WHERE
--first condition: any column of the referenced index should be a referencing column in the referencing objekt
EXISTS
(
    SELECT
           [roc].[RepoObject_guid]
    FROM
         [repo].[RepoObjectColumn] AS [roc]
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
    SELECT
           [roc].[RepoObject_guid]
    FROM
         [repo].[RepoObjectColumn] AS [roc]
    WHERE
    --[RepoObject_guid] is matching
    [roc].[RepoObject_guid] = [ref].[referencing_RepoObject_guid]
    --but some referencing columns are missing in referencing object
    --this is possible in case of a composed key where not all columns of the source are referenced in the target
    AND [ref].[referencing_RepoObjectColumn_guid] IS NULL
)
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


