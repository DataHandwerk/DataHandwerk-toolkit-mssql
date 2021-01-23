
-- Alter View SysObject
-- Alter View SysObject
/*
ATTENTION:
[SysObject_RepoObject_guid] has prefix SysObject, because it it the RepoObject_guid stored in repo_sys.extended_properties
but some objects havn't extended properties, for example Triggers
These objects have RepoObject_guid only in [repo].[RepoObject].RepoObject_guid, but they have no SysObject_RepoObject_guid

ATTENTION:
when using synonyms
SCHEMA_NAME([so].schema_id) doesn't return the original schema_name but it runs in the current database 

OBJECT_SCHEMA_NAME muss verwendet werden und die database_id der DWH-Datenbank muss verwendet werden
oder über synonym [sys_dwh].schemas
*/
CREATE VIEW [repo_sys].[SysObject]
AS
--
SELECT
       [so].object_id AS                                      [SysObject_id]
     , [sch].[name] COLLATE DATABASE_DEFAULT AS               [SysObject_schema_name]
       --, OBJECT_SCHEMA_NAME([so].object_id) AS [SysObject_schema_name_]
     , [so].[name] COLLATE DATABASE_DEFAULT AS                [SysObject_name]
     , [SysObject_fullname] = Concat(QUOTENAME([sch].[name]) , '.' , QUOTENAME([so].[name])) COLLATE DATABASE_DEFAULT
     , TRY_CAST([ep].[property_value] AS UNIQUEIDENTIFIER) AS [SysObject_RepoObject_guid]
     , [so].[principal_id]
     , [so].schema_id
     , [so].[parent_object_id]
     , [so].[type] COLLATE DATABASE_DEFAULT AS                [type]
     , [so].[type_desc]
     , [so].[create_date]
     , [so].[modify_date]
     , [so].[is_ms_shipped]
     , [so].[is_published]
     , [so].[is_schema_published]
     , [st].[temporal_type]
     , [st].[temporal_type_desc]
     , [st].[history_table_id]
     , [st].[max_column_id_used]
     , [sm].[definition] AS                                   [sql_modules_definition]
FROM
     sys_dwh.objects AS so
     LEFT OUTER JOIN
     [sys_dwh].schemas AS sch
     ON sch.schema_id = [so].schema_id
     LEFT OUTER JOIN
     repo_sys.[ExtendedProperties] AS ep
     ON ep.major_id = so.object_id
        AND ep.minor_id = 0
        AND ep.property_name = N'RepoObject_guid'
     LEFT OUTER JOIN
     sys_dwh.tables AS st
     ON st.object_id = so.object_id
     LEFT OUTER JOIN
     [sys_dwh].[sql_modules] AS sm
     ON sm.object_id = so.object_id
WHERE  [sch].[name] <> 'sys'
GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO


