
CREATE FUNCTION [config].[ftv_get_parameter_value]
(
    @Parameter_name Varchar(100)
  , @sub_Parameter  NVarchar(128) = N''
)
Returns Table
As
Return
(
    Select
        [Parameter_value_result]
		, [Parameter_value_result_int]
		, [Parameter_value_result_date]
		, [Parameter_value_result_datetime]
    From
        [config].Parameter
    Where
        Parameter_name    = @Parameter_name
        And sub_Parameter = @sub_Parameter
);
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '3190291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'config'
  , @level1type = N'FUNCTION'
  , @level1name = N'ftv_get_parameter_value';
Go
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[Parameter]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'FUNCTION', @level1name = N'ftv_get_parameter_value';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.fs_PumlHeaderLeftToRight.adoc[]
* xref:docs.fs_PumlHeaderTopToBottom.adoc[]
* xref:docs.ObjectRefCyclic.adoc[]
* xref:docs.Schema_puml.adoc[]
* xref:repo.RepoObject_gross2.adoc[]
* xref:repo.RepoObject_SqlCreateTable.adoc[]
* xref:repo.RepoObjectColumn_HistValidColums_setpoint.adoc[]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'FUNCTION', @level1name = N'ftv_get_parameter_value';




GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.Parameter.adoc[]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'FUNCTION', @level1name = N'ftv_get_parameter_value';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'FUNCTION', @level1name = N'ftv_get_parameter_value';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'FUNCTION', @level1name = N'ftv_get_parameter_value';

