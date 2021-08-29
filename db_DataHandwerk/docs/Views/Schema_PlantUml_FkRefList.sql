
CREATE View docs.Schema_PlantUml_FkRefList
As
Select
    SchemaName = fk.referencing_SysObject_schema_name
  , FkRefList  = String_Agg (
                                Concat (
                                           Cast(N'' As NVarchar(Max))
                                         , docs.fs_cleanStringForPuml ( fk.referenced_RepoObject_fullname2 )
                                         , '::'
                                         , docs.fs_cleanStringForPuml ( fk.referenced_index_name )
                                         , ' <-- '
                                         , docs.fs_cleanStringForPuml ( fk.referencing_RepoObject_fullname2 )
                                         , '::'
                                         , docs.fs_cleanStringForPuml ( fk.referencing_index_name )
                                       )
                              , Char ( 13 ) + Char ( 10 )
                            ) Within Group(Order By
                                               fk.referenced_RepoObject_fullname2
                                             , fk.referencing_RepoObject_fullname2)
From
    repo.ForeignKey_Indexes_union_T As fk
Where
    fk.referenced_SysObject_schema_name = fk.referencing_SysObject_schema_name
Group By
    fk.referencing_SysObject_schema_name