
CREATE VIEW [sys_self].[ExtendedProperties]
AS
--
SELECT
	[sep].[class]
   ,[sep].[major_id]
   ,[sep].[minor_id]
   ,[sep].[name] COLLATE database_default AS [property_name]
   ,[sep].[class_desc]
   ,[sep].value AS [property_value]
   ,CASE
		WHEN [sep].[class] IN (1, 2, 7) THEN OBJECT_SCHEMA_NAME([sep].[major_id] /*, [db].[dwh_database_id]*/)
	END AS [SysObject_schema_name]
   ,CASE
		WHEN [sep].[class] IN (1, 2, 7) THEN OBJECT_NAME([sep].[major_id] /*, [db].[dwh_database_id]*/)
	END AS [SysObject_name]
   ,CASE [sep].[class]
		WHEN 1 THEN [sc].[name]
		WHEN 2 THEN [sp].[name]
		WHEN 3 THEN [si].[name]
	END COLLATE database_default AS [minor_name]
   ,CASE
		WHEN [sep].[class] = 1 THEN [sc].[name]
	END COLLATE database_default AS [entity_column_name]
   ,CASE
		WHEN [sep].[class] = 2 THEN [sp].[name]
	END COLLATE database_default AS [entity_parameter_name]
   ,CASE
		WHEN [sep].[class] = 7 THEN [si].[name]
	END COLLATE database_default AS [entity_index_name]
   ,[level2type] =
	CASE
		WHEN [sep].[class] = 1 AND
			[sep].[minor_id] > 0 THEN 'COLUMN'
		WHEN [sep].[class] = 2 AND
			[sep].[minor_id] > 0 THEN 'PARAMETER'
		WHEN [sep].[class] = 7 AND
			[sep].[minor_id] > 0 THEN 'INDEX'
	END
   ,[property_basetype] = SQL_VARIANT_PROPERTY([sep].value, 'BaseType')
   ,[property_nvarchar] = TRY_CAST([sep].value AS NVARCHAR(4000))
   ,[so].[parent_object_id]
   ,[parent_name] = [parent].[name]
   ,[parent_type] = [parent].[type]

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