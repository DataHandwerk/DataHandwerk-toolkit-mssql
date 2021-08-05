
CREATE View [reference].[RepoObjectColumn_RelationScript]
As
--
Select
    Distinct
    --
    referenced_RepoObject_guid
  , referencing_RepoObject_guid
  , DbmlRelation = Concat (
                              'Ref'
                            , ': '
                            , QuoteName (
                                            QuoteName ( referencing_schema_name ) + '.'
                                            + QuoteName ( referencing_entity_name )
                                          , '"'
                                        )
                            , '."'
                            , referencing_column_name
                            , '"'
                            --<: one-to-many. E.g: users.id < posts.user_id
                            -->: many-to-one. E.g: posts.user_id > users.id
                            ---: one-to-one. E.g: users.id - user_infos.user_id
                            , ' > '
                            , QuoteName (
                                            QuoteName ( referenced_schema_name ) + '.'
                                            + QuoteName ( referenced_entity_name )
                                          , '"'
                                        )
                            , '."'
                            , referenced_column_name
                            , '"'
                          )
From
    [reference].RepoObjectColumn_reference_T As rocu
    Inner Join
        repo.RepoObjectColumn             As roc1
            On
            roc1.RepoObjectColumn_guid = rocu.referencing_RepoObjectColumn_guid

    Inner Join
        repo.RepoObjectColumn             As roc2
            On
            roc2.RepoObjectColumn_guid = rocu.referenced_RepoObjectColumn_guid
Where
    --exclude virtual columns, which have [uniqueidentifier] as name
    roc1.is_RepoObjectColumn_name_uniqueidentifier     = 0
    And roc2.is_RepoObjectColumn_name_uniqueidentifier = 0
    And roc1.is_SysObjectColumn_name_uniqueidentifier  = 0
    And roc2.is_SysObjectColumn_name_uniqueidentifier  = 0;
--AND NOT [referenced_RepoObjectColumn_guid] IS NULL
--AND NOT [referencing_RepoObjectColumn_guid] IS NULL
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e779297f-447f-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_RelationScript'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e679297f-447f-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_RelationScript'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'e579297f-447f-eb11-84e6-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_RelationScript'
  , @level2type = N'COLUMN'
  , @level2name = N'DbmlRelation';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '06df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_RelationScript';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [reference].[RepoObjectColumn_reference_union]
* [repo].[RepoObjectColumn]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RelationScript';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.ftv_RepoObject_ColumReferenceRepoObject.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RelationScript';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:reference.RepoObjectColumn_reference_T.adoc[]
* xref:repo.RepoObjectColumn.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RelationScript';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_union].[referencing_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RelationScript', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectColumn_reference_union].[referenced_RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_RelationScript', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';

