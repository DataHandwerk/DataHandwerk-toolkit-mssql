
CREATE View repo.ForeignKey_ssas_IndexPattern
As
Select
    fk.ForeignKey_guid
  , ForeignKey_name                        = 'FK_' + tFrom.Name + '_TO_' + tTo.name
  , ForeignKey_fullname                    = QuoteName ( fk.databasename ) + '.' + QuoteName ( 'FK_' + tFrom.Name + '_TO_' + tTo.name )
  , referenced_IndexPatternColumnName      = colTo.ExplicitName
  , referenced_IndexPatternColumnGuid      = Cast(colTo.RepoObjectColumn_guid As Varchar(36))
  , referenced_RepoObject_guid             = tTo.RepoObject_guid
  , referencing_IndexPatternColumnName     = colFrom.ExplicitName
  , referencing_IndexPatternColumnGuid     = Cast(colFrom.RepoObjectColumn_guid As Varchar(36))
  , referencing_RepoObject_guid            = tFrom.RepoObject_guid
  , delete_referential_action              = Cast(Null As TinyInt)
  , update_referential_action              = Cast(Null As TinyInt)
  --extra columns only in ssas
  , fk.databasename
  , ForeignKey_orignalName                 = fk.Name
  , fk.IsActive
  , fk.Type
  , fk.CrossFilteringBehavior
  , fk.JoinOnDateBehavior
  , fk.RelyOnReferentialIntegrity
  , fk.FromCardinality
  , fk.ToCardinality
  , fk.SecurityFilteringBehavior
  , referenced_ObjectName                  = tTo.name
  , referenced_ColumnName                  = colTo.ExplicitName
  , referenced_IndexPatternColumnDatatype  = dtTo.ExplicitDataTypeName
  , referenced_RepoObject_fullname         = QuoteName ( fk.databasename ) + '.' + QuoteName ( tTo.name )
  , referenced_RepoObject_fullname2        = fk.databasename + '.' + tTo.name
  , referenced_IsKey                       = colTo.IsKey
  , referenced_IsNullable                  = colTo.IsNullable
  , referencing_ObjectName                 = tFrom.name
  , referencing_ColumnName                 = colFrom.ExplicitName
  , referencing_IndexPatternColumnDatatype = dtFrom.ExplicitDataTypeName
  , referencing_RepoObject_fullname        = QuoteName ( fk.databasename ) + '.' + QuoteName ( tFrom.name )
  , referencing_RepoObject_fullname2       = fk.databasename + '.' + tFrom.name
  , referencing_IsKey                      = colFrom.IsKey
  , referencing_IsNullable                 = colFrom.IsNullable
From
    ssas.TMSCHEMA_RELATIONSHIPS_T        As fk
    Left Join
        ssas.TMSCHEMA_COLUMNS_T          As colFrom
            On
            colFrom.databasename    = fk.databasename
            And colFrom.TableID     = fk.FromTableID
            And colFrom.ID          = fk.FromColumnID

    Left Join
        ssas.TMSCHEMA_TABLES_T           As tFrom
            On
            tFrom.databasename      = colFrom.databasename
            And tFrom.ID            = colFrom.TableId

    Left Join
        configT.SsasDmv_ExplicitDataType As dtFrom
            On
            dtFrom.ExplicitDataType = colFrom.ExplicitDataType

    Left Join
        ssas.TMSCHEMA_COLUMNS_T          As colTo
            On
            colTo.databasename      = fk.databasename
            And colTo.TableID       = fk.ToTableID
            And colTo.ID            = fk.ToColumnID

    Left Join
        ssas.TMSCHEMA_TABLES_T           As tTo
            On
            tTo.databasename        = colTo.databasename
            And tTo.ID              = colTo.TableId

    Left Join
        configT.SsasDmv_ExplicitDataType As dtTo
            On
            dtTo.ExplicitDataType   = colTo.ExplicitDataType
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
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '944578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '994578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'ToCardinality';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9a4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'SecurityFilteringBehavior';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '974578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'RelyOnReferentialIntegrity';


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
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '964578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'JoinOnDateBehavior';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '934578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'IsActive';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '984578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'FromCardinality';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '924578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'ForeignKey_orignalName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '914578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '954578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'CrossFilteringBehavior';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ca6be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'referencing_IsNullable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c96be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'referencing_IsKey';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c86be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'referenced_IsNullable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c76be6eb-ad08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern', @level2type = N'COLUMN', @level2name = N'referenced_IsKey';

