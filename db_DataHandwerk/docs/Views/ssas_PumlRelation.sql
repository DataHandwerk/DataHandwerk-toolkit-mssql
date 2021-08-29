
/*to: noch nicht fertig, unnötige entfernen*/
CREATE View docs.ssas_PumlRelation
As
Select
    ForeignKey_guid
  , ForeignKey_name
  , SchemaName                            = databasename
  , PumlRelation                          = Concat (
                                                       Cast(N'' As NVarchar(Max))
                                                     --ssas names can contain space and other
                                                     , docs.fs_cleanStringForPuml ( referenced_RepoObject_fullname2 )
                                                     , '::'
                                                     , docs.fs_cleanStringForPuml ( referenced_ColumnName )
                                                     , ' '
                                                     --todo: check with test data, containing 1:1 and 1:n relations
                                                     , Iif(ToCardinality = 1, '|', '}')
                                                     , Iif(referenced_IsNullable = 1, 'o', '|')
                                                     , Case
                                                           When IsActive = 1
                                                               Then
                                                               Iif(CrossFilteringBehavior = 1, '-[plain]-', '-[bold]-')
                                                           Else
                                                               Iif(CrossFilteringBehavior = 1, '-[dotted]-', '-[dashed]-')
                                                       End
                                                     , Iif(referencing_IsNullable = 1, 'o', '|')
                                                     , Iif(FromCardinality = 1, '|', '{')
                                                     , ' '
                                                     , docs.fs_cleanStringForPuml ( referencing_RepoObject_fullname2 )
                                                     , '::'
                                                     , docs.fs_cleanStringForPuml ( referencing_ColumnName )
                                                   )
  , ForeignKey_fullname
  , referenced_IndexPatternColumnName
  , referenced_IndexPatternColumnGuid
  , referenced_RepoObject_guid
  , referencing_IndexPatternColumnName
  , referencing_IndexPatternColumnGuid
  , referencing_RepoObject_guid
  , delete_referential_action
  , update_referential_action
  , ForeignKey_orignalName
  , IsActive
  , Type
  , CrossFilteringBehavior
  , JoinOnDateBehavior
  , RelyOnReferentialIntegrity
  , FromCardinality
  , ToCardinality
  , SecurityFilteringBehavior
  , referenced_ObjectName
  , referenced_ColumnName
  , referenced_IndexPatternColumnDatatype
  , referenced_RepoObject_fullname
  , referenced_RepoObject_fullname2
  , referencing_ObjectName
  , referencing_ColumnName
  , referencing_IndexPatternColumnDatatype
  , referencing_RepoObject_fullname
  , referencing_RepoObject_fullname2
From
    repo.ForeignKey_ssas_IndexPattern
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ec4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eb4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ea4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'referencing_IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e94578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'referencing_ColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e84578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'referencing_ObjectName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e74578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e64578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e54578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'referenced_IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e44578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'referenced_ColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e34578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'referenced_ObjectName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e24578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'SecurityFilteringBehavior';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e14578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'ToCardinality';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e04578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'FromCardinality';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'df4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'RelyOnReferentialIntegrity';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'de4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'JoinOnDateBehavior';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dd4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'CrossFilteringBehavior';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dc4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'Type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'db4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'IsActive';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'da4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'ForeignKey_orignalName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd94578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'update_referential_action';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd84578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'delete_referential_action';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd74578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd64578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'referencing_IndexPatternColumnGuid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd54578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'referencing_IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd44578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd34578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'referenced_IndexPatternColumnGuid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd24578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'referenced_IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd14578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'ForeignKey_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd04578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'PumlRelation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cf4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'SchemaName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ce4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'ForeignKey_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cd4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation', @level2type = N'COLUMN', @level2name = N'ForeignKey_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6c6e8dee-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssas_PumlRelation';

