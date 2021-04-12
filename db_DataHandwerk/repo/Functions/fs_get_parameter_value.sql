Create Function repo.fs_get_parameter_value
(
    @Parameter_name Varchar(100)
  , @sub_Parameter  NVarchar(128) = N''
)
Returns NVarchar(4000)
As
Begin
    Return
    (
        Select
            Parameter_value__result_nvarchar
        From
            repo.Parameter
        Where
            Parameter_name    = @Parameter_name
            And sub_Parameter = @sub_Parameter
    );
End;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'e98f291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'FUNCTION'
  , @level1name = N'fs_get_parameter_value';
Go