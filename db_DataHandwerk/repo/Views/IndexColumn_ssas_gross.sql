
Create View repo.IndexColumn_ssas_gross
As
Select
    icv.index_guid
  , icv.index_column_id
  , icv.is_descending_key
  , icv.RepoObjectColumn_guid
  , parent_RepoObject_guid    = iv.RepoObject_guid
  , iv.index_name
  , parent_schema_name        = ro.RepoObject_schema_name
  , parent_Object_name        = ro.RepoObject_name
  , Object_column_name        = roc.RepoObjectColumn_name
  , column_user_type_fullname = roc.Repo_user_type_fullname
  , iv.is_index_unique
  , iv.is_index_primary_key
  , parent_Object_fullname    = ro.RepoObject_fullname
  , is_index_real             = Cast(1 As Bit)
From
    repo.IndexColumn_ssas_T   As icv
    Inner Join
        repo.Index_ssas_T     As iv
            On
            icv.index_guid            = iv.index_guid

    Inner Join
        repo.RepoObjectColumn As roc
            On
            roc.RepoObjectColumn_guid = icv.RepoObjectColumn_guid

    Left Join
        repo.RepoObject       As ro
            On
            ro.RepoObject_guid        = iv.RepoObject_guid