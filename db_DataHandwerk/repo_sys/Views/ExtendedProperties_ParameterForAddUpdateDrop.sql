CREATE VIEW [repo_sys].[ExtendedProperties_ParameterForAddUpdateDrop]
AS
--
SELECT [sep].[property_name]
 , [sep].[property_value]
 , 'SCHEMA' AS [level0type]
 , [sep].[SysObject_schema_name] AS [level0name]
 , [level1type] = IIF([stl].[level2type] = 'CONSTRAINT', 'TABLE', [stl].[level1type])
 , [level1name] = IIF([stl].[level2type] = 'CONSTRAINT', [sep].[parent_name] COLLATE database_default, [sep].[SysObject_name] COLLATE database_default)
 , [level2type] = IIF([stl].[level2type] = 'CONSTRAINT', [stl].[level2type], [sep].[level2type] COLLATE database_default)
 , [level2name] = IIF([stl].[level2type] = 'CONSTRAINT', [sep].[SysObject_name], [sep].[minor_name])
 , [sep].[minor_id]
 , [sep].[class]
 , [sep].[class_desc]
 , [so].[type]
 , [type_level1type] = [stl].[level1type]
 , [type_level2type] = [stl].[level2type]
FROM repo_sys.[ExtendedProperties] AS sep
INNER JOIN sys_dwh.objects AS so
 ON sep.major_id = so.object_id
INNER JOIN [config].[type_level1type_level2type] AS stl
 ON so.type COLLATE database_default = stl.type
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4d90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '60f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'type_level2type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5ff47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'type_level1type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5ef47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '54f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '53f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5bf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'minor_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '59f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'level2type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5af47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'level2name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '57f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'level1type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '58f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'level1name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '55f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'level0type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '56f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'level0name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5df47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'class_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5cf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'class';

