
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
     repo_sys.extended_properties AS ep
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
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a097b780-9951-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'max_column_id_used';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9f97b780-9951-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'history_table_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a297b780-9951-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'temporal_type_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a197b780-9951-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'temporal_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'6d28ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'is_schema_published';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'6c28ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'is_published';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'6b28ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'is_ms_shipped';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'6e28ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'modify_date';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'6a28ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'create_date';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'7728ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'type_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'7628ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'6f28ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'parent_object_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'7128ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'schema_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'7028ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'principal_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'7428ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'SysObject_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'f0638bfc-7948-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'7328ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'7528ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'7228ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject', @level2type = N'COLUMN', @level2name = N'SysObject_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'559f84d1-c646-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysObject';

