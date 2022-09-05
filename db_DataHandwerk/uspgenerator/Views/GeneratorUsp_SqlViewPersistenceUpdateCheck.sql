--similair logic to [uspgenerator].[GeneratorUspStep_Persistence_src]
--step 600
--'update changed'
Create   View uspgenerator.GeneratorUsp_SqlViewPersistenceUpdateCheck
As
Select
    usp_id                        = gu.id
  , view_fullname                 = Replace ( gu.usp_fullname, 'usp_PERSIST_', 'PersistenceUpdateCheck_' )
  , SqlViewPersistenceUpdateCheck = Concat (
                                               'USE  ['
                                             , dwhdb.dwh_database_name
                                             , ']'
                                             , Char ( 13 ) + Char ( 10 )
                                             , 'GO'
                                             , Char ( 13 ) + Char ( 10 )
                                             , '/*'
                                             , Char ( 13 ) + Char ( 10 )
                                             , 'code of this view is generated in the dhw repository. Do not modify manually.'
                                             , Char ( 13 ) + Char ( 10 )
                                             , 'Use [uspgenerator].[GeneratorUsp] to define persistence'
                                             , Char ( 13 ) + Char ( 10 )
                                             , '[uspgenerator].[GeneratorUsp_SqlViewPersistenceUpdateCheck] to get the code of the view'
                                             , Char ( 13 ) + Char ( 10 )
                                             , '[uspgenerator].[GeneratorUsp_SqlUsp] to get the code of the usp and also the code of the view'
                                             , Char ( 13 ) + Char ( 10 )
                                             , '*/'
                                             , Char ( 13 ) + Char ( 10 )
                                             , 'CREATE OR ALTER VIEW '
                                             , Char ( 13 ) + Char ( 10 )
                                             , Replace ( gu.usp_fullname, 'usp_PERSIST_', 'PersistenceUpdateCheck_' )
                                             , '
AS
SELECT
'
                                             , ro.PersistenceSrcTgtColumnList
                                             , '
FROM '
                                               + ro.RepoObject_fullname + ' AS T
INNER JOIN '
                                               + ro.persistence_source_SysObject_fullname_or_tempsource + ' AS S
ON
'
                                               + i.PersistenceWhereColumnList
                                             --ro.PersistenceCompareColumnList could be empty
                                             , '
WHERE
' +                                          ro.PersistenceCompareColumnList
                                             , '
GO

'
                                           )
  , gu.usp_fullname
From
    repo.RepoObject_gross2                As ro
    Inner Join
        uspgenerator.GeneratorUsp         As gu
            On
            ro.RepoObject_schema_name = gu.usp_schema
            And ro.usp_persistence_name = gu.usp_name
    --INNER JOIN because step 600 should be created only when PK exists in persistence_source

    Inner Join
        repo.RepoObject_gross             As ro_s
            On
            ro_s.RepoObject_guid = ro.persistence_source_RepoObject_guid

    Inner Join
        repo.Index_ColumList_T            As i
            On
            i.index_guid = ro_s.pk_index_guid
    Cross Join config.ftv_dwh_database () As dwhdb
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '173ad98e-d92a-ed11-8577-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlViewPersistenceUpdateCheck', @level2type = N'COLUMN', @level2name = N'usp_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '163ad98e-d92a-ed11-8577-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlViewPersistenceUpdateCheck', @level2type = N'COLUMN', @level2name = N'SqlViewPersistenceUpdateCheck';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '153ad98e-d92a-ed11-8577-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlViewPersistenceUpdateCheck', @level2type = N'COLUMN', @level2name = N'view_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '143ad98e-d92a-ed11-8577-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlViewPersistenceUpdateCheck', @level2type = N'COLUMN', @level2name = N'usp_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'd7539585-d92a-ed11-8577-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator', @level1type = N'VIEW', @level1name = N'GeneratorUsp_SqlViewPersistenceUpdateCheck';

