CREATE TABLE [reference].[RepoObjectSource_QueryPlan] (
    [RepoObject_guid]                  UNIQUEIDENTIFIER NOT NULL,
    [target_column_name]               NVARCHAR (128)   NULL,
    [source_server_name]               NVARCHAR (128)   NULL,
    [source_database_name]             NVARCHAR (128)   NULL,
    [source_schema_name]               NVARCHAR (128)   NULL,
    [source_table_name]                NVARCHAR (128)   NULL,
    [source_column_name]               NVARCHAR (128)   NULL,
    [SysObject_query_executed_dt]      DATETIME         NULL,
    [const_value]                      NVARCHAR (4000)  NULL,
    [target_column_info]               XML              NULL,
    [source_column_info]               XML              NULL,
    [const_info]                       XML              NULL,
    [is_target_column_name_expression] AS               (CONVERT([bit],case when [target_column_name] like 'EXPR[0-9][0-9][0-9][0-9]' then (1) else (0) end)),
    [is_source_column_name_expression] AS               (CONVERT([bit],case when [source_column_name] like 'EXPR[0-9][0-9][0-9][0-9]' then (1) else (0) end)),
    CONSTRAINT [FK_RepoObjectSource_QueryPlan__RepoObject] FOREIGN KEY ([RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid]) ON DELETE CASCADE ON UPDATE CASCADE
)
WITH (DATA_COMPRESSION = PAGE);












GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'references on column level
target: repo.RepoObjectSource_from_query_plan
source: query plan analysis of the execution of a query like
`Vselect top (1) * into #foo from (SELECT * FROM sss.aaa)`

First update query plan and write them into repo.RepoObject
then analyse the query plans and update results into 

EXEC [repo].[usp_RepoObject__update_SysObject_query_plan]
EXEC [repo].[usp_RepoObjectSource_from_query_plan__update]

some query plans can''t be extracted, some can be extracted but not analyzed
in this case mark the RepoObject in repo.RepoObject
SET [has_execution_plan_issue] = 1', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0e90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectSource_QueryPlan__RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3290291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8bf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan', @level2type = N'COLUMN', @level2name = N'target_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '93f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan', @level2type = N'COLUMN', @level2name = N'target_column_info';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '91f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan', @level2type = N'COLUMN', @level2name = N'SysObject_query_executed_dt';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8ff37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan', @level2type = N'COLUMN', @level2name = N'source_table_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8cf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan', @level2type = N'COLUMN', @level2name = N'source_server_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8ef37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan', @level2type = N'COLUMN', @level2name = N'source_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8df37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan', @level2type = N'COLUMN', @level2name = N'source_database_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '90f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan', @level2type = N'COLUMN', @level2name = N'source_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '94f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan', @level2type = N'COLUMN', @level2name = N'source_column_info';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8af37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '92f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan', @level2type = N'COLUMN', @level2name = N'const_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '95f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan', @level2type = N'COLUMN', @level2name = N'const_info';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '96f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan', @level2type = N'COLUMN', @level2name = N'is_target_column_name_expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '97f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan', @level2type = N'COLUMN', @level2name = N'is_source_column_name_expression';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectSource_QueryPlan].[target_column_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan', @level2type = N'COLUMN', @level2name = N'is_target_column_name_expression';




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(CONVERT([bit],case when [target_column_name] like ''EXPR[0-9][0-9][0-9][0-9]'' then (1) else (0) end))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan', @level2type = N'COLUMN', @level2name = N'is_target_column_name_expression';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [reference].[RepoObjectSource_QueryPlan].[source_column_name]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan', @level2type = N'COLUMN', @level2name = N'is_source_column_name_expression';




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(CONVERT([bit],case when [source_column_name] like ''EXPR[0-9][0-9][0-9][0-9]'' then (1) else (0) end))', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan', @level2type = N'COLUMN', @level2name = N'is_source_column_name_expression';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.RepoObjectColumn_reference_QueryPlan.adoc[]
* xref:reference.usp_RepoObjectSource_QueryPlan.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectSource_QueryPlan__RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObjectSource_QueryPlan__RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan';

