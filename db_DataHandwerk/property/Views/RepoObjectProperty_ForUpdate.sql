
CREATE VIEW [property].[RepoObjectProperty_ForUpdate]
As
Select
    T1.[RepoObjectProperty_id]
  , T1.[RepoObject_guid]
  , T1.[property_name]
  , T1.[property_value]
  , T1.[inheritance]
  --,T1.[property_basetype]
  --,T1.[property_int]
  --,T1.[property_bigint]
  --,T1.[property_varchar]
  --,T1.[property_nvarchar]
  --,T1.[property_real]
  --,T1.[property_float]
  --,T1.[property_money]
  , T2.RepoObject_fullname
  , T2.RepoObject_fullname2
  , T2.RepoObject_schema_name
  , T2.RepoObject_name
From
    [property].[RepoObjectProperty] T1
    Inner Join
        repo.RepoObject             T2
            On
            T2.RepoObject_guid = T1.RepoObject_guid;