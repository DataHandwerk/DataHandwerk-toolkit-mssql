
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
     repo_sys.[ExtendedProperties] AS ses
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



GO



GO



GO



GO



GO



GO



GO



GO


