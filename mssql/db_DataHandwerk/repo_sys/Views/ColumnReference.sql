CREATE VIEW [repo_sys].[ColumnReference]
AS
--
--muss / kann noch angereichert werden
SELECT [so].SysObject_fullname AS SysObject_full_name
 , [sdsre].[referencing_minor_id]
 , [sdsre].[referenced_server_name]
 , [sdsre].[referenced_database_name]
 , [sdsre].[referenced_schema_name]
 , [sdsre].[referenced_entity_name]
 , [sdsre].[referenced_minor_name]
 , [sdsre].[referenced_id]
 , [sdsre].[referenced_minor_id]
 , [sdsre].[referenced_class]
 , [sdsre].[referenced_class_desc]
 , [sdsre].[is_caller_dependent]
 , [sdsre].[is_ambiguous]
 , [sdsre].[is_selected]
 , [sdsre].[is_updated]
 , [sdsre].[is_select_all]
 , [sdsre].[is_all_columns_found]
 , [sdsre].[is_insert_all]
 , [sdsre].[is_incomplete]
FROM repo_sys.SysObject AS so
CROSS APPLY sys_dwh.dm_sql_referenced_entities(so.SysObject_fullname, 'OBJECT') AS sdsre
WHERE [so].[type] IN (
  'U'
  , 'V'
  )
