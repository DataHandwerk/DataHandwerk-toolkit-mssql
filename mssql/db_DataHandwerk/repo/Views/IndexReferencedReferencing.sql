﻿
-- Alter View IndexReferencedReferencing

-- Alter View IndexReferencedReferencing
/*
Was ist der Sinn dieser Sicht?

Es muss bedacht werden, dass der gleiche Quell-Index im Zielobjekt mehrere Vererbungen haben kann,
wenn die Quelle mehrfach verwendet wird und der Quell-Index somit auch mehrfach im Ziel vorhanden sein kann

repo.RepoObject_reference__union
fasst aber alle Referenzen zwischen Objekten zusammen, auch wenn es da mehrere Ausprägungen gibt

Wenn repo.Index__virtual AS i_v richtig gefüllt wird, dann müsste es in folgender Sicht auch eine Einträge mit Anz > 1 geben 

SELECT
       [source_index_guid]
     , [referenced_RepoObject_guid]
     , [referencing_RepoObject_guid]
     , COUNT(*) AS [Anz]
FROM
     repo.IndexReferencedReferencing AS T1
GROUP BY
         [source_index_guid]
       , [referenced_RepoObject_guid]
       , [referencing_RepoObject_guid]
ORDER BY
         [Anz] DESC

*/
CREATE VIEW [repo].[IndexReferencedReferencing]
AS
--
SELECT
       [i_s].[index_guid] AS            [source_index_guid]
     , [ror].[referenced_RepoObject_guid]
     , [ror].[referencing_RepoObject_guid]
     , [i_v].[referenced_index_guid] AS [referenced_index_guid]
     , [i_v].[RowNumberInReferencing] AS RowNumberInReferencing_Target
FROM
     repo.Index__union AS i_s --index source: index in referenced source object(s)
     INNER JOIN
     repo.RepoObject_reference__union AS ror
     ON ror.referenced_RepoObject_guid = i_s.parent_RepoObject_guid
     LEFT JOIN
     repo.Index__virtual AS i_v
     ON i_v.referenced_index_guid = i_s.index_guid
        AND i_v.parent_RepoObject_guid = ror.referencing_RepoObject_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ac8563d4-1b51-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing', @level2type = N'COLUMN', @level2name = N'RowNumberInReferencing_Target';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'38b3cf2f-e54e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referenced_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'3ab3cf2f-e54e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'39b3cf2f-e54e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'37b3cf2f-e54e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing', @level2type = N'COLUMN', @level2name = N'source_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'2cb3cf2f-e54e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing';

