CREATE TABLE [repo].[execution_log] (
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
    CONSTRAINT [PK_execution_log] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b53dfec8-3849-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'CONSTRAINT', @level2name = N'PK_execution_log';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '16b886f6-f250-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'parameter_20';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '15b886f6-f250-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'parameter_19';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '14b886f6-f250-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'parameter_18';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '13b886f6-f250-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'parameter_17';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '12b886f6-f250-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'parameter_16';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '18b886f6-f250-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'parameter_15';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '17b886f6-f250-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'parameter_14';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '35c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'parameter_13';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '34c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'parameter_12';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '33c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'parameter_11';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '32c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'parameter_10';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '31c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'parameter_09';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '30c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'parameter_08';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2fc30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'parameter_07';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2ec30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'parameter_06';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2dc30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'parameter_05';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2cc30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'parameter_04';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2bc30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'parameter_03';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2ac30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'parameter_02';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '29c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'parameter_01';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1a5262a1-d650-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'event_info';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '27c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'info_09';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '26c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'info_08';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '25c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'info_07';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '24c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'info_06';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '23c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'info_05';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '22c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'info_04';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '21c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'info_03';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '20c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'info_02';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1fc30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'info_01';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1cc30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'deleted';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3ec30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'updated';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '28c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'inserted';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1bc30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'created_dt';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3cc30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'step_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3bc30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'step_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '38c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'proc_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '39c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'proc_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '37c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'proc_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3dc30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'sub_execution_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3ac30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'ssis_execution_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1dc30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'execution_instance_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '36c30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'parent_execution_log_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1ec30751-3949-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log', @level2type = N'COLUMN', @level2name = N'id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b43dfec8-3849-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'TABLE', @level1name = N'execution_log';

