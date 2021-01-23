
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
     repo.Index_union AS i_s --index source: index in referenced source object(s)
     INNER JOIN
     repo.[RepoObject_reference_union] AS ror
     ON ror.referenced_RepoObject_guid = i_s.parent_RepoObject_guid
     LEFT JOIN
     repo.[Index_virtual] AS i_v
     ON i_v.referenced_index_guid = i_s.index_guid
        AND i_v.parent_RepoObject_guid = ror.referencing_RepoObject_guid
GO



GO



GO



GO



GO



GO


