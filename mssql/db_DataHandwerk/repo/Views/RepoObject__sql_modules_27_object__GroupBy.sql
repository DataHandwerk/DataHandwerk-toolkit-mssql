
CREATE VIEW [repo].[RepoObject__sql_modules_27_object__GroupBy]
AS
--
SELECT
       [RepoObject_guid]
     , [has_GroupBy] = 1
FROM
     repo.RepoObject__sql_modules_20_statement_children
WHERE  [is_keyword] = 1
       AND [normalized] = 'GROUP BY'
GROUP BY
         [RepoObject_guid]