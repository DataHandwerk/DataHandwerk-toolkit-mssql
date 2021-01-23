
--in case of an simple identifier like [T1].[aaa]
--get the table part [Identifier_source_table] (before dot) and the column part [Identifier_source_column] (after dot)
CREATE VIEW [repo].[RepoObject__sql_modules_25_IdentifierList_children_IdentifierSplit]
AS
--
SELECT
       [t1].[RepoObject_guid]
     , [t1].[key]
     , [t1].[SysObject_fullname]
     , [t1].[RowNumber_per_Object]
     , [t1].[class]
     , [t1].[normalized]
     , [t1].[T2_class]
     , [t1].[Identifier_alias]
     , [t1].[Identifier_source]
     , [t1].[Identifier_source_class]
     , [t1].[Identifier_source_children]
       --in case of an simple identifier like [T1].[aaa] get the table part (before dot) and the column part (after dot)
     , [Identifier_source_table] = CASE [Identifier_source_class]
                                       WHEN 'Identifier'
                                       THEN CASE
                                                WHEN [T2].[child1_normalized] = '.'
                                                     AND NOT [T2].[child2_normalized] IS NULL
                                                THEN [T2].[child0_normalized]
                                                WHEN [T2].[child1_normalized] IS NULL
                                                THEN NULL
                                            END
                                   END
     , [Identifier_source_column] = CASE [Identifier_source_class]
                                        WHEN 'Identifier'
                                        THEN CASE
                                                 WHEN [T2].[child1_normalized] = '.'
                                                      AND NOT [T2].[child2_normalized] IS NULL
                                                 THEN [T2].[child2_normalized]
                                                 WHEN [T2].[child1_normalized] IS NULL
                                                 THEN [T2].[child0_normalized]
                                             END
                                    END
--, [T2].[child0_class]
--, [T2].[child0_is_group]
--, [T2].[child0_is_keyword]
--, [T2].[child0_normalized]
--, [T2].[child0_children]
--, [T2].[child1_class]
--, [T2].[child1_is_group]
--, [T2].[child1_is_keyword]
--, [T2].[child1_normalized]
--, [T2].[child1_children]
--, [T2].[child2_class]
--, [T2].[child2_is_group]
--, [T2].[child2_is_keyword]
--, [T2].[child2_normalized]
--, [T2].[child2_children]
--, [T2].[child3_class]
--, [T2].[child3_is_group]
--, [T2].[child3_is_keyword]
--, [T2].[child3_normalized]
--, [T2].[child3_children]
--, [T2].[child4_class]
--, [T2].[child4_is_group]
--, [T2].[child4_is_keyword]
--, [T2].[child4_normalized]
--, [T2].[child4_children]
FROM
     [repo].[RepoObject__sql_modules_24_IdentifierList_children] AS T1
     CROSS APPLY
     [repo].[ftv_sqlparse_children_pivot](T1.[Identifier_source_children]) AS T2