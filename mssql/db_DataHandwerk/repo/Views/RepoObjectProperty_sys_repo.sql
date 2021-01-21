
-- Alter View RepoObjectProperty_sys_repo

CREATE VIEW [repo].[RepoObjectProperty_sys_repo]
AS
--
SELECT
       [ro].[RepoObject_guid]
     , [ses].[property_name]
     , [ses].[property_value]
     , [ses].[SysObject_schema_name]
     , [ses].[SysObject_name]
     , [link].[RepoObjectProperty_id]
     , [link].[property_value] AS [RepoObjectProperty_property_value]
FROM
     repo_sys.extended_properties AS ses
     INNER JOIN
     repo.RepoObject AS ro
     ON ses.SysObject_schema_name = ro.SysObject_schema_name
        AND ses.SysObject_name = ro.SysObject_name
        AND ses.minor_name IS NULL
        AND ses.class = 1 --OBJECT_OR_COLUMN
        --todo: handle class = 3 SCHEMA
        --todo: handle class = 7 INDEX
        AND ses.property_name <> 'RepoObject_guid'
     LEFT JOIN
     repo.RepoObjectProperty AS link
     ON ro.RepoObject_guid = link.RepoObject_guid
        AND [ses].[property_name] = link.[property_name]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '47ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_sys_repo', @level2type = N'COLUMN', @level2name = N'RepoObjectProperty_property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '46ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_sys_repo', @level2type = N'COLUMN', @level2name = N'RepoObjectProperty_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '48ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_sys_repo', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '49ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_sys_repo', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '44ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_sys_repo', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '43ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_sys_repo', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '45ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_sys_repo', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7a2c8508-724c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_sys_repo';

