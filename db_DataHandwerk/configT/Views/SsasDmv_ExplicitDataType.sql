/*
it is hard to find oficial source, I found something here:

https://www.biinsight.com/automate-testing-ssas-tabular-models/#more-5909

*/
Create   View configT.SsasDmv_ExplicitDataType
As
Select
    ExplicitDataType     = 2
  , ExplicitDataTypeName = 'String'
Union All
Select
    ExplicitDataType     = 6
  , ExplicitDataTypeName = 'Int64'
Union All
Select
    ExplicitDataType     = 8
  , ExplicitDataTypeName = 'Double'
Union All
Select
    ExplicitDataType     = 9
  , ExplicitDataTypeName = 'DateTime'
Union All
Select
    ExplicitDataType     = 10
  , ExplicitDataTypeName = 'Decimal'
Union All
Select
    ExplicitDataType     = 11
  , ExplicitDataTypeName = 'Boolean'
Union All
Select
    ExplicitDataType     = 17
  , ExplicitDataTypeName = 'Binary'
Union All
Select
    ExplicitDataType     = 19
  , ExplicitDataTypeName = 'Unknown (column is in Error state)'
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '92d59301-2c07-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'SsasDmv_ExplicitDataType', @level2type = N'COLUMN', @level2name = N'ExplicitDataTypeName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '91d59301-2c07-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'SsasDmv_ExplicitDataType', @level2type = N'COLUMN', @level2name = N'ExplicitDataType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9450ddf7-2b07-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'SsasDmv_ExplicitDataType';

