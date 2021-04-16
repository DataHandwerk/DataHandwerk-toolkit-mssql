
/*
todo - direkt oder über extended properties
- Index List
- referencing
- referenced
*/
CREATE View [docs].[RepoObject_Adoc]
As
Select
    ro.RepoObject_guid
  , is_DocsOutput          = Max ( ro.is_DocsOutput )
  , RepoObject_fullname    = Max ( ro.RepoObject_fullname )
  , RepoObject_fullname2   = Max ( ro.RepoObject_fullname2 )
  , RepoObject_schema_name = Max ( RepoObject_schema_name )
  , SysObject_fullname     = Max ( ro.SysObject_fullname )
  , SysObject_fullname2    = Max ( ro.SysObject_fullname2 )
  , SysObject_schema_name  = Max ( SysObject_schema_name )
  , SysObject_type         = Max ( ro.SysObject_type )
  , SysObject_type_name    = Max ( ro.SysObject_type_name )
  , AdocContent            = Concat (
                                        '= '
                                      , Max ( ro.SysObject_fullname )
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      --
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '== existing_properties'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '// tag::existing_properties[]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , String_Agg (
                                                       Concat (
                                                                  Cast('' As NVarchar(Max))
                                                                , Case
                                                                      When Not rop.property_nvarchar Is Null
                                                                          Then
                                                                          ':ExistsProperty--' + Lower ( rop.property_name ) + ':'
                                                                          + Char ( 13 ) + Char ( 10 )
                                                                      Else
                                                                          ''
                                                                  End
                                                              )
                                                     , ''
                                                   ) Within Group(Order By
                                                                      rop_cross.property_name)
                                      , Case
                                            When Max ( ro.sql_modules_antora ) <> ''
                                                Then
                                                ':ExistsProperty--sql_modules_definition:' + Char ( 13 ) + Char ( 10 )
                                        End
                                      , Case
                                            When Max ( ro.SysObject_type ) In
                                            ( 'U', 'V' )
                                                Then
                                                ':ExistsProperty--FK:' + Char ( 13 ) + Char ( 10 )
                                        End
                                      , Case
                                            When Max ( ilist.AntoraIndexList ) <> ''
                                                Then
                                                ':ExistsProperty--AntoraIndexList:' + Char ( 13 ) + Char ( 10 )
                                        End
                                      , Case
                                            When Max ( parlist.AntoraParameterList ) <> ''
                                                Then
                                                ':ExistsProperty--AntoraParameterList:' + Char ( 13 ) + Char ( 10 )
                                        End
                                      , Case
                                            When Max ( ro.SysObject_type ) In
                                            ( 'U', 'V', 'IF' )
                                                Then
                                                ':ExistsProperty--Columns:' + Char ( 13 ) + Char ( 10 )
                                        End
                                      , '// end::existing_properties[]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      --
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '== RepoObject_guid'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '// tag::RepoObject_guid[]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , ro.RepoObject_guid
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '// end::RepoObject_guid[]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      --
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '== SysObject_type'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '// tag::SysObject_type[]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , Max ( ro.SysObject_type )
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '// end::SysObject_type[]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      --
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '== SysObject_type_name'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '// tag::SysObject_type_name[]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , Max ( ro.SysObject_type_name )
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '// end::SysObject_type_name[]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      --
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '== SysObject_id'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '// tag::SysObject_id[]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , Max ( ro.SysObject_id )
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '// end::SysObject_id[]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      --
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '== SysObject_modify_date'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '// tag::SysObject_modify_date[]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , Convert ( NVarchar(20), Max ( ro.SysObject_modify_date ), 120 )
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '// end::SysObject_modify_date[]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      --
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '== AntoraColumnDetails'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '// tag::AntoraColumnDetails[]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , Max ( clist.AntoraColumnDetails )
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '// end::AntoraColumnDetails[]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      --
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '== AntoraPkColumnTableRows'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '// tag::AntoraPkColumnTableRows[]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , Max ( clist.AntoraPkColumnTableRows )
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '// end::AntoraPkColumnTableRows[]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      --
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '== AntoraNonPkColumnTableRows'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '// tag::AntoraNonPkColumnTableRows[]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , Max ( clist.AntoraNonPkColumnTableRows )
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '// end::AntoraNonPkColumnTableRows[]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      --
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '== AntoraIndexList'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '// tag::AntoraIndexList[]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , Max ( ilist.AntoraIndexList )
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '// end::AntoraIndexList[]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      --
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '== AntoraParameterList'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '// tag::AntoraParameterList[]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , Max ( parlist.AntoraParameterList )
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '// end::AntoraParameterList[]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , String_Agg (
                                                       Concat (
                                                                  Cast('' As NVarchar(Max))
                                                                , Char ( 13 )
                                                                , Char ( 10 )
                                                                , '== '
                                                                , rop_cross.property_name
                                                                , Char ( 13 )
                                                                , Char ( 10 )
                                                                , Char ( 13 )
                                                                , Char ( 10 )
                                                                , '// tag::'
                                                                , Lower ( rop_cross.property_name )
                                                                , '[]'
                                                                , Char ( 13 )
                                                                , Char ( 10 )
                                                                , rop.property_nvarchar
                                                                , Char ( 13 )
                                                                , Char ( 10 )
                                                                , '// end::'
                                                                , Lower ( rop_cross.property_name )
                                                                , '[]'
                                                                , Char ( 13 )
                                                                , Char ( 10 )
                                                              )
                                                     , Char ( 13 ) + Char ( 10 )
                                                   ) Within Group(Order By
                                                                      rop_cross.property_name)
                                      --END
                                      --
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      --
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '== sql_modules_definition'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '// tag::sql_modules_definition[]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '[source,sql]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '----'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , Max ( ro.sql_modules_antora )
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '----'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      , '// end::sql_modules_definition[]'
                                      , Char ( 13 )
                                      , Char ( 10 )
                                      --
                                      , Char ( 13 )
                                      , Char ( 10 )
                                    )
  , PropertyCount          = Count ( Distinct rop.property_name )
From
    repo.RepoObject_gross             ro
    Left Join
        repo.RepoObjectProperty_cross rop_cross
            On
            rop_cross.RepoObject_guid = ro.RepoObject_guid

    Left Join
        [property].RepoObjectProperty       rop
            On
            rop.RepoObject_guid       = rop_cross.RepoObject_guid
            And rop.property_name     = rop_cross.property_name
    --AND NOT rop.[property_nvarchar] IS NULL

    Left Join
        docs.RepoObject_ColumnList    clist
            On
            clist.RepoObject_guid     = ro.RepoObject_guid

    Left Join
        docs.RepoObject_IndexList_T   ilist
            On
            ilist.RepoObject_guid     = ro.RepoObject_guid

    Left Join
        docs.RepoObject_ParameterList parlist
            On
            parlist.RepoObject_guid   = ro.RepoObject_guid
Group By
    ro.RepoObject_guid;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'd5e0b563-4291-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5a1254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_type_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dae0b563-4291-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5a5c44d7-1193-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '591254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd9e0b563-4291-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '595c44d7-1193-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd7e0b563-4291-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '581254dc-0593-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname2';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'd8e0b563-4291-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dce0b563-4291-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc'
  , @level2type = N'COLUMN'
  , @level2name = N'PropertyCount';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'dbe0b563-4291-eb11-84f2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc'
  , @level2type = N'COLUMN'
  , @level2name = N'AdocContent';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '43e90a1e-7495-eb11-84f4-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObject_Adoc'
  , @level2type = N'COLUMN'
  , @level2name = N'is_DocsOutput';
