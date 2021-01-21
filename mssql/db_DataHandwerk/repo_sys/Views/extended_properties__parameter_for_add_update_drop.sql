
-- Alter View extended_properties__parameter_for_add_update_drop
CREATE VIEW [repo_sys].[extended_properties__parameter_for_add_update_drop]
As
--
Select
       [sep].[property_name]
     , [sep].[property_value]
     , 'SCHEMA' As                      [level0type]
     , [sep].[SysObject_schema_name] As [level0name]
     , [stl].[level1type]
     , [sep].[SysObject_name] As        [level1name]
     , [sep].[level2type]
     , [sep].[minor_name] As            [level2name]
     , [sep].[minor_id]
     , [sep].[class]
     , [sep].[class_desc]
     , [so].[type]
From
     repo_sys.extended_properties As sep
     Inner Join
     sys_dwh.objects As so
     On sep.major_id = so.object_id
     Inner Join
     repo.type__level1type_level2type As stl
     On so.type = stl.type Collate Latin1_General_CI_AS_KS_WS
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'f827ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties__parameter_for_add_update_drop', @level2type = N'COLUMN', @level2name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'ee27ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties__parameter_for_add_update_drop', @level2type = N'COLUMN', @level2name = N'class_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'ed27ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties__parameter_for_add_update_drop', @level2type = N'COLUMN', @level2name = N'class';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'f527ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties__parameter_for_add_update_drop', @level2type = N'COLUMN', @level2name = N'minor_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'f327ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties__parameter_for_add_update_drop', @level2type = N'COLUMN', @level2name = N'level2name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'f427ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties__parameter_for_add_update_drop', @level2type = N'COLUMN', @level2name = N'level2type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'f127ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties__parameter_for_add_update_drop', @level2type = N'COLUMN', @level2name = N'level1name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'f227ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties__parameter_for_add_update_drop', @level2type = N'COLUMN', @level2name = N'level1type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'ef27ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties__parameter_for_add_update_drop', @level2type = N'COLUMN', @level2name = N'level0name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'f027ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties__parameter_for_add_update_drop', @level2type = N'COLUMN', @level2name = N'level0type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'f727ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties__parameter_for_add_update_drop', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'f627ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties__parameter_for_add_update_drop', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'd6938381-4f47-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'extended_properties__parameter_for_add_update_drop';

