
/*
--test

declare @json_array nvarchar(max)
set @json_array =
'
[{"class": "Token", "ttype": ["Name"], "is_group": false, "str": "[T1]", "normalized": "[T1]", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Punctuation"], "is_group": false, "str": ".", "normalized": ".", "is_keyword": false, "is_whitespace": false, "children": []}, {"class": "Token", "ttype": ["Name"], "is_group": false, "str": "[Active]", "normalized": "[Active]", "is_keyword": false, "is_whitespace": false, "children": []}]
'

SELECT * from [repo].[ftv_sqlparse_children_pivot](@json_array)

*/
CREATE FUNCTION [repo].[ftv_sqlparse_children_pivot] (
     @json_array NVARCHAR(MAX)) RETURNS TABLE AS RETURN
(
    SELECT
           [child0_class] = JSON_VALUE(@json_array , '$[0].class')
         , [child0_is_group] = JSON_VALUE(@json_array , '$[0].is_group')
         , [child0_is_keyword] = JSON_VALUE(@json_array , '$[0].is_keyword')
         , [child0_normalized] = JSON_VALUE(@json_array , '$[0].normalized')
         , [child0_children] = JSON_VALUE(@json_array , '$[0].children')

         , [child1_class] = JSON_VALUE(@json_array , '$[1].class')
         , [child1_is_group] = JSON_VALUE(@json_array , '$[1].is_group')
         , [child1_is_keyword] = JSON_VALUE(@json_array , '$[1].is_keyword')
         , [child1_normalized] = JSON_VALUE(@json_array , '$[1].normalized')
         , [child1_children] = JSON_VALUE(@json_array , '$[1].children')

         , [child2_class] = JSON_VALUE(@json_array , '$[2].class')
         , [child2_is_group] = JSON_VALUE(@json_array , '$[2].is_group')
         , [child2_is_keyword] = JSON_VALUE(@json_array , '$[2].is_keyword')
         , [child2_normalized] = JSON_VALUE(@json_array , '$[2].normalized')
         , [child2_children] = JSON_VALUE(@json_array , '$[2].children')

         , [child3_class] = JSON_VALUE(@json_array , '$[3].class')
         , [child3_is_group] = JSON_VALUE(@json_array , '$[3].is_group')
         , [child3_is_keyword] = JSON_VALUE(@json_array , '$[3].is_keyword')
         , [child3_normalized] = JSON_VALUE(@json_array , '$[3].normalized')
         , [child3_children] = JSON_VALUE(@json_array , '$[3].children')

         , [child4_class] = JSON_VALUE(@json_array , '$[4].class')
         , [child4_is_group] = JSON_VALUE(@json_array , '$[4].is_group')
         , [child4_is_keyword] = JSON_VALUE(@json_array , '$[4].is_keyword')
         , [child4_normalized] = JSON_VALUE(@json_array , '$[4].normalized')
         , [child4_children] = JSON_VALUE(@json_array , '$[4].children')
)