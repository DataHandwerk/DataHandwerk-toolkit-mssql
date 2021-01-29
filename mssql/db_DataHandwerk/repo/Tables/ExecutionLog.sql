CREATE TABLE [repo].[ExecutionLog] (
    [id]                      BIGINT           IDENTITY (1, 1) NOT NULL,
    [parent_execution_log_id] BIGINT           NULL,
    [execution_instance_guid] UNIQUEIDENTIFIER NOT NULL,
    [ssis_execution_id]       BIGINT           NULL,
    [sub_execution_id]        INT              NULL,
    [current_execution_guid]  UNIQUEIDENTIFIER NULL,
    [proc_id]                 INT              NULL,
    [proc_schema_name]        NVARCHAR (128)   NULL,
    [proc_name]               NVARCHAR (128)   NULL,
    [step_id]                 INT              NULL,
    [step_name]               NVARCHAR (1000)  NULL,
    [created_dt]              DATETIME         NULL,
    [source_object]           NVARCHAR (261)   NULL,
    [target_object]           NVARCHAR (261)   NULL,
    [inserted]                INT              NULL,
    [updated]                 INT              NULL,
    [deleted]                 INT              NULL,
    [info_01]                 SQL_VARIANT      NULL,
    [info_02]                 SQL_VARIANT      NULL,
    [info_03]                 SQL_VARIANT      NULL,
    [info_04]                 SQL_VARIANT      NULL,
    [info_05]                 SQL_VARIANT      NULL,
    [info_06]                 SQL_VARIANT      NULL,
    [info_07]                 SQL_VARIANT      NULL,
    [info_08]                 SQL_VARIANT      NULL,
    [info_09]                 SQL_VARIANT      NULL,
    [event_info]              NVARCHAR (MAX)   NULL,
    [parameter_01]            SQL_VARIANT      NULL,
    [parameter_02]            SQL_VARIANT      NULL,
    [parameter_03]            SQL_VARIANT      NULL,
    [parameter_04]            SQL_VARIANT      NULL,
    [parameter_05]            SQL_VARIANT      NULL,
    [parameter_06]            SQL_VARIANT      NULL,
    [parameter_07]            SQL_VARIANT      NULL,
    [parameter_08]            SQL_VARIANT      NULL,
    [parameter_09]            SQL_VARIANT      NULL,
    [parameter_10]            SQL_VARIANT      NULL,
    [parameter_11]            SQL_VARIANT      NULL,
    [parameter_12]            SQL_VARIANT      NULL,
    [parameter_13]            SQL_VARIANT      NULL,
    [parameter_14]            SQL_VARIANT      NULL,
    [parameter_15]            SQL_VARIANT      NULL,
    [parameter_16]            SQL_VARIANT      NULL,
    [parameter_17]            SQL_VARIANT      NULL,
    [parameter_18]            SQL_VARIANT      NULL,
    [parameter_19]            SQL_VARIANT      NULL,
    [parameter_20]            SQL_VARIANT      NULL,
    [proc_fullname]           AS               (concat(quotename([proc_schema_name]),'.',quotename([proc_name]))),
    CONSTRAINT [PK_ExecutionLog] PRIMARY KEY CLUSTERED ([id] ASC)
);




GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1e90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'CONSTRAINT', @level2name = N'PK_ExecutionLog';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1c90291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ebf27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'updated';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e9f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'target_object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e0f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'sub_execution_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e6f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'step_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e5f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'step_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dff27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'ssis_execution_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e8f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'source_object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e3f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'proc_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e4f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'proc_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e2f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'proc_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ddf27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'parent_execution_log_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0af37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'parameter_20';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '09f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'parameter_19';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '08f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'parameter_18';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '07f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'parameter_17';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '06f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'parameter_16';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '05f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'parameter_15';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '04f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'parameter_14';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '03f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'parameter_13';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '02f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'parameter_12';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '01f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'parameter_11';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '00f37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'parameter_10';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fff27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'parameter_09';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fef27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'parameter_08';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fdf27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'parameter_07';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fcf27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'parameter_06';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fbf27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'parameter_05';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'faf27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'parameter_04';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f9f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'parameter_03';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f8f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'parameter_02';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f7f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'parameter_01';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eaf27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'inserted';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f5f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'info_09';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f4f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'info_08';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f3f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'info_07';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f2f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'info_06';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f1f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'info_05';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f0f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'info_04';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eff27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'info_03';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'eef27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'info_02';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'edf27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'info_01';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dcf27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'def27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'execution_instance_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f6f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'event_info';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ecf27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'deleted';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e1f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'current_execution_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e7f27926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'created_dt';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0bf37926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'ExecutionLog', @level2type = N'COLUMN', @level2name = N'proc_fullname';

