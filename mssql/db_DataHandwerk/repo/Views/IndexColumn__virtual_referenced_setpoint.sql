
/*
Sollwert
jeder Index in [repo].[Index__virtual], der einen [referenced_index_guid] hat, der also geerbt wird
benötigt für diesen geerbten Index auch geerbte Spalten
alle benötigten Spalten werden hier aufgelistet

Setpoint:
each index in [repo].[Index__virtual], having a [referenced_index_guid] (the index is inherited)
also needs the columns
these required columns are listed here
this view is a "setpoint"
all these columns should exists in [repo].[IndexColumn__virtual]



isue:
some combinations of ([Index_guid], [index_column_id]) are not unique
why?
because they have multiple [referencing_RepoObjectColumn_guid]
but this is wrong, only one referencing_RepoObjectColumn_guid is possible per [index_column_id]

=> [RowNumberInReferencing]



*/
CREATE VIEW [repo].[IndexColumn__virtual_referenced_setpoint]
AS
--
SELECT
       [i].[index_guid] --referencing index, which inherits columns from referenced index 
     , [ic].[index_column_id]
     , [ic].[is_descending_key]
     , [ic].[referencing_RepoObjectColumn_guid] --columns in the referencing RepoObject
     , [i].[referenced_index_guid] --referenced index, which is the source for inherited columns 
     , [i].[RowNumberInReferencing]
       --only for testing:
     , [ic].[referenced_RepoObjectColumn_guid]
     , [ic].[referenced_RepoObject_guid]
     , [ic].[referencing_RepoObject_guid]
FROM
     repo.Index__virtual AS i
     INNER JOIN
     repo.IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing AS ic --setpoint belongs to the parent_RepoObject of the index
     ON ic.referencing_RepoObject_guid = i.parent_RepoObject_guid
        --ic.index_guid is the referenced index (source index)
        AND ic.index_guid = i.referenced_index_guid
        AND ic.[RowNumberInReferencing] = i.[RowNumberInReferencing]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'af8563d4-1b51-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_referenced_setpoint', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ad8563d4-1b51-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_referenced_setpoint', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ae8563d4-1b51-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_referenced_setpoint', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b08563d4-1b51-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_referenced_setpoint', @level2type = N'COLUMN', @level2name = N'RowNumberInReferencing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '41b3cf2f-e54e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_referenced_setpoint', @level2type = N'COLUMN', @level2name = N'referenced_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '42b3cf2f-e54e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_referenced_setpoint', @level2type = N'COLUMN', @level2name = N'referencing_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b2a4188b-0352-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_referenced_setpoint', @level2type = N'COLUMN', @level2name = N'is_descending_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3fb3cf2f-e54e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_referenced_setpoint', @level2type = N'COLUMN', @level2name = N'index_column_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '40b3cf2f-e54e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_referenced_setpoint', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2ab3cf2f-e54e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_referenced_setpoint';

