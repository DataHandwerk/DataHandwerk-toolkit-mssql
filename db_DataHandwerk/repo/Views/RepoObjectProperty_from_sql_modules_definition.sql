/*
<<property_start>>MS_Description
* extracts properties from sql_modules_definition
* properties can be added (normally in comments) following this syntax
** use one line to mark the starting point for parsing: `<<property_start>>abcde` markes the property_name `abcde`
** use one line to mark the end point: `<<property_end>>`
* The correct sequence must be followed. Nested parsing is not supported.
<<property_end>>
*/
CREATE VIEW repo.RepoObjectProperty_from_sql_modules_definition
AS
SELECT
 --
 [RepoObject_guid]
 , [property_name] = CAST([es].[substring_netPreEol] AS NVARCHAR(128))
 , property_value = CAST(STRING_AGG([es].[substring_netPostEol], CHAR(13) + CHAR(10)) within GROUP (
   ORDER BY [es].[pos1]
   ) AS NVARCHAR(4000))
FROM [repo].[RepoObject_SqlModules_Repo_Sys]
CROSS APPLY tool.[ftv_extract_substrings]([sql_modules_definition], CHAR(13) + CHAR(10) + '<<property_start>>', CHAR(13) + CHAR(10) + '<<property_end>>') AS es
WHERE [es].[substring_netPreEol] <> ''
GROUP BY [RepoObject_guid]
 , [es].[substring_netPreEol]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c324df58-0b9a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_from_sql_modules_definition', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c224df58-0b9a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_from_sql_modules_definition', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c124df58-0b9a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_from_sql_modules_definition', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'bc24df58-0b9a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_from_sql_modules_definition';

