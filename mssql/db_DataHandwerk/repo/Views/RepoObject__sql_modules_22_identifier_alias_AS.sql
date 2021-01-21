
/*
it looks like an identifier has only one child and inside this one child only one child identifier which is the alias
but currently we do not force one entry by ([RepoObject_guid], [key])
we coul add a Row_number to enable filtering for the first alias
*/

CREATE VIEW [repo].[RepoObject__sql_modules_22_identifier_alias_AS]
AS
--
SELECT
       [T1].[RepoObject_guid]
     , [T1].[key]
     , [T1].[SysObject_fullname]
     , [identifier_name] = [T1].[normalized]
     , [identifier_alias] = [T2].[normalized]
     , [RowNumber] = ROW_NUMBER() OVER(PARTITION BY [T1].[RepoObject_guid]
                                                  , [T1].[key]
       ORDER BY
                [T2].[json_key])
FROM
     repo.RepoObject__sql_modules_20_statement_children AS T1
     CROSS APPLY
     [repo].[ftv_sqlparse]([T1].[children]) AS T2
WHERE  [T1].[class] = 'Identifier'
       AND [T2].[class] = 'Identifier'