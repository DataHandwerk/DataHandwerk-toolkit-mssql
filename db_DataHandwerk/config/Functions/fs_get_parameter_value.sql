CREATE Function [config].[fs_get_parameter_value]
(
    @Parameter_name Varchar(100)
  , @sub_Parameter  NVarchar(128) = N''
)
Returns NVarchar(max)
As
Begin
    Return
    (
        Select
            [Parameter_value_result]
        From
            [config].Parameter
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
  , @level0name = N'config'
  , @level1type = N'FUNCTION'
  , @level1name = N'fs_get_parameter_value';
Go
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[Parameter]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'FUNCTION', @level1name = N'fs_get_parameter_value';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.usp_AntoraExport_DocSnippet.adoc[]
* xref:docs.usp_AntoraExport_navigation.adoc[]
* xref:docs.usp_AntoraExport_ObjectPage.adoc[]
* xref:docs.usp_AntoraExport_ObjectPageTemplate.adoc[]
* xref:docs.usp_AntoraExport_ObjectPartialProperties.adoc[]
* xref:docs.usp_AntoraExport_ObjectPuml.adoc[]
* xref:docs.usp_AntoraExport_Page_IndexSemanticGroup.adoc[]
* xref:repo.usp_main.adoc[]
* xref:repo.usp_RepoObjectColumn_update_RepoObjectColumn_column_id.adoc[]
* xref:repo.usp_sync_guid_RepoObject.adoc[]
* xref:repo.usp_sync_guid_RepoObjectColumn.adoc[]
* xref:repo.usp_sync_guid_RepoSchema.adoc[]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'FUNCTION', @level1name = N'fs_get_parameter_value';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.Parameter.adoc[]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'FUNCTION', @level1name = N'fs_get_parameter_value';

