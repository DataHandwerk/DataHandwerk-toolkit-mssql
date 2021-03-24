﻿

/*
Was ist der Sinn dieser Sicht?

Es muss bedacht werden, dass der gleiche Quell-Index im Zielobjekt mehrere Vererbungen haben kann,
wenn die Quelle mehrfach verwendet wird und der Quell-Index somit auch mehrfach im Ziel vorhanden sein kann
Das ist so lange OK, wie es im referenced unterschiedliche Spalten sind.

Wir müssten noch irgendwo prüfen, ob die gleiche Spalten-Kombination aus verschiedenen Quellen geerbt wird
Und dann dürfte es den Index nur einmal geben, aber möglicherweise mit mehrfachen Quellen?
Oder brauchen wir nur eine Quelle und ignorieren einfach weitere Quellen?

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
SELECT [i_s].[index_guid] AS [source_index_guid]
 , [i_s].[index_type] AS [source_index_type]
 , [ror].[referenced_RepoObject_guid]
 , [ror].[referencing_RepoObject_guid]
 , [i_v].[referenced_index_guid] AS [referenced_index_guid]
 , [i_v].[RowNumberInReferencing] AS [RowNumberInReferencing_Target]
FROM repo.Index_union AS i_s --index source: index in referenced source object(s)
INNER JOIN repo.[RepoObject_reference_union] AS ror
 ON ror.referenced_RepoObject_guid = i_s.parent_RepoObject_guid
LEFT JOIN repo.[Index_virtual] AS i_v
 ON i_v.referenced_index_guid = i_s.index_guid
  AND i_v.parent_RepoObject_guid = ror.referencing_RepoObject_guid

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6690291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fcf57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing', @level2type = N'COLUMN', @level2name = N'source_index_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fbf57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing', @level2type = N'COLUMN', @level2name = N'source_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '00f67926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing', @level2type = N'COLUMN', @level2name = N'RowNumberInReferencing_Target';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fef57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fdf57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fff57926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referenced_index_guid';
