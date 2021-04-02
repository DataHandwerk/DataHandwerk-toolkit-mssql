/*
mismatch of RepoObject_guid can create 2 entries per one RepoObject
this can happen, if the guid exists in the database extended properties and a new guid will be created in the repo
ro1 has the right RepoObject_fullname, but the guid was new created
ro2 got the "right" guid from database, but ro2 can't propagate the fullname into RepoObject because the RepoObject_fullname is occupied
now we have 2 entries, but we need to merge them

we need to replace 
ro1.RepoObject_guid by ro2.RepoObject_guid


first we check where the RepoObject PK is used in FK

--Returns logical foreign key information
EXEC sp_fkeys @pktable_name = N'RepoObject'
 , @pktable_owner = N'repo';

we should care about

repo	RepoObject_persistence	target_RepoObject_guid
repo	ProcedureInstance	Procedure_RepoObject_guid

we will not care about

repo	Index_virtual	parent_RepoObject_guid
repo	RepoObject_SqlModules	RepoObject_guid
repo	RepoObjectColumn	RepoObject_guid
repo	RepoObjectProperty	RepoObject_guid
repo	RepoObjectSource_FirstResultSet	RepoObject_guid
repo	RepoObjectSource_QueryPlan	RepoObject_guid

*/
--list of conflicting entries which needs to be merged
Create VIEW repo.RepoObject_RequiredRepoObjectMerge
AS
SELECT
 --
 ro1.RepoObject_guid
 , ro2.RepoObject_guid AS ro2_RepoObject_guid
 , ro1.RepoObject_fullname
 , ro2.RepoObject_fullname AS ro2_RepoObject_fullname
 , ro1.SysObject_fullname
 , ro2.SysObject_fullname AS ro2_SysObject_fullname
 , ro1.RepoObject_name
 , ro1.RepoObject_schema_name
 , ro1.SysObject_name
 , ro1.SysObject_schema_name
 , ro2.RepoObject_name AS ro2_RepoObject_name
 , ro2.RepoObject_schema_name AS ro2_RepoObject_schema_name
 , ro2.SysObject_name AS ro2_SysObject_name
FROM repo.RepoObject AS ro1
INNER JOIN repo.RepoObject AS ro2
 ON ro2.SysObject_fullname = ro1.RepoObject_fullname
  AND ro2.RepoObject_guid <> ro1.RepoObject_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f94a3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'ro2_SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f84a3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'ro2_RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f74a3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'ro2_RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f64a3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f54a3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f44a3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f34a3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f24a3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'ro2_SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f14a3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f04a3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'ro2_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ef4a3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ee4a3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'ro2_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ed4a3013-3866-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '52230f14-2e66-eb11-84dd-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge';


GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject].[SysObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject].[SysObject_name]
[repo].[RepoObject].[SysObject_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject].[SysObject_fullname]
[repo].[RepoObject].[SysObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[SysObject_schema_name],''].['',[SysObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject].[RepoObject_schema_name]
[repo].[RepoObject].[RepoObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject].[RepoObject_name]
[repo].[RepoObject].[RepoObject_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject].[RepoObject_guid]
[repo].[RepoObject].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject].[RepoObject_fullname]
[repo].[RepoObject].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_RequiredRepoObjectMerge', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';

