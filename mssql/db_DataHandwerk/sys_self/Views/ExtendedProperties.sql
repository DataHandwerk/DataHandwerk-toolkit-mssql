CREATE VIEW [sys_self].[ExtendedProperties]
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
   THEN OBJECT_SCHEMA_NAME([sep].[major_id] /*, [db].[dwh_database_id]*/)
  END AS [SysObject_schema_name]
 , CASE 
  WHEN [sep].[class] IN (
    1
    , 2
    , 7
    )
   THEN OBJECT_NAME([sep].[major_id] /*, [db].[dwh_database_id]*/)
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
FROM sys.extended_properties AS sep
LEFT OUTER JOIN sys.columns AS sc
 ON sep.major_id = sc.object_id
  AND sep.minor_id = sc.column_id
LEFT OUTER JOIN sys.parameters AS sp
 ON sep.major_id = sp.object_id
  AND sep.minor_id = sp.parameter_id
LEFT OUTER JOIN sys.indexes AS si
 ON sep.major_id = si.object_id
  AND sep.minor_id = si.index_id
LEFT OUTER JOIN sys.objects AS so
 ON sep.major_id = so.object_id
LEFT OUTER JOIN sys.objects AS parent
 ON parent.object_id = so.parent_object_id
  ----
  --CROSS APPLY
  --repo.ftv_dwh_database() AS db

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e38f291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '95f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '96f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '94f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9df17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'property_nvarchar';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '92f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9cf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'property_basetype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a0f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'parent_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9ef17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'parent_object_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9ff17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'parent_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '97f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'minor_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '91f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'minor_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '90f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'major_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9bf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'level2type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '99f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'entity_parameter_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9af17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'entity_index_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '98f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'entity_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '93f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'class_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8ff17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self', @level1type = N'VIEW', @level1name = N'ExtendedProperties', @level2type = N'COLUMN', @level2name = N'class';

