Create View [property].RepoObjectProperty_Collect_source_uspgenerator
As

Select
    ro.RepoObject_guid
  , property_name  = p_names.property_name
  , property_value = Case p_names.property_name
                         When 'AdocUspSteps'
                             Then
                             Cast(Cast(ro.AdocUspSteps As NVarchar(4000)) As Sql_Variant)
                         When 'UspParameters'
                             Then
                             Cast(Cast(ro.UspParameters As NVarchar(4000)) As Sql_Variant)
                         When 'ExampleUsage'
                             Then
                             Cast(ro.UspExamples As Sql_Variant)
                         When 'MS_Description'
                             Then
                             Cast(ro.MS_Description As Sql_Variant)
                     End
From
    uspgenerator.GeneratorUsp_SqlUsp ro
    Cross Join
    (
        Values
            ( 'AdocUspSteps' )
          , ( 'UspParameters' )
          , ( 'ExampleUsage' )
          , ( 'MS_Description' )
    )                                p_names ( property_name )
Where
    Not RepoObject_guid Is Null;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b9fe9885-ea9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_uspgenerator', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b8fe9885-ea9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_uspgenerator', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b7fe9885-ea9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_uspgenerator', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b5fe9885-ea9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_uspgenerator';

