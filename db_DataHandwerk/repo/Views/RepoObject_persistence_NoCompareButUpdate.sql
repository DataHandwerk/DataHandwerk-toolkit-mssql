
CREATE View repo.RepoObject_persistence_NoCompareButUpdate
As
Select
    T1.target_RepoObject_guid
  , T1.source_RepoObject_guid
  , T1.source_RepoObject_name
  , T1.ColumnListNoCompareButUpdate
  , NoCompareButUpdate_Column         = Trim ( T2.value )
  , T3.RepoObject_guid
  , T3.RepoObjectColumn_guid
  , is_persistence_NoCompareButUpdate = Iif(T3.RepoObjectColumn_guid Is Null, 0, 1)
From
    repo.RepoObject_persistence                                    As T1
    Cross Apply String_Split(T1.ColumnListNoCompareButUpdate, ',') As T2
    Left Join
        repo.RepoObjectColumn As T3
            On
            T3.RepoObject_guid = T1.target_RepoObject_guid
            And T3.Column_name = Trim ( T2.value )
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6a034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoCompareButUpdate', @level2type = N'COLUMN', @level2name = N'is_persistence_NoCompareButUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '69034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoCompareButUpdate', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '68034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoCompareButUpdate', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '67034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoCompareButUpdate', @level2type = N'COLUMN', @level2name = N'NoCompareButUpdate_Column';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '66034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoCompareButUpdate', @level2type = N'COLUMN', @level2name = N'ColumnListNoCompareButUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '65034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoCompareButUpdate', @level2type = N'COLUMN', @level2name = N'source_RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '64034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoCompareButUpdate', @level2type = N'COLUMN', @level2name = N'source_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '63034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoCompareButUpdate', @level2type = N'COLUMN', @level2name = N'target_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3d2e3185-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_NoCompareButUpdate';

