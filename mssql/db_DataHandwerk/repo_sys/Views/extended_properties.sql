
/*
database_id required in
- OBJECT_SCHEMA_NAME
- OBJECT_NAME
*/

CREATE VIEW [repo_sys].[extended_properties]
AS
--
SELECT
       [sep].[class]
     , [sep].[major_id]
     , [sep].[minor_id]
     , [sep].[name] COLLATE DATABASE_DEFAULT AS [property_name]
     , [sep].[class_desc]
     , [sep].value AS                           [property_value]
     , CASE
           WHEN [sep].[class] IN(1 , 2 , 7)
           THEN OBJECT_SCHEMA_NAME([sep].[major_id] , [db].[dwh_database_id])
       END AS                                   [SysObject_schema_name]
     , CASE
           WHEN [sep].[class] IN(1 , 2 , 7)
           THEN OBJECT_NAME([sep].[major_id] , [db].[dwh_database_id])
       END AS                                   [SysObject_name]
     , CASE [sep].[class]
           WHEN 1
           THEN [sc].[name]
           WHEN 2
           THEN [sp].[name]
           WHEN 3
           THEN [si].[name]
       END COLLATE DATABASE_DEFAULT AS          [minor_name]
     , CASE
           WHEN [sep].[class] = 1
           THEN [sc].[name]
       END COLLATE DATABASE_DEFAULT AS          [entity_column_name]
     , CASE
           WHEN [sep].[class] = 2
           THEN [sp].[name]
       END COLLATE DATABASE_DEFAULT AS          [entity_parameter_name]
     , CASE
           WHEN [sep].[class] = 7
           THEN [si].[name]
       END COLLATE DATABASE_DEFAULT AS          [entity_index_name]
     , [level2type] = CASE
                          WHEN [sep].[class] = 1
                               AND [sep].[minor_id] > 0
                          THEN 'COLUMN'
                          WHEN [sep].[class] = 2
                               AND [sep].[minor_id] > 0
                          THEN 'PARAMETER'
                          WHEN [sep].[class] = 7
                               AND [sep].[minor_id] > 0
                          THEN 'INDEX'
                      END
     , [property_basetype] = SQL_VARIANT_PROPERTY([sep].value , 'BaseType')
     , [property_nvarchar] = TRY_CAST([sep].value AS NVARCHAR(4000))

-- Explicit conversion from data type int to uniqueidentifier is not allowed.
--, [property_value_uniqueidentifier] = TRY_CAST([sep].value As UniqueIdentifier)
FROM
     sys_dwh.extended_properties AS sep
     LEFT OUTER JOIN
     sys_dwh.columns AS sc
     ON sep.major_id = sc.object_id
        AND sep.minor_id = sc.column_id
     LEFT OUTER JOIN
     sys_dwh.parameters AS sp
     ON sep.major_id = sp.object_id
        AND sep.minor_id = sp.parameter_id
     LEFT OUTER JOIN
     sys_dwh.indexes AS si
     ON sep.major_id = si.object_id
        AND sep.minor_id = si.index_id
     --
     CROSS APPLY
     repo.ftv_dwh_database() AS db
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '035e305b-5d47-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties', @level2type = N'COLUMN', @level2name = N'property_nvarchar';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '025e305b-5d47-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties', @level2type = N'COLUMN', @level2name = N'property_basetype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0e28ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties', @level2type = N'COLUMN', @level2name = N'level2type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0c28ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties', @level2type = N'COLUMN', @level2name = N'entity_index_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0d28ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties', @level2type = N'COLUMN', @level2name = N'entity_parameter_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0b28ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties', @level2type = N'COLUMN', @level2name = N'entity_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1128ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties', @level2type = N'COLUMN', @level2name = N'minor_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1428ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1528ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1328ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0a28ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties', @level2type = N'COLUMN', @level2name = N'class_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1228ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1028ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties', @level2type = N'COLUMN', @level2name = N'minor_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0f28ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties', @level2type = N'COLUMN', @level2name = N'major_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0928ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties', @level2type = N'COLUMN', @level2name = N'class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'3d9f84d1-c646-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties';

