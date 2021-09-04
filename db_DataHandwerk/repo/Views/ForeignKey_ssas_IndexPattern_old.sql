

create View [repo].[ForeignKey_ssas_IndexPattern_old]
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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '18ff988b-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a6dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'update_referential_action';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aadfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'afdfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'ToCardinality';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b0dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'SecurityFilteringBehavior';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'addfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'RelyOnReferentialIntegrity';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a4dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bcdfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bbdfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b8dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'referencing_ObjectName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bedfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'referencing_IsNullable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bddfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'referencing_IsKey';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a2dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'referencing_IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a3dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'referencing_IndexPatternColumnGuid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'badfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'referencing_IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b9dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'referencing_ColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a1dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b5dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b4dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b1dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'referenced_ObjectName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b7dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'referenced_IsNullable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b6dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'referenced_IsKey';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9fdfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'referenced_IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a0dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'referenced_IndexPatternColumnGuid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b3dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'referenced_IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b2dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'referenced_ColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'acdfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'JoinOnDateBehavior';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a9dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'IsActive';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aedfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'FromCardinality';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a8dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'ForeignKey_orignalName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9ddfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'ForeignKey_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9cdfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'ForeignKey_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9edfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'ForeignKey_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a5dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'delete_referential_action';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a7dfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'abdfd191-480b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_ssas_IndexPattern_old', @level2type = N'COLUMN', @level2name = N'CrossFilteringBehavior';

