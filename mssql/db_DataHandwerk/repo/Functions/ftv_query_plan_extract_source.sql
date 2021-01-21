-- Alter Function ftv_query_plan_extract_source

/*

OPTION(MAXRECURSION 100) should be used from outer
it is not possible to include this into the table valued function

example:

SELECT TOP 100
       [ro].[RepoObject_guid]
     , [source_columns].*
FROM
     repo.RepoObject AS ro
     CROSS APPLY
     repo_sys.ftv_query_plan_extract_source(SysObject_query_plan) AS source_columns
WHERE  NOT [ro].[SysObject_query_plan] IS NULL OPTION(
                                                      MAXRECURSION 100)

*/

/*
based on
https://stackoverflow.com/questions/45658957/how-to-get-column-level-dependencies-in-a-view

from:
https://stackoverflow.com/users/8478406/basil-kisel

It is a solution based on query plan. It has some adventages

- almost any select queries can be processed
- no SchemaBinding

and disadventages

- has not been tested properly
- can become broken suddenly if Microsoft change XML query plan.

The core idea is that every column expression inside XML query plan is defined in "DefinedValue" node. 
First subnode of "DefinedValue" is a reference to output column and second one is a expression. 
The expression computes from input columns and constant values. 
As mentioned above It's based only on empirical observation and needs to be tested properly.

*/
CREATE FUNCTION [repo].[ftv_query_plan_extract_source] (
     @query_plan XML) RETURNS TABLE
--RETURNS @retColumnReferences TABLE
--(
--     -- columns returned by the function
--    [target_column_name]   NVARCHAR(4000) NULL
--   , [source_server_name] NVARCHAR(4000) NULL
--   , [source_database_name] NVARCHAR(4000) NULL
--   , [source_schema_name]   NVARCHAR(4000) NULL
--   , [source_table_name]    NVARCHAR(4000) NULL
--   , [source_column_name]   NVARCHAR(4000) NULL
--   , [const_value]          NVARCHAR(4000) NULL
--   , [target_column_info]   XML NULL
--   , [source_column_info]   XML NULL
--   , [const_info]           XML NULL
--)
AS RETURN

   -- body of the function
   --Next is a main query. It's biggest part is recursive common table expression for column extraction.
   WITH XMLNAMESPACES(DEFAULT 'http://schemas.microsoft.com/sqlserver/2004/07/showplan' , 'http://schemas.microsoft.com/sqlserver/2004/07/showplan' AS shp -- Used in .query() for predictive namespace using. 
   ) ,
        cte_column_dependencies
        AS (
        --The seed of recursion is a query that extracts columns for #foo table that store 1 row of interested select query.
        SELECT
        (
            SELECT
                   [foo_col].[info].[query]('./ColumnReference') FOR
        XML RAW('shp:root') , TYPE
        ) -- Becouse .value() can't extract attribute from root node.
        AS                   [target_column_info]
      ,
        (
            SELECT
                   [foo_col].[info].[query]('./ScalarOperator/Identifier/ColumnReference') FOR
        XML RAW('shp:root') , TYPE
        ) AS                 [source_column_info]
      , CAST(NULL AS XML) AS [const_info]
      , 1 AS                 [iteration_no]
        FROM
             @query_plan.nodes('//Update/SetPredicate/ScalarOperator/ScalarExpressionList/ScalarOperator/MultipleAssign/Assign') AS foo_col(info)
        WHERE [foo_col].[info].[exist]('./ColumnReference[@Table="[#foo]"]') = 1

--The recursive part searches for "DefinedValue" node with depended column and extract all "ColumnReference" and "Const" subnodes that used in column expression. It's over complicated by XML to SQL conversions.
        UNION ALL
        SELECT
        (
            SELECT
                   [internal_col].[info].[query]('.') FOR
        XML RAW('shp:root') , TYPE
        )
      , [source_info].[column_info]
      , [source_info].[const_info]
      , [prev_dependencies].[iteration_no] + 1
        FROM
             @query_plan.nodes('//DefinedValue/ColumnReference') AS internal_col(info)
             INNER JOIN
             cte_column_dependencies AS prev_dependencies -- Filters by depended columns.
             ON prev_dependencies.source_column_info.value('(//ColumnReference/@Column)[1]' , 'nvarchar(4000)') = internal_col.info.value('(./@Column)[1]' , 'nvarchar(4000)')
             AND EXISTS
        (
            SELECT
                   [prev_dependencies].[source_column_info].value('(.//@Schema)[1]' , 'nvarchar(4000)')
            INTERSECT
            SELECT
                   [internal_col].[info].value('(./@Schema)[1]' , 'nvarchar(4000)')
        )
AND EXISTS
        (
            SELECT
                   [prev_dependencies].[source_column_info].value('(.//@Database)[1]' , 'nvarchar(4000)')
            INTERSECT
            SELECT
                   [internal_col].[info].value('(./@Database)[1]' , 'nvarchar(4000)')
        )
AND EXISTS
        (
            SELECT
                   [prev_dependencies].[source_column_info].value('(.//@Server)[1]' , 'nvarchar(4000)')
            INTERSECT
            SELECT
                   [internal_col].[info].value('(./@Server)[1]' , 'nvarchar(4000)')
        )
             CROSS APPLY
        ( -- Becouse only column or only constant can be places in result row.
            SELECT
            (
                SELECT
                       [source_col].[info].[query]('.') FOR
            XML RAW('shp:root') , TYPE
            ) AS    [column_info]
          , NULL AS [const_info]
            FROM
                 internal_col.info.nodes('..//ColumnReference') AS source_col(info)
            UNION ALL
            SELECT
                   NULL AS [column_info]
                 ,
            (
                SELECT
                       [const].[info].[query]('.') FOR
            XML RAW('shp:root') , TYPE
            ) AS           [const_info]
            FROM
                 internal_col.info.nodes('..//Const') AS const(info)
        ) AS source_info
        WHERE [source_info].[column_info] IS NULL
              OR -- Except same node selected by '..//ColumnReference' from its sources. Sorry, I'm not so well to check it with XQuery simple.
              [source_info].[column_info].value('(//@Column)[1]' , 'nvarchar(4000)') <> [internal_col].[info].value('(./@Column)[1]' , 'nvarchar(4000)')
AND
        (
            SELECT
                   [source_info].[column_info].value('(//@Schema)[1]' , 'nvarchar(4000)')
            INTERSECT
            SELECT
                   [internal_col].[info].value('(./@Schema)[1]' , 'nvarchar(4000)')
        ) IS NULL
AND
        (
            SELECT
                   [source_info].[column_info].value('(//@Database)[1]' , 'nvarchar(4000)')
            INTERSECT
            SELECT
                   [internal_col].[info].value('(./@Database)[1]' , 'nvarchar(4000)')
        ) IS NULL
AND
        (
            SELECT
                   [source_info].[column_info].value('(//@Server)[1]' , 'nvarchar(4000)')
            INTERSECT
            SELECT
                   [internal_col].[info].value('(./@Server)[1]' , 'nvarchar(4000)')
        ) IS NULL)

        ----Finally, It's select statement that convert XML to appropriate human text.
        --INSERT INTO @retColumnReferences
        --(
        --     [target_column_name]
        --     , [source_server_name]
        --     , [source_database_name]
        --     , [source_schema_name]
        --     , [source_table_name]
        --     , [source_column_name]
        --     , [const_value]
        --     , [target_column_info]
        --     , [source_column_info]
        --     , [const_info]
        --)
        SELECT
               [target_column_name] = [col_dep].[target_column_info].value('(.//shp:ColumnReference/@Column)[1]' , 'nvarchar(4000)')
             , [source_server_name] = [col_dep].[source_column_info].value('(.//shp:ColumnReference/@Server)[1]' , 'nvarchar(4000)')
             , [source_database_name] = [col_dep].[source_column_info].value('(.//shp:ColumnReference/@Database)[1]' , 'nvarchar(4000)')
             , [source_schema_name] = [col_dep].[source_column_info].value('(.//shp:ColumnReference/@Schema)[1]' , 'nvarchar(4000)')
             , [source_table_name] = [col_dep].[source_column_info].value('(.//shp:ColumnReference/@Table)[1]' , 'nvarchar(4000)')
             , [source_column_name] = [col_dep].[source_column_info].value('(.//shp:ColumnReference/@Column)[1]' , 'nvarchar(4000)')
             , [const_value] = [col_dep].[const_info].value('(/shp:root/shp:Const/@ConstValue)[1]' , 'nvarchar(4000)')
             , [col_dep].[target_column_info]
             , [col_dep].[source_column_info]
             , [col_dep].[const_info]

