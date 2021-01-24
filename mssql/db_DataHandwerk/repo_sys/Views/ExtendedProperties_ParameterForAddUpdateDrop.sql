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
INNER JOIN repo.[type_level1type_level2type] AS stl
 ON so.type COLLATE database_default = stl.type
GO


