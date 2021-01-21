
CREATE VIEW [repo].[aa_test_RepoObject__column_list_common]
AS
--liste für normale Spalten
--weitere listen nötig für
--PK
--berechnet
--
--
--evtl abfangen, dass [RepoObjectColumn_name] eine guid sein könnte, die dann keinen Datentyp hat
SELECT
       [RepoObject_guid]
       --noch ergänzen
       --NULL oder NOT NULL - [is_nullable]
       --Datentyp
     , column_list_common = STRING_AGG(CONCAT(' ' , QUOTENAME([RepoObjectColumn_name]) , ' ' , [Repo_user_type_fullname] ,
                                                                          CASE [Repo_is_nullable]
                                                                              WHEN 0
                                                                              THEN ' NOT'
                                                                          END , ' NULL ') , ',') WITHIN GROUP(ORDER BY [SysObjectColumn_column_id])
FROM
     [repo].[RepoObjectColumn] AS roc
WHERE
--not persisted
[Repo_is_persisted] IS NULL
OR [Repo_is_persisted] = 0
--not PK
--muss man joinen oder aus Index in roc reinbringen
GROUP BY
         [RepoObject_guid]