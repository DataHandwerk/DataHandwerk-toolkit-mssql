CREATE SCHEMA [repo_sys]
    AUTHORIZATION [dbo];


















































GO
EXECUTE sp_addextendedproperty @name = N'RepoSchema_guid', @value = '1799d297-86a3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'contains views and related procedures to connect the repository database (repo) and the dwh database (sys) via synonyms in schema `sys_dwh`', @level0type = N'SCHEMA', @level0name = N'repo_sys';

