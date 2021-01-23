
CREATE VIEW [repo].[RepoObject_SqlModules_24_IdentifierList_children]
AS
--
SELECT
       [T1].[RepoObject_guid]
     , [T1].[key]
     , [T1].[SysObject_fullname]
     , [T1].[RowNumber_per_Object]
     , [T1].[class]
       --, [T1].[is_group]
       --, [T1].[is_keyword]
       --, [T1].[is_whitespace]
     , [T1].[normalized]
       --, [T1].[children]
     , [T2_class] = [T2].[class]
     , [Identifier_alias] = CASE [T2].[class]
                                WHEN 'Identifier'
                                THEN CASE
                                         WHEN [T2].[child1_normalized] = 'AS'
                                         THEN [T2].[child2_normalized]
                                         WHEN [T2].[child3_normalized] = 'AS'
                                         THEN [T2].[child4_normalized]
                                     END
                                WHEN 'Comparison'
                                THEN CASE
                                         WHEN [T2].[child1_normalized] = '='
                                         THEN [T2].[child0_normalized]
                                     END
                            END
     , [Identifier_source] = CASE [T2].[class]
                                 WHEN 'Identifier'
                                 THEN CASE [T2].[child0_class]
                                          WHEN 'Token'
                                          THEN [T2].[normalized]
                                          WHEN 'Function'
                                          THEN [T2].[child0_normalized]
                                      END
                                 WHEN 'Comparison'
                                 THEN CASE
                                          WHEN [T2].[child1_normalized] = '='
                                          THEN [T2].[child2_normalized]
                                      END
                             END
     , [Identifier_source_class] = CASE [T2].[class]
                                       WHEN 'Identifier'
                                       THEN CASE [T2].[child0_class]
                                                WHEN 'Token'
                                                THEN [T2].[class]
                                                WHEN 'Function'
                                                THEN [T2].[child0_class]
                                            END
                                       WHEN 'Comparison'
                                       THEN CASE
                                                WHEN [T2].[child1_normalized] = '='
                                                THEN [T2].[child2_class]
                                            END
                                   END
     , [Identifier_source_children] = CASE [T2].[class]
                                          WHEN 'Identifier'
                                          THEN CASE [T2].[child0_class]
                                                   WHEN 'Token'
                                                   THEN [T2].[children]
                                                   WHEN 'Function'
                                                   THEN [T2].[child0_children]
                                               END
                                          WHEN 'Comparison'
                                          THEN CASE
                                                   WHEN [T2].[child1_normalized] = '='
                                                   THEN [T2].[child2_children]
                                               END
                                      END
--, [T2].[json_key]
--, [T2].[is_group]
--, [T2].[is_keyword]
--, [T2].[is_whitespace]
--, [T2].[normalized]
--, [T2].[children]
--, [T2].[child0_class]
--, [T2].[child0_is_group]
--, [T2].[child0_is_keyword]
--, [T2].[child0_is_whitespace]
--, [T2].[child0_normalized]
--, [T2].[child0_children]
--, [T2].[child1_class]
--, [T2].[child1_is_group]
--, [T2].[child1_is_keyword]
--, [T2].[child1_is_whitespace]
--, [T2].[child1_normalized]
--, [T2].[child1_children]
--, [T2].[child2_class]
--, [T2].[child2_is_group]
--, [T2].[child2_is_keyword]
--, [T2].[child2_is_whitespace]
--, [T2].[child2_normalized]
--, [T2].[child2_children]
--, [T2].[child3_class]
--, [T2].[child3_is_group]
--, [T2].[child3_is_keyword]
--, [T2].[child3_is_whitespace]
--, [T2].[child3_normalized]
--, [T2].[child3_children]
--, [T2].[child4_class]
--, [T2].[child4_is_group]
--, [T2].[child4_is_keyword]
--, [T2].[child4_is_whitespace]
--, [T2].[child4_normalized]
--, [T2].[child4_children]
FROM
     [repo].[RepoObject_SqlModules_20_statement_children] AS T1
     CROSS APPLY
     [repo].[ftv_sqlparse_with_some_children](T1.children) AS T2
WHERE  [T1].[class] = 'IdentifierList'
       AND [T2].[class] IN
                           (
                           'Identifier' , 'Comparison'
                           )
       AND [T2].[class] = 'Comparison'