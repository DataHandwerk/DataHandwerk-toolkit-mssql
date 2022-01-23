
/*
ColumnListIgnore is an attribute of the persistence. +
normally it can't be applied to the target, because it could not exist in the target, if it is ignored. +
But if it exists in the target object, it needs to be applied. +
That's why this information needs to be applied to the source and to the target:

* it needs to be applied to the source in any case, +
  but not as update of repo.RepoObjectColumn, but in the moment, when missing columns are detected in 
  repo.usp_sync_guid_RepoObjectColumn
* it also needs to be applied to the target, if it exists in the target +
  in this case repo.RepoObjectColumn should be updated

This is a bit dirty. But how to do different?

*/
CREATE View repo.RepoObject_persistence_target_Ignore
As
Select
    T1.target_RepoObject_guid
  , T1.source_RepoObject_guid
  , T1.source_RepoObject_name
  , T1.ColumnListIgnore
  , NoCompareButUpdate_Column = Trim ( T2.value )
  , T3.RepoObject_guid
  , T3.RepoObjectColumn_guid
  , is_persistence_Ignore     = Iif(T3.RepoObjectColumn_guid Is Null, 0, 1)
From
    repo.RepoObject_persistence                        As T1
    Cross Apply String_Split(T1.ColumnListIgnore, ',') As T2
    Left Join
        --target RepoObject
        repo.RepoObjectColumn As T3
            On
            T3.RepoObject_guid = T1.target_RepoObject_guid
            And T3.Column_name = Trim ( T2.value )
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '85034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_target_Ignore', @level2type = N'COLUMN', @level2name = N'is_persistence_Ignore';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '84034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_target_Ignore', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '83034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_target_Ignore', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '82034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_target_Ignore', @level2type = N'COLUMN', @level2name = N'NoCompareButUpdate_Column';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '81034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_target_Ignore', @level2type = N'COLUMN', @level2name = N'ColumnListIgnore';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '80034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_target_Ignore', @level2type = N'COLUMN', @level2name = N'source_RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7f034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_target_Ignore', @level2type = N'COLUMN', @level2name = N'source_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7e034690-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_target_Ignore', @level2type = N'COLUMN', @level2name = N'target_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3f2e3185-576e-ec11-8539-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_target_Ignore';

