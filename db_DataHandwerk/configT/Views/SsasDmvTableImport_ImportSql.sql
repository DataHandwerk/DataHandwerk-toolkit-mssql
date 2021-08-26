/*
there could be more than one isActive = 1 in config.SsasDatabasename

* we could truncate once and import all
* or we could use the [isCurrentImport] and loop through aktive databasename and import them one by one

*/
Create   View configT.SsasDmvTableImport_ImportSql
As
Select
    T2.databasename
  , T2.LinkedServer
  , T2.isActive
  , T2.isCurrentImport
  , truncateSql     = Concat (
                                 'TRUNCATE TABLE '
                               , Char ( 13 ) + Char ( 10 )
                               , 'ssas.'
                               , T1.DmvTableName
                               , Char ( 13 ) + Char ( 10 )
                               , 'GO'
                               , Char ( 13 ) + Char ( 10 )
                             )
  , DeleteInsertSql = Concat (
                                 'DELETE '
                               , Char ( 13 ) + Char ( 10 )
                               , 'ssas.'
                               , T1.DmvTableName
                               , Char ( 13 ) + Char ( 10 )
                               , 'WHERE databasename = ''' + T2.databasename + ''''
                               , Char ( 13 ) + Char ( 10 )
                               , 'GO'
                               , Char ( 13 ) + Char ( 10 )
                               , Char ( 13 ) + Char ( 10 )
                               , 'Insert Into '
                               , Char ( 13 ) + Char ( 10 )
                               , 'ssas.'
                               , T1.DmvTableName
                               , Char ( 13 ) + Char ( 10 )
                               , '('
                               , Char ( 13 ) + Char ( 10 )
                               , 'databasename'
                               , Char ( 13 ) + Char ( 10 )
                               , ', '
                               , T1.DmvColumnList
                               , Char ( 13 ) + Char ( 10 )
                               , ')'
                               , Char ( 13 ) + Char ( 10 )
                               , 'Select'
                               , Char ( 13 ) + Char ( 10 )
                               , '''' + T2.databasename + ''''
                               , Char ( 13 ) + Char ( 10 )
                               , ', '
                               , T1.DmvColumnList
                               , Char ( 13 ) + Char ( 10 )
                               , 'From'
                               , Char ( 13 ) + Char ( 10 )
                               , 'OpenQuery'
                               , Char ( 13 ) + Char ( 10 )
                               , '( '
                               , T2.LinkedServer
                               , ', '
                               , Char ( 13 ) + Char ( 10 )
                               , '''Select '
                               , Char ( 13 ) + Char ( 10 )
                               , '  '
                               , T1.DmvColumnList
                               , Char ( 13 ) + Char ( 10 )
                               , 'From $SYSTEM.'
                               , T1.DmvTableName
                               , ''''
                               , Char ( 13 ) + Char ( 10 )
                               , ')'
                               , Char ( 13 ) + Char ( 10 )
                               , 'GO'
                               , Char ( 13 ) + Char ( 10 )
                             )
From
    configT.SsasDmvTableImport_DmvColumnList As T1
    --there could be more than one isActive database
    Cross Join config.SsasDatabasename       As T2
Where
    T2.isActive = 1
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1fc70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'SsasDmvTableImport_ImportSql', @level2type = N'COLUMN', @level2name = N'DeleteInsertSql';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1ec70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'SsasDmvTableImport_ImportSql', @level2type = N'COLUMN', @level2name = N'truncateSql';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1dc70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'SsasDmvTableImport_ImportSql', @level2type = N'COLUMN', @level2name = N'isCurrentImport';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1cc70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'SsasDmvTableImport_ImportSql', @level2type = N'COLUMN', @level2name = N'isActive';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1bc70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'SsasDmvTableImport_ImportSql', @level2type = N'COLUMN', @level2name = N'LinkedServer';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1ac70313-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'SsasDmvTableImport_ImportSql', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'dae6a70a-8a06-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'VIEW', @level1name = N'SsasDmvTableImport_ImportSql';

