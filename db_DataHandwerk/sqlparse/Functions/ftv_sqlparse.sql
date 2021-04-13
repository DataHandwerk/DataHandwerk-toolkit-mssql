Create Function [sqlparse].ftv_sqlparse
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
        ----get values of some children
        ----children[0] is the first children
        --,child0_class nvarchar(500) N'$.children[0].class'
        --,child0_is_group bit N'$.children[0].is_group'
        --,child0_is_keyword bit N'$.children[0].is_keyword'
        --,child0_is_whitespace bit N'$.children[0].is_whitespace'
        --,child0_normalized nvarchar(MAX) N'$.children[0].normalized'
        --,child0_children nvarchar(MAX) N'$.children[0].children' AS JSON
        --,child1_class nvarchar(500) N'$.children[1].class'
        --,child1_is_group bit N'$.children[1].is_group'
        --,child1_is_keyword bit N'$.children[1].is_keyword'
        --,child1_is_whitespace bit N'$.children[1].is_whitespace'
        --,child1_normalized nvarchar(MAX) N'$.children[1].normalized'
        --,child1_children nvarchar(MAX) N'$.children[1].children' AS JSON
        )                        j2
);
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '2b90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'FUNCTION'
  , @level1name = N'ftv_sqlparse';
