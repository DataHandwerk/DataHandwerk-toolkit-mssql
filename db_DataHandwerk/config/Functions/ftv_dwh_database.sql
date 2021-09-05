CREATE Function [config].ftv_dwh_database
()
--returns nvarchar(128)
Returns Table
As
Return
(
    Select
        Cast([Parameter_value_result] As NVarchar(128))          As dwh_database_name
      , Db_Id ( Cast([Parameter_value_result] As NVarchar(128))) As dwh_database_id
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
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[Parameter]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'FUNCTION', @level1name = N'ftv_dwh_database';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.RepoObjectColumn_reference_QueryPlan.adoc[]
* xref:reference.usp_update_Referencing_Count.adoc[]
* xref:repo.RepoObject_SqlCreateTable.adoc[]
* xref:repo.usp_update_Referencing_Count.adoc[]
* xref:repo_sys.ExtendedProperties.adoc[]
* xref:repo_sys.sql_expression_dependencies.adoc[]
* xref:repo_sys.SysColumn.adoc[]
* xref:uspgenerator.GeneratorUsp_SqlUsp.adoc[]
* xref:workflow.Workflow_SqlUsp.adoc[]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'FUNCTION', @level1name = N'ftv_dwh_database';




GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.Parameter.adoc[]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'FUNCTION', @level1name = N'ftv_dwh_database';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'FUNCTION', @level1name = N'ftv_dwh_database';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'FUNCTION', @level1name = N'ftv_dwh_database';

