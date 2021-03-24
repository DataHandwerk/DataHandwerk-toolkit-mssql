CREATE FUNCTION [repo].[ftv_sqlparse_with_some_children] (@json_array NVARCHAR(MAX))
RETURNS TABLE
AS
RETURN (
  SELECT j1.[key] AS json_key
   , j2.*
  FROM OPENJSON(@json_array) j1
  CROSS APPLY OPENJSON(j1.[value]) WITH (
    class NVARCHAR(500) N'$.class'
    , is_group BIT N'$.is_group'
    , is_keyword BIT N'$.is_keyword'
    , is_whitespace BIT N'$.is_whitespace'
    , normalized NVARCHAR(MAX) N'$.normalized'
    , children NVARCHAR(MAX) N'$.children' AS JSON
    --get values of some children
    --children[0] is the first children
    , child0_class NVARCHAR(500) N'$.children[0].class'
    , child0_is_group BIT N'$.children[0].is_group'
    , child0_is_keyword BIT N'$.children[0].is_keyword'
    , child0_is_whitespace BIT N'$.children[0].is_whitespace'
    , child0_normalized NVARCHAR(MAX) N'$.children[0].normalized'
    , child0_children NVARCHAR(MAX) N'$.children[0].children' AS JSON
    , child1_class NVARCHAR(500) N'$.children[1].class'
    , child1_is_group BIT N'$.children[1].is_group'
    , child1_is_keyword BIT N'$.children[1].is_keyword'
    , child1_is_whitespace BIT N'$.children[1].is_whitespace'
    , child1_normalized NVARCHAR(MAX) N'$.children[1].normalized'
    , child1_children NVARCHAR(MAX) N'$.children[1].children' AS JSON
    , child2_class NVARCHAR(500) N'$.children[2].class'
    , child2_is_group BIT N'$.children[2].is_group'
    , child2_is_keyword BIT N'$.children[2].is_keyword'
    , child2_is_whitespace BIT N'$.children[2].is_whitespace'
    , child2_normalized NVARCHAR(MAX) N'$.children[2].normalized'
    , child2_children NVARCHAR(MAX) N'$.children[2].children' AS JSON
    , child3_class NVARCHAR(500) N'$.children[3].class'
    , child3_is_group BIT N'$.children[3].is_group'
    , child3_is_keyword BIT N'$.children[3].is_keyword'
    , child3_is_whitespace BIT N'$.children[3].is_whitespace'
    , child3_normalized NVARCHAR(MAX) N'$.children[3].normalized'
    , child3_children NVARCHAR(MAX) N'$.children[3].children' AS JSON
    , child4_class NVARCHAR(500) N'$.children[4].class'
    , child4_is_group BIT N'$.children[4].is_group'
    , child4_is_keyword BIT N'$.children[4].is_keyword'
    , child4_is_whitespace BIT N'$.children[4].is_whitespace'
    , child4_normalized NVARCHAR(MAX) N'$.children[4].normalized'
    , child4_children NVARCHAR(MAX) N'$.children[4].children' AS JSON
    ) j2
  )

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2f90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'FUNCTION', @level1name = N'ftv_sqlparse_with_some_children';