--  col_dep.target_column_info
--, col_dep.source_column_info
--, col_dep.const_info
--  coalesce(col_dep.target_column_info.value('(.//shp:ColumnReference/@Server)[1]'   ,'nvarchar(4000)') + '.' ,'')
--+ coalesce(col_dep.target_column_info.value('(.//shp:ColumnReference/@Database)[1]' ,'nvarchar(4000)') + '.' ,'')
--+ coalesce(col_dep.target_column_info.value('(.//shp:ColumnReference/@Schema)[1]'   ,'nvarchar(4000)') + '.' ,'')
--+ col_dep.target_column_info.value('(.//shp:ColumnReference/@Column)[1]' ,'nvarchar(4000)')
--  as target_column_name
--, coalesce(col_dep.source_column_info.value('(.//shp:ColumnReference/@Server)[1]'   ,'nvarchar(4000)') + '.' ,'')
--+ coalesce(col_dep.source_column_info.value('(.//shp:ColumnReference/@Database)[1]' ,'nvarchar(4000)') + '.' ,'')
--+ coalesce(col_dep.source_column_info.value('(.//shp:ColumnReference/@Schema)[1]'   ,'nvarchar(4000)') + '.' ,'')
--+ col_dep.source_column_info.value('(.//shp:ColumnReference/@Column)[1]' ,'nvarchar(4000)')
--  as source_column_name
--
        FROM
             cte_column_dependencies AS col_dep
--ORDER BY
--         [col_dep].[iteration_no]
--       , [target_column_name]
--       , [source_column_name]
--
--/*
--https://stackoverflow.com/questions/7428669/how-to-set-the-maxrecursion-option-for-a-cte-inside-a-table-valued-function
--https://social.msdn.microsoft.com/Forums/en-US/7c7d5fea-38ad-4bc5-9038-a157e640561f/using-option-clause-within-create-function-statement-for-inline-table-functions?forum=transactsql
--[the] OPTION clause can be used only at the statement level
--So you cannot use it within a query expression inside view definitions or inline TVFs etc.
--The only way to use it in your case is to create the TVF without the OPTION clause and specify it in the query that uses the TVF. 
--We have a bug that tracks request for allowing use of OPTION clause inside any query expression (for example, if exists() or CTE or view).
--You can not change the default value of that option inside a udf. 
--You will have to do it in the statement referencing the udf.
--*/
--
--OPTION(MAXRECURSION 100) -- It's an assurance from infinite loop.
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a41cb308-944b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'FUNCTION', @level1name = N'ftv_query_plan_extract_source';

