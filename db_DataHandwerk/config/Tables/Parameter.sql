CREATE TABLE [config].[Parameter] (
    [Parameter_name]                   VARCHAR (100)   NOT NULL,
    [sub_Parameter]                    NVARCHAR (128)  CONSTRAINT [DF__Parameter__sub_P__18B6AB08] DEFAULT ('') NOT NULL,
    [Parameter_desciption]             NVARCHAR (1000) NULL,
    [Parameter_default_value]          SQL_VARIANT     NULL,
    [Parameter_value]                  SQL_VARIANT     NULL,
    [Parameter_value__result_nvarchar] AS              (TRY_CAST(coalesce([Parameter_value],[Parameter_default_value]) AS [nvarchar](4000))),
    [Parameter_value__result_int]      AS              (case when NOT sql_variant_property([Parameter_default_value],'BaseType')='uniqueidentifier' AND NOT sql_variant_property([Parameter_value],'BaseType')='uniqueidentifier' then TRY_CAST(coalesce([Parameter_value],[Parameter_default_value]) AS [int])  end),
    [Parameter_value__result_date]     AS              (case when NOT [Parameter_value] IS NULL AND NOT sql_variant_property([Parameter_value],'BaseType')='uniqueidentifier' then TRY_CAST([Parameter_value] AS [date]) when NOT [Parameter_default_value] IS NULL AND NOT sql_variant_property([Parameter_default_value],'BaseType')='uniqueidentifier' then CONVERT([date],TRY_CAST([Parameter_default_value] AS [datetime]))  end),
    [Parameter_value__result_datetime] AS              (case when NOT [Parameter_value] IS NULL AND NOT sql_variant_property([Parameter_value],'BaseType')='uniqueidentifier' then TRY_CAST([Parameter_value] AS [datetime]) when NOT [Parameter_default_value] IS NULL AND NOT sql_variant_property([Parameter_default_value],'BaseType')='uniqueidentifier' then TRY_CAST([Parameter_default_value] AS [datetime])  end),
    CONSTRAINT [PK_Parameter] PRIMARY KEY CLUSTERED ([Parameter_name] ASC, [sub_Parameter] ASC)
);




















GO



GO



GO



GO



GO



GO



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
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '16f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_value__result_nvarchar';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '75b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_value__result_int';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[Parameter].[Parameter_default_value]
[repo].[Parameter].[Parameter_value]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_value__result_nvarchar';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST(coalesce([Parameter_value],[Parameter_default_value]) AS [nvarchar](4000)))', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_value__result_nvarchar';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b27159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_value__result_datetime';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b17159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_value__result_date';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'PK_Parameter', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'Parameter_name,sub_Parameter', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'varchar(100),nvarchar(128)', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'2690291C-9D61-EB11-84DC-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = '* default parameter values are defined (hard coded) in xref:sqldb:config.Parameter_default.adoc[] and available in xref:sqldb:config.Parameter.adoc#column-Parameter_default_value[config.Parameter.Parameter_default_value]
* default parameter values can be overwritten by project specific content using xref:sqldb:config.Parameter.adoc#column-Parameter_value[config.Parameter.Parameter_value]
* resulting content is available in
** xref:sqldb:config.Parameter.adoc#column-Parameter_value__result_int[config.Parameter.Parameter_value__result_int]
** xref:sqldb:config.Parameter.adoc#column-Parameter_value__result_nvarchar[config.Parameter.Parameter_value__result_nvarchar]
', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter';


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
* [config].[Parameter].[Parameter_value]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_value__result_int';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST(coalesce([Parameter_value],[Parameter_default_value]) AS [int]))', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_value__result_int';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(case when NOT [Parameter_value] IS NULL AND NOT sql_variant_property([Parameter_value],''BaseType'')=''uniqueidentifier'' then TRY_CAST([Parameter_value] AS [datetime]) when NOT [Parameter_default_value] IS NULL AND NOT sql_variant_property([Parameter_default_value],''BaseType'')=''uniqueidentifier'' then TRY_CAST([Parameter_default_value] AS [datetime])  end)', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_value__result_datetime';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(case when NOT [Parameter_value] IS NULL AND NOT sql_variant_property([Parameter_value],''BaseType'')=''uniqueidentifier'' then TRY_CAST([Parameter_value] AS [date]) when NOT [Parameter_default_value] IS NULL AND NOT sql_variant_property([Parameter_default_value],''BaseType'')=''uniqueidentifier'' then CONVERT([date],TRY_CAST([Parameter_default_value] AS [datetime]))  end)', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'TABLE', @level1name = N'Parameter', @level2type = N'COLUMN', @level2name = N'Parameter_value__result_date';

