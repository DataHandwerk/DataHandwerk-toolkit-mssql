CREATE TABLE [configT].[spt_values] (
    [name]   NVARCHAR (35) NULL,
    [number] INT           NOT NULL,
    [type]   NCHAR (3)     NOT NULL,
    [low]    INT           NULL,
    [high]   INT           NULL,
    [status] INT           NULL
);





GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3090291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'TABLE', @level1name = N'spt_values';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '85f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'TABLE', @level1name = N'spt_values', @level2type = N'COLUMN', @level2name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '88f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'TABLE', @level1name = N'spt_values', @level2type = N'COLUMN', @level2name = N'status';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '84f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'TABLE', @level1name = N'spt_values', @level2type = N'COLUMN', @level2name = N'number';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '83f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'TABLE', @level1name = N'spt_values', @level2type = N'COLUMN', @level2name = N'name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '86f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'TABLE', @level1name = N'spt_values', @level2type = N'COLUMN', @level2name = N'low';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '87f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'TABLE', @level1name = N'spt_values', @level2type = N'COLUMN', @level2name = N'high';


GO



GO
CREATE NONCLUSTERED INDEX [idx_spt_values_1]
    ON [configT].[spt_values]([number] ASC, [type] ASC)
    INCLUDE([name]);


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:configT.numbers_0_2047.adoc[]
* xref:configT.type.adoc[]
* xref:configT.usp_init_spt_values.adoc[]', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'TABLE', @level1name = N'spt_values';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'TABLE', @level1name = N'spt_values';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'configT', @level1type = N'TABLE', @level1name = N'spt_values';

