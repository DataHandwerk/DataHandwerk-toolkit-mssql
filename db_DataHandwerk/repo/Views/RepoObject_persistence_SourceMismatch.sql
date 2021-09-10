
/*
<<property_start>>MS_Description
this view can be used to try to repair mismatch between source_RepoObject_guid and source_RepoObject_name or missing them

this could happen in case of renaming or guid changes

for example the source_RepoObject_guid could be lost in case of conecting the repository to the wrong dwh
<<property_end>>

<<property_start>>ExampleUsage
--repair repo.RepoObject_persistence.source_RepoObject_name via guid

Update
    repo.RepoObject_persistence_SourceMismatch
Set
    source_RepoObject_name = source_RepoObject_name_via_guid
Where
    (
        is_name_mismatch_via_guid = 1
        Or source_RepoObject_name Is Null
    )
    And Not source_RepoObject_name_via_guid Is Null

--repair repo.RepoObject_persistence.source_RepoObject_guid via name
Update
    repo.RepoObject_persistence_SourceMismatch
Set
    source_RepoObject_guid = source_RepoObject_guid_via_name
Where
    (
        is_guid_mismatch_via_name = 1
        Or source_RepoObject_guid Is Null
    )
    And Not source_RepoObject_guid_via_name Is Null

--still missing guid?
--repair repo.RepoObject_persistence.source_RepoObject_guid via default_source_RepoObject_name
Update
    repo.RepoObject_persistence_SourceMismatch
Set
    source_RepoObject_guid = source_RepoObject_guid_via_default_name
  , source_RepoObject_name = default_source_RepoObject_name
Where
    (
        source_RepoObject_guid Is Null
        Or source_RepoObject_name Is Null
    )
    And Not source_RepoObject_guid_via_default_name Is Null

--still entries?
--try other ways to solve
Select
    *
From
    repo.RepoObject_persistence_SourceMismatch
where
    is_mismatch = 1
<<property_end>>

*/
CREATE View repo.RepoObject_persistence_SourceMismatch
As
Select
    T1.target_RepoObject_guid
  , T1.target_RepoObject_fullname2
  , T1.target_name
  , T1.target_schema
  , T1.source_RepoObject_guid
  , T1.source_RepoObject_name
  , T1.default_source_RepoObject_name
  , source_RepoObject_name_via_guid         = src.RepoObject_name
  , source_RepoObject_guid_via_name         = src2.RepoObject_guid
  , source_RepoObject_guid_via_default_name = src3.RepoObject_guid
  , is_name_mismatch_via_guid               = Iif(T1.source_RepoObject_name <> src.RepoObject_name, 1, 0)
  , is_guid_mismatch_via_name               = Iif(T1.source_RepoObject_guid <> src2.RepoObject_guid, 1, 0)
  , is_mismatch                             = Iif(
                                                  T1.source_RepoObject_guid Is Null
                                                  Or T1.source_RepoObject_name Is Null
                                                  Or T1.source_RepoObject_name <> src.RepoObject_name
                                                  Or T1.source_RepoObject_guid <> src2.RepoObject_guid
                                                , 1
                                                , 0)
From
    repo.RepoObject_persistence_ForUpdate As T1
    Left Outer Join
        repo.RepoObject                   As src
            On
            src.RepoObject_guid             = T1.source_RepoObject_guid

    Left Outer Join
        repo.RepoObject                   As src2
            On
            src2.RepoObject_name            = T1.source_RepoObject_name
            And src2.RepoObject_schema_name = T1.target_schema

    Left Outer Join
        repo.RepoObject                   As src3
            On
            src3.RepoObject_name            = T1.default_source_RepoObject_name
            And src3.RepoObject_schema_name = T1.target_schema
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '73e1c56a-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_SourceMismatch';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e02c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_SourceMismatch', @level2type = N'COLUMN', @level2name = N'target_schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dd2c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_SourceMismatch', @level2type = N'COLUMN', @level2name = N'target_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'de2c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_SourceMismatch', @level2type = N'COLUMN', @level2name = N'target_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'df2c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_SourceMismatch', @level2type = N'COLUMN', @level2name = N'target_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e42c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_SourceMismatch', @level2type = N'COLUMN', @level2name = N'source_RepoObject_name_via_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e22c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_SourceMismatch', @level2type = N'COLUMN', @level2name = N'source_RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e52c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_SourceMismatch', @level2type = N'COLUMN', @level2name = N'source_RepoObject_guid_via_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e62c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_SourceMismatch', @level2type = N'COLUMN', @level2name = N'source_RepoObject_guid_via_default_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e12c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_SourceMismatch', @level2type = N'COLUMN', @level2name = N'source_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e72c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_SourceMismatch', @level2type = N'COLUMN', @level2name = N'is_name_mismatch_via_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e92c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_SourceMismatch', @level2type = N'COLUMN', @level2name = N'is_mismatch';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e82c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_SourceMismatch', @level2type = N'COLUMN', @level2name = N'is_guid_mismatch_via_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e32c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_persistence_SourceMismatch', @level2type = N'COLUMN', @level2name = N'default_source_RepoObject_name';

