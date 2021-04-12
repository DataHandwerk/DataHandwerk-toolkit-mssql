--"common" references
--these should be "common" columns in views, not containing expressions
--Attention: views on views are "resolved" like views on the underlaying tables!
--it looks like we don't get references between views here!
Create View repo.RepoObjectColumn_reference_FirstResultSet
As
--
Select
    ro.SysObject_id                                                            As referencing_id
  , roc.SysObjectColumn_column_id                                              As referencing_minor_id
  , Cast(ro.SysObject_id As BigInt) * 10000 + roc.SysObjectColumn_column_id    As referencing_node_id
  , roc2.SysObject_id                                                          As referenced_id
  , roc2.SysObjectColumn_column_id                                             As referenced_minor_id
  , Cast(roc2.SysObject_id As BigInt) * 10000 + roc2.SysObjectColumn_column_id As referenced_node_id
  , ros.RepoObject_guid                                                        As referencing_RepoObject_guid
  , roc.RepoObjectColumn_guid                                                  As referencing_RepoObjectColumn_guid
  , roc2.RepoObject_guid                                                       As referenced_RepoObject_guid
  , roc2.RepoObjectColumn_guid                                                 As referenced_RepoObjectColumn_guid
  , ro.SysObject_type                                                          As referencing_type
  , ro.SysObject_schema_name                                                   As referencing_schema_name
  , ro.SysObject_name                                                          As referencing_entity_name
  , ros.target_column_name                                                     As referencing_column_name
  , ros.source_schema_name                                                     As referenced_schema_name
  , ros.source_table_name                                                      As referenced_entity_name
  , ros.source_column_name                                                     As referenced_column_name
  , roc2.SysObject_type                                                        As referenced_type
  , InformationSource                                                          = 'sys.dm_exec_describe_first_result_set'
  , is_referencing_object_equal_referenced_object                              = Cast(Case
                                                                                          When ros.RepoObject_guid = roc2.RepoObject_guid
                                                                                              Then
                                                                                              1
                                                                                          Else
                                                                                              0
                                                                                      End As Bit)
  --Flag, if the [referenced_RepoObject_guid] is a referenced object in [repo].[RepoObject_reference__union]
  , is_referenced_object                                                       =
    (
        Select
            Top 1
            Cast(1 As Bit)
        From
            repo.RepoObject_reference_union As ro_r
        Where
            ro_r.referencing_RepoObject_guid    = ros.RepoObject_guid
            And ro_r.referenced_RepoObject_guid = roc2.RepoObject_guid
    )
  , ros.is_hidden
From
    repo.RepoObjectSource_FirstResultSet As ros
    Inner Join
        repo.RepoObject                  As ro
            On
            ros.RepoObject_guid        = ro.RepoObject_guid

    Left Join
        repo.RepoObjectColumn_gross      As roc
            On
            ro.SysObject_schema_name   = roc.SysObject_schema_name
            And ro.SysObject_name      = roc.SysObject_name
            And ros.target_column_name = roc.SysObjectColumn_name

    Left Join
        repo.RepoObjectColumn_gross      As roc2
            On
            ros.source_schema_name     = roc2.SysObject_schema_name
            And ros.source_table_name  = roc2.SysObject_name
            And ros.source_column_name = roc2.SysObjectColumn_name
            And ros.source_server_name Is Null
--exclude reference on self (target column = source column)
Where
    Not (
            ro.SysObject_schema_name = ros.source_schema_name
            And ro.SysObject_name = ros.source_table_name
            And ros.target_column_name = ros.source_column_name
        )
    --exclude source 'sys 
    --todo: make this an option via parameter
    And Not ros.source_schema_name = 'sys';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '6b90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_FirstResultSet';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '56f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_FirstResultSet'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '57f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_FirstResultSet'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '53f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_FirstResultSet'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '52f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_FirstResultSet'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4ef67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_FirstResultSet'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_node_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4df67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_FirstResultSet'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_minor_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4cf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_FirstResultSet'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '58f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_FirstResultSet'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_entity_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '59f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_FirstResultSet'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_column_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5df67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_FirstResultSet'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5af67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_FirstResultSet'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '55f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_FirstResultSet'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '54f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_FirstResultSet'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '51f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_FirstResultSet'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_node_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '50f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_FirstResultSet'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_minor_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '4ff67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_FirstResultSet'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5bf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_FirstResultSet'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_entity_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5cf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_FirstResultSet'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_column_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5ff67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_FirstResultSet'
  , @level2type = N'COLUMN'
  , @level2name = N'is_referencing_object_equal_referenced_object';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '60f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_FirstResultSet'
  , @level2type = N'COLUMN'
  , @level2name = N'is_referenced_object';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '61f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_FirstResultSet'
  , @level2type = N'COLUMN'
  , @level2name = N'is_hidden';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '5ef67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_FirstResultSet'
  , @level2type = N'COLUMN'
  , @level2name = N'InformationSource';
Go

Go

Execute sp_addextendedproperty
    @name = N'ReferencedObjectColumnList'
  , @value = N'[repo].[RepoObjectSource_FirstResultSet].[is_hidden]'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_FirstResultSet'
  , @level2type = N'COLUMN'
  , @level2name = N'is_hidden';
