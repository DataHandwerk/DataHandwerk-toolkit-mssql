
CREATE View property.RepoObjectProperty_InheritanceType_InheritanceDefinition
As
Select
    --
    ro.RepoObject_guid
  , pn.property_name
  , rop.property_value
  , Inheritance_StringAggSeparatorSql     = Coalesce (
                                                         ro.Inheritance_StringAggSeparatorSql
                                                       , par_sub_sep.Parameter_value_result
                                                       , par_sep.Parameter_value_result
                                                     )
  , InheritanceDefinition                 = Coalesce (
                                                         ro.InheritanceDefinition
                                                       , par_sub_def.Parameter_value_result
                                                       , par_def.Parameter_value_result
                                                     )
  , InheritanceType                       = Coalesce ( ro.InheritanceType, par_sub.Parameter_value_result_int, par.Parameter_value_result_int )
  , ro.RepoObject_fullname
  , ro.RepoObject_type
  , ro_InheritanceType                    = ro.InheritanceType
  , sub_InheritanceType                   = par_sub.Parameter_value_result_int
  , par_InheritanceType                   = par.Parameter_value_result_int
  , ro_InheritanceDefinition              = ro.InheritanceDefinition
  , sub_InheritanceDefintion              = par_sub_def.Parameter_value_result
  , par_InheritanceDefintion              = par_def.Parameter_value_result
  , ro_Inheritance_StringAggSeparatorSql  = ro.Inheritance_StringAggSeparatorSql
  , sub_Inheritance_StringAggSeparatorSql = par_sub_sep.Parameter_value_result
  , par_Inheritance_StringAggSeparatorSql = par_sep.Parameter_value_result
From
    repo.RepoObject                             As ro
    Cross Join property.PropertyName_RepoObject As pn
    Left Join
        property.RepoObjectProperty As rop
            On
            rop.RepoObject_guid           = ro.RepoObject_guid
            And rop.property_name         = pn.property_name

    Left Join
        config.Parameter            As par_sub
            On
            par_sub.Parameter_name        = 'InheritanceType_object'
            And par_sub.sub_Parameter     = pn.property_name

    Left Join
        config.Parameter            As par
            On
            par.Parameter_name            = 'InheritanceType_object'
            And par.sub_Parameter         = ''

    Left Join
        config.Parameter            As par_sub_def
            On
            par_sub_def.Parameter_name    = 'InheritanceDefinition_object'
            And par_sub_def.sub_Parameter = pn.property_name

    Left Join
        config.Parameter            As par_def
            On
            par_def.Parameter_name        = 'InheritanceDefinition_object'
            And par_def.sub_Parameter     = ''

    Left Join
        config.Parameter            As par_sub_sep
            On
            par_sub_sep.Parameter_name    = 'Inheritance_StringAggSeparatorSql_object'
            And par_sub_sep.sub_Parameter = pn.property_name

    Left Join
        config.Parameter            As par_sep
            On
            par_sep.Parameter_name        = 'Inheritance_StringAggSeparatorSql_object'
            And par_sep.sub_Parameter     = ''
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '64b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e0b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'sub_InheritanceType';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e3b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'sub_InheritanceDefintion';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e6b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'sub_Inheritance_StringAggSeparatorSql';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dfb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'ro_InheritanceType';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e2b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'ro_InheritanceDefinition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e5b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'ro_Inheritance_StringAggSeparatorSql';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'deb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd7b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ddb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd9b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'property_value';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd8b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'property_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e1b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'par_InheritanceType';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e4b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'par_InheritanceDefintion';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e7b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'par_Inheritance_StringAggSeparatorSql';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dcb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'InheritanceType';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dbb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'InheritanceDefinition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dab33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'Inheritance_StringAggSeparatorSql';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[Parameter]
* [property].[PropertyName_RepoObject]
* [property].[RepoObjectProperty]
* [repo].[RepoObject]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObject_guid,property_name', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid,property_name', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,nvarchar(128)', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'9C1492C1-0B96-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:property.RepoObjectProperty_InheritanceType_resulting_InheritanceDefinition.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.Parameter.adoc[]
* xref:property.PropertyName_RepoObject.adoc[]
* xref:property.RepoObjectProperty.adoc[]
* xref:repo.RepoObject.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [config].[Parameter].[Parameter_value__result_int]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'sub_InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST(coalesce([Parameter_value],[Parameter_default_value]) AS [int]))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'sub_InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [config].[Parameter].[Parameter_value__result_nvarchar]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'sub_InheritanceDefintion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST(coalesce([Parameter_value],[Parameter_default_value]) AS [nvarchar](4000)))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'sub_InheritanceDefintion';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [config].[Parameter].[Parameter_value__result_nvarchar]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'sub_Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST(coalesce([Parameter_value],[Parameter_default_value]) AS [nvarchar](4000)))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'sub_Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[InheritanceType]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'ro_InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[InheritanceDefinition]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'ro_InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[Inheritance_StringAggSeparatorSql]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'ro_Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_type]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectProperty].[property_value]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'datatype of property_value is `sql_variant`, because it should be possible to synchronize the property_value in the repository with property_value in extended properties in the dwh database, which is `sql_variant` +
therefore the maximum content is nvarchar(4000) or varchar(8000)', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[PropertyName_RepoObject].[property_name]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [config].[Parameter].[Parameter_value__result_int]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'par_InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST(coalesce([Parameter_value],[Parameter_default_value]) AS [int]))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'par_InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [config].[Parameter].[Parameter_value__result_nvarchar]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'par_InheritanceDefintion';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST(coalesce([Parameter_value],[Parameter_default_value]) AS [nvarchar](4000)))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'par_InheritanceDefintion';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [config].[Parameter].[Parameter_value__result_nvarchar]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'par_Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(TRY_CAST(coalesce([Parameter_value],[Parameter_default_value]) AS [nvarchar](4000)))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'par_Inheritance_StringAggSeparatorSql';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[Inheritance_StringAggSeparatorSql]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition', @level2type = N'COLUMN', @level2name = N'Inheritance_StringAggSeparatorSql';

