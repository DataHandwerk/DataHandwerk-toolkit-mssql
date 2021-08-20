


CREATE View property.RepoObjectProperty_Collect_source_uspgenerator
As
Select
    ro.RepoObject_guid
  , property_name  = p_names.property_name
  , property_value = Case p_names.property_name
                         When 'AdocUspSteps'
                             Then
                             Cast(ro.AdocUspSteps As NVarchar(Max))
                         When 'UspParameters'
                             Then
                             Cast(ro.UspParameters As NVarchar(Max))
                         When 'ExampleUsage'
                             Then
                             Cast(ro.UspExamples As NVarchar(Max))
                         When 'MS_Description'
                             Then
                             Cast(ro.MS_Description As NVarchar(Max))
                     End
From
    uspgenerator.GeneratorUsp_SqlUsp As ro
    Cross Join
    (
        Values
            ( 'AdocUspSteps' )
          , ( 'UspParameters' )
          , ( 'ExampleUsage' )
          , ( 'MS_Description' )
    )                                As p_names ( property_name )
Where
    Not ro.RepoObject_guid Is Null
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b9fe9885-ea9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_uspgenerator', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b8fe9885-ea9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_uspgenerator', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b7fe9885-ea9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_uspgenerator', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b5fe9885-ea9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_uspgenerator';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [uspgenerator].[GeneratorUsp_SqlUsp]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_uspgenerator';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObject_guid,property_name', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_uspgenerator';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid,property_name', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_uspgenerator';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,varchar(14)', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_uspgenerator';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = '7762a94f-5f9f-eb11-84f8-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_uspgenerator';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:property.usp_RepoObjectProperty_collect.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_uspgenerator';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:uspgenerator.GeneratorUsp_SqlUsp.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_uspgenerator';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [uspgenerator].[GeneratorUsp_SqlUsp].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_uspgenerator', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';

