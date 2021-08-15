CREATE TABLE [repo].[RepoObject] (
    [RepoObject_guid]                     UNIQUEIDENTIFIER CONSTRAINT [DF_RepoObject_RepoObject_guid] DEFAULT (newsequentialid()) NOT NULL,
    [has_different_sys_names]             AS               (CONVERT([bit],case when [RepoObject_schema_name]<>[SysObject_schema_name] OR [RepoObject_name]<>[SysObject_name] OR [RepoObject_type]<>[SysObject_type] then (1) else (0) end)),
    [has_execution_plan_issue]            BIT              NULL,
    [has_get_referenced_issue]            BIT              NULL,
    [Inheritance_StringAggSeparatorSql]   NVARCHAR (4000)  NULL,
    [InheritanceDefinition]               NVARCHAR (4000)  NULL,
    [InheritanceType]                     TINYINT          NULL,
    [is_required_ObjectMerge]             BIT              NULL,
    [is_repo_managed]                     BIT              NULL,
    [is_SysObject_missing]                BIT              NULL,
    [modify_dt]                           DATETIME         CONSTRAINT [DF_RepoObject_modify_dt] DEFAULT (getdate()) NOT NULL,
    [pk_index_guid]                       UNIQUEIDENTIFIER NULL,
    [pk_IndexPatternColumnName_new]       NVARCHAR (4000)  NULL,
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
    [RepoObject_fullname2]                AS               (concat([RepoObject_schema_name],'.',[RepoObject_name])) PERSISTED NOT NULL,
    [SysObject_fullname]                  AS               (concat('[',[SysObject_schema_name],'].[',[SysObject_name],']')) PERSISTED NOT NULL,
    [SysObject_fullname2]                 AS               (concat([SysObject_schema_name],'.',[SysObject_name])) PERSISTED NOT NULL,
    [SysObject_query_sql]                 AS               (concat('SELECT * FROM [',[config].[fs_dwh_database_name](),'].[',[SysObject_schema_name],'].[',[SysObject_name],']')),
    [usp_persistence_name]                AS               ('usp_PERSIST_'+[RepoObject_name]) PERSISTED NOT NULL,
    [usp_persistence_fullname2]           AS               (concat([RepoObject_schema_name],'.','usp_PERSIST_',[RepoObject_name])) PERSISTED NOT NULL,
    CONSTRAINT [PK_RepoObject] PRIMARY KEY CLUSTERED ([RepoObject_guid] ASC) WITH (DATA_COMPRESSION = PAGE),
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



GO



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


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '68b8b46b-a08f-eb11-84f1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'pk_IndexPatternColumnName_new';


GO



GO



GO



GO



GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject].[SysObject_name]
[repo].[RepoObject].[SysObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[SysObject_schema_name],''].['',[SysObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject].[RepoObject_name]
[repo].[RepoObject].[RepoObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject].[SysObject_id]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'node_id';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(CONVERT([bigint],[SysObject_id])*(10000))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'node_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject].[SysObject_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'is_SysObject_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(case when TRY_CAST([SysObject_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end)', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'is_SysObject_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject].[RepoObject_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'is_RepoObject_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(case when TRY_CAST([RepoObject_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end)', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'is_RepoObject_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'[repo].[RepoObject].[RepoObject_name]
[repo].[RepoObject].[RepoObject_schema_name]
[repo].[RepoObject].[RepoObject_type]
[repo].[RepoObject].[SysObject_name]
[repo].[RepoObject].[SysObject_schema_name]
[repo].[RepoObject].[SysObject_type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'has_different_sys_names';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(CONVERT([bit],case when [RepoObject_schema_name]<>[SysObject_schema_name] OR [RepoObject_name]<>[SysObject_name] OR [RepoObject_type]<>[SysObject_type] then (1) else (0) end))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'has_different_sys_names';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fd38cf17-0592-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[SysObject_schema_name],''].['',[SysObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fc38cf17-0592-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '077bec7a-a69b-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'is_required_ObjectMerge';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObject_guid', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'uniqueidentifier', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = N'ED8F291C-9D61-EB11-84DC-A81E8446D5B0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.AntoraNavListPage_by_schema.adoc[]
* xref:docs.ftv_RepoObject_Reference_PlantUml_EntityRefList.adoc[]
* xref:docs.RepoObject_Plantuml_ColRefList.adoc[]
* xref:docs.RepoObject_Plantuml_ColRefList_1_1.adoc[]
* xref:docs.RepoObject_Plantuml_ObjectRefList_1_1.adoc[]
* xref:docs.visjs_nodelist_object_test01.adoc[]
* xref:graph.RepoObject_S.adoc[]
* xref:property.ExtendedProperty_Repo2Sys_level1.adoc[]
* xref:property.ExtendedProperty_Repo2Sys_level2_RepoObject.adoc[]
* xref:property.ExtendedProperty_Repo2Sys_level2_RepoObjectColumn.adoc[]
* xref:property.RepoObjectColumnProperty_sys_repo.adoc[]
* xref:property.RepoObjectProperty_cross.adoc[]
* xref:property.RepoObjectProperty_ForUpdate.adoc[]
* xref:property.RepoObjectProperty_InheritanceType_InheritanceDefinition.adoc[]
* xref:property.RepoObjectProperty_sys_repo.adoc[]
* xref:property.usp_RepoObjectColumnProperty_set.adoc[]
* xref:property.usp_RepoObjectProperty_set.adoc[]
* xref:reference.ftv_RepoObject_ReferencedReferencing.adoc[]
* xref:reference.RepoObject_reference_persistence.adoc[]
* xref:reference.RepoObject_reference_virtual.adoc[]
* xref:reference.RepoObjectColumn_reference_FirstResultSet.adoc[]
* xref:reference.RepoObjectColumn_reference_Persistence.adoc[]
* xref:reference.RepoObjectColumn_reference_QueryPlan.adoc[]
* xref:reference.RepoObjectColumn_reference_SqlModules.adoc[]
* xref:reference.usp_RepoObject_update_SysObjectQueryPlan.adoc[]
* xref:reference.usp_RepoObjectSource_FirstResultSet.adoc[]
* xref:reference.usp_RepoObjectSource_QueryPlan.adoc[]
* xref:reference.usp_RepoObjectSource_virtual_set.adoc[]
* xref:reference.usp_update_Referencing_Count.adoc[]
* xref:repo.check_IndexColumn_virtual_referenced_setpoint.adoc[]
* xref:repo.Index_Settings_ForUpdate.adoc[]
* xref:repo.Index_virtual_ForUpdate.adoc[]
* xref:repo.Index_virtual_SysObject.adoc[]
* xref:repo.IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_check.adoc[]
* xref:repo.IndexColumn_virtual_gross.adoc[]
* xref:repo.RepoObject__after_update.adoc[]
* xref:repo.RepoObject_fullname_u_v.adoc[]
* xref:repo.RepoObject_gross.adoc[]
* xref:repo.RepoObject_persistence_column.adoc[]
* xref:repo.RepoObject_persistence_ForUpdate.adoc[]
* xref:repo.RepoObject_persistence_ObjectNames.adoc[]
* xref:repo.RepoObject_related_FK_union.adoc[]
* xref:repo.RepoObject_RequiredRepoObjectMerge.adoc[]
* xref:repo.RepoObject_SqlCreateTable.adoc[]
* xref:repo.RepoObjectColumn_gross.adoc[]
* xref:repo.RepoObjectColumn_MissingSource_TypeV.adoc[]
* xref:repo.SysColumn_RepoObjectColumn_via_guid.adoc[]
* xref:repo.SysColumn_RepoObjectColumn_via_name.adoc[]
* xref:repo.SysObject_RepoObject_via_guid.adoc[]
* xref:repo.SysObject_RepoObject_via_name.adoc[]
* xref:repo.usp_Index_finish.adoc[]
* xref:repo.usp_Index_virtual_set.adoc[]
* xref:repo.usp_persistence_set.adoc[]
* xref:repo.usp_sync_guid_RepoObject.adoc[]
* xref:repo.usp_sync_guid_RepoObjectColumn.adoc[]
* xref:repo.usp_update_Referencing_Count.adoc[]
* xref:repo_sys.ForeignKey.adoc[]
* xref:repo_sys.Index_unique.adoc[]
* xref:repo_sys.RepoObjectReferenced.adoc[]
* xref:repo_sys.RepoObjectReferencing.adoc[]
* xref:sqlparse.RepoObject_SqlModules_10_statement.adoc[]
* xref:sqlparse.RepoObject_SqlModules_39_object.adoc[]
* xref:sqlparse.RepoObject_SqlModules_71_reference_ExpliciteTableAlias.adoc[]
* xref:sqlparse.RepoObject_SqlModules_72_reference_NoTableAlias.adoc[]
* xref:sqlparse.RepoObject_SqlModules_Repo_Sys.adoc[]
* xref:uspgenerator.GeneratorUsp_SqlUsp.adoc[]
* xref:workflow.ProcedureDependency_gross.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject';






GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[SysObject_name]
* [repo].[RepoObject].[SysObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObject].[RepoObject_name]
* [repo].[RepoObject].[RepoObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
CREATE NONCLUSTERED INDEX [_dta_index_RepoObject_50_1757249315__K22_K24_K1]
    ON [repo].[RepoObject]([SysObject_name] ASC, [SysObject_schema_name] ASC, [RepoObject_guid] ASC);


GO
CREATE NONCLUSTERED INDEX [_dta_index_RepoObject_50_1757249315__K1_K24_K22_K25_19]
    ON [repo].[RepoObject]([RepoObject_guid] ASC, [SysObject_schema_name] ASC, [SysObject_name] ASC, [SysObject_type] ASC)
    INCLUDE([RepoObject_type]);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cbf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'usp_persistence_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'caf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_query_sql';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dc6d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'usp_persistence_fullname2';

