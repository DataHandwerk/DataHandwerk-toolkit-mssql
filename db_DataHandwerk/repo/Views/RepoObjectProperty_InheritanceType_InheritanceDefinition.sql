Create View repo.RepoObjectProperty_InheritanceType_InheritanceDefinition
As
Select
    --
    ro.RepoObject_guid
  , pn.property_name
  , rop.property_value
  , Inheritance_StringAggSeparatorSql     = Coalesce (
                                                         ro.Inheritance_StringAggSeparatorSql
                                                       , par_sub_sep.Parameter_value__result_nvarchar
                                                       , par_sep.Parameter_value__result_nvarchar
                                                     )
  , InheritanceDefinition                 = Coalesce (
                                                         ro.InheritanceDefinition
                                                       , par_sub_def.Parameter_value__result_nvarchar
                                                       , par_def.Parameter_value__result_nvarchar
                                                     )
  , InheritanceType                       = Coalesce (
                                                         ro.InheritanceType
                                                       , par_sub.Parameter_value__result_int
                                                       , par.Parameter_value__result_int
                                                     )
  , ro.RepoObject_fullname
  , ro.RepoObject_type
  , ro_InheritanceType                    = ro.InheritanceType
  , sub_InheritanceType                   = par_sub.Parameter_value__result_int
  , par_InheritanceType                   = par.Parameter_value__result_int
  , ro_InheritanceDefinition              = ro.InheritanceDefinition
  , sub_InheritanceDefintion              = par_sub_def.Parameter_value__result_nvarchar
  , par_InheritanceDefintion              = par_def.Parameter_value__result_nvarchar
  , ro_Inheritance_StringAggSeparatorSql  = ro.Inheritance_StringAggSeparatorSql
  , sub_Inheritance_StringAggSeparatorSql = par_sub_sep.Parameter_value__result_nvarchar
  , par_Inheritance_StringAggSeparatorSql = par_sep.Parameter_value__result_nvarchar
From
    repo.RepoObject                         As ro
    Cross Join repo.PropertyName_RepoObject As pn
    Left Join
        repo.RepoObjectProperty As rop
            On
            rop.RepoObject_guid           = ro.RepoObject_guid
            And rop.property_name         = pn.property_name

    Left Join
        [config].Parameter          As par_sub
            On
            par_sub.Parameter_name        = 'InheritanceType_object'
            And par_sub.sub_Parameter     = pn.property_name

    Left Join
        [config].Parameter          As par
            On
            par.Parameter_name            = 'InheritanceType_object'
            And par.sub_Parameter         = ''

    Left Join
        [config].Parameter          As par_sub_def
            On
            par_sub_def.Parameter_name    = 'InheritanceDefinition_object'
            And par_sub_def.sub_Parameter = pn.property_name

    Left Join
        [config].Parameter          As par_def
            On
            par_def.Parameter_name        = 'InheritanceDefinition_object'
            And par_def.sub_Parameter     = ''

    Left Join
        [config].Parameter          As par_sub_sep
            On
            par_sub_sep.Parameter_name    = 'Inheritance_StringAggSeparatorSql_object'
            And par_sub_sep.sub_Parameter = pn.property_name

    Left Join
        [config].Parameter          As par_sep
            On
            par_sep.Parameter_name        = 'Inheritance_StringAggSeparatorSql_object'
            And par_sep.sub_Parameter     = '';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '64b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e0b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'sub_InheritanceType';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e3b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'sub_InheritanceDefintion';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e6b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'sub_Inheritance_StringAggSeparatorSql';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dfb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'ro_InheritanceType';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e2b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'ro_InheritanceDefinition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e5b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'ro_Inheritance_StringAggSeparatorSql';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'deb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd7b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'ddb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd9b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'property_value';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd8b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'property_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e1b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'par_InheritanceType';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e4b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'par_InheritanceDefintion';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e7b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'par_Inheritance_StringAggSeparatorSql';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dcb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'InheritanceType';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dbb33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'InheritanceDefinition';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dab33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectProperty_InheritanceType_InheritanceDefinition'
  , @level2type = N'COLUMN'
  , @level2name = N'Inheritance_StringAggSeparatorSql';
