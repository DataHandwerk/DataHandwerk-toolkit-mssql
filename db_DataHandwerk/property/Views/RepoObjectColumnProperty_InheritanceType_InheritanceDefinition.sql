Create View [property].RepoObjectColumnProperty_InheritanceType_InheritanceDefinition
As
Select
    --
    roc.RepoObjectColumn_guid
  , pn.property_name
  , rocp.property_value
  , Inheritance_StringAggSeparatorSql     = Coalesce (
                                                         roc.Inheritance_StringAggSeparatorSql
                                                       , par_sub_sep.Parameter_value__result_nvarchar
                                                       , par_sep.Parameter_value__result_nvarchar
                                                     )
  , InheritanceDefinition                 = Coalesce (
                                                         roc.InheritanceDefinition
                                                       , par_sub_def.Parameter_value__result_nvarchar
                                                       , par_def.Parameter_value__result_nvarchar
                                                     )
  , InheritanceType                       = Coalesce (
                                                         roc.InheritanceType
                                                       , par_sub.Parameter_value__result_int
                                                       , par.Parameter_value__result_int
                                                     )
  , roc.RepoObjectColumn_name
  , roc_InheritanceType                   = roc.InheritanceType
  , sub_InheritanceType                   = par_sub.Parameter_value__result_int
  , par_InheritanceType                   = par.Parameter_value__result_int
  , roc_InheritanceDefinition             = roc.InheritanceDefinition
  , sub_InheritanceDefinition             = par_sub_def.Parameter_value__result_nvarchar
  , par_InheritanceDefinition             = par_def.Parameter_value__result_nvarchar
  , roc_Inheritance_StringAggSeparatorSql = roc.Inheritance_StringAggSeparatorSql
  , sub_Inheritance_StringAggSeparatorSql = par_sub_sep.Parameter_value__result_nvarchar
  , par_Inheritance_StringAggSeparatorSql = par_sep.Parameter_value__result_nvarchar
From
    repo.RepoObjectColumn                         As roc
    Cross Join [property].PropertyName_RepoObjectColumn As pn
    Left Join
        [property].RepoObjectColumnProperty As rocp
            On
            rocp.RepoObjectColumn_guid    = roc.RepoObjectColumn_guid
            And rocp.property_name        = pn.property_name

    Left Join
        [config].Parameter                As par_sub
            On
            par_sub.Parameter_name        = 'InheritanceType_column'
            And par_sub.sub_Parameter     = pn.property_name

    Left Join
        [config].Parameter                As par
            On
            par.Parameter_name            = 'InheritanceType_column'
            And par.sub_Parameter         = ''

    Left Join
        [config].Parameter                As par_sub_def
            On
            par_sub_def.Parameter_name    = 'InheritanceDefinition_column'
            And par_sub_def.sub_Parameter = pn.property_name

    Left Join
        [config].Parameter                As par_def
            On
            par_def.Parameter_name        = 'InheritanceDefinition_column'
            And par_def.sub_Parameter     = ''

    Left Join
        [config].Parameter                As par_sub_sep
            On
            par_sub_sep.Parameter_name    = 'Inheritance_StringAggSeparatorSql_column'
            And par_sub_sep.sub_Parameter = pn.property_name

    Left Join
        [config].Parameter                As par_sep
            On
            par_sep.Parameter_name        = 'Inheritance_StringAggSeparatorSql_column'
            And par_sep.sub_Parameter     = '';
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
