Create View [sqlparse].RepoObject_SqlModules_44_from_Identifier_QuoteName
As
Select
    --
    T1.RepoObject_guid
  , T1.json_key
  , T1.SysObject_fullname
  , T1.class
  , T1.RowNumber_per_Object
  , T1.name
  , T1.name_charindex_dot
  , T1.name_PreDot
  , T1.name_PostDot
  , T1.alias
  , T1.T1_identifier_alias
  , T1.lag_normalized_wo_nolock
  , alias_QuoteName        = Case
                                 When Left(alias, 1) = '['
                                      And Right(alias, 1) = ']'
                                     Then
                                     alias
                                 Else
                                     QuoteName ( alias )
                             End
  , name_PreDot_QuoteName  = Case
                                 When Left(name_PreDot, 1) = '['
                                      And Right(name_PreDot, 1) = ']'
                                     Then
                                     name_PreDot
                                 Else
                                     QuoteName ( name_PreDot )
                             End
  , name_PostDot_QuoteName = Case
                                 When Left(name_PostDot, 1) = '['
                                      And Right(name_PostDot, 1) = ']'
                                     Then
                                     name_PostDot
                                 Else
                                     QuoteName ( name_PostDot )
                             End
From
    [sqlparse].RepoObject_SqlModules_43_from_Identifier As T1;
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6e4241cb-fb63-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'name_PostDot_QuoteName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6d4241cb-fb63-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'name_PreDot_QuoteName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6c4241cb-fb63-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'alias_QuoteName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6b4241cb-fb63-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'lag_normalized_wo_nolock';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6a4241cb-fb63-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'T1_identifier_alias';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '694241cb-fb63-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'alias';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '684241cb-fb63-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'name_PostDot';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '674241cb-fb63-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'name_PreDot';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '664241cb-fb63-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'name_charindex_dot';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '654241cb-fb63-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '644241cb-fb63-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'RowNumber_per_Object';
Go

Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '624241cb-fb63-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'class';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '614241cb-fb63-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '604241cb-fb63-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '5c4241cb-fb63-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3a813ebd-7764-eb11-84dd-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'sqlparse'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlModules_44_from_Identifier_QuoteName'
  , @level2type = N'COLUMN'
  , @level2name = N'json_key';
Go