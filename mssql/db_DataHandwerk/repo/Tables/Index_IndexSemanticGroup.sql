CREATE TABLE [repo].[Index_IndexSemanticGroup] (
    [index_guid]                 UNIQUEIDENTIFIER NOT NULL,
    [IndexPatternColumnDatatype] NVARCHAR (4000)  NULL,
    [IndexPatternColumnName]     NVARCHAR (4000)  NULL,
    [IndexSemanticGroup]         NVARCHAR (512)   NULL,
    CONSTRAINT [PK_Index_IndexSemanticGroup] PRIMARY KEY CLUSTERED ([index_guid] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ce81875a-724f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_IndexSemanticGroup', @level2type = N'CONSTRAINT', @level2name = N'PK_Index_IndexSemanticGroup';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd581875a-724f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_IndexSemanticGroup', @level2type = N'COLUMN', @level2name = N'IndexSemanticGroup';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd481875a-724f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_IndexSemanticGroup', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd381875a-724f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_IndexSemanticGroup', @level2type = N'COLUMN', @level2name = N'IndexPatternColumnDatatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd281875a-724f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_IndexSemanticGroup', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'cd81875a-724f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_IndexSemanticGroup';

