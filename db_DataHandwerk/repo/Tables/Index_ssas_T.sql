CREATE TABLE [repo].[Index_ssas_T] (
    [index_name]           NVARCHAR (450)   NOT NULL,
    [is_index_primary_key] BIT              NOT NULL,
    [is_index_unique]      BIT              NOT NULL,
    [RepoObject_guid]      UNIQUEIDENTIFIER NOT NULL,
    [databasename]         NVARCHAR (128)   NOT NULL,
    [TableName]            NVARCHAR (MAX)   NOT NULL,
    [ColumnName]           NVARCHAR (MAX)   CONSTRAINT [DF_Index_ssas_T_ColumnName] DEFAULT ('') NOT NULL,
    [index_guid]           UNIQUEIDENTIFIER CONSTRAINT [DF_Index_ssas_T_index_guid] DEFAULT (newsequentialid()) NOT NULL,
    CONSTRAINT [PK_Index_ssas_T] PRIMARY KEY CLUSTERED ([index_name] ASC),
    CONSTRAINT [uq_Index_ssas_T] UNIQUE NONCLUSTERED ([index_guid] ASC)
);






GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'cab100de-0d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_ssas_T', @level2type = N'CONSTRAINT', @level2name = N'DF_Index_ssas_T_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f741f8c3-0f08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_ssas_T', @level2type = N'CONSTRAINT', @level2name = N'uq_Index_ssas_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'cbb100de-0d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_ssas_T', @level2type = N'CONSTRAINT', @level2name = N'PK_Index_ssas_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '887029e9-0d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_ssas_T', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '877029e9-0d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_ssas_T', @level2type = N'COLUMN', @level2name = N'TableName';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '857029e9-0d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_ssas_T', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '847029e9-0d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_ssas_T', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '837029e9-0d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_ssas_T', @level2type = N'COLUMN', @level2name = N'is_index_unique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '827029e9-0d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_ssas_T', @level2type = N'COLUMN', @level2name = N'is_index_primary_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '817029e9-0d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_ssas_T', @level2type = N'COLUMN', @level2name = N'index_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'c9b100de-0d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_ssas_T';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6b6e8dee-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_ssas_T', @level2type = N'CONSTRAINT', @level2name = N'DF_Index_ssas_T_ColumnName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cc4578f6-3d08-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'Index_ssas_T', @level2type = N'COLUMN', @level2name = N'ColumnName';

