
Create View reference.additional_Reference_wo_columns_from_properties_src
As
Select
    Distinct
    referenced_AntoraComponent  = pvt.[1]
  , referenced_AntoraModule     = pvt.[2]
  , referenced_Schema           = pvt.[3]
  , referenced_Object           = pvt.[4]
  --, referenced_Column           = pvt.[5]
  , referencing_AntoraComponent = pvt.[6]
  , referencing_AntoraModule    = pvt.[7]
  , referencing_Schema          = pvt.[8]
  , referencing_Object          = pvt.[9]
--, referencing_Column          = pvt.[10]
From
(
    Select
        RepoObject_guid
      , property_name
      , LinePerGuidProperty
      --, property_value
      --, value_line
      --, value_line_len
      , value_line_row
      , RowPerGuidPropertyLine
    From
        property.RepoObjectProperty_SelectedPropertyName_split
) As tbl
Pivot
(
    Max(value_line_row)
    For RowPerGuidPropertyLine In
    ( [1], [2], [3], [4], [5], [6], [7], [8], [9], [10] )
) As pvt
Where
    property_name = 'additional_reference_csv'
--And pvt.[5]   <> 'null'
--And pvt.[5]   <> ''
--And pvt.[10]  <> 'null'
--And pvt.[10]  <> ''
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e07b9f91-ae1f-ec11-8523-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_wo_columns_from_properties_src', @level2type = N'COLUMN', @level2name = N'referencing_Object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'df7b9f91-ae1f-ec11-8523-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_wo_columns_from_properties_src', @level2type = N'COLUMN', @level2name = N'referencing_Schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'de7b9f91-ae1f-ec11-8523-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_wo_columns_from_properties_src', @level2type = N'COLUMN', @level2name = N'referencing_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dd7b9f91-ae1f-ec11-8523-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_wo_columns_from_properties_src', @level2type = N'COLUMN', @level2name = N'referencing_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dc7b9f91-ae1f-ec11-8523-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_wo_columns_from_properties_src', @level2type = N'COLUMN', @level2name = N'referenced_Object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'db7b9f91-ae1f-ec11-8523-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_wo_columns_from_properties_src', @level2type = N'COLUMN', @level2name = N'referenced_Schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'da7b9f91-ae1f-ec11-8523-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_wo_columns_from_properties_src', @level2type = N'COLUMN', @level2name = N'referenced_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd97b9f91-ae1f-ec11-8523-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_wo_columns_from_properties_src', @level2type = N'COLUMN', @level2name = N'referenced_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '87e48c87-ae1f-ec11-8523-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_wo_columns_from_properties_src';

