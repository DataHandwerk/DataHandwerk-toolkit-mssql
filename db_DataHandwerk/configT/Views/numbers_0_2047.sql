

/*
<<property_start>>Description
<<property_end>>
*/
CREATE View [configT].[numbers_0_2047]
As
Select
    number
  , type
  , low
  , high
  , status
From
    configT.spt_values
Where
    type = 'P'
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1dacb147-4af5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'numbers_0_2047';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '21acb147-4af5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'numbers_0_2047', @level2type = N'COLUMN', @level2name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '24acb147-4af5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'numbers_0_2047', @level2type = N'COLUMN', @level2name = N'status';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '20acb147-4af5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'numbers_0_2047', @level2type = N'COLUMN', @level2name = N'number';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '22acb147-4af5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'numbers_0_2047', @level2type = N'COLUMN', @level2name = N'low';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '23acb147-4af5-eb11-850c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'numbers_0_2047', @level2type = N'COLUMN', @level2name = N'high';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:configT.spt_values.adoc[]', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'numbers_0_2047';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [configT].[spt_values]', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'numbers_0_2047';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'numbers_0_2047';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'numbers_0_2047';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [configT].[spt_values].[type]', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'numbers_0_2047', @level2type = N'COLUMN', @level2name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [configT].[spt_values].[status]', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'numbers_0_2047', @level2type = N'COLUMN', @level2name = N'status';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [configT].[spt_values].[number]', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'numbers_0_2047', @level2type = N'COLUMN', @level2name = N'number';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [configT].[spt_values].[low]', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'numbers_0_2047', @level2type = N'COLUMN', @level2name = N'low';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [configT].[spt_values].[high]', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'numbers_0_2047', @level2type = N'COLUMN', @level2name = N'high';

