
-- Alter View RepoObjectColumnProperty_sys_repo
CREATE VIEW [repo].[RepoObjectColumnProperty_sys_repo]
AS
--
SELECT
       [roc].[RepoObjectColumn_guid]
     , [ses].[property_name]
     , [ses].[property_value]
     , [ses].[SysObject_schema_name]
     , [ses].[SysObject_name]
     , [ses].[entity_column_name] AS [SysObjectColumn_name]
     , [link].[RepoObjectColumnProperty_id]
     , [link].[property_value] as [RepoObjectColumnProperty_property_value]
FROM
     repo_sys.extended_properties AS ses
     INNER JOIN
     repo.RepoObject AS ro
     ON ses.SysObject_schema_name = ro.SysObject_schema_name
        AND ses.SysObject_name = ro.SysObject_name
     INNER JOIN
     repo.RepoObjectColumn AS roc
     ON ro.RepoObject_guid = roc.RepoObject_guid
        AND ses.entity_column_name = roc.SysObjectColumn_name
        AND ses.property_name <> 'RepoObjectColumn_guid'
     LEFT JOIN
     repo.RepoObjectColumnProperty AS link
     ON roc.RepoObjectColumn_guid = link.RepoObjectColumn_guid
        AND [ses].[property_name] = link.[property_name]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4eea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_sys_repo', @level2type = N'COLUMN', @level2name = N'RepoObjectColumnProperty_property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4dea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_sys_repo', @level2type = N'COLUMN', @level2name = N'RepoObjectColumnProperty_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '51ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_sys_repo', @level2type = N'COLUMN', @level2name = N'SysObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4fea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_sys_repo', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '50ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_sys_repo', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4bea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_sys_repo', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4aea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_sys_repo', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4cea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_sys_repo', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7b2c8508-724c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_sys_repo';

