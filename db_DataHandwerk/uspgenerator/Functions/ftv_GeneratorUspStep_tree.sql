
/*
<<property_start>>MS_Description
* xref:sqldb:uspgenerator.GeneratorUspStep.adoc[] has a parent child structure.
Here in this function we try to get the numbers in the right order.
* It is not perfect if the tree is to deep and some "deep" numbers are lower.
** check the result per [usp_id]
** and if it not fits try to use better sorted numbers
* one goal is to solve steps which are conditions
** is_condition = 1
** we need to encapsulate condition THEN and ELSE statement in BEGIN...END blocks
** and this should work recursively
** see the comment on top of the code for more details and testing
<<property_end>>

<<property_start>>exampleUsage
--get all steps per Usp, recursively:

SELECT u.*
 , t.*
FROM [uspgenerator].[GeneratorUsp] u
CROSS APPLY [uspgenerator].[ftv_GeneratorUspStep_tree]([id], NULL) t
ORDER BY [u].id
 , t.[RowNumber_PerUsp]
<<property_end>>

----and now about conditions
----all this is done because we need to encapsulate condition THEN and ELSE statement in BEGIN...END blocks
----but we need to explore the first and last step per condition THEN- or ELSE-block
--
--get all (is_condition = 1) statements and their recursive children
SELECT [s].[usp_id]
 , [s].[Number] AS [Condition_Number]
 --, [s].[Parent_Number]
 --, [s].[Name]
 --, [s].[has_logging]
 --, [s].[is_condition]
 --, [s].[is_inactive]
 --, [s].[is_SubProcedure]
 --, [s].[Statement]
 --, [s].[log_source_object]
 --, [s].[log_target_object]
 --, [s].[log_flag_InsertUpdateDelete]
 --, [s].[info_01]
 --, [s].[info_02]
 --, [s].[info_03]
 --, [s].[info_04]
 --, [s].[info_05]
 --, [s].[info_06]
 --, [s].[info_07]
 --, [s].[info_08]
 --, [s].[info_09]
 --, [t].[usp_id]
 , [t].[child_PerParent]
 , [t].[RowNumber_PerUsp] AS [RowNumber_PerUspAndCondition]
 , [t].[Number]
 , [t].[Asc_PerParentChild]
 , [t].[Desc_PerParentChild]
 , [t].[is_required_ELSE]
--, [t].[Depth]
--, [t].[is_condition]
--, [t].[Root_Sort]
--, [t].[Parent_Number]
--, [t].[Parent_Sort]
--, [t].[Sort]
FROM [uspgenerator].[GeneratorUspStep] AS s
CROSS APPLY [uspgenerator].[ftv_GeneratorUspStep_tree]([usp_id], [Number]) AS t
WHERE [s].[is_condition] = 1
ORDER BY [s].[usp_id]
 , [Condition_Number]
 , [t].[child_PerParent]
 , [RowNumber_PerUspAndCondition]


--evaluate the count and place of BEGIN and END for condition statements:
--t: all recursive children of any step which is a condition
--this should also work for recursive conditions, because ([s].[is_condition] = 1) will filter any conditions
--([t].[Asc_PerParentChild] = 1) indicates a required BEGIN, these are first children of conditions
--([t].[Desc_PerParentChild] = 1) indicates a required BEGIN, these are last children of condition steps

SELECT [s].[usp_id]
 , [t].[Number]
 , required_Begin_count = SUM(IIF([t].[Asc_PerParentChild] = 1, 1, 0))
 , required_End_count = sum(iif([t].[Desc_PerParentChild] = 1, 1, 0))
 , [is_required_ELSE] = MAX([t].[is_required_ELSE])
FROM [uspgenerator].[GeneratorUspStep] AS s
CROSS APPLY [uspgenerator].[ftv_GeneratorUspStep_tree]([usp_id], [Number]) AS t
WHERE [s].[is_condition] = 1
GROUP BY [s].[usp_id]
 , [t].[Number]


 --combine all active steps per usp with required_Begin_count and required_End_count:

SELECT [u].[id]
 --, [u].[usp_schema]
 --, [u].[usp_name]
 , [u].[has_logging]
 --, [u].[usp_Comment]
 , [u].[usp_fullname]
 --, [t].[usp_id]
 , [t].[Number]
 , [t].[RowNumber_PerUsp]
 , [t].[Depth]
 , [t].[is_condition]
 , [t].[Root_Sort]
 --, [t].[Parent_Number]
 --, [t].[Parent_Sort]
 --, [t].[Sort]
 --, [t].[child_PerParent]
 --, [t].[Asc_PerParentChild]
 --, [t].[Desc_PerParentChild]
 , [BeginEnd].[required_Begin_count]
 , [BeginEnd].[required_End_count]
 , [BeginEnd].[is_required_ELSE]
FROM [uspgenerator].[GeneratorUsp] AS u
CROSS APPLY [uspgenerator].[ftv_GeneratorUspStep_tree]([id], NULL) AS t
LEFT JOIN (
 SELECT [s].[usp_id]
  , [t].[Number]
  , [required_Begin_count] = SUM(IIF([t].[Asc_PerParentChild] = 1, 1, 0))
  , [required_End_count] = SUM(IIF([t].[Desc_PerParentChild] = 1, 1, 0))
  , [is_required_ELSE] = MAX([t].[is_required_ELSE])
 FROM [uspgenerator].[GeneratorUspStep] AS s
 CROSS APPLY [uspgenerator].[ftv_GeneratorUspStep_tree]([usp_id], [Number]) AS t
 WHERE [s].[is_condition] = 1
 GROUP BY [s].[usp_id]
  , [t].[Number]
 ) AS BeginEnd
 ON BeginEnd.usp_id = u.id
  AND BeginEnd.Number = t.Number
ORDER BY [u].[id]
 , [t].[RowNumber_PerUsp]

--and finaly use [uspgenerator].[ftv_GeneratorUspStep_sql] to create the statement per step

SELECT [u].[id]
 , [t].[Number]
 , [u].[has_logging]
 , [BeginEnd].[required_Begin_count]
 , [BeginEnd].[required_End_count]
 , [BeginEnd].[is_required_ELSE]
 --only information
 , [u].[usp_fullname]
 , [t].[RowNumber_PerUsp]
 --, [t].[Depth]
 --, [t].[is_condition]
 --, [t].[Root_Sort]
 --, [t].[Parent_Number]
 --, [t].[Parent_Sort]
 --, [t].[Sort]
 --, [t].[child_PerParent]
 --, [t].[Asc_PerParentChild]
 --, [t].[Desc_PerParentChild]
 , sql.SqlStep
FROM [uspgenerator].[GeneratorUsp] AS u
CROSS APPLY [uspgenerator].[ftv_GeneratorUspStep_tree]([id], NULL) AS t
LEFT JOIN (
 SELECT [s].[usp_id]
  , [t].[Number]
  , [required_Begin_count] = SUM(IIF([t].[Asc_PerParentChild] = 1, 1, 0))
  , [required_End_count] = SUM(IIF([t].[Desc_PerParentChild] = 1, 1, 0))
  , [is_required_ELSE] = MAX([t].[is_required_ELSE])
 FROM [uspgenerator].[GeneratorUspStep] AS s
 CROSS APPLY [uspgenerator].[ftv_GeneratorUspStep_tree]([usp_id], [Number]) AS t
 WHERE [s].[is_condition] = 1
 GROUP BY [s].[usp_id]
  , [t].[Number]
 ) AS BeginEnd
 ON BeginEnd.usp_id = u.id
  AND BeginEnd.Number = t.Number
CROSS APPLY [uspgenerator].[ftv_GeneratorUspStep_sql]([u].[id], [t].[Number], [u].[has_logging], [BeginEnd].[required_Begin_count], [BeginEnd].[required_End_count], [BeginEnd].[is_required_ELSE]) sql
ORDER BY [u].[id]
 , [t].[RowNumber_PerUsp]


*/
CREATE Function [uspgenerator].[ftv_GeneratorUspStep_tree]
(
    @usp_id        Int
  , @Parent_Number Int
--, @usp_has_logging TINYINT = 0
)
Returns Table
As
Return
(
    With
    tree
    As
        --tree is recursive to solve parent child hierarchies
        (
        Select
            usp_id
          , Number
          , Parent_Number
          , 0               As Depth
          , Number          As Sort
          , Number          As Parent_Sort
          , Number          As Root_Sort
          , is_condition
          , child_PerParent = Iif(Not Parent_Number Is Null
                                  , Row_Number () Over ( Partition By usp_id, Parent_Number Order By Number )
                                  , Null)
        --ROW_NUMBER() OVER(Partition by [usp_id], [Parent_Number] ORDER BY [Number])
        From
            [uspgenerator].GeneratorUspStep
        Where
            --
            usp_id            = @usp_id
            And is_inactive   = 0
            And
            (
                Parent_Number = @Parent_Number
                Or @Parent_Number Is Null
                   And Parent_Number Is Null
            )
        Union All
        Select
            child.usp_id
          , child.Number
          , child.Parent_Number
          , parent.Depth + 1
          , child.Parent_Number As sort
          , parent.Sort         As Parent_sort
          , parent.Root_Sort    As Root_Sort
          , child.is_condition
          , child_PerParent     = parent.child_PerParent
        From
            [uspgenerator].GeneratorUspStep As child
            Inner Join
                tree              As parent
                    On
                    child.Parent_Number = parent.Number
        Where
            --
            child.usp_id          = @usp_id
            And child.is_inactive = 0
        )
  ,
    tree_2
    As
        --tree_2 is required to calculate the correct step order: [RowNumber_PerUsp]
        (
        Select
            --
            tree.usp_id
          , tree.Number
          , RowNumber_PerUsp = Row_Number () Over ( Partition By
                                                        tree.usp_id
                                                    Order By
                                                        tree.Root_Sort
                                                      , tree.Parent_Number
                                                      , tree.Parent_Sort
                                                      , tree.Sort
                                                  )
          , tree.Depth
          , tree.is_condition
          , tree.Root_Sort
          , tree.Parent_Number
          , tree.Parent_Sort
          , tree.Sort
          , tree.child_PerParent
        From
            tree
        )
  ,
    tree_3
    As
        --final query is used to calculate Asc_PerParentChild and Desc_PerParentChild
        --Asc_PerParentChild is the first step per [child_PerParent]
        --if the @Parent_Number has [is_condition] = 1
        --then [child_PerParent] = 1 is the THEN block an [child_PerParent] = 2 is the ELSE block
        --to encapsulate THEN and ELSE block:
        --a 'BEGIN' is required before Asc_PerParentChild = 1
        --a 'END' is required after Desc_PerParentChild = 1
        (
        Select
            --
            *
          , Asc_PerParentChild  = Row_Number () Over ( Partition By usp_id, child_PerParent Order By RowNumber_PerUsp )
          , Desc_PerParentChild = Row_Number () Over ( Partition By usp_id, child_PerParent Order By RowNumber_PerUsp Desc )
        From
            tree_2
        )
    Select
        --
        *
      --[child_PerParent] = 2 is the ELSE-block, if the parent is a condition
      --in front of the ELSE block the 'ELSE' is required
      , is_required_ELSE = Iif(child_PerParent = 2 And Asc_PerParentChild = 1, 1, 0)
    From
        tree_3
);
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '3390291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'FUNCTION'
  , @level1name = N'ftv_GeneratorUspStep_tree';
Go