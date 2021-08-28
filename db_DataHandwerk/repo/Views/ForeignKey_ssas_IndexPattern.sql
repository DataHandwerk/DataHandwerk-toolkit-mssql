
CREATE View repo.ForeignKey_ssas_IndexPattern
As
Select
    fk.ForeignKey_guid
  , ForeignKey_name                    = 'FK_' + tFrom.Name + '_TO_' + tTo.name
  , ForeignKey_fullname                = QuoteName ( fk.databasename ) + '.' + QuoteName ( 'FK_' + tFrom.Name + '_TO_' + tTo.name )
  , referencing_RepoObject_guid        = tFrom.RepoObject_guid
  , referenced_RepoObject_guid         = tTo.RepoObject_guid
  , referencing_IndexPatternColumnName = colFrom.ExplicitName
  , referencing_IndexPatternColumnGuid = Cast(colFrom.RepoObjectColumn_guid As Varchar(36))
  , referenced_IndexPatternColumnName  = colTo.ExplicitName
  , referenced_IndexPatternColumnGuid  = Cast(colTo.RepoObjectColumn_guid As Varchar(36))
  , delete_referential_action          = Cast(Null As TinyInt)
  , update_referential_action          = Cast(Null As TinyInt)
From
    ssas.TMSCHEMA_RELATIONSHIPS_T As fk
    Left Join
        ssas.TMSCHEMA_COLUMNS_T   As colFrom
            On
            colFrom.databasename = fk.databasename
            And colFrom.TableID  = fk.FromTableID
            And colFrom.ID       = fk.FromColumnID

    Left Join
        ssas.TMSCHEMA_TABLES_T    As tFrom
            On
            tFrom.databasename   = colFrom.databasename
            And tFrom.ID         = colFrom.TableId

    Left Join
        ssas.TMSCHEMA_COLUMNS_T   As colTo
            On
            colTo.databasename   = fk.databasename
            And colTo.TableID    = fk.ToTableID
            And colTo.ID         = fk.ToColumnID

    Left Join
        ssas.TMSCHEMA_TABLES_T    As tTo
            On
            tTo.databasename     = colTo.databasename
            And tTo.ID           = colTo.TableId