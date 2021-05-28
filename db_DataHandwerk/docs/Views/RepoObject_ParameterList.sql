Create View docs.RepoObject_ParameterList
As
Select
    RepoObject_guid     = SysObject_RepoObject_guid
  , AntoraParameterList = String_Agg (
                                         Concat (
                                                    Cast(N'* ' As NVarchar(Max))
                                                  , name
                                                  , ' (' + user_type_fullname + ')'
                                                  , Iif(has_default_value = 1
                                                        , ' = ' + Try_Cast(default_value As NVarchar(4000)) COLLATE database_default
                                                        , Null)
                                                )
                                       , Char ( 13 ) + Char ( 10 )
                                     ) Within Group(Order By
                                                        parameter_id)
From
    repo_sys.parameters
Group By
    SysObject_RepoObject_guid;
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '117e7a91-ca97-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ParameterList'
  , @level2type = N'COLUMN'
  , @level2name = N'AntoraParameterList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '107e7a91-ca97-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ParameterList'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '9ddfbe88-ca97-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_ParameterList';
