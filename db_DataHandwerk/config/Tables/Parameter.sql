CREATE TABLE [config].[Parameter] (
    [Parameter_name]                  VARCHAR (100)   NOT NULL,
    [sub_Parameter]                   NVARCHAR (128)  CONSTRAINT [DF__Parameter__sub_P__18B6AB08] DEFAULT ('') NOT NULL,
    [Parameter_desciption]            NVARCHAR (1000) NULL,
    [Parameter_default_value]         NVARCHAR (MAX)  NULL,
    [Parameter_value]                 NVARCHAR (MAX)  NULL,
    [Parameter_value_result]          AS              (coalesce([Parameter_value],[Parameter_default_value])),
    [Parameter_value_result_int]      AS              (TRY_CAST(left(coalesce([Parameter_value],[Parameter_default_value]),(4000)) AS [int])),
    [Parameter_value_result_date]     AS              (TRY_CAST(left(coalesce([Parameter_value],[Parameter_default_value]),(4000)) AS [date])),
    [Parameter_value_result_datetime] AS              (TRY_CAST(left(coalesce([Parameter_value],[Parameter_default_value]),(4000)) AS [datetime])),
    CONSTRAINT [PK_Parameter] PRIMARY KEY CLUSTERED ([Parameter_name] ASC, [sub_Parameter] ASC)
);






GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2690291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'CONSTRAINT', @level2name = N'PK_Parameter';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2490291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '69cbc49c-3862-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'CONSTRAINT', @level2name = N'DF__Parameter__sub_P__18B6AB08';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '12f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'sub_Parameter';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '15f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '11f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '13f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_desciption';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '14f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_default_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '16f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_value_result';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '75b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_value_result_int';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [config].[Parameter].[Parameter_default_value]
* [config].[Parameter].[Parameter_value]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_value_result';




GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b27159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_value_result_datetime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b17159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_value_result_date';


GO



GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'Parameter_name,sub_Parameter', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'varchar(100),nvarchar(128)', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'2690291C-9D61-EB11-84DC-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter';


GO





GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:config.fs_dwh_database_name.adoc[]
* xref:config.fs_get_parameter_value.adoc[]
* xref:config.ftv_dwh_database.adoc[]
* xref:config.ftv_get_parameter_value.adoc[]
* xref:config.usp_init_parameter.adoc[]
* xref:config.usp_parameter_set.adoc[]
* xref:docs.usp_AntoraExport_DocSnippet.adoc[]
* xref:docs.usp_AntoraExport_ObjectPageTemplate.adoc[]
* xref:property.PropertyName_RepoObject.adoc[]
* xref:property.PropertyName_RepoObjectColumn.adoc[]
* xref:property.RepoObjectColumnProperty_InheritanceType_InheritanceDefinition.adoc[]
* xref:property.RepoObjectProperty_InheritanceType_InheritanceDefinition.adoc[]
* xref:repo.usp_persistence_set.adoc[]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [config].[Parameter].[Parameter_default_value]
* [config].[Parameter].[Parameter_value]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_value_result_int';


GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'CONSTRAINT', @level2name = N'PK_Parameter';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'CONSTRAINT', @level2name = N'PK_Parameter';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'CONSTRAINT', @level2name = N'DF__Parameter__sub_P__18B6AB08';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'CONSTRAINT', @level2name = N'DF__Parameter__sub_P__18B6AB08';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [config].[Parameter].[Parameter_default_value]
* [config].[Parameter].[Parameter_value]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_value_result_datetime';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [config].[Parameter].[Parameter_default_value]
* [config].[Parameter].[Parameter_value]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_value_result_date';

