
CREATE VIEW [repo_sys].[ColumnReference]
as
--
--muss / kann noch angereichert werden
Select
       [so].SysObject_fullname AS SysObject_full_name
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
From
     repo_sys.SysObject As so
     Cross Apply
     sys_dwh.dm_sql_referenced_entities(so.SysObject_fullname , 'OBJECT') As sdsre
Where  [so].[type] In
                      (
                      'U' , 'V'
                      )
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


