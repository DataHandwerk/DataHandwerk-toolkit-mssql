/*
Script created by SQL Examiner 8.0.0.39 at 26.01.2021 10:43:15.
Run this script on WideWorldImporters-test on localhost\sql2019 to make it the same as dhw_WideWorldImporters-test on localhost\sql2019
*/
SET NOCOUNT ON
SET NOEXEC OFF
SET ARITHABORT ON
SET XACT_ABORT ON
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

BEGIN TRAN
GO

--step 1: create schema repo------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = N'repo') 
EXEC sp_executesql N'CREATE SCHEMA [repo] AUTHORIZATION [dbo]'
GO
IF @@ERROR <> 0 AND @@TRANCOUNT > 0 BEGIN PRINT 'step 1 is completed with errors' ROLLBACK TRAN END
GO
IF @@TRANCOUNT = 0 BEGIN PRINT 'step 1 is completed with errors' SET NOEXEC ON END
GO

--step 2: create table repo.ExecutionLog------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[repo].[ExecutionLog]') AND type in (N'U'))
CREATE TABLE [repo].[ExecutionLog] (
	[id]							[bigint]			 IDENTITY(1, 1) NOT NULL,
	[parent_execution_log_id]		[bigint]			 NULL,
	[execution_instance_guid]		[uniqueidentifier]	 NOT NULL,
	[ssis_execution_id]				[bigint]			 NULL,
	[sub_execution_id]				[int]				 NULL,
	[current_execution_guid]		[uniqueidentifier]	 NULL,
	[proc_id]						[int]				 NULL,
	[proc_schema_name]				[nvarchar](128)		 COLLATE Latin1_General_CI_AS NULL,
	[proc_name]						[nvarchar](128)		 COLLATE Latin1_General_CI_AS NULL,
	[step_id]						[int]				 NULL,
	[step_name]						[nvarchar](1000)	 COLLATE Latin1_General_CI_AS NULL,
	[created_dt]					[datetime]			 NULL,
	[source_object]					[nvarchar](261)		 COLLATE Latin1_General_CI_AS NULL,
	[target_object]					[nvarchar](261)		 COLLATE Latin1_General_CI_AS NULL,
	[inserted]						[int]				 NULL,
	[updated]						[int]				 NULL,
	[deleted]						[int]				 NULL,
	[info_01]						[sql_variant]		 NULL,
	[info_02]						[sql_variant]		 NULL,
	[info_03]						[sql_variant]		 NULL,
	[info_04]						[sql_variant]		 NULL,
	[info_05]						[sql_variant]		 NULL,
	[info_06]						[sql_variant]		 NULL,
	[info_07]						[sql_variant]		 NULL,
	[info_08]						[sql_variant]		 NULL,
	[info_09]						[sql_variant]		 NULL,
	[event_info]					[nvarchar](max)		 COLLATE Latin1_General_CI_AS NULL,
	[parameter_01]					[sql_variant]		 NULL,
	[parameter_02]					[sql_variant]		 NULL,
	[parameter_03]					[sql_variant]		 NULL,
	[parameter_04]					[sql_variant]		 NULL,
	[parameter_05]					[sql_variant]		 NULL,
	[parameter_06]					[sql_variant]		 NULL,
	[parameter_07]					[sql_variant]		 NULL,
	[parameter_08]					[sql_variant]		 NULL,
	[parameter_09]					[sql_variant]		 NULL,
	[parameter_10]					[sql_variant]		 NULL,
	[parameter_11]					[sql_variant]		 NULL,
	[parameter_12]					[sql_variant]		 NULL,
	[parameter_13]					[sql_variant]		 NULL,
	[parameter_14]					[sql_variant]		 NULL,
	[parameter_15]					[sql_variant]		 NULL,
	[parameter_16]					[sql_variant]		 NULL,
	[parameter_17]					[sql_variant]		 NULL,
	[parameter_18]					[sql_variant]		 NULL,
	[parameter_19]					[sql_variant]		 NULL,
	[parameter_20]					[sql_variant]		 NULL,
	[proc_fullname]					AS (concat(quotename([proc_schema_name]),'.',quotename([proc_name])))
) ON [PRIMARY]
GO
IF @@ERROR <> 0 AND @@TRANCOUNT > 0 BEGIN PRINT 'step 2 is completed with errors' ROLLBACK TRAN END
GO
IF @@TRANCOUNT = 0 BEGIN PRINT 'step 2 is completed with errors' SET NOEXEC ON END
GO

--step 3: repo.ExecutionLog: add primary key PK_ExecutionLog----------------------------------------
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[repo].[ExecutionLog]') AND name = N'PK_ExecutionLog') 
ALTER TABLE [repo].[ExecutionLog] ADD CONSTRAINT [PK_ExecutionLog] PRIMARY KEY CLUSTERED ([id])
GO
IF @@ERROR <> 0 AND @@TRANCOUNT > 0 BEGIN PRINT 'step 3 is completed with errors' ROLLBACK TRAN END
GO
IF @@TRANCOUNT = 0 BEGIN PRINT 'step 3 is completed with errors' SET NOEXEC ON END
GO

--step 4: create procedure repo.usp_ExecutionLog_insert---------------------------------------------
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[repo].[usp_ExecutionLog_insert]') AND type in (N'P', N'PC'))
BEGIN
DECLARE @sql nvarchar(max)
SET @sql = N'/*
only insert, no update

to get duration and grouping, use unique combinations of keys,for example

- @execution_instance_guid (which should be unique per execution)
- @ssis_execution_id
- @sub_execution_id
- @proc_id
- @step_id
- @parent_execution_log_id

