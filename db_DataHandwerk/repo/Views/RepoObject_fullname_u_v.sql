Create View repo.RepoObject_fullname_u_v
As
Select
    RepoObject_fullname
From
    repo.RepoObject
Where
    RepoObject_type In
    ( 'u', 'v' );
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '19df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_fullname_u_v'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '08df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_fullname_u_v';
