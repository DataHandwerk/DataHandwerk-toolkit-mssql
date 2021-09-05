



CREATE View [reference].[RepoObjectColumn_reference_QueryPlan]
As
--
Select
    referencing_id                                = ro.SysObject_id
  , referencing_minor_id                          = roc.SysObjectColumn_column_id
  , referencing_node_id                           = Cast(ro.SysObject_id As BigInt) * 10000 + roc.SysObjectColumn_column_id
  , referenced_id                                 = roc2.SysObject_id
  , referenced_minor_id                           = roc2.SysObjectColumn_column_id
  , referenced_node_id                            = Cast(roc2.SysObject_id As BigInt) * 10000 + roc2.SysObjectColumn_column_id
  , referencing_RepoObject_guid                   = ros.RepoObject_guid
  , referencing_RepoObjectColumn_guid             = roc.RepoObjectColumn_guid
  , referenced_RepoObject_guid                    = roc2.RepoObject_guid
  , referenced_RepoObjectColumn_guid              = roc2.RepoObjectColumn_guid
  , referencing_type                              = ro.SysObject_type
  , referencing_schema_name                       = ro.SysObject_schema_name
  , referencing_entity_name                       = ro.SysObject_name
  , referencing_column_name                       = ros.target_column_name
  , referenced_schema_name                        = roc2.SysObject_schema_name
  , referenced_entity_name                        = roc2.SysObject_name
  , referenced_column_name                        = ros.source_column_name
  , referenced_type                               = roc2.SysObject_type
  , InformationSource                             = 'query plan'
  ----, [ros].[source_server_name] AS      [source_server_name]
  ----, [repo].[fs_dwh_database_name]() AS [source_database_name]
  --, [ros].[source_database_name] AS      [source_database_name_quoted]
  , source_schema_name_quoted                     = ros.source_schema_name
  , source_table_name_quoted                      = ros.source_table_name
  , ros.is_target_column_name_expression
  , ros.is_source_column_name_expression
  , is_computed                                   = Cast(Case
                                                             When ros.is_target_column_name_expression = 1
                                                                  Or ros.is_source_column_name_expression = 1
                                                                 Then
                                                                 1
                                                             Else
                                                                 0
                                                         End As Bit)
  , definition                                    = Cast(Null As NVarchar(Max))
  , is_referencing_object_equal_referenced_object = Cast(Case
                                                             When ros.RepoObject_guid = roc2.RepoObject_guid
                                                                 Then
                                                                 1
                                                             Else
                                                                 0
                                                         End As Bit)
  , is_referenced_object                          =
    (
        Select
            Top 1
            Cast(1 As Bit)
        From
            reference.RepoObject_reference_T As ro_r
        Where
            ro_r.referencing_RepoObject_guid    = ros.RepoObject_guid
            And ro_r.referenced_RepoObject_guid = roc2.RepoObject_guid
    )
From
    reference.RepoObjectSource_QueryPlan  As ros
    Inner Join
        repo.RepoObject                   As ro
            On
            ros.RepoObject_guid = ro.RepoObject_guid
    Cross Join config.ftv_dwh_database () As dwhdb
    Left Join
        repo.RepoObjectColumn_gross As roc
            On
            ro.SysObject_schema_name                     = roc.SysObject_schema_name
            And ro.SysObject_name                        = roc.SysObject_name
            And ros.target_column_name                   = roc.SysObjectColumn_name

    Left Join
        repo.RepoObjectColumn_gross As roc2
            On
            ros.source_column_name                       = roc2.SysObjectColumn_name
            And ros.source_server_name Is Null
            And
            (
                (
                    ros.source_database_name             = QuoteName ( dwhdb.dwh_database_name )
                    And ros.source_schema_name           = QuoteName ( roc2.SysObject_schema_name )
                    And ros.source_table_name            = QuoteName ( roc2.SysObject_name )
                )
                --if source_column is expression like 'Expr1006' then these are missing: ros.source_schema_name, ros.source_table_name
                --we should use these names from the target column (which is in the same object)
                Or
                (
                    ros.is_source_column_name_expression = 1
                    And ro.SysObject_schema_name         = roc2.SysObject_schema_name
                    And ro.SysObject_name                = roc2.SysObject_name
                )
            )
--
--
Where
    --exclude reference on self (target column = source column)
    Not (
            ro.SysObject_schema_name = roc2.SysObject_schema_name
            And ro.SysObject_name = roc2.SysObject_name
            And ros.target_column_name = ros.source_column_name
        )
