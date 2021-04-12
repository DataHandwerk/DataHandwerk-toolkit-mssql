Create Function repo.fs_dwh_database_name
()
Returns NVarchar(128)
As
Begin
    Return
    (
        Select
            Cast(Parameter_value__result_nvarchar As NVarchar(128)) As dwh_database_name
        From
            repo.Parameter
        Where
            Parameter_name    = 'dwh_database_name'
            And sub_Parameter = ''
    );
End;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'e78f291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'FUNCTION'
  , @level1name = N'fs_dwh_database_name';
Go