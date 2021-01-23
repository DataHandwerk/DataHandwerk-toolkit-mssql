

-- Alter View extended_properties__parameter_for_add_update_drop
CREATE VIEW [repo_sys].[extended_properties__parameter_for_add_update_drop]
As
--
Select
       [sep].[property_name]
     , [sep].[property_value]
     , 'SCHEMA' As                      [level0type]
     , [sep].[SysObject_schema_name] As [level0name]
     , [level1type] = IIF([stl].[level2type] = 'CONSTRAINT' , 'TABLE' , [stl].[level1type])
     , [level1name] = IIF([stl].[level2type] = 'CONSTRAINT' , [sep].[parent_name] , [sep].[SysObject_name])
     , [level2type] = IIF([stl].[level2type] = 'CONSTRAINT' , [stl].[level2type] , [sep].[level2type])
     , [level2name] = IIF([stl].[level2type] = 'CONSTRAINT' , [sep].[SysObject_name] , [sep].[minor_name])
     , [sep].[minor_id]
     , [sep].[class]
     , [sep].[class_desc]
     , [so].[type]
     , [type_level1type] = [stl].[level1type]
     , [type_level2type] = [stl].[level2type]
From
     repo_sys.extended_properties As sep
     Inner Join
     sys_dwh.objects As so
     On sep.major_id = so.object_id
     Inner Join
     repo.[type_level1type_level2type] As stl
     On so.type = stl.type Collate Latin1_General_CI_AS_KS_WS
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


