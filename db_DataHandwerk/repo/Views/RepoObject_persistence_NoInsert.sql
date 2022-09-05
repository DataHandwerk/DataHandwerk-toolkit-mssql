

Create View [repo].[RepoObject_persistence_NoInsert]
As
Select
    T1.target_RepoObject_guid
  , T1.source_RepoObject_guid
  , T1.source_RepoObject_name
  , T1.ColumnListNoInsert
  , NoInsert_Column         = Trim ( T2.value )
  , T3.RepoObject_guid
  , T3.RepoObjectColumn_guid
  , is_persistence_NoInsert = Iif(T3.RepoObjectColumn_guid Is Null, 0, 1)
From
    repo.RepoObject_persistence                                   As T1
    Cross Apply String_Split(T1.ColumnListNoInsert, ',') As T2
    Left Join
        repo.RepoObjectColumn As T3
            On
            T3.RepoObject_guid = T1.target_RepoObject_guid
            And T3.Column_name = Trim ( T2.value )
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '21894b8d-2c2d-ed11-8577-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoInsert', @level2type = N'COLUMN', @level2name = N'is_persistence_NoInsert';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '20894b8d-2c2d-ed11-8577-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoInsert', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1f894b8d-2c2d-ed11-8577-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoInsert', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1e894b8d-2c2d-ed11-8577-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoInsert', @level2type = N'COLUMN', @level2name = N'NoInsert_Column';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1d894b8d-2c2d-ed11-8577-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoInsert', @level2type = N'COLUMN', @level2name = N'ColumnListNoInsert';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1c894b8d-2c2d-ed11-8577-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoInsert', @level2type = N'COLUMN', @level2name = N'source_RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1b894b8d-2c2d-ed11-8577-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoInsert', @level2type = N'COLUMN', @level2name = N'source_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1a894b8d-2c2d-ed11-8577-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoInsert', @level2type = N'COLUMN', @level2name = N'target_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'c673c77f-2c2d-ed11-8577-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoInsert';

