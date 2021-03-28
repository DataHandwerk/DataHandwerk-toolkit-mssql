/*
database_id required in
- OBJECT_SCHEMA_NAME
- OBJECT_NAME
*/
CREATE VIEW [repo_sys].[ExtendedProperties]
AS
--
SELECT [sep].[class]
 , [sep].[major_id]
 , [sep].[minor_id]
 , [sep].[name] COLLATE database_default AS [property_name]
 , [sep].[class_desc]
 , [sep].value AS [property_value]
 , CASE 
  WHEN [sep].[class] IN (
    1
    , 2
    , 7
    )
   THEN OBJECT_SCHEMA_NAME([sep].[major_id], [db].[dwh_database_id])
  END AS [SysObject_schema_name]
 , CASE 
  WHEN [sep].[class] IN (
    1
    , 2
    , 7
    )
   THEN OBJECT_NAME([sep].[major_id], [db].[dwh_database_id])
  END AS [SysObject_name]
 , CASE [sep].[class]
  WHEN 1
   THEN [sc].[name]
  WHEN 2
   THEN [sp].[name]
  WHEN 3
   THEN [si].[name]
  END COLLATE database_default AS [minor_name]
 , CASE 
  WHEN [sep].[class] = 1
   THEN [sc].[name]
  END COLLATE database_default AS [entity_column_name]
 , CASE 
  WHEN [sep].[class] = 2
   THEN [sp].[name]
  END COLLATE database_default AS [entity_parameter_name]
 , CASE 
  WHEN [sep].[class] = 7
   THEN [si].[name]
  END COLLATE database_default AS [entity_index_name]
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
 , [property_basetype] = SQL_VARIANT_PROPERTY([sep].value, 'BaseType')
 , [property_nvarchar] = TRY_CAST([sep].value AS NVARCHAR(4000))
 , [so].[parent_object_id]
 , [parent_name] = [parent].[name]
 , [parent_type] = [parent].[type]
-- Explicit conversion from data type int to uniqueidentifier is not allowed.
--, [property_value_uniqueidentifier] = TRY_CAST([sep].value As UniqueIdentifier)
FROM sys_dwh.extended_properties AS sep
LEFT OUTER JOIN sys_dwh.columns AS sc
 ON sep.major_id = sc.object_id
  AND sep.minor_id = sc.column_id
LEFT OUTER JOIN sys_dwh.parameters AS sp
 ON sep.major_id = sp.object_id
  AND sep.minor_id = sp.parameter_id
LEFT OUTER JOIN sys_dwh.indexes AS si
 ON sep.major_id = si.object_id
  AND sep.minor_id = si.index_id
LEFT OUTER JOIN sys_dwh.objects AS so
 ON sep.major_id = so.object_id
LEFT OUTER JOIN sys_dwh.objects AS parent
 ON parent.object_id = so.parent_object_id
--
CROSS APPLY repo.ftv_dwh_database() AS db
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '4b90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '47f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '48f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '46f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4ff47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'property_nvarchar';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '44f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4ef47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'property_basetype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '52f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'parent_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '50f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'parent_object_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '51f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'parent_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '49f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'minor_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '43f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'minor_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '42f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'major_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4df47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'level2type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4bf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'entity_parameter_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4cf47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'entity_index_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4af47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'entity_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '45f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'class_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '41f47926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'class';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'[repo].[ftv_dwh_database]
[sys_dwh].[columns]
[sys_dwh].[extended_properties]
[sys_dwh].[indexes]
[sys_dwh].[objects]
[sys_dwh].[parameters]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties';

