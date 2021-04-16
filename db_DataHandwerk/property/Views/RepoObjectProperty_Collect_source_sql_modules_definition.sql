/*
<<property_start>>MS_Description
* extracts properties from sql_modules_definition
* properties can be added (normally in comments) following this syntax
** use one line to mark the starting point for parsing: `<<property_start>>abcde` markes the property_name `abcde`
** use one line to mark the end point: `<<property_end>>`
* The correct sequence must be followed. Nested parsing is not supported.
<<property_end>>
*/
Create View [property].[RepoObjectProperty_Collect_source_sql_modules_definition]
As
Select
    --
    RepoObject_guid
  , property_name  = Cast(es.substring_netPreEol As NVarchar(128))
  , property_value = Cast(String_Agg ( es.substring_netPostEol, Char ( 13 ) + Char ( 10 )) Within Group(Order By
                                                                                                            es.pos1) As NVarchar(4000))
From
    [sqlparse].RepoObject_SqlModules_Repo_Sys
    Cross Apply tool.ftv_extract_substrings (
                                                sql_modules_definition
                                              , Char ( 13 ) + Char ( 10 ) + '<<property_start>>'
                                              , Char ( 13 ) + Char ( 10 ) + '<<property_end>>'
                                            ) As es
Where
    es.substring_netPreEol <> ''
Group By
    RepoObject_guid
  , es.substring_netPreEol;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c324df58-0b9a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_sql_modules_definition', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c224df58-0b9a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_sql_modules_definition', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c124df58-0b9a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_sql_modules_definition', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'bc24df58-0b9a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_Collect_source_sql_modules_definition';

