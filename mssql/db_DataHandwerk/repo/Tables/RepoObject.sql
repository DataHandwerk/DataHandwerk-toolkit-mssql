CREATE TABLE [repo].[RepoObject] (
    [RepoObject_guid]                     UNIQUEIDENTIFIER CONSTRAINT [DF_RepoObject_RepoObject_guid] DEFAULT (newsequentialid()) NOT NULL,
    [RepoObject_schema_name]              NVARCHAR (128)   NOT NULL,
    [RepoObject_name]                     NVARCHAR (128)   CONSTRAINT [DF_RepoObject_RepoObject_name] DEFAULT (newid()) NOT NULL,
    [RepoObject_type]                     CHAR (2)         NOT NULL,
    [RepoObject_Referencing_Count]        INT              NULL,
    [SysObject_id]                        INT              NULL,
    [SysObject_schema_name]               NVARCHAR (128)   NOT NULL,
    [SysObject_name]                      NVARCHAR (128)   CONSTRAINT [DF_RepoObject_SysObject_name] DEFAULT (newid()) NOT NULL,
    [SysObject_type]                      CHAR (2)         NULL,
    [SysObject_modify_date]               DATETIME         NULL,
    [SysObject_parent_object_id]          INT              CONSTRAINT [DF_RepoObject_SysObject_parent_object_id] DEFAULT ((0)) NOT NULL,
    [SysObject_query_plan]                XML              NULL,
    [SysObject_query_executed_dt]         DATETIME         NULL,
    [is_repo_managed]                     BIT              NULL,
    [is_SysObject_missing]                BIT              NULL,
    [has_execution_plan_issue]            BIT              NULL,
    [has_get_referenced_issue]            BIT              NULL,
    [modify_dt]                           DATETIME         CONSTRAINT [DF_RepoObject_modify_dt] DEFAULT (getdate()) NOT NULL,
    [pk_index_guid]                       UNIQUEIDENTIFIER NULL,
    [has_different_sys_names]             AS               (CONVERT([bit],case when [RepoObject_schema_name]<>[SysObject_schema_name] OR [RepoObject_name]<>[SysObject_name] OR [RepoObject_type]<>[SysObject_type] then (1) else (0) end)),
    [is_RepoObject_name_uniqueidentifier] AS               (case when TRY_CAST([RepoObject_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end),
    [is_SysObject_name_uniqueidentifier]  AS               (case when TRY_CAST([SysObject_name] AS [uniqueidentifier]) IS NULL then (0) else (1) end),
    [node_id]                             AS               (CONVERT([bigint],[SysObject_id])*(10000)),
    [RepoObject_fullname]                 AS               (concat('[',[RepoObject_schema_name],'].[',[RepoObject_name],']')),
    [SysObject_query_sql]                 AS               (concat('SELECT * FROM [',[repo].[fs_dwh_database_name](),'].[',[SysObject_schema_name],'].[',[SysObject_name],']')),
    [SysObject_fullname]                  AS               (concat('[',[SysObject_schema_name],'].[',[SysObject_name],']')),
    CONSTRAINT [PK_RepoObject] PRIMARY KEY CLUSTERED ([RepoObject_guid] ASC),
    CONSTRAINT [FK_RepoObject_Index_IndexSemanticGroup__pk_index_guid] FOREIGN KEY ([pk_index_guid]) REFERENCES [repo].[Index_IndexSemanticGroup] ([index_guid]) ON DELETE SET NULL ON UPDATE CASCADE,
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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '981cb308-944b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_modify_dt';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'fc9808a2-534d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'fb9808a2-534d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e6968530-e846-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'CONSTRAINT', @level2name = N'DF_RepoObject_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'cf910dde-914f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'CONSTRAINT', @level2name = N'FK_RepoObject_Index_IndexSemanticGroup__pk_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '93d1e122-cb4c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoObject__SysNames';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '92d1e122-cb4c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'CONSTRAINT', @level2name = N'UK_RepoObject__RepoNames';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5f9f84d1-c646-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'ms_Description', @value = N'test Description for Constraint', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'CONSTRAINT', @level2name = N'PK_RepoObject';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bd1cb308-944b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c01cb308-944b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_query_sql';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bc1cb308-944b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9c888a3c-034e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'node_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '35ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'is_SysObject_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '33ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'is_RepoObject_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'3fc30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'has_different_sys_names';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'de910dde-914f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'pk_index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bb1cb308-944b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'modify_dt';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6ce4634c-304c-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'has_get_referenced_issue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3900581c-a34a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'has_execution_plan_issue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '34ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'is_SysObject_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e128ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'is_repo_managed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'be1cb308-944b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_query_executed_dt';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bf1cb308-944b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_query_plan';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '754a6024-ae4a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_modify_date';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e928ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e728ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e828ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e628ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'SysObject_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'6b98637b-974b-eb11-84d3-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_Referencing_Count';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e528ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'reference in [repo_sys].[type]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e328ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e428ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e228ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5a9f84d1-c646-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'RepoObject';

