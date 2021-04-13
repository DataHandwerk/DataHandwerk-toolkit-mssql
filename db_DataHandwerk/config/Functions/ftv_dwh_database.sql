Create Function [config].ftv_dwh_database
()
--returns nvarchar(128)
Returns Table
As
Return
(
    Select
        Cast(Parameter_value__result_nvarchar As NVarchar(128))          As dwh_database_name
      , Db_Id ( Cast(Parameter_value__result_nvarchar As NVarchar(128))) As dwh_database_id
    From
        [config].Parameter
    Where
        Parameter_name    = 'dwh_database_name'
        And sub_Parameter = N''
);
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '2790291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'config'
  , @level1type = N'FUNCTION'
  , @level1name = N'ftv_dwh_database';
Go