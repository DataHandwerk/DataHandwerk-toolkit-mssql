

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