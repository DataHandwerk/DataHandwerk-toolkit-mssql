
/*
<<property_start>>exampleUsage
--get sql code CREATE OR ALTER TABLE for persistence tables
Select
    RepoObject_guid
  , RepoObject_fullname
  , SqlCreateTable
--, DbmlTable
--, ConList
--, persistence_source_RepoObject_fullname
--, persistence_source_RepoObject_guid
--, persistence_source_SysObject_fullname
From
    dhw_self.repo.RepoObject_SqlCreateTable
Where
    Not persistence_source_RepoObject_guid Is Null
Order By
    RepoObject_fullname;
<<property_end>>

*/
CREATE View [repo].[RepoObject_SqlCreateTable]
As
Select
    ro.RepoObject_guid
  , Concat (
               'Table '
             , QuoteName ( ro.RepoObject_fullname, '"' )
             , '{'
             , Char ( 13 )
             , Char ( 10 )
             , ColList.DbmlColumnList
             --note: 'string to add notes'
             , Case
                   When Not ro.Property_ms_description Is Null
                       Then
                       Char ( 13 ) + Char ( 10 ) + 'Note: ''''''' + Char ( 13 ) + Char ( 10 )
                       + Replace ( Replace ( ro.Property_ms_description, '\', '\\' ), '''''''', '\''''''' )
                       + Char ( 13 ) + Char ( 10 ) + ''''''''
                   Else
                       Null
               End
             --optional Settings [setting1: value1, setting2: value2, setting3, setting4]
             , Char ( 13 )
             , Char ( 10 )
             , Case
                   When Not IndexList.DbmlIndexList Is Null
                       Then
                       Char ( 13 ) + Char ( 10 ) + 'indexes {' + Char ( 13 ) + Char ( 10 ) + IndexList.DbmlIndexList
                       + Char ( 13 ) + Char ( 10 ) + '}' + Char ( 13 ) + Char ( 10 )
                   Else
                       Null
               End
             , '}'
             , Char ( 13 )
             , Char ( 10 )
           ) As DbmlTable
  , ro.RepoObject_fullname
  , Concat (
               'USE  ['
             , dwhdb.dwh_database_name
             , ']'
             , Char ( 13 ) + Char ( 10 )
             , 'GO'
             , Char ( 13 ) + Char ( 10 )
             , 'CREATE TABLE '
             , ro.RepoObject_fullname
             , ' ('
             , Char ( 13 )
             , Char ( 10 )
             , ColList.CreateColumnList
             , Case
                   When Exists
                        (
                            Select
                                1
                            From
                                repo.Index_SqlConstraint_PkUq ConList
                            Where
                                ConList.parent_RepoObject_guid = ro.RepoObject_guid
                        )
                       Then
                       ','
                   Else
                       Null
               End
             --CONSTRAINT PK, FK, depending on some settings
             , ConList.ConList
             --PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
             , Case
                   When Exists
                        (
                            Select
                                1
                            From
                                repo.RepoObjectColumn roc
                            Where
                                roc.RepoObject_guid                = ro.RepoObject_guid
                                And roc.Repo_generated_always_type = 1
                        )
                        And Exists
                            (
                                Select
                                    1
                                From
                                    repo.RepoObjectColumn roc
                                Where
                                    roc.RepoObject_guid                = ro.RepoObject_guid
                                    And roc.Repo_generated_always_type = 2
                            )
                       Then
                       Concat (
                                  ', PERIOD FOR SYSTEM_TIME ('
                                , QuoteName ((
                                                 Select
                                                     Top ( 1 )
                                                     RepoObjectColumn_name
                                                 From
                                                     repo.RepoObjectColumn roc
                                                 Where
                                                     roc.RepoObject_guid                = ro.RepoObject_guid
                                                     And roc.Repo_generated_always_type = 1
                                                 Order By
                                                     RepoObjectColumn_name
                                             )
                                            )
                                , ', '
                                , QuoteName ((
                                                 Select
                                                     Top ( 1 )
                                                     RepoObjectColumn_name
                                                 From
                                                     repo.RepoObjectColumn roc
                                                 Where
                                                     roc.RepoObject_guid                = ro.RepoObject_guid
                                                     And roc.Repo_generated_always_type = 2
                                                 Order By
                                                     RepoObjectColumn_name
                                             )
                                            )
                                , ')'
                                , Char ( 13 )
                                , Char ( 10 )
                              )
                   Else
                       Null
               End
             , ')'
             --WITH
             --(
             --SYSTEM_VERSIONING = ON ( HISTORY_TABLE = [Application].[Cities_Archive] )
             --)
             , Case ro.Repo_temporal_type
                   When 2
                       Then
                       Concat (
                                  Char ( 13 )
                                , Char ( 10 )
                                , 'WITH'
                                , Char ( 13 )
                                , Char ( 10 )
                                , '('
                                , Char ( 13 )
                                , Char ( 10 )
                                , 'SYSTEM_VERSIONING = ON ( HISTORY_TABLE = '
                                --, '[Application].[Cities_Archive]'
                                , Coalesce (
                                               ro_hist.RepoObject_fullname
                                             , Concat (
                                                          QuoteName ( IsNull (
                                                                                 Hist_Table_schema.[Parameter_value_result]
                                                                               , ro.RepoObject_schema_name
                                                                             )
                                                                    )
                                                        , '.'
                                                        , QuoteName ( Concat (
                                                                                 ro.RepoObject_name
                                                                               , Hist_Table_name_suffix.[Parameter_value_result]
                                                                             )
                                                                    )
                                                      )
                                           )
                                , ' )'
                                , Char ( 13 )
                                , Char ( 10 )
                                , ')'
                                , Char ( 13 )
                                , Char ( 10 )
                              )
                   Else
                       Null
               End
           ) As SqlCreateTable
  --ConstraintList
  , ConList.ConList
  , ro.persistence_source_RepoObject_fullname
  , ro.persistence_source_RepoObject_guid
  , ro.persistence_source_SysObject_fullname
From
    repo.RepoObject_gross                                                     ro
    --column list should exist, otherwise CREATE statement will be invalid
    Inner Join
        repo.RepoObject_ColumnList                                            As ColList
            On
            ColList.RepoObject_guid = ro.RepoObject_guid

    Left Join
    (
        Select
            parent_RepoObject_guid
          , ConList = String_Agg (
                                     Concat (
                                                --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                                                Cast(' ' As NVarchar(Max)), Con.SqlConstraint, Char ( 13 ), Char ( 10 )
                                            )
                                   , ','
                                 )
        From
            repo.Index_SqlConstraint_PkUq Con
        Group By
            parent_RepoObject_guid
    )                                                                         ConList
        On
        ConList.parent_RepoObject_guid = ro.RepoObject_guid

    Left Join
    (
        Select
            parent_RepoObject_guid
          , DbmlIndexList = String_Agg (
                                           Concat (
                                                      --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                                                      Cast(' ' As NVarchar(Max))
                                                    , '('
                                                    , i.DbmlIndexColumnList
                                                    , ') '
                                                    , '['
                                                    , Case
                                                          --this doesn't work. but we define pk in DbmlColumnList
                                                          When i.is_index_primary_key = 1
                                                              Then
                                                              'pk'
                                                          When i.is_index_unique = 1
                                                              Then
                                                              'unique'
                                                          Else
                                                              'name:''' + index_name + ''''
                                                      End
                                                    , ']'
                                                  )
                                         , Char ( 13 ) + Char ( 10 )
                                       ) Within Group(Order By
                                                          i.RowNumber_PkPerParentObject)
        From
            repo.Index_gross i
        Where
            i.is_index_primary_key = 0
            And
            (
                i.is_index_unique  = 1
                Or i.is_index_real = 1
            )
        Group By
            parent_RepoObject_guid
    )                                                                         IndexList
        On
        IndexList.parent_RepoObject_guid = ro.RepoObject_guid

    Left Join
        repo.RepoObject                                                       ro_hist
            On
            ro_hist.RepoObject_guid = ro.Repo_history_table_guid
    Cross Join [config].[ftv_get_parameter_value] ( 'Hist_Table_schema', '' ) As Hist_Table_schema
    Cross Join [config].[ftv_get_parameter_value] ( 'Hist_Table_name_suffix', '' ) As Hist_Table_name_suffix
    Cross Join [config].ftv_dwh_database () As dwhdb;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '7990291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlCreateTable';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e9f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlCreateTable'
  , @level2type = N'COLUMN'
  , @level2name = N'SqlCreateTable';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e8f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlCreateTable'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'eaf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlCreateTable'
  , @level2type = N'COLUMN'
  , @level2name = N'ConList';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4f4cb4d0-4762-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlCreateTable'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '524cb4d0-4762-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlCreateTable'
  , @level2type = N'COLUMN'
  , @level2name = N'persistence_source_SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '514cb4d0-4762-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlCreateTable'
  , @level2type = N'COLUMN'
  , @level2name = N'persistence_source_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '504cb4d0-4762-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlCreateTable'
  , @level2type = N'COLUMN'
  , @level2name = N'persistence_source_RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '3fdf2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlCreateTable'
  , @level2type = N'COLUMN'
  , @level2name = N'DbmlTable';
Go

Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_gross].[persistence_source_SysObject_fullname]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlCreateTable'
  , @level2type = N'COLUMN'
  , @level2name = N'persistence_source_SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_gross].[persistence_source_RepoObject_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlCreateTable'
  , @level2type = N'COLUMN'
  , @level2name = N'persistence_source_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObject_gross].[persistence_source_RepoObject_fullname]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_SqlCreateTable'
  , @level2type = N'COLUMN'
  , @level2name = N'persistence_source_RepoObject_fullname';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[ftv_get_parameter_value]
* [repo].[Index_gross]
* [repo].[Index_SqlConstraint_PkUq]
* [repo].[RepoObject]
* [repo].[RepoObject_ColumnList]
* [repo].[RepoObject_gross]
* [repo].[RepoObjectColumn]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlCreateTable';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlCreateTable';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlCreateTable';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlCreateTable';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'662DB2AA-0F96-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlCreateTable';


GO
EXECUTE sp_addextendedproperty @name = N'exampleUsage', @value = N'
--get sql code CREATE OR ALTER TABLE for persistence tables
Select
    RepoObject_guid
  , RepoObject_fullname
  , SqlCreateTable
--, DbmlTable
--, ConList
--, persistence_source_RepoObject_fullname
--, persistence_source_RepoObject_guid
--, persistence_source_SysObject_fullname
From
    dhw_self.repo.RepoObject_SqlCreateTable
Where
    Not persistence_source_RepoObject_guid Is Null
Order By
    RepoObject_fullname;', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlCreateTable';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.ftv_RepoObject_ColumReferenceRepoObject.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlCreateTable';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.ftv_dwh_database.adoc[]
* xref:config.ftv_get_parameter_value.adoc[]
* xref:repo.Index_gross.adoc[]
* xref:repo.Index_SqlConstraint_PkUq.adoc[]
* xref:repo.RepoObject.adoc[]
* xref:repo.RepoObject_ColumnList.adoc[]
* xref:repo.RepoObject_gross.adoc[]
* xref:repo.RepoObjectColumn.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'RepoObject_SqlCreateTable';

