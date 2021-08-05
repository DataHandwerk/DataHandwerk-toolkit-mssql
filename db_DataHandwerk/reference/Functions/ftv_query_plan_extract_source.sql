/*
CURRENTLY NOT WORKING
wrong example 
Invalid column name 'SysObject_query_plan'.


OPTION(MAXRECURSION 100) should be used from outer
it is not possible to include this into the table valued function

example:

SELECT TOP 100
       [ro].[RepoObject_guid]
     , [source_columns].*
FROM
     repo.RepoObject AS ro
     CROSS APPLY
     [reference].[ftv_query_plan_extract_source](SysObject_query_plan) AS source_columns
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
CREATE Function [reference].[ftv_query_plan_extract_source]
(
    @query_plan Xml
)
Returns Table
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
As
Return
-- body of the function
--Next is a main query. It's biggest part is recursive common table expression for column extraction.
With XmlNamespaces
(
    Default 'http://schemas.microsoft.com/sqlserver/2004/07/showplan'
  , 'http://schemas.microsoft.com/sqlserver/2004/07/showplan' As shp -- Used in .query() for predictive namespace using. 
)
,
cte_column_dependencies
As
    (
    --The seed of recursion is a query that extracts columns for #foo table that store 1 row of interested select query.
    Select
        (
            Select
                foo_col.info.query ( './ColumnReference' )
            For Xml Raw ( 'shp:root' ), Type
        ) -- Becouse .value() can't extract attribute from root node.
                          As target_column_info
      , (
            Select
                foo_col.info.query ( './ScalarOperator/Identifier/ColumnReference' )
            For Xml Raw ( 'shp:root' ), Type
        )                 As source_column_info
      , Cast(Null As Xml) As const_info
      , 1                 As iteration_no
    From
        @query_plan.nodes('//Update/SetPredicate/ScalarOperator/ScalarExpressionList/ScalarOperator/MultipleAssign/Assign') As foo_col(info)
    Where
        foo_col.info.exist ( './ColumnReference[@Table="[#foo]"]' ) = 1
    --The recursive part searches for "DefinedValue" node with depended column and extract all "ColumnReference" and "Const" subnodes that used in column expression. It's over complicated by XML to SQL conversions.
    Union All
    Select
        (
            Select internal_col.info.query ( '.' ) For Xml Raw ( 'shp:root' ), Type
        )
      , source_info.column_info
      , source_info.const_info
      , prev_dependencies.iteration_no + 1
    From
        @query_plan.nodes('//DefinedValue/ColumnReference') As internal_col(info)
        Inner Join
            cte_column_dependencies                         As prev_dependencies -- Filters by depended columns.
                On
                prev_dependencies.source_column_info.value ( '(//ColumnReference/@Column)[1]', 'nvarchar(4000)' ) = internal_col.info.value (
                                                                                                                                                '(./@Column)[1]'
                                                                                                                                              , 'nvarchar(4000)'
                                                                                                                                            )
                And Exists
                    (
                        Select
                            prev_dependencies.source_column_info.value ( '(.//@Schema)[1]', 'nvarchar(4000)' )
                        Intersect
                        Select
                            internal_col.info.value ( '(./@Schema)[1]', 'nvarchar(4000)' )
                    )
                And Exists
                    (
                        Select
                            prev_dependencies.source_column_info.value ( '(.//@Database)[1]', 'nvarchar(4000)' )
                        Intersect
                        Select
                            internal_col.info.value ( '(./@Database)[1]', 'nvarchar(4000)' )
                    )
                And Exists
                    (
                        Select
                            prev_dependencies.source_column_info.value ( '(.//@Server)[1]', 'nvarchar(4000)' )
                        Intersect
                        Select
                            internal_col.info.value ( '(./@Server)[1]', 'nvarchar(4000)' )
                    )
        Cross Apply
    (
        -- Becouse only column or only constant can be places in result row.
        Select
            (
                Select source_col.info.query ( '.' ) For Xml Raw ( 'shp:root' ), Type
            )    As column_info
          , Null As const_info
        From
            internal_col.info.nodes ( '..//ColumnReference' ) As source_col(info)
        Union All
        Select
            Null As column_info
          , (
                Select const.info.query ( '.' ) For Xml Raw ( 'shp:root' ), Type
            )    As const_info
        From
            internal_col.info.nodes ( '..//Const' ) As const(info)
    )                                                       As source_info
    Where
        source_info.column_info Is Null
        Or -- Except same node selected by '..//ColumnReference' from its sources. Sorry, I'm not so well to check it with XQuery simple.
        source_info.column_info.value ( '(//@Column)[1]', 'nvarchar(4000)' ) <> internal_col.info.value (
                                                                                                            '(./@Column)[1]'
                                                                                                          , 'nvarchar(4000)'
                                                                                                        )
        And
        (
            Select
                source_info.column_info.value ( '(//@Schema)[1]', 'nvarchar(4000)' )
            Intersect
            Select
                internal_col.info.value ( '(./@Schema)[1]', 'nvarchar(4000)' )
        ) Is Null
        And
        (
            Select
                source_info.column_info.value ( '(//@Database)[1]', 'nvarchar(4000)' )
            Intersect
            Select
                internal_col.info.value ( '(./@Database)[1]', 'nvarchar(4000)' )
        ) Is Null
        And
        (
            Select
                source_info.column_info.value ( '(//@Server)[1]', 'nvarchar(4000)' )
            Intersect
            Select
                internal_col.info.value ( '(./@Server)[1]', 'nvarchar(4000)' )
        ) Is Null
    )

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
Select
    target_column_name   = col_dep.target_column_info.value ( '(.//shp:ColumnReference/@Column)[1]', 'nvarchar(4000)' )
  , source_server_name   = col_dep.source_column_info.value ( '(.//shp:ColumnReference/@Server)[1]', 'nvarchar(4000)' )
  , source_database_name = col_dep.source_column_info.value ( '(.//shp:ColumnReference/@Database)[1]', 'nvarchar(4000)' )
  , source_schema_name   = col_dep.source_column_info.value ( '(.//shp:ColumnReference/@Schema)[1]', 'nvarchar(4000)' )
  , source_table_name    = col_dep.source_column_info.value ( '(.//shp:ColumnReference/@Table)[1]', 'nvarchar(4000)' )
  , source_column_name   = col_dep.source_column_info.value ( '(.//shp:ColumnReference/@Column)[1]', 'nvarchar(4000)' )
  , const_value          = col_dep.const_info.value ( '(/shp:root/shp:Const/@ConstValue)[1]', 'nvarchar(4000)' )
  , col_dep.target_column_info
  , col_dep.source_column_info
  , col_dep.const_info
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
From
    cte_column_dependencies As col_dep;
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
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '2990291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'FUNCTION'
  , @level1name = N'ftv_query_plan_extract_source';

GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.usp_RepoObjectSource_QueryPlan.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'FUNCTION', @level1name = N'ftv_query_plan_extract_source';

