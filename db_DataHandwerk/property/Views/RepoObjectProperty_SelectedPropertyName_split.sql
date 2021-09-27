/*
<<property_start>>MS_Description
* property_value of xref:dhw:sqldb:property.RepoObjectProperty.adoc[] is splitted in lines and these lines are splitted in rows
* Where property_name = 'additional_reference_csv'
<<property_end>>
*/
CREATE View property.RepoObjectProperty_SelectedPropertyName_split
As
Select
    RepoObject_guid
  , property_name
  , property_value
  , value_line             = Value2LineSplit.value
  , value_line_row         = Line2RowSplit.value
  , value_line_len         = Len ( Value2LineSplit.value )
  , LinePerGuidProperty    = Dense_Rank () Over ( Partition By
                                                      RepoObject_guid
                                                    , property_name
                                                  Order By
                                                      Value2LineSplit.value
                                                )
  , RowPerGuidPropertyLine = Row_Number () Over ( Partition By
                                                      RepoObject_guid
                                                    , property_name
                                                    , Value2LineSplit.value
                                                  Order By
                                                      Value2LineSplit.value
                                                )
From
    property.RepoObjectProperty
    --String_Split separator must be one (1) char (varchar, nchar, nvarchar)
    --we remove Char(13)
    --Windows CR LF 13 10
    --Unix LF 10
    Cross Apply String_Split(property_value, Char ( 10 )) As Value2LineSplit
    Cross Apply String_Split(Value2LineSplit.value, ',') As Line2RowSplit
Where
    property_name                     = 'additional_reference_csv'
    And Len ( Value2LineSplit.value ) > 1
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dea68210-a51f-ec11-8523-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_SelectedPropertyName_split', @level2type = N'COLUMN', @level2name = N'RowPerGuidPropertyLine';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dda68210-a51f-ec11-8523-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_SelectedPropertyName_split', @level2type = N'COLUMN', @level2name = N'LinePerGuidProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dca68210-a51f-ec11-8523-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_SelectedPropertyName_split', @level2type = N'COLUMN', @level2name = N'value_line_len';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dba68210-a51f-ec11-8523-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_SelectedPropertyName_split', @level2type = N'COLUMN', @level2name = N'value_line_row';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'daa68210-a51f-ec11-8523-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_SelectedPropertyName_split', @level2type = N'COLUMN', @level2name = N'value_line';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd9a68210-a51f-ec11-8523-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_SelectedPropertyName_split', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd8a68210-a51f-ec11-8523-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_SelectedPropertyName_split', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd7a68210-a51f-ec11-8523-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_SelectedPropertyName_split', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '49efd408-a51f-ec11-8523-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_SelectedPropertyName_split';

