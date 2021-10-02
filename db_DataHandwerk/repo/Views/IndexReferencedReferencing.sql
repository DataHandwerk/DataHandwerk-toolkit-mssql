



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
CREATE View repo.IndexReferencedReferencing
As
--
Select
    source_index_guid             = i_s.index_guid
  , ror.referencing_RepoObject_guid
  , RowNumberInReferencing_Target = i_v.RowNumberInReferencing
  , source_index_type             = i_s.index_type
  , ror.referenced_RepoObject_guid
  , referenced_index_guid         = i_v.referenced_index_guid
From
    repo.Index_union                     As i_s --index source: index in referenced source object(s)
    Inner Join
        reference.RepoObject_reference_T As ror
            On
            ror.referenced_RepoObject_guid = i_s.parent_RepoObject_guid

    Left Join
        repo.Index_virtual               As i_v
            On
            i_v.referenced_index_guid      = i_s.index_guid
            And i_v.parent_RepoObject_guid = ror.referencing_RepoObject_guid
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '6690291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexReferencedReferencing';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fcf57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexReferencedReferencing'
  , @level2type = N'COLUMN'
  , @level2name = N'source_index_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fbf57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexReferencedReferencing'
  , @level2type = N'COLUMN'
  , @level2name = N'source_index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '00f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexReferencedReferencing'
  , @level2type = N'COLUMN'
  , @level2name = N'RowNumberInReferencing_Target';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fef57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexReferencedReferencing'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fdf57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexReferencedReferencing'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'fff57926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'IndexReferencedReferencing'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_index_guid';
Go

Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_reference_T].[referencing_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObject_reference_T].[referenced_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_virtual].[referenced_index_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing', @level2type = N'COLUMN', @level2name = N'referenced_index_guid';



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [reference].[RepoObject_reference_T]
* [repo].[Index_union]
* [repo].[Index_virtual]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing';




GO
EXECUTE sp_addextendedproperty @name = N'has_execution_plan_issue', @value = N'1', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.IndexReferencedReferencing_HasFullColumnsInReferencing.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.RepoObject_reference_T.adoc[]
* xref:repo.Index_union.adoc[]
* xref:repo.Index_virtual.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing';


GO



GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_union].[index_type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing', @level2type = N'COLUMN', @level2name = N'source_index_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_union].[index_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing', @level2type = N'COLUMN', @level2name = N'source_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[Index_virtual].[RowNumberInReferencing]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexReferencedReferencing', @level2type = N'COLUMN', @level2name = N'RowNumberInReferencing_Target';

