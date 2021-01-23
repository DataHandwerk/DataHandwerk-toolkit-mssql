
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
     repo_sys.[ExtendedProperties] AS ses
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



GO



GO



GO



GO



GO



GO



GO


