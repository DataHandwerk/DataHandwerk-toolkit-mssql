/*
soure

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
     , [T2].[json_key]
     , [T2].[is_group]
     , [T2].[is_keyword]
     , [T2].[is_whitespace]
     , [T2].[normalized]
     , [T2].[children]
     , [T2].[child0_class]
     , [T2].[child0_is_group]
     , [T2].[child0_is_keyword]
     , [T2].[child0_is_whitespace]
     , [T2].[child0_normalized]
     , [T2].[child0_children]
     , [T2].[child1_class]
     , [T2].[child1_is_group]
     , [T2].[child1_is_keyword]
     , [T2].[child1_is_whitespace]
     , [T2].[child1_normalized]
     , [T2].[child1_children]
     , [T2].[child2_class]
     , [T2].[child2_is_group]
     , [T2].[child2_is_keyword]
     , [T2].[child2_is_whitespace]
     , [T2].[child2_normalized]
     , [T2].[child2_children]
     , [T2].[child3_class]
     , [T2].[child3_is_group]
     , [T2].[child3_is_keyword]
     , [T2].[child3_is_whitespace]
     , [T2].[child3_normalized]
     , [T2].[child3_children]
     , [T2].[child4_class]
     , [T2].[child4_is_group]
     , [T2].[child4_is_keyword]
     , [T2].[child4_is_whitespace]
     , [T2].[child4_normalized]
     , [T2].[child4_children]
FROM
     [repo].[RepoObject__sql_modules_20_statement_children] AS T1
     CROSS APPLY
     [repo].[ftv_sqlparse_with_some_children](T1.children) AS T2
WHERE  [T1].[class] = 'IdentifierList'
       AND [T2].[class] IN
                           (
                           'Identifier' , 'Comparison'
                           )



test:

declare @jsonstr nvarchar(max)
set @jsonstr =
'
[{"class": "Identifier", "ttype": null, "is_group": true, "str": "s.SupplierID", "normalized": "s.SupplierID", "is_keyword": false, "is_whitespace": false, "children": [{"class": "Token", "ttype": ["Name"], "is_group": false, "str": "s", "normalized": "s", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ".", "normalized": ".", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Name"], "is_group": false, "str": "SupplierID", "normalized": "SupplierID", "is_keyword": false, "is_whitespace": false, "children": []}]}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ",", "normalized": ",", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Identifier", "ttype": null, "is_group": true, "str": "s.SupplierName", "normalized": "s.SupplierName", "is_keyword": false, "is_whitespace": false, "children": [{"class": "Token", "ttype": ["Name"], "is_group": false, "str": "s", "normalized": "s", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ".", "normalized": ".", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Name"], "is_group": false, "str": "SupplierName", "normalized": "SupplierName", "is_keyword": false, "is_whitespace": false, "children": []}]}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ",", "normalized": ",", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Identifier", "ttype": null, "is_group": true, "str": "sc.SupplierCategoryName", "normalized": "sc.SupplierCategoryName", "is_keyword": false, "is_whitespace": false, "children": [{"class": "Token", "ttype": ["Name"], "is_group": false, "str": "sc", "normalized": "sc", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ".", "normalized": ".", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Name"], "is_group": false, "str": "SupplierCategoryName", "normalized": "SupplierCategoryName", "is_keyword": false, "is_whitespace": false, "children": []}]}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ",", "normalized": ",", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Identifier", "ttype": null, "is_group": true, "str": "pp.FullName AS PrimaryContact", "normalized": "pp.FullName", "is_keyword": false, "is_whitespace": false, "children": [{"class": "Token", "ttype": ["Name"], "is_group": false, "str": "pp", "normalized": "pp", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ".", "normalized": ".", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Name"], "is_group": false, "str": "FullName", "normalized": "FullName", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Keyword"], "is_group": false, "str": "AS", "normalized": "AS", "is_keyword": true, "is_whitespace": false, "children": []}, {"class": "Identifier", "ttype": null, "is_group": true, "str": "PrimaryContact", "normalized": "PrimaryContact", "is_keyword": false, "is_whitespace": false, "children": [{"class": "Token", "ttype": ["Name"], "is_group": false, "str": "PrimaryContact", "normalized": "PrimaryContact", "is_keyword": false, "is_whitespace": false, "children": []}]}]}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ",", "normalized": ",", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Identifier", "ttype": null, "is_group": true, "str": "ap.FullName AS AlternateContact", "normalized": "ap.FullName", "is_keyword": false, "is_whitespace": false, "children": [{"class": "Token", "ttype": ["Name"], "is_group": false, "str": "ap", "normalized": "ap", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ".", "normalized": ".", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Name"], "is_group": false, "str": "FullName", "normalized": "FullName", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Keyword"], "is_group": false, "str": "AS", "normalized": "AS", "is_keyword": true, "is_whitespace": false, "children": []}, {"class": "Identifier", "ttype": null, "is_group": true, "str": "AlternateContact", "normalized": "AlternateContact", "is_keyword": false, "is_whitespace": false, "children": [{"class": "Token", "ttype": ["Name"], "is_group": false, "str": "AlternateContact", "normalized": "AlternateContact", "is_keyword": false, "is_whitespace": false, "children": []}]}]}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ",", "normalized": ",", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Identifier", "ttype": null, "is_group": true, "str": "s.PhoneNumber", "normalized": "s.PhoneNumber", "is_keyword": false, "is_whitespace": false, "children": [{"class": "Token", "ttype": ["Name"], "is_group": false, "str": "s", "normalized": "s", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ".", "normalized": ".", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Name"], "is_group": false, "str": "PhoneNumber", "normalized": "PhoneNumber", "is_keyword": false, "is_whitespace": false, "children": []}]}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ",", "normalized": ",", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Identifier", "ttype": null, "is_group": true, "str": "s.FaxNumber", "normalized": "s.FaxNumber", "is_keyword": false, "is_whitespace": false, "children": [{"class": "Token", "ttype": ["Name"], "is_group": false, "str": "s", "normalized": "s", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ".", "normalized": ".", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Name"], "is_group": false, "str": "FaxNumber", "normalized": "FaxNumber", "is_keyword": false, "is_whitespace": false, "children": []}]}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ",", "normalized": ",", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Identifier", "ttype": null, "is_group": true, "str": "s.WebsiteURL", "normalized": "s.WebsiteURL", "is_keyword": false, "is_whitespace": false, "children": [{"class": "Token", "ttype": ["Name"], "is_group": false, "str": "s", "normalized": "s", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ".", "normalized": ".", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Name"], "is_group": false, "str": "WebsiteURL", "normalized": "WebsiteURL", "is_keyword": false, "is_whitespace": false, "children": []}]}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ",", "normalized": ",", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Identifier", "ttype": null, "is_group": true, "str": "dm.DeliveryMethodName AS DeliveryMethod", "normalized": "dm.DeliveryMethodName", "is_keyword": false, "is_whitespace": false, "children": [{"class": "Token", "ttype": ["Name"], "is_group": false, "str": "dm", "normalized": "dm", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ".", "normalized": ".", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Name"], "is_group": false, "str": "DeliveryMethodName", "normalized": "DeliveryMethodName", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Keyword"], "is_group": false, "str": "AS", "normalized": "AS", "is_keyword": true, "is_whitespace": false, "children": []}, {"class": "Identifier", "ttype": null, "is_group": true, "str": "DeliveryMethod", "normalized": "DeliveryMethod", "is_keyword": false, "is_whitespace": false, "children": [{"class": "Token", "ttype": ["Name"], "is_group": false, "str": "DeliveryMethod", "normalized": "DeliveryMethod", "is_keyword": false, "is_whitespace": false, "children": []}]}]}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ",", "normalized": ",", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Identifier", "ttype": null, "is_group": true, "str": "c.CityName AS CityName", "normalized": "c.CityName", "is_keyword": false, "is_whitespace": false, "children": [{"class": "Token", "ttype": ["Name"], "is_group": false, "str": "c", "normalized": "c", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ".", "normalized": ".", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Name"], "is_group": false, "str": "CityName", "normalized": "CityName", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Keyword"], "is_group": false, "str": "AS", "normalized": "AS", "is_keyword": true, "is_whitespace": false, "children": []}, {"class": "Identifier", "ttype": null, "is_group": true, "str": "CityName", "normalized": "CityName", "is_keyword": false, "is_whitespace": false, "children": [{"class": "Token", "ttype": ["Name"], "is_group": false, "str": "CityName", "normalized": "CityName", "is_keyword": false, "is_whitespace": false, "children": []}]}]}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ",", "normalized": ",", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Identifier", "ttype": null, "is_group": true, "str": "s.DeliveryLocation AS DeliveryLocation", "normalized": "s.DeliveryLocation", "is_keyword": false, "is_whitespace": false, "children": [{"class": "Token", "ttype": ["Name"], "is_group": false, "str": "s", "normalized": "s", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ".", "normalized": ".", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Name"], "is_group": false, "str": "DeliveryLocation", "normalized": "DeliveryLocation", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Keyword"], "is_group": false, "str": "AS", "normalized": "AS", "is_keyword": true, "is_whitespace": false, "children": []}, {"class": "Identifier", "ttype": null, "is_group": true, "str": "DeliveryLocation", "normalized": "DeliveryLocation", "is_keyword": false, "is_whitespace": false, "children": [{"class": "Token", "ttype": ["Name"], "is_group": false, "str": "DeliveryLocation", "normalized": "DeliveryLocation", "is_keyword": false, "is_whitespace": false, "children": []}]}]}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ",", "normalized": ",", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Identifier", "ttype": null, "is_group": true, "str": "s.SupplierReference", "normalized": "s.SupplierReference", "is_keyword": false, "is_whitespace": false, "children": [{"class": "Token", "ttype": ["Name"], "is_group": false, "str": "s", "normalized": "s", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ".", "normalized": ".", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Name"], "is_group": false, "str": "SupplierReference", "normalized": "SupplierReference", "is_keyword": false, "is_whitespace": false, "children": []}]}]
'
select *
    FROM
         OPENJSON(@jsonstr) AS j1

select * from [repo].[ftv_sqlparse_IdentifierList](@jsonstr)

select *
FROM
     [repo].[RepoObject__sql_modules_20_statement_children] AS T1
     CROSS APPLY
     [repo].[ftv_sqlparse_IdentifierList](T1.children) AS T2
WHERE  [T1].[class] = 'IdentifierList'
and isjson(T1.children) = 1



*/
--@jsonstr should be 'children' element of en entry class IdentifierList
CREATE Function [sqlparse].ftv_sqlparse_IdentifierList__TestOnly
(
    @jsonstr NVarchar(Max)
)
Returns Table
As
Return
(
    Select
        --j1.*
        --,
        --  [T1].[RepoObject_guid]
        --, [T1].[key]
        --, [T1].[SysObject_fullname]
        --, [T1].[RowNumber_per_Object]
        --, [T1].[class]
        --  --, [T1].[is_group]
        --  --, [T1].[is_keyword]
        --  --, [T1].[is_whitespace]
        --, [T1].[normalized]
        --  --, [T1].[children]
        --, 
        T2_class                   = T2.class
      , Identifier_alias           = Case T2.class
                                         When 'Identifier'
                                             Then
                                             Case
                                                 When T2.child1_normalized = 'AS'
                                                     Then
                                                     T2.child2_normalized
                                                 When T2.child3_normalized = 'AS'
                                                     Then
                                                     T2.child4_normalized
                                             End
                                         When 'Comparison'
                                             Then
                                             Case
                                                 When T2.child1_normalized = '='
                                                     Then
                                                     T2.child0_normalized
                                             End
                                     End
      , Identifier_source          = Case T2.class
                                         When 'Identifier'
                                             Then
                                             Case T2.child0_class
                                                 When 'Token'
                                                     Then
                                                     T2.normalized
                                                 When 'Function'
                                                     Then
                                                     T2.child0_normalized
                                             End
                                         When 'Comparison'
                                             Then
                                             Case
                                                 When T2.child1_normalized = '='
                                                     Then
                                                     T2.child2_normalized
                                             End
                                     End
      , Identifier_source_class    = Case T2.class
                                         When 'Identifier'
                                             Then
                                             Case T2.child0_class
                                                 When 'Token'
                                                     Then
                                                     T2.class
                                                 When 'Function'
                                                     Then
                                                     T2.child0_class
                                             End
                                         When 'Comparison'
                                             Then
                                             Case
                                                 When T2.child1_normalized = '='
                                                     Then
                                                     T2.child2_class
                                             End
                                     End
      , Identifier_source_children = Case T2.class
                                         When 'Identifier'
                                             Then
                                             Case T2.child0_class
                                                 When 'Token'
                                                     Then
                                                     T2.children
                                                 When 'Function'
                                                     Then
                                                     T2.child0_children
                                             End
                                         When 'Comparison'
                                             Then
                                             Case
                                                 When T2.child1_normalized = '='
                                                     Then
                                                     T2.child2_children
                                             End
                                     End
    --     , [T2].[json_key]
    --     , [T2].[is_group]
    --     , [T2].[is_keyword]
    --     , [T2].[is_whitespace]
    --     , [T2].[normalized]
    --     , [T2].[children]
    --     , [T2].[child0_class]
    --     , [T2].[child0_is_group]
    --     , [T2].[child0_is_keyword]
    --     , [T2].[child0_is_whitespace]
    --     , [T2].[child0_normalized]
    --     , [T2].[child0_children]
    --     , [T2].[child1_class]
    --     , [T2].[child1_is_group]
    --     , [T2].[child1_is_keyword]
    --     , [T2].[child1_is_whitespace]
    --     , [T2].[child1_normalized]
    --     , [T2].[child1_children]
    --     , [T2].[child2_class]
    --     , [T2].[child2_is_group]
    --     , [T2].[child2_is_keyword]
    --     , [T2].[child2_is_whitespace]
    --     , [T2].[child2_normalized]
    --     , [T2].[child2_children]
    --     , [T2].[child3_class]
    --     , [T2].[child3_is_group]
    --     , [T2].[child3_is_keyword]
    --     , [T2].[child3_is_whitespace]
    --     , [T2].[child3_normalized]
    --     , [T2].[child3_children]
    --     , [T2].[child4_class]
    --     , [T2].[child4_is_group]
    --     , [T2].[child4_is_keyword]
    --     , [T2].[child4_is_whitespace]
    --     , [T2].[child4_normalized]
    --     , [T2].[child4_children]
    ----FROM
    ----     [repo].[RepoObject__sql_modules_20_statement_children] AS T1
    From --
        --     OPENJSON(@jsonstr) AS j1
        --     CROSS APPLY
        [sqlparse].ftv_sqlparse_with_some_children ( @jsonstr ) As T2
    Where
        T2.class In
        ( 'Identifier', 'Comparison' )
);
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '5190291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'FUNCTION'
  , @level1name = N'ftv_sqlparse_IdentifierList__TestOnly';
Go
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [sqlparse].[ftv_sqlparse_with_some_children]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'FUNCTION', @level1name = N'ftv_sqlparse_IdentifierList__TestOnly';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:sqlparse.ftv_sqlparse_with_some_children.adoc[]', @level0type = N'SCHEMA', @level0name = N'sqlparse', @level1type = N'FUNCTION', @level1name = N'ftv_sqlparse_IdentifierList__TestOnly';

