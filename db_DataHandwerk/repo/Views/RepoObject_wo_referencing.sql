Create View repo.RepoObject_wo_referencing
As
Select
    T1.RepoObject_guid
  , T1.is_repo_managed
  , T1.RepoObject_name
  , T1.RepoObject_Referencing_Count
  , T1.RepoObject_schema_name
  , T1.RepoObject_type
  , T1.is_RepoObject_name_uniqueidentifier
  , T1.RepoObject_fullname
  , T1.RepoObject_fullname2
From
    repo.RepoObject  As T1
    Left Join
        configT.type As T3
            On
            T3.type = T1.RepoObject_type
Where
    Not Exists
(
    Select
        Expr1 = 1
    From
        reference.RepoObject_reference_T As T2
    Where
        ( T2.referenced_RepoObject_guid = T1.RepoObject_guid )
)
    And T3.is_DocsOutput = 1