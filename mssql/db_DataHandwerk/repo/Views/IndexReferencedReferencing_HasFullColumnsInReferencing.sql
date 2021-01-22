
/*
Filter repo.IndexReferencedReferencing for all columns, existing in referenced, also existing in referenced

keep in mind, that a [source_index_guid] can be inherited into several [referenced_index_guid]
if the source object is used several times but target columns are different
*/
CREATE VIEW [repo].[IndexReferencedReferencing_HasFullColumnsInReferencing]
AS
--
SELECT
       [T1].[source_index_guid]
     , [T1].[referenced_RepoObject_guid]
     , [T1].[referencing_RepoObject_guid]
     , [T1].[referenced_index_guid]
     , [T1].RowNumberInReferencing_Target
     , [T2].[RowNumberInReferencing]
FROM
     repo.IndexReferencedReferencing AS T1
     INNER JOIN
     [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing] AS [T2]
     ON [T1].[source_index_guid] = [T2].[index_guid]
        AND [T1].[referenced_RepoObject_guid] = [T2].[referenced_RepoObject_guid]
        AND [T1].[referencing_RepoObject_guid] = [T2].[referencing_RepoObject_guid]

--WHERE  EXISTS
--(
--    SELECT
--           [T2].[index_guid]
--    FROM
--         [repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing] AS [T2]
--    WHERE  [T1].[source_index_guid] = [T2].[index_guid]
--           AND [T1].[referenced_RepoObject_guid] = [T2].[referenced_RepoObject_guid]
--           AND [T1].[referencing_RepoObject_guid] = [T2].[referencing_RepoObject_guid]
--)
GO



GO



GO



GO



GO



GO



GO


