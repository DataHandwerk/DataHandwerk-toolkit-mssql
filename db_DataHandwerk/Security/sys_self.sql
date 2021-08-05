CREATE SCHEMA [sys_self]
    AUTHORIZATION [dbo];














GO
EXECUTE sp_addextendedproperty @name = N'RepoSchema_guid', @value = '1999d297-86a3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sys_self';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'this schema is not required when connecting the repository to a "normal" dwh database

* it contains some views and procedures similar to objects in schema `repo_sys` to apply similar logic not to the dwh database but to the current database (self)
* is is only used the repository database development', @level0type = N'SCHEMA', @level0name = N'sys_self';

