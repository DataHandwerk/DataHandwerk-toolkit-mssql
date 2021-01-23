
-- Alter Function ftv_sqlparse_with_some_children
CREATE FUNCTION [repo].[ftv_sqlparse_with_some_children] (@json_array nvarchar(max))
RETURNS TABLE
AS RETURN
(
SELECT
       j1.[key] as json_key
	   , j2.*
FROM
     OPENJSON(@json_array) j1 
CROSS APPLY
	OPENJSON(j1.[value])
WITH
(
class nvarchar(500) N'$.class'
,is_group bit N'$.is_group'
,is_keyword bit N'$.is_keyword'
,is_whitespace bit N'$.is_whitespace'
,normalized nvarchar(MAX) N'$.normalized'
,children nvarchar(MAX) N'$.children' AS JSON
--get values of some children
--children[0] is the first children
,child0_class nvarchar(500) N'$.children[0].class'
,child0_is_group bit N'$.children[0].is_group'
,child0_is_keyword bit N'$.children[0].is_keyword'
,child0_is_whitespace bit N'$.children[0].is_whitespace'
,child0_normalized nvarchar(MAX) N'$.children[0].normalized'
,child0_children nvarchar(MAX) N'$.children[0].children' AS JSON

,child1_class nvarchar(500) N'$.children[1].class'
,child1_is_group bit N'$.children[1].is_group'
,child1_is_keyword bit N'$.children[1].is_keyword'
,child1_is_whitespace bit N'$.children[1].is_whitespace'
,child1_normalized nvarchar(MAX) N'$.children[1].normalized'
,child1_children nvarchar(MAX) N'$.children[1].children' AS JSON

,child2_class nvarchar(500) N'$.children[2].class'
,child2_is_group bit N'$.children[2].is_group'
,child2_is_keyword bit N'$.children[2].is_keyword'
,child2_is_whitespace bit N'$.children[2].is_whitespace'
,child2_normalized nvarchar(MAX) N'$.children[2].normalized'
,child2_children nvarchar(MAX) N'$.children[2].children' AS JSON

,child3_class nvarchar(500) N'$.children[3].class'
,child3_is_group bit N'$.children[3].is_group'
,child3_is_keyword bit N'$.children[3].is_keyword'
,child3_is_whitespace bit N'$.children[3].is_whitespace'
,child3_normalized nvarchar(MAX) N'$.children[3].normalized'
,child3_children nvarchar(MAX) N'$.children[3].children' AS JSON

,child4_class nvarchar(500) N'$.children[4].class'
,child4_is_group bit N'$.children[4].is_group'
,child4_is_keyword bit N'$.children[4].is_keyword'
,child4_is_whitespace bit N'$.children[4].is_whitespace'
,child4_normalized nvarchar(MAX) N'$.children[4].normalized'
,child4_children nvarchar(MAX) N'$.children[4].children' AS JSON
) j2

)