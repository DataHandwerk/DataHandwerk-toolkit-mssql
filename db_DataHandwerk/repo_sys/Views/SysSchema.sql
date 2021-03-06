﻿
Create View repo_sys.SysSchema
As
--
Select
    sch.schema_id                                   As SysSchema_id
  , sch.name Collate Database_Default               As SysSchema_name
  , sch.principal_id                                As SysSchema_principal_id
  , Try_Cast(ep.property_value As UniqueIdentifier) As SysSchema_RepoSchema_guid
From
    sys_dwh.schemas                 As sch
    Left Outer Join
        repo_sys.ExtendedProperties As ep
            On
            ep.major_id          = sch.schema_id
            And ep.minor_id      = 0
            And ep.class         = 3 /*class 3 - Schema*/
            And ep.property_name = N'RepoSchema_guid';

-- Where [sch].[name] <> 'sys'
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c30747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysSchema', @level2type = N'COLUMN', @level2name = N'SysSchema_RepoSchema_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c20747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysSchema', @level2type = N'COLUMN', @level2name = N'SysSchema_principal_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c10747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysSchema', @level2type = N'COLUMN', @level2name = N'SysSchema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c00747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysSchema', @level2type = N'COLUMN', @level2name = N'SysSchema_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'af0747ec-8ca3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo_sys', @level1type = N'VIEW', @level1name = N'SysSchema';

