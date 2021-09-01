
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
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0a60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_PlantUml_FkRefList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1c60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_PlantUml_FkRefList', @level2type = N'COLUMN', @level2name = N'SchemaName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1d60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_PlantUml_FkRefList', @level2type = N'COLUMN', @level2name = N'FkRefList';

