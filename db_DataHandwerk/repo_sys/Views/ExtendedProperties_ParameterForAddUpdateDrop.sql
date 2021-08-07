
CREATE View [repo_sys].[ExtendedProperties_ParameterForAddUpdateDrop]
As
--
Select [sep].[property_name]
 , [sep].[property_value]
 , 'SCHEMA' As [level0type]
 , [sep].[SysObject_schema_name] As [level0name]
 , [level1type] = Iif([stl].[level2type] = 'CONSTRAINT', 'TABLE', [stl].[level1type])
 , [level1name] = Iif([stl].[level2type] = 'CONSTRAINT', [sep].[parent_name] Collate Database_Default, [sep].[SysObject_name] Collate Database_Default)
 , [level2type] = Iif([stl].[level2type] = 'CONSTRAINT', [stl].[level2type], [sep].[level2type] Collate Database_Default)
 , [level2name] = Iif([stl].[level2type] = 'CONSTRAINT', [sep].[SysObject_name], [sep].[minor_name])
 , [sep].[minor_id]
 , [sep].[class]
 , [sep].[class_desc]
 , [so].[type]
 , [type_level1type] = [stl].[level1type]
 , [type_level2type] = [stl].[level2type]
From repo_sys.[ExtendedProperties] As sep
Inner Join sys_dwh.objects As so
 On sep.major_id = so.object_id
Inner Join [configT].[type_level1type_level2type] As stl
 On so.type Collate Database_Default = stl.type
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


GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[type_level1type_level2type].[level2type]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'type_level2type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[type_level1type_level2type].[level1type]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'type_level1type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo_sys].[ExtendedProperties].[property_value]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo_sys].[ExtendedProperties].[property_name]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo_sys].[ExtendedProperties].[minor_id]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'minor_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo_sys].[ExtendedProperties].[class_desc]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'class_desc';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo_sys].[ExtendedProperties].[class]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop', @level2type = N'COLUMN', @level2name = N'class';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[type_level1type_level2type]
* [repo_sys].[ExtendedProperties]
* [sys_dwh].[objects]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:property.usp_sync_ExtendedProperties_Repo2Sys_Delete.adoc[]
* xref:property.usp_sync_ExtendedProperties_Repo2Sys_InsertUpdate.adoc[]
* xref:repo_sys.usp_dropextendedproperty_level_1.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:configT.type_level1type_level2type.adoc[]
* xref:repo_sys.ExtendedProperties.adoc[]
* xref:sys_dwh.objects.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'ExtendedProperties_ParameterForAddUpdateDrop';

