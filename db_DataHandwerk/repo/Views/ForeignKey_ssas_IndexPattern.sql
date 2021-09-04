
CREATE View repo.ForeignKey_ssas_IndexPattern
As
Select
    fk.ForeignKey_guid
  , ForeignKey_name                        = 'FK_' + tFrom.tables_name + '_TO_' + tTo.tables_name
  , ForeignKey_fullname                    = QuoteName ( fk.databasename ) + '.'
                                             + QuoteName ( 'FK_' + tFrom.tables_name + '_TO_' + tTo.tables_name )
  , referenced_IndexPatternColumnName      = colTo.tables_columns_name
  , referenced_IndexPatternColumnGuid      = Cast(colTo.RepoObjectColumn_guid As Varchar(36))
  , referenced_RepoObject_guid             = tTo.RepoObject_guid
  , referencing_IndexPatternColumnName     = colFrom.tables_columns_name
  , referencing_IndexPatternColumnGuid     = Cast(colFrom.RepoObjectColumn_guid As Varchar(36))
  , referencing_RepoObject_guid            = tFrom.RepoObject_guid
  , delete_referential_action              = Cast(Null As TinyInt)
  , update_referential_action              = Cast(Null As TinyInt)
  --extra columns only in ssas
  , fk.databasename
  , fk.relationships_name
  , relationships_isActive                 = IsNull ( fk.relationships_isActive, 1 )
  --, fk.Type
  , fk.relationships_crossFilteringBehavior
  --, fk.JoinOnDateBehavior
  --, fk.RelyOnReferentialIntegrity
  , fk.relationships_fromCardinality
  , fk.relationships_toCardinality
  --, fk.SecurityFilteringBehavior
  , referenced_ObjectName                  = tTo.tables_name
  , referenced_ColumnName                  = colTo.tables_columns_name
  , referenced_IndexPatternColumnDatatype  = colTo.tables_columns_dataType
  , referenced_RepoObject_fullname         = QuoteName ( fk.databasename ) + '.' + QuoteName ( tTo.tables_name )
  , referenced_RepoObject_fullname2        = fk.databasename + '.' + tTo.tables_name
  , referenced_IsKey                       = IsNull ( colTo.tables_columns_isKey, 0 )
  , referenced_IsNullable                  = IsNull ( colTo.tables_columns_isNullable, 1 )
  , referencing_ObjectName                 = tFrom.tables_name
  , referencing_ColumnName                 = colFrom.tables_columns_name
  , referencing_IndexPatternColumnDatatype = colFrom.tables_columns_dataType
  , referencing_RepoObject_fullname        = QuoteName ( fk.databasename ) + '.' + QuoteName ( tFrom.tables_name )
  , referencing_RepoObject_fullname2       = fk.databasename + '.' + tFrom.tables_name
  , referencing_IsKey                      = IsNull ( colFrom.tables_columns_isKey, 0 )
  , referencing_IsNullable                 = IsNull ( colFrom.tables_columns_isNullable, 1 )
From
    ssas.model_json_32_relationships_T       As fk
    Left Join
        ssas.model_json_311_tables_columns_T As colFrom
            On
            colFrom.databasename            = fk.databasename
            And colFrom.tables_name         = fk.relationships_fromTable
            And colFrom.tables_columns_name = fk.relationships_fromColumn

    Left Join
        ssas.model_json_31_tables_T          As tFrom
            On
            tFrom.databasename              = colFrom.databasename
            And tFrom.tables_name           = colFrom.tables_name

    --Left Join
    --    configT.SsasDmv_ExplicitDataType As dtFrom
    --        On
    --        dtFrom.ExplicitDataType = colFrom.ExplicitDataType

    Left Join
        ssas.model_json_311_tables_columns_T As colTo
            On
            colTo.databasename              = fk.databasename
            And colTo.tables_name           = fk.relationships_toTable
            And colTo.tables_columns_name   = fk.relationships_toColumn

    Left Join
        ssas.model_json_31_tables_T          As tTo
            On
            tTo.databasename                = colTo.databasename
            And tTo.tables_name             = colTo.tables_name

--Left Join
--    configT.SsasDmv_ExplicitDataType As dtTo
--        On
--        dtTo.ExplicitDataType   = colTo.ExplicitDataType
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '676e8dee-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '904578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'update_referential_action';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8e4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8c4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'referencing_IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8d4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'referencing_IndexPatternColumnGuid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8b4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '894578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'referenced_IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8a4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'referenced_IndexPatternColumnGuid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '874578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'ForeignKey_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '864578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'ForeignKey_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '884578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'ForeignKey_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8f4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'delete_referential_action';


GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a44578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a34578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a04578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'referencing_ObjectName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a24578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'referencing_IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a14578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'referencing_ColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9f4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9e4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9b4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'referenced_ObjectName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9d4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'referenced_IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9c4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'referenced_ColumnName';


GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '914578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'databasename';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ca6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'referencing_IsNullable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c96be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'referencing_IsKey';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c86be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'referenced_IsNullable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c76be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'referenced_IsKey';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7edfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'relationships_toCardinality';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7adfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'relationships_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7bdfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'relationships_isActive';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7ddfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'relationships_fromCardinality';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7cdfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'relationships_crossFilteringBehavior';

