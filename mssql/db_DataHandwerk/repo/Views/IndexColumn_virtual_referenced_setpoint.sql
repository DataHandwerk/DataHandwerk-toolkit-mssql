
-- Alter View IndexColumn_virtual_referenced_setpoint

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
CREATE VIEW [repo].[IndexColumn_virtual_referenced_setpoint]
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