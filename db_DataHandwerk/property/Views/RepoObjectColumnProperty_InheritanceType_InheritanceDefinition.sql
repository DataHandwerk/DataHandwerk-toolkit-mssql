
CREATE View property.RepoObjectColumnProperty_InheritanceType_InheritanceDefinition
As
Select
    --
    roc.RepoObjectColumn_guid
  , pn.property_name
  , rocp.property_value
  , Inheritance_StringAggSeparatorSql     = Coalesce (
                                                         roc.Inheritance_StringAggSeparatorSql
                                                       , par_sub_sep.Parameter_value_result
                                                       , par_sep.Parameter_value_result
                                                     )
  , InheritanceDefinition                 = Coalesce (
                                                         roc.InheritanceDefinition
                                                       , par_sub_def.Parameter_value_result
                                                       , par_def.Parameter_value_result
                                                     )
  , InheritanceType                       = Coalesce (
                                                         roc.InheritanceType
                                                       , par_sub.Parameter_value_result_int
                                                       , par.Parameter_value_result_int
                                                     )
  , roc.RepoObjectColumn_name
  , roc_InheritanceType                   = roc.InheritanceType
  , sub_InheritanceType                   = par_sub.Parameter_value_result_int
  , par_InheritanceType                   = par.Parameter_value_result_int
  , roc_InheritanceDefinition             = roc.InheritanceDefinition
  , sub_InheritanceDefinition             = par_sub_def.Parameter_value_result
  , par_InheritanceDefinition             = par_def.Parameter_value_result
  , roc_Inheritance_StringAggSeparatorSql = roc.Inheritance_StringAggSeparatorSql
  , sub_Inheritance_StringAggSeparatorSql = par_sub_sep.Parameter_value_result
  , par_Inheritance_StringAggSeparatorSql = par_sep.Parameter_value_result
From
    repo.RepoObjectColumn                               As roc
    Cross Join property.PropertyName_RepoObjectColumn_T As pn
    Left Join
        property.RepoObjectColumnProperty As rocp
            On
            rocp.RepoObjectColumn_guid    = roc.RepoObjectColumn_guid
            And rocp.property_name        = pn.property_name

    Left Join
        config.Parameter                  As par_sub
            On
            par_sub.Parameter_name        = 'InheritanceType_column'
            And par_sub.sub_Parameter     = pn.property_name

    Left Join
        config.Parameter                  As par
            On
            par.Parameter_name            = 'InheritanceType_column'
            And par.sub_Parameter         = ''

    Left Join
        config.Parameter                  As par_sub_def
            On
            par_sub_def.Parameter_name    = 'InheritanceDefinition_column'
            And par_sub_def.sub_Parameter = pn.property_name

    Left Join
        config.Parameter                  As par_def
            On
            par_def.Parameter_name        = 'InheritanceDefinition_column'
            And par_def.sub_Parameter     = ''

    Left Join
        config.Parameter                  As par_sub_sep
            On
            par_sub_sep.Parameter_name    = 'Inheritance_StringAggSeparatorSql_column'
            And par_sub_sep.sub_Parameter = pn.property_name

    Left Join
        config.Parameter                  As par_sep
            On
            par_sep.Parameter_name        = 'Inheritance_StringAggSeparatorSql_column'
            And par_sep.sub_Parameter     = ''
Where
    pn.has_inheritance = 1
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '65b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f0b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'sub_InheritanceType';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f3b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'sub_InheritanceDefinition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f6b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'sub_Inheritance_StringAggSeparatorSql';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'efb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'roc_InheritanceType';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f2b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'roc_InheritanceDefinition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f5b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'roc_Inheritance_StringAggSeparatorSql';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'eeb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e8b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'eab33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'property_value';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e9b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'property_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f1b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'par_InheritanceType';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f4b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'par_InheritanceDefinition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f7b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'par_Inheritance_StringAggSeparatorSql';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'edb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'InheritanceType';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ecb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'InheritanceDefinition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ebb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'Inheritance_StringAggSeparatorSql';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[Parameter]
* [property].[PropertyName_RepoObjectColumn]
* [property].[RepoObjectColumnProperty]
* [repo].[RepoObjectColumn]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObjectColumn_guid,property_name', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObjectColumn_guid,property_name', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,nvarchar(128)', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = '6fce81bf-5e9f-eb11-84f8-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:property.RepoObjectColumnProperty_InheritanceType_resulting_InheritanceDefinition.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.Parameter.adoc[]
* xref:property.PropertyName_RepoObjectColumn.adoc[]
* xref:property.RepoObjectColumnProperty.adoc[]
* xref:repo.RepoObjectColumn.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [config].[Parameter].[Parameter_value_result_int]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'sub_InheritanceType';




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST(coalesce([Parameter_value],[Parameter_default_value]) AS [int]))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'sub_InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [config].[Parameter].[Parameter_value_result]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'sub_InheritanceDefinition';




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST(coalesce([Parameter_value],[Parameter_default_value]) AS [nvarchar](4000)))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'sub_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [config].[Parameter].[Parameter_value_result]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'sub_Inheritance_StringAggSeparatorSql';




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST(coalesce([Parameter_value],[Parameter_default_value]) AS [nvarchar](4000)))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'sub_Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[InheritanceType]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'roc_InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[InheritanceDefinition]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'roc_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[Inheritance_StringAggSeparatorSql]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'roc_Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[RepoObjectColumn_name]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the column. Is unique within the object.', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectColumnProperty].[property_value]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'datatype of property_value is `sql_variant`, because it should be possible to synchronize the property_value in the repository with property_value in extended properties in the dwh database, which is `sql_variant` +
therefore the maximum content is nvarchar(4000) or varchar(8000)', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[PropertyName_RepoObjectColumn].[property_name]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [config].[Parameter].[Parameter_value_result_int]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'par_InheritanceType';




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST(coalesce([Parameter_value],[Parameter_default_value]) AS [int]))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'par_InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [config].[Parameter].[Parameter_value_result]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'par_InheritanceDefinition';




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST(coalesce([Parameter_value],[Parameter_default_value]) AS [nvarchar](4000)))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'par_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [config].[Parameter].[Parameter_value_result]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'par_Inheritance_StringAggSeparatorSql';




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST(coalesce([Parameter_value],[Parameter_default_value]) AS [nvarchar](4000)))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'par_Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn].[Inheritance_StringAggSeparatorSql]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_InheritanceType_InheritanceDefinition';

