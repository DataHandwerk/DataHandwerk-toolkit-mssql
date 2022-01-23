
CREATE View repo.RepoObject_persistence_NoCompareNoUpdate
As
Select
    T1.target_RepoObject_guid
  , T1.source_RepoObject_guid
  , T1.source_RepoObject_name
  , T1.ColumnListNoCompareNoUpdate
  , NoCompareNoUpdate_Column         = Trim ( T2.value )
  , T3.RepoObject_guid
  , T3.RepoObjectColumn_guid
  , is_persistence_NoCompareNoUpdate = Iif(T3.RepoObjectColumn_guid Is Null, 0, 1)
From
    repo.RepoObject_persistence                                   As T1
    Cross Apply String_Split(T1.ColumnListNoCompareNoUpdate, ',') As T2
    Left Join
        repo.RepoObjectColumn As T3
            On
            T3.RepoObject_guid = T1.target_RepoObject_guid
            And T3.Column_name = Trim ( T2.value )
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7d034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoCompareNoUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence_NoCompareNoUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7c034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoCompareNoUpdate', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7b034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoCompareNoUpdate', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7a034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoCompareNoUpdate', @level2type = N'COLUMN', @level2name = N'NoCompareNoUpdate_Column';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '79034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoCompareNoUpdate', @level2type = N'COLUMN', @level2name = N'ColumnListNoCompareNoUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '78034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoCompareNoUpdate', @level2type = N'COLUMN', @level2name = N'source_RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '77034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoCompareNoUpdate', @level2type = N'COLUMN', @level2name = N'source_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '76034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoCompareNoUpdate', @level2type = N'COLUMN', @level2name = N'target_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3e2e3185-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoCompareNoUpdate';

