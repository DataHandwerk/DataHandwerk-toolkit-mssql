
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
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a98563d4-1b51-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing_HasFullColumnsInReferencing', @level2type = N'COLUMN', @level2name = N'RowNumberInReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aa8563d4-1b51-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing_HasFullColumnsInReferencing', @level2type = N'COLUMN', @level2name = N'RowNumberInReferencing_Target';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'3cb3cf2f-e54e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing_HasFullColumnsInReferencing', @level2type = N'COLUMN', @level2name = N'referenced_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'3eb3cf2f-e54e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing_HasFullColumnsInReferencing', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'3db3cf2f-e54e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing_HasFullColumnsInReferencing', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'3bb3cf2f-e54e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing_HasFullColumnsInReferencing', @level2type = N'COLUMN', @level2name = N'source_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'2db3cf2f-e54e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing_HasFullColumnsInReferencing';

