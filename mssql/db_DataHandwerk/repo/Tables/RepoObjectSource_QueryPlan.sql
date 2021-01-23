﻿CREATE TABLE [repo].[RepoObjectSource_QueryPlan] (
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
    CONSTRAINT [FK_RepoObjectSource_from_query_plan_RepoObject1] FOREIGN KEY ([RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid]) ON DELETE CASCADE ON UPDATE CASCADE
);


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
SET [has_execution_plan_issue] = 1', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObjectSource_QueryPlan';
