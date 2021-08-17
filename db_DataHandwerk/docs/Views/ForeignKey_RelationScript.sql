
CREATE View docs.ForeignKey_RelationScript
As
--
Select
    --
    DbmlRelation = Concat (
                              'Ref '
                            , ForeignKey_name
                            , ': '
                            , QuoteName ( referencing_RepoObject_fullname, '"' )
                            , '.('
                            , referencing_IndexPatternColumnName
                            , ')'
                            --<: one-to-many. E.g: users.id < posts.user_id
                            -->: many-to-one. E.g: posts.user_id > users.id
                            ---: one-to-one. E.g: users.id - user_infos.user_id
                            , ' > '
                            , QuoteName ( referenced_RepoObject_fullname, '"' )
                            , '.('
                            , referenced_IndexPatternColumnName
                            , ')'
                            , '[delete: '
                            , Case delete_referential_action
                                  When 0
                                      Then
                                      'no action'
                                  When 1
                                      Then
                                      'Cascade'
                                  When 2
                                      Then
                                      'Set null'
                                  When 3
                                      Then
                                      'Set default'
                              End
                            , ', update: '
                            , Case update_referential_action
                                  When 0
                                      Then
                                      'no action'
                                  When 1
                                      Then
                                      'Cascade'
                                  When 2
                                      Then
                                      'Set null'
                                  When 3
                                      Then
                                      'Set default'
                              End
                            , ']'
                          )
  , referenced_RepoObject_fullname
  , referenced_RepoObject_guid
  , referencing_RepoObject_fullname
  , referencing_RepoObject_guid
--, [ForeignKey_guid]
--, [is_MatchingDatatypePattern]
--, [ForeignKey_name]
--, [ForeignKey_fullname]
--, [referenced_index_guid]
--, [referenced_IndexPatternColumnDatatype]
--, [referenced_IndexPatternColumnName]
--, [referencing_index_guid]
--, [referencing_IndexPatternColumnDatatype]
--, [referencing_IndexPatternColumnName]
--, [delete_referential_action]
--, [update_referential_action]
From
    repo.ForeignKey_Indexes_union_T
Where
    Not referenced_index_guid Is Null
    And Not referencing_index_guid Is Null
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e479297f-447f-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_RelationScript'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e379297f-447f-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_RelationScript'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e279297f-447f-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_RelationScript'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e179297f-447f-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_RelationScript'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e079297f-447f-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_RelationScript'
  , @level2type = N'COLUMN'
  , @level2name = N'DbmlRelation';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '05df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_RelationScript';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[ForeignKey_Indexes_union_T]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ForeignKey_RelationScript';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'referenced_RepoObject_guid,referencing_RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ForeignKey_RelationScript';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ForeignKey_RelationScript';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'B2A389E4-1699-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ForeignKey_RelationScript';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.ForeignKey_Indexes_union_T.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ForeignKey_RelationScript';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[ForeignKey_Indexes_union_T].[referencing_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ForeignKey_RelationScript', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[ForeignKey_Indexes_union_T].[referencing_RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ForeignKey_RelationScript', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[ForeignKey_Indexes_union_T].[referenced_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ForeignKey_RelationScript', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[ForeignKey_Indexes_union_T].[referenced_RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ForeignKey_RelationScript', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname';

