
Create View repo.SysSchema_RepoSchema_via_name
As
--
Select
    ss.SysSchema_id
  , ss.SysSchema_name
  , ss.SysSchema_RepoSchema_guid As SysSchema_RepoSchema_guid
  , rs.RepoSchema_guid           As RepoSchema_guid
  , rs.RepoSchema_name
  , rs.SysSchema_id              As RepoSchema_SysSchema_id
  , rs.SysSchema_name            As RepoSchema_SysSchema_name
  , rs.is_SysSchema_missing      As RepoSchema_is_SysSchema_missing
  , rs.is_RepoSchema_name_uniqueidentifier
  , rs.is_SysSchema_name_uniqueidentifier
From
    repo_sys.SysSchema  As ss
    Left Outer Join
        repo.RepoSchema As rs
            On
            ss.SysSchema_name = rs.SysSchema_name;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd70747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_name', @level2type = N'COLUMN', @level2name = N'is_SysSchema_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd60747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_name', @level2type = N'COLUMN', @level2name = N'is_RepoSchema_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd50747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_name', @level2type = N'COLUMN', @level2name = N'RepoSchema_is_SysSchema_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd40747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_name', @level2type = N'COLUMN', @level2name = N'RepoSchema_SysSchema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd30747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_name', @level2type = N'COLUMN', @level2name = N'RepoSchema_SysSchema_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd20747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_name', @level2type = N'COLUMN', @level2name = N'RepoSchema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd10747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_name', @level2type = N'COLUMN', @level2name = N'RepoSchema_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd00747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_name', @level2type = N'COLUMN', @level2name = N'SysSchema_RepoSchema_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cf0747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_name', @level2type = N'COLUMN', @level2name = N'SysSchema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ce0747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_name', @level2type = N'COLUMN', @level2name = N'SysSchema_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b10747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysSchema_RepoSchema_via_name';

