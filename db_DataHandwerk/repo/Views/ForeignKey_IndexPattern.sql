
CREATE View repo.ForeignKey_IndexPattern
As
Select
    --
    constraint_object_id               = fk.object_id
  , fk.ForeignKey_guid
  , ForeignKey_name                    = Max ( fkc.ForeignKey_name )
  , ForeignKey_fullname                = Max ( fk.ForeignKey_fullname )
  , referencing_RepoObject_guid        = Max ( fkc.referencing_RepoObject_guid )
  , referenced_RepoObject_guid         = Max ( fkc.referenced_RepoObject_guid )
  , referencing_IndexPatternColumnName = String_Agg ( Cast(fkc.referencing_column_name As NVarchar(Max)), ',' ) Within Group(Order By
                                                                                                                                 fkc.constraint_column_id)
  -- , referencing_IndexPatternColumnGuid = String_Agg(CAST(referencing_RepoObjectColumn_guid AS VARCHAR(36)), ',') WITHIN
  --GROUP (
  --  ORDER BY [constraint_column_id]
  --  )
  , referenced_IndexPatternColumnName  = String_Agg ( Cast(fkc.referenced_column_name As NVarchar(Max)), ',' ) Within Group(Order By
                                                                                                                                fkc.constraint_column_id)
  -- , referenced_IndexPatternColumnGuid = String_Agg(CAST(referenced_RepoObjectColumn_guid AS VARCHAR(36)), ',') WITHIN
  --GROUP (
  --  ORDER BY [constraint_column_id]
  --  )
  , delete_referential_action          = Max ( fk.delete_referential_action )
  , update_referential_action          = Max ( fk.update_referential_action )
From
    repo_sys.ForeignKey           As fk
    Left Join
        repo_sys.ForeignKeyColumn As fkc
            On
            fkc.ForeignKey_guid = fk.ForeignKey_guid
Group By
    fk.object_id
  , fk.ForeignKey_guid
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '7e170058-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_IndexPattern';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9ed08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_IndexPattern'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a0d08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_IndexPattern'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_IndexPatternColumnName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9fd08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_IndexPattern'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'a1d08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_IndexPattern'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_IndexPatternColumnName';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9cd08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_IndexPattern'
  , @level2type = N'COLUMN'
  , @level2name = N'ForeignKey_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9bd08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_IndexPattern'
  , @level2type = N'COLUMN'
  , @level2name = N'ForeignKey_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9dd08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_IndexPattern'
  , @level2type = N'COLUMN'
  , @level2name = N'ForeignKey_fullname';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '9ad08365-c073-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_IndexPattern'
  , @level2type = N'COLUMN'
  , @level2name = N'constraint_object_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '42df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_IndexPattern'
  , @level2type = N'COLUMN'
  , @level2name = N'update_referential_action';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '41df2fe1-ae7a-eb11-84e5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'ForeignKey_IndexPattern'
  , @level2type = N'COLUMN'
  , @level2name = N'delete_referential_action';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo_sys].[ForeignKey]
* [repo_sys].[ForeignKeyColumn]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_IndexPattern';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'constraint_object_id,ForeignKey_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_IndexPattern';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'int,uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_IndexPattern';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'9B56674A-0696-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_IndexPattern';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.ForeignKey_Indexes.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_IndexPattern';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo_sys.ForeignKey.adoc[]
* xref:repo_sys.ForeignKeyColumn.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_IndexPattern';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[ForeignKey].[ForeignKey_guid]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_IndexPattern', @level2type = N'COLUMN', @level2name = N'ForeignKey_guid';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_IndexPattern';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_IndexPattern';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[ForeignKeyColumn].[ForeignKey_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_IndexPattern', @level2type = N'COLUMN', @level2name = N'ForeignKey_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[ForeignKey].[delete_referential_action]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_IndexPattern', @level2type = N'COLUMN', @level2name = N'delete_referential_action';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo_sys].[ForeignKey].[object_id]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'ForeignKey_IndexPattern', @level2type = N'COLUMN', @level2name = N'constraint_object_id';

