CREATE TABLE [reference].[RepoObject_QueryPlan] (
    [RepoObject_guid]             UNIQUEIDENTIFIER NOT NULL,
    [SysObject_query_executed_dt] DATETIME         NULL,
    [SysObject_query_plan]        XML              NULL,
    CONSTRAINT [PK_RepoObject_QueryPlan] PRIMARY KEY CLUSTERED ([RepoObject_guid] ASC) WITH (DATA_COMPRESSION = PAGE),
    CONSTRAINT [FK_RepoObject_QueryPlan__RepoObject] FOREIGN KEY ([RepoObject_guid]) REFERENCES [repo].[RepoObject] ([RepoObject_guid]) ON DELETE CASCADE ON UPDATE CASCADE
);












GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '01df2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_QueryPlan', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObject_QueryPlan';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '02df2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_QueryPlan', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObject_QueryPlan__RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '00df2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_QueryPlan';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0edf2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_QueryPlan', @level2type = N'COLUMN', @level2name = N'SysObject_query_plan';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0ddf2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_QueryPlan', @level2type = N'COLUMN', @level2name = N'SysObject_query_executed_dt';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0cdf2fe1-ae7a-eb11-84e5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_QueryPlan', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO



GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_QueryPlan';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_QueryPlan';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'01DF2FE1-AE7A-EB11-84E5-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_QueryPlan';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:reference.usp_RepoObject_update_SysObjectQueryPlan.adoc[]
* xref:repo.RepoObject_gross.adoc[]', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_QueryPlan';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_QueryPlan', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObject_QueryPlan';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_QueryPlan', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObject_QueryPlan';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_QueryPlan', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObject_QueryPlan__RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_QueryPlan', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObject_QueryPlan__RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_QueryPlan';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'TABLE', @level1name = N'RepoObject_QueryPlan';

