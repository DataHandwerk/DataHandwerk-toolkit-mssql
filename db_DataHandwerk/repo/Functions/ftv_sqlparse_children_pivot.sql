/*
--test

declare @json_array nvarchar(max)
set @json_array =
'
[{"class": "Token", "ttype": ["Name"], "is_group": false, "str": "[T1]", "normalized": "[T1]", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ".", "normalized": ".", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Name"], "is_group": false, "str": "[Active]", "normalized": "[Active]", "is_keyword": false, "is_whitespace": false, "children": []}]
'

SELECT * from [repo].[ftv_sqlparse_children_pivot](@json_array)

*/
Create Function repo.ftv_sqlparse_children_pivot
(
    @json_array NVarchar(Max)
)
Returns Table
As
Return
(
    Select
        child0_class      = Json_Value ( @json_array, '$[0].class' )
      , child0_is_group   = Json_Value ( @json_array, '$[0].is_group' )
      , child0_is_keyword = Json_Value ( @json_array, '$[0].is_keyword' )
      , child0_normalized = Json_Value ( @json_array, '$[0].normalized' )
      , child0_children   = Json_Value ( @json_array, '$[0].children' )
      , child1_class      = Json_Value ( @json_array, '$[1].class' )
      , child1_is_group   = Json_Value ( @json_array, '$[1].is_group' )
      , child1_is_keyword = Json_Value ( @json_array, '$[1].is_keyword' )
      , child1_normalized = Json_Value ( @json_array, '$[1].normalized' )
      , child1_children   = Json_Value ( @json_array, '$[1].children' )
      , child2_class      = Json_Value ( @json_array, '$[2].class' )
      , child2_is_group   = Json_Value ( @json_array, '$[2].is_group' )
      , child2_is_keyword = Json_Value ( @json_array, '$[2].is_keyword' )
      , child2_normalized = Json_Value ( @json_array, '$[2].normalized' )
      , child2_children   = Json_Value ( @json_array, '$[2].children' )
      , child3_class      = Json_Value ( @json_array, '$[3].class' )
      , child3_is_group   = Json_Value ( @json_array, '$[3].is_group' )
      , child3_is_keyword = Json_Value ( @json_array, '$[3].is_keyword' )
      , child3_normalized = Json_Value ( @json_array, '$[3].normalized' )
      , child3_children   = Json_Value ( @json_array, '$[3].children' )
      , child4_class      = Json_Value ( @json_array, '$[4].class' )
      , child4_is_group   = Json_Value ( @json_array, '$[4].is_group' )
      , child4_is_keyword = Json_Value ( @json_array, '$[4].is_keyword' )
      , child4_normalized = Json_Value ( @json_array, '$[4].normalized' )
      , child4_children   = Json_Value ( @json_array, '$[4].children' )
);
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '2d90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'FUNCTION'
  , @level1name = N'ftv_sqlparse_children_pivot';
