CREATE TABLE [repo].[RepoObject] (
    [RepoObject_guid]                     UNIQUEIDENTIFIER CONSTRAINT [DF_RepoObject_RepoObject_guid] DEFAULT (newsequentialid()) NOT NULL,
    [has_different_sys_names]             AS               (CONVERT([bit],case when [RepoObject_schema_name]<>[SysObject_schema_name] OR [RepoObject_name]<>[SysObject_name] OR [RepoObject_type]<>[SysObject_type] then (1) else (0) end)),
    [has_execution_plan_issue]            BIT              NULL,
    [has_get_referenced_issue]            BIT              NULL,
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
    [SysObject_query_executed_dt]         DATETIME         NULL,
    [SysObject_query_plan]                XML              NULL,
    [SysObject_schema_name]               NVARCHAR (128)   NOT NULL,
    [SysObject_type]                      CHAR (2)         NULL,
    [is_RepoObject_name_uniqueidentifier] AS               (case when TRY_CAST([RepoObject_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end),
    [is_SysObject_name_uniqueidentifier]  AS               (case when TRY_CAST([SysObject_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end),
    [node_id]                             AS               (CONVERT([bigint],[SysObject_id])*(10000)),
    [RepoObject_fullname]                 AS               (concat('[',[RepoObject_schema_name],'].[',[RepoObject_name],']')),
    [SysObject_fullname]                  AS               (concat('[',[SysObject_schema_name],'].[',[SysObject_name],']')),
    [SysObject_query_sql]                 AS               (concat('SELECT * FROM [',[repo].[fs_dwh_database_name](),'].[',[SysObject_schema_name],'].[',[SysObject_name],']')),
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

