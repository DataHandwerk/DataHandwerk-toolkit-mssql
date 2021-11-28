
/*
all used [property_name] in any Measure
*/

create View property.PropertyName_Measure
As
Select
    Distinct
    --
    property_name = Trim ( property_name )
From
    property.MeasureProperty
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '807f7d5a-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'PropertyName_Measure', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f81ea651-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'PropertyName_Measure';

