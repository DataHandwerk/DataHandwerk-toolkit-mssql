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



GO



GO



GO



GO



GO



GO



GO



GO



GO