if a procedure is called several times per ssis_execution, for example the @ssis_execution_id could be used as group and @execution_instance_guid for individual execution

it is also possible to use the @execution_log_id output parameter ad to store it back as @parent_execution_log_id

*/
CREATE PROCEDURE [repo].[usp_ExecutionLog_insert] @execution_instance_guid UNIQUEIDENTIFIER
 , @ssis_execution_id BIGINT = NULL
 , @sub_execution_id INT = NULL
 , @parent_execution_log_id BIGINT = NULL
 , @current_execution_guid UNIQUEIDENTIFIER = NULL
 , @proc_id INT = NULL
 , @proc_schema_name NVARCHAR(128) = NULL
 , @proc_name NVARCHAR(128) = NULL
 , @event_info NVARCHAR(MAX) = NULL
 , @step_id INT = NULL
 , @step_name NVARCHAR(1000) = NULL
 , @source_object NVARCHAR(261) = NULL
 , @target_object NVARCHAR(261) = NULL
 , @inserted INT = NULL
 , @updated INT = NULL
 , @deleted INT = NULL
 , @info_01 SQL_VARIANT = NULL
 , @info_02 SQL_VARIANT = NULL
 , @info_03 SQL_VARIANT = NULL
 , @info_04 SQL_VARIANT = NULL
 , @info_05 SQL_VARIANT = NULL
 , @info_06 SQL_VARIANT = NULL
 , @info_07 SQL_VARIANT = NULL
 , @info_08 SQL_VARIANT = NULL
 , @info_09 SQL_VARIANT = NULL
 , @parameter_01 SQL_VARIANT = NULL
 , @parameter_02 SQL_VARIANT = NULL
 , @parameter_03 SQL_VARIANT = NULL
 , @parameter_04 SQL_VARIANT = NULL
 , @parameter_05 SQL_VARIANT = NULL
 , @parameter_06 SQL_VARIANT = NULL
 , @parameter_07 SQL_VARIANT = NULL
 , @parameter_08 SQL_VARIANT = NULL
 , @parameter_09 SQL_VARIANT = NULL
 , @parameter_10 SQL_VARIANT = NULL
 , @parameter_11 SQL_VARIANT = NULL
 , @parameter_12 SQL_VARIANT = NULL
 , @parameter_13 SQL_VARIANT = NULL
 , @parameter_14 SQL_VARIANT = NULL
 , @parameter_15 SQL_VARIANT = NULL
 , @parameter_16 SQL_VARIANT = NULL
 , @parameter_17 SQL_VARIANT = NULL
 , @parameter_18 SQL_VARIANT = NULL
 , @parameter_19 SQL_VARIANT = NULL
 , @parameter_20 SQL_VARIANT = NULL
 , @execution_log_id BIGINT = NULL OUTPUT
AS
DECLARE @start_dt DATETIME = GETDATE();

INSERT INTO repo.ExecutionLog (
 [execution_instance_guid]
 , [parent_execution_log_id]
 , [ssis_execution_id]
 , [sub_execution_id]
 , [current_execution_guid]
 , [proc_id]
 , [proc_schema_name]
 , [proc_name]
 , [event_info]
 , [step_id]
 , [step_name]
 , [created_dt]
 , [source_object]
 , [target_object]
 , [inserted]
 , [updated]
 , [deleted]
 , [info_01]
 , [info_02]
 , [info_03]
 , [info_04]
 , [info_05]
 , [info_06]
 , [info_07]
 , [info_08]
 , [info_09]
 , [parameter_01]
 , [parameter_02]
 , [parameter_03]
 , [parameter_04]
 , [parameter_05]
 , [parameter_06]
 , [parameter_07]
 , [parameter_08]
 , [parameter_09]
 , [parameter_10]
 , [parameter_11]
 , [parameter_12]
 , [parameter_13]
 , [parameter_14]
 , [parameter_15]
 , [parameter_16]
 , [parameter_17]
 , [parameter_18]
 , [parameter_19]
 , [parameter_20]
 )
VALUES (
 @execution_instance_guid
 , @parent_execution_log_id
 , @ssis_execution_id
 , @sub_execution_id
 , @current_execution_guid
 , @proc_id
 , @proc_schema_name
 , @proc_name
 , @event_info
 , @step_id
 , @step_name
 , @start_dt
 , @source_object
 , @target_object
 , @inserted
 , @updated
 , @deleted
 , @info_01
 , @info_02
 , @info_03
 , @info_04
 , @info_05
 , @info_06
 , @info_07
 , @info_08
 , @info_09
 , @parameter_01
 , @parameter_02
 , @parameter_03
 , @parameter_04
 , @parameter_05
 , @parameter_06
 , @parameter_07
 , @parameter_08
 , @parameter_09
 , @parameter_10
 , @parameter_11
 , @parameter_12
 , @parameter_13
 , @parameter_14
 , @parameter_15
 , @parameter_16
 , @parameter_17
 , @parameter_18
 , @parameter_19
 , @parameter_20
 );

SET @execution_log_id = SCOPE_IDENTITY();'
EXEC sp_executesql @sql
END
GO
IF @@ERROR <> 0 AND @@TRANCOUNT > 0 BEGIN PRINT 'step 4 is completed with errors' ROLLBACK TRAN END
GO
IF @@TRANCOUNT = 0 BEGIN PRINT 'step 4 is completed with errors' SET NOEXEC ON END
GO

----------------------------------------------------------------------
IF @@TRANCOUNT > 0 BEGIN COMMIT TRAN PRINT 'Synchronization is successfully completed.' END
GO
SET NOEXEC OFF
GO
