Create View repo.check_IndexColumn_virtual_referenced_setpoint
As
Select
    T1.index_guid
  , T1.index_column_id
  , T1.referencing_RepoObjectColumn_guid
  , T1.referenced_index_guid
  , T1.referenced_RepoObjectColumn_guid
  , ro_s.SysObject_fullname     As SysObject_fullname_s
  , ro_t.SysObject_fullname     As SysObject_fullname_t
  , roc_s.SysObjectColumn_name  As SysObjectColumn_name_s
  , roc_t.SysObjectColumn_name  As SysObjectColumn_name_t
  , T1.referenced_RepoObject_guid
  , roc_s.RepoObject_guid       As RepoObject_guid_s
  , T1.referencing_RepoObject_guid
  , roc_t.RepoObject_guid       As RepoObject_guid_t
  , roc_t.RepoObjectColumn_guid As RepoObjectColumn_guid_t
--    , [roc_s].[RepoObjectColumn_guid] AS [RepoObjectColumn_guid_s]
--, [roc_s].[RepoObjectColumn_name] AS [RepoObjectColumn_name_s]
--, [roc_t].[RepoObjectColumn_name] AS [RepoObjectColumn_name_t]
From
    repo.IndexColumn_virtual_referenced_setpoint As T1
    Left Outer Join
        repo.RepoObjectColumn                    As roc_t
            On
            T1.referencing_RepoObjectColumn_guid = roc_t.RepoObjectColumn_guid

    Left Outer Join
        repo.RepoObjectColumn                    As roc_s
            On
            T1.referenced_RepoObjectColumn_guid  = roc_s.RepoObjectColumn_guid

    Left Outer Join
        repo.RepoObject                          As ro_t
            On
            T1.referencing_RepoObject_guid       = ro_t.RepoObject_guid

    Left Outer Join
        repo.RepoObject                          As ro_s
            On
            T1.referenced_RepoObject_guid        = ro_s.RepoObject_guid;
--WHERE  [T1].[index_guid] = '9731BB8B-CB50-EB11-84D5-A81E8446D5B0'
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '8990291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'check_IndexColumn_virtual_referenced_setpoint';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4ff77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'check_IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObjectColumn_name_t';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4ef77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'check_IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObjectColumn_name_s';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4df77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'check_IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname_t';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4cf77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'check_IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'SysObject_fullname_s';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '54f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'check_IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObjectColumn_guid_t';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '53f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'check_IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid_t';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '51f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'check_IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'RepoObject_guid_s';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '49f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'check_IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '52f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'check_IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4bf77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'check_IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '50f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'check_IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4af77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'check_IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '47f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'check_IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'index_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '48f77926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'check_IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'index_column_id';
Go

Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[IndexColumn_virtual_referenced_setpoint].[referencing_RepoObjectColumn_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'check_IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[IndexColumn_virtual_referenced_setpoint].[referencing_RepoObject_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'check_IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[IndexColumn_virtual_referenced_setpoint].[referenced_RepoObjectColumn_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'check_IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[IndexColumn_virtual_referenced_setpoint].[referenced_RepoObject_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'check_IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[IndexColumn_virtual_referenced_setpoint].[referenced_index_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'check_IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_index_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[IndexColumn_virtual_referenced_setpoint].[index_guid]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'check_IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'index_guid';
Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[IndexColumn_virtual_referenced_setpoint].[index_column_id]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'check_IndexColumn_virtual_referenced_setpoint'
  , @level2type = N'COLUMN'
  , @level2name = N'index_column_id';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [repo].[IndexColumn_virtual_referenced_setpoint]
* [repo].[RepoObject]
* [repo].[RepoObjectColumn]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'check_IndexColumn_virtual_referenced_setpoint';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'index_guid,index_column_id', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'check_IndexColumn_virtual_referenced_setpoint';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'index_guid,index_column_id', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'check_IndexColumn_virtual_referenced_setpoint';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier,int', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'check_IndexColumn_virtual_referenced_setpoint';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'938AA10A-AB97-EB11-84F4-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'check_IndexColumn_virtual_referenced_setpoint';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:repo.IndexColumn_virtual_referenced_setpoint.adoc[]
* xref:repo.RepoObject.adoc[]
* xref:repo.RepoObjectColumn.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'check_IndexColumn_virtual_referenced_setpoint';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the column. Is unique within the object.
if it not exists in the database, the RepoObject_guid or any other guid is used, because this column should not be empty', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'check_IndexColumn_virtual_referenced_setpoint', @level2type = N'COLUMN', @level2name = N'SysObjectColumn_name_t';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the column. Is unique within the object.
if it not exists in the database, the RepoObject_guid or any other guid is used, because this column should not be empty', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'check_IndexColumn_virtual_referenced_setpoint', @level2type = N'COLUMN', @level2name = N'SysObjectColumn_name_s';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[SysObject_schema_name],''].['',[SysObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'check_IndexColumn_virtual_referenced_setpoint', @level2type = N'COLUMN', @level2name = N'SysObject_fullname_t';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[SysObject_schema_name],''].['',[SysObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'check_IndexColumn_virtual_referenced_setpoint', @level2type = N'COLUMN', @level2name = N'SysObject_fullname_s';

