Create Function [sqlparse].ftv_sqlparse_with_some_children
(
    @json_array NVarchar(Max)
)
Returns Table
As
Return
(
    Select
        j1.[Key] As json_key
      , j2.*
    From
        OpenJson ( @json_array ) j1
        Cross Apply
        OpenJson ( j1.Value )
        With
        (
            class NVarchar ( 500 ) N'$.class'
          , is_group Bit N'$.is_group'
          , is_keyword Bit N'$.is_keyword'
          , is_whitespace Bit N'$.is_whitespace'
          , normalized NVarchar ( Max ) N'$.normalized'
          , children NVarchar ( Max ) N'$.children' As Json
          --get values of some children
          --children[0] is the first children
          , child0_class NVarchar ( 500 ) N'$.children[0].class'
          , child0_is_group Bit N'$.children[0].is_group'
          , child0_is_keyword Bit N'$.children[0].is_keyword'
          , child0_is_whitespace Bit N'$.children[0].is_whitespace'
          , child0_normalized NVarchar ( Max ) N'$.children[0].normalized'
          , child0_children NVarchar ( Max ) N'$.children[0].children' As Json
          , child1_class NVarchar ( 500 ) N'$.children[1].class'
          , child1_is_group Bit N'$.children[1].is_group'
          , child1_is_keyword Bit N'$.children[1].is_keyword'
          , child1_is_whitespace Bit N'$.children[1].is_whitespace'
          , child1_normalized NVarchar ( Max ) N'$.children[1].normalized'
          , child1_children NVarchar ( Max ) N'$.children[1].children' As Json
          , child2_class NVarchar ( 500 ) N'$.children[2].class'
          , child2_is_group Bit N'$.children[2].is_group'
          , child2_is_keyword Bit N'$.children[2].is_keyword'
          , child2_is_whitespace Bit N'$.children[2].is_whitespace'
          , child2_normalized NVarchar ( Max ) N'$.children[2].normalized'
          , child2_children NVarchar ( Max ) N'$.children[2].children' As Json
          , child3_class NVarchar ( 500 ) N'$.children[3].class'
          , child3_is_group Bit N'$.children[3].is_group'
          , child3_is_keyword Bit N'$.children[3].is_keyword'
          , child3_is_whitespace Bit N'$.children[3].is_whitespace'
          , child3_normalized NVarchar ( Max ) N'$.children[3].normalized'
          , child3_children NVarchar ( Max ) N'$.children[3].children' As Json
          , child4_class NVarchar ( 500 ) N'$.children[4].class'
          , child4_is_group Bit N'$.children[4].is_group'
          , child4_is_keyword Bit N'$.children[4].is_keyword'
          , child4_is_whitespace Bit N'$.children[4].is_whitespace'
          , child4_normalized NVarchar ( Max ) N'$.children[4].normalized'
          , child4_children NVarchar ( Max ) N'$.children[4].children' As Json
        )                        j2
);
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '2f90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'FUNCTION'
  , @level1name = N'ftv_sqlparse_with_some_children';
