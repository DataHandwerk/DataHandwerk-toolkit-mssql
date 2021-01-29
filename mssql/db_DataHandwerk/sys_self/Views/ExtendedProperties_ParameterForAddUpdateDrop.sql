CREATE VIEW [sys_self].[ExtendedProperties_ParameterForAddUpdateDrop]
AS
--
SELECT [sep].[property_name]
 , [sep].[property_value]
 , 'SCHEMA' AS [level0type]
 , [sep].[SysObject_schema_name] AS [level0name]
 , [level1type] = IIF([stl].[level2type] = 'CONSTRAINT', 'TABLE', [stl].[level1type])
 , [level1name] = IIF([stl].[level2type] = 'CONSTRAINT', [sep].[parent_name], [sep].[SysObject_name])
 , [level2type] = IIF([stl].[level2type] = 'CONSTRAINT', [stl].[level2type], [sep].[level2type])
 , [level2name] = IIF([stl].[level2type] = 'CONSTRAINT', [sep].[SysObject_name], [sep].[minor_name])
 , [sep].[minor_id]
 , [sep].[class]
 , [sep].[class_desc]
 , [so].[type]
 , [type_level1type] = [stl].[level1type]
 , [type_level2type] = [stl].[level2type]
FROM sys_self.[ExtendedProperties] AS sep
INNER JOIN sys.objects AS so
 ON sep.major_id = so.object_id
INNER JOIN repo.[type_level1type_level2type] AS stl
 ON so.type COLLATE database_default = stl.type

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e58f291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aef17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'type_level2type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'adf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'type_level1type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'acf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a2f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a1f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a9f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'minor_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a7f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'level2type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a8f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'level2name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a5f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'level1type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a6f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'level1name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a3f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'level0type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a4f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'level0name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'abf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'class_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aaf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'class';

