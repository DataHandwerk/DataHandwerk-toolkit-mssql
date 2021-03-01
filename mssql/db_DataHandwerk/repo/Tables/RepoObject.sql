CREATE TABLE [repo].[RepoObject] (
    [RepoObject_guid]                     UNIQUEIDENTIFIER CONSTRAINT [DF_RepoObject_RepoObject_guid] DEFAULT (newsequentialid()) NOT NULL,
    [has_different_sys_names]             AS               (CONVERT([bit],case when [RepoObject_schema_name]<>[SysObject_schema_name] OR [RepoObject_name]<>[SysObject_name] OR [RepoObject_type]<>[SysObject_type] then (1) else (0) end)),
    [has_execution_plan_issue]            BIT              NULL,
    [has_get_referenced_issue]            BIT              NULL,
    [Inheritance_StringAggSeparatorSql]   NVARCHAR (4000)  NULL,
    [InheritanceDefinition]               NVARCHAR (4000)  NULL,
    [InheritanceType]                     TINYINT          NULL,
    [is_repo_managed]                     BIT              NULL,
    [is_SysObject_missing]                BIT              NULL,
    [modify_dt]                           DATETIME         CONSTRAINT [DF_RepoObject_modify_dt] DEFAULT (getdate()) NOT NULL,
    [pk_index_guid]                       UNIQUEIDENTIFIER NULL,
    [Repo_history_table_guid]             UNIQUEIDENTIFIER NULL,
    [Repo_temporal_type]                  TINYINT          NULL,
    [RepoObject_name]                     NVARCHAR (128)   CONSTRAINT [DF_RepoObject_RepoObject_name] DEFAULT (newid()) NOT NULL,
    [RepoObject_Referencing_Count]        INT              NULL,
    [RepoObject_schema_name]              NVARCHAR (128)   NOT NULL,
    [RepoObject_type]                     CHAR (2)         NOT NULL,
    [SysObject_id]                        INT              NULL,
    [SysObject_modify_date]               DATETIME         NULL,
    [SysObject_name]                      NVARCHAR (128)   CONSTRAINT [DF_RepoObject_SysObject_name] DEFAULT (newid()) NOT NULL,
    [SysObject_parent_object_id]          INT              CONSTRAINT [DF_RepoObject_SysObject_parent_object_id] DEFAULT ((0)) NOT NULL,
    [SysObject_schema_name]               NVARCHAR (128)   NOT NULL,
    [SysObject_type]                      CHAR (2)         NULL,
    [is_RepoObject_name_uniqueidentifier] AS               (case when TRY_CAST([RepoObject_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end) PERSISTED NOT NULL,
    [is_SysObject_name_uniqueidentifier]  AS               (case when TRY_CAST([SysObject_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end) PERSISTED NOT NULL,
    [node_id]                             AS               (CONVERT([bigint],[SysObject_id])*(10000)),
    [RepoObject_fullname]                 AS               (concat('[',[RepoObject_schema_name],'].[',[RepoObject_name],']')) PERSISTED NOT NULL,
    [SysObject_fullname]                  AS               (concat('[',[SysObject_schema_name],'].[',[SysObject_name],']')) PERSISTED NOT NULL,
    [SysObject_query_sql]                 AS               (concat('SELECT * FROM [',[repo].[fs_dwh_database_name](),'].[',[SysObject_schema_name],'].[',[SysObject_name],']')),
    [usp_persistence_name]                AS               ('usp_PERSIST_'+[RepoObject_name]) PERSISTED NOT NULL,
    CONSTRAINT [PK_RepoObject] PRIMARY KEY CLUSTERED ([RepoObject_guid] ASC),
    CONSTRAINT [FK_RepoObject_Index_IndexSemanticGroup__pk_index_guid] FOREIGN KEY ([pk_index_guid]) REFERENCES [repo].[Index_Settings] ([index_guid]) ON DELETE SET NULL ON UPDATE CASCADE,
    CONSTRAINT [UK_RepoObject__RepoNames] UNIQUE NONCLUSTERED ([RepoObject_schema_name] ASC, [RepoObject_name] ASC),
    CONSTRAINT [UK_RepoObject__SysNames] UNIQUE NONCLUSTERED ([SysObject_schema_name] ASC, [SysObject_name] ASC)
);




















GO
CREATE TRIGGER [repo].[RepoObject__after_update] ON repo.RepoObject
AFTER UPDATE
AS
UPDATE a
  SET
      [modify_dt] = GETDATE()
FROM   [repo].[RepoObject] AS [a]
       JOIN
       [inserted] AS [b]
       ON [a].[RepoObject_guid] = [b].[RepoObject_guid]
GO
-- =============================================
-- Author:		Germo Goertz
-- Create date: 2021-01-01
-- Description:	trigger is required because only one updating FK from other tables is possible
-- =============================================
CREATE TRIGGER [repo].[RepoObject__after_delete] ON repo.RepoObject
AFTER DELETE
AS
BEGIN
    -- SET NOCOUNT ON added to prevent extra result sets from
    -- interfering with SELECT statements.
    SET NOCOUNT ON;

    --FK would ON DELETE would be better, but FK is defined already for [target_RepoObject_guid]
    UPDATE   repo.RepoObject_persistence
      SET
          [source_RepoObject_guid] = NULL
    WHERE
          [source_RepoObject_guid] IN
    (
        SELECT
               [RepoObject_guid]
        FROM
             [deleted]
    );

END
GO



GO



GO



GO



GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'ms_Description', @value = N'test Description for Constraint', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObject';


GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO



GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'Repo_temporal_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ef8f291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoObject__SysNames';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f18f291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoObject__RepoNames';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ed8f291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1390291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObject_Index_IndexSemanticGroup__pk_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1f90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_SysObject_parent_object_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1d90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1b90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1790291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1990291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_modify_dt';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'eb8f291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c4f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c3f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c0f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_parent_object_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bff17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bef17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_modify_date';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bdf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bcf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bbf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'baf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_Referencing_Count';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b9f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'aff17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b8f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'Repo_temporal_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b7f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'Repo_history_table_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b6f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'pk_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b5f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'modify_dt';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b4f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'is_SysObject_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b3f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'is_repo_managed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b2f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'has_get_referenced_issue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b1f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'has_execution_plan_issue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cbf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'usp_persistence_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'caf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_query_sql';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c9f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c8f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c7f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'node_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c6f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'is_SysObject_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c5f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'is_RepoObject_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b0f17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'has_different_sys_names';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '74b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'InheritanceType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '73b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'InheritanceDefinition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '72b33a4a-426d-eb11-84e2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'Inheritance_StringAggSeparatorSql';