------
--AND --
--[ros].[RepoObject_guid] = '6076940B-2B57-EB11-84D8-A81E8446D5B0'
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '6c90291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '76f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'source_table_name_quoted';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '75f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'source_schema_name_quoted';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6cf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6df67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '69f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '68f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '64f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_node_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '63f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_minor_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '62f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6ef67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_entity_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6ff67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'referencing_column_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '73f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_type';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '70f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_schema_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6bf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObjectColumn_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '6af67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_RepoObject_guid';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '67f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_node_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '66f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_minor_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '65f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_id';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '71f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_entity_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '72f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'referenced_column_name';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '77f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'is_target_column_name_expression';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '78f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'is_source_column_name_expression';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7bf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'is_referencing_object_equal_referenced_object';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7cf67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'is_referenced_object';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '79f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'is_computed';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '74f67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'InformationSource';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = '7af67926-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'definition';
Go

Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectSource_QueryPlan].[is_target_column_name_expression]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan', @level2type = N'COLUMN', @level2name = N'is_target_column_name_expression';


Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(CONVERT([bit],case when [target_column_name] like ''EXPR[0-9][0-9][0-9][0-9]'' then (1) else (0) end))'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'is_target_column_name_expression';
Go

EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectSource_QueryPlan].[is_source_column_name_expression]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan', @level2type = N'COLUMN', @level2name = N'is_source_column_name_expression';


Go

Execute sp_addextendedproperty
    @name = N'MS_Description'
  , @value = N'(CONVERT([bit],case when [source_column_name] like ''EXPR[0-9][0-9][0-9][0-9]'' then (1) else (0) end))'
  , @level0type = N'SCHEMA'
  , @level0name = N'reference'
  , @level1type = N'VIEW'
  , @level1name = N'RepoObjectColumn_reference_QueryPlan'
  , @level2type = N'COLUMN'
  , @level2name = N'is_source_column_name_expression';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[ftv_dwh_database]
* [reference].[RepoObject_reference_T]
* [reference].[RepoObjectSource_QueryPlan]
* [repo].[RepoObject]
* [repo].[RepoObjectColumn_gross]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan';




GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'referencing_id,referencing_minor_id,referenced_id,referenced_minor_id', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'int,int,int,int', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = '3507d5c8-139e-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.SysObjectColumn_QueryPlanExpression.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.ftv_dwh_database.adoc[]
* xref:reference.RepoObject_reference_T.adoc[]
* xref:reference.RepoObjectSource_QueryPlan.adoc[]
* xref:repo.RepoObject.adoc[]
* xref:repo.RepoObjectColumn_gross.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan', @level2type = N'COLUMN', @level2name = N'referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of the column. Is unique within the object.
Column IDs might not be sequential.', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan', @level2type = N'COLUMN', @level2name = N'referencing_minor_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan', @level2type = N'COLUMN', @level2name = N'referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'ID of the column. Is unique within the object.
Column IDs might not be sequential.', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan', @level2type = N'COLUMN', @level2name = N'referenced_minor_id';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectSource_QueryPlan].[source_table_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan', @level2type = N'COLUMN', @level2name = N'source_table_name_quoted';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectSource_QueryPlan].[source_schema_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan', @level2type = N'COLUMN', @level2name = N'source_schema_name_quoted';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_type]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan', @level2type = N'COLUMN', @level2name = N'referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan', @level2type = N'COLUMN', @level2name = N'referencing_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan', @level2type = N'COLUMN', @level2name = N'referencing_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectSource_QueryPlan].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[SysObjectColumn_column_id]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan', @level2type = N'COLUMN', @level2name = N'referencing_minor_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_id]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan', @level2type = N'COLUMN', @level2name = N'referencing_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan', @level2type = N'COLUMN', @level2name = N'referencing_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectSource_QueryPlan].[target_column_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan', @level2type = N'COLUMN', @level2name = N'referencing_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[SysObject_type]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan', @level2type = N'COLUMN', @level2name = N'referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[SysObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan', @level2type = N'COLUMN', @level2name = N'referenced_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[SysObjectColumn_column_id]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan', @level2type = N'COLUMN', @level2name = N'referenced_minor_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[SysObject_id]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan', @level2type = N'COLUMN', @level2name = N'referenced_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[SysObject_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan', @level2type = N'COLUMN', @level2name = N'referenced_entity_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectSource_QueryPlan].[source_column_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObjectColumn_reference_QueryPlan', @level2type = N'COLUMN', @level2name = N'referenced_column_name';

