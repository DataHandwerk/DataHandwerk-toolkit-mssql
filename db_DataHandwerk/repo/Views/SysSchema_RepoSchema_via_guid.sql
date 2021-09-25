
CREATE View repo.SysSchema_RepoSchema_via_guid
As
--
Select
    ss.SysSchema_id
  , ss.SysSchema_name
  , SysSchema_RepoSchema_guid       = ss.SysSchema_RepoSchema_guid
  , RepoSchema_guid                 = rs.RepoSchema_guid
  , rs.RepoSchema_name
  , RepoSchema_SysSchema_id         = rs.SysSchema_id
  , RepoSchema_SysSchema_name       = rs.SysSchema_name
  , RepoSchema_is_SysSchema_missing = rs.is_SysSchema_missing
  , rs.is_RepoSchema_name_uniqueidentifier
  , rs.is_SysSchema_name_uniqueidentifier
From
    repo_sys.SysSchema  As ss
    Left Outer Join
        repo.RepoSchema As rs
            On
            rs.RepoSchema_guid = ss.SysSchema_RepoSchema_guid
            And rs.is_ssas     = 0
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cd0747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid', @level2type = N'COLUMN', @level2name = N'is_SysSchema_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cc0747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid', @level2type = N'COLUMN', @level2name = N'is_RepoSchema_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cb0747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid', @level2type = N'COLUMN', @level2name = N'RepoSchema_is_SysSchema_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ca0747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid', @level2type = N'COLUMN', @level2name = N'RepoSchema_SysSchema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c90747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid', @level2type = N'COLUMN', @level2name = N'RepoSchema_SysSchema_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c80747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid', @level2type = N'COLUMN', @level2name = N'RepoSchema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c70747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid', @level2type = N'COLUMN', @level2name = N'RepoSchema_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c60747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid', @level2type = N'COLUMN', @level2name = N'SysSchema_RepoSchema_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c50747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid', @level2type = N'COLUMN', @level2name = N'SysSchema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c40747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid', @level2type = N'COLUMN', @level2name = N'SysSchema_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b00747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[RepoSchema]
* [repo_sys].[SysSchema]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.usp_sync_guid_RepoSchema.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.RepoSchema.adoc[]
* xref:repo_sys.SysSchema.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[SysSchema].[SysSchema_RepoSchema_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid', @level2type = N'COLUMN', @level2name = N'SysSchema_RepoSchema_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[SysSchema].[SysSchema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid', @level2type = N'COLUMN', @level2name = N'SysSchema_name';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[SysSchema].[SysSchema_id]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid', @level2type = N'COLUMN', @level2name = N'SysSchema_id';




GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoSchema].[RepoSchema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid', @level2type = N'COLUMN', @level2name = N'RepoSchema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoSchema].[RepoSchema_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid', @level2type = N'COLUMN', @level2name = N'RepoSchema_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoSchema].[is_SysSchema_name_uniqueidentifier]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid', @level2type = N'COLUMN', @level2name = N'is_SysSchema_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(case when TRY_CAST([SysSchema_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end)', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid', @level2type = N'COLUMN', @level2name = N'is_SysSchema_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoSchema].[is_RepoSchema_name_uniqueidentifier]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid', @level2type = N'COLUMN', @level2name = N'is_RepoSchema_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(case when TRY_CAST([RepoSchema_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end)', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid', @level2type = N'COLUMN', @level2name = N'is_RepoSchema_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoSchema].[SysSchema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid', @level2type = N'COLUMN', @level2name = N'RepoSchema_SysSchema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoSchema].[SysSchema_id]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid', @level2type = N'COLUMN', @level2name = N'RepoSchema_SysSchema_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoSchema].[is_SysSchema_missing]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_guid', @level2type = N'COLUMN', @level2name = N'RepoSchema_is_SysSchema_missing';

