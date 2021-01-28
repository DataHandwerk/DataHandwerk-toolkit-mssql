
CREATE FUNCTION [repo].[ftv_GeneratorUspStep_sql] (
 @usp_id INT
 , @number INT
 , @usp_has_logging TINYINT = 0
 , @required_Begin_count INT = 0 --how many "BEGIN" should be added in front of statement (required in condition blocks)
 , @required_End_count INT = 0   --how many "END" should be added at the of statement (required in condition blocks)
 , @is_required_ELSE TINYINT = 0   --"ELSE" should be added in front of statement (required in condition blocks)
 )
RETURNS TABLE
AS
RETURN (
	SELECT 
	--
	SqlStep = 
	--
	CONCAT(CAST('' as NVARCHAR(max))
	, CASE @is_required_ELSE WHEN 1 THEN 'ELSE' + char(13) + char(10) END
	, REPLICATE ( 'BEGIN' + char(13) + char(10), @required_Begin_count )
	, CASE 
		WHEN [is_SubProcedure] = 1 THEN
			--no logging
			CONCAT('EXEC ', [Statement], char(13), char(10), '--add your own parameters'
			, CASE WHEN NOT [info_01] IS NULL THEN CONCAT(char(13), char(10), '  ',       '@', [info_01]) end
			, CASE WHEN NOT [info_02] IS NULL THEN CONCAT(char(13), char(10), '  ', ',' , '@', [info_02]) end
			, CASE WHEN NOT [info_03] IS NULL THEN CONCAT(char(13), char(10), '  ', ',' , '@', [info_03]) end
			, CASE WHEN NOT [info_04] IS NULL THEN CONCAT(char(13), char(10), '  ', ',' , '@', [info_04]) end
			, CASE WHEN NOT [info_05] IS NULL THEN CONCAT(char(13), char(10), '  ', ',' , '@', [info_05]) end
			, CASE WHEN NOT [info_06] IS NULL THEN CONCAT(char(13), char(10), '  ', ',' , '@', [info_06]) end
			, CASE WHEN NOT [info_07] IS NULL THEN CONCAT(char(13), char(10), '  ', ',' , '@', [info_07]) end
			, CASE WHEN NOT [info_08] IS NULL THEN CONCAT(char(13), char(10), '  ', ',' , '@', [info_08]) end
			, CASE WHEN NOT [info_09] IS NULL THEN CONCAT(char(13), char(10), '  ', ',' , '@', [info_09]) end
			, CASE WHEN @usp_has_logging = 1 THEN
				CONCAT(''
					, CASE WHEN 
								NOT [info_01] IS NULL 
							OR  NOT [info_02] IS NULL 
							OR  NOT [info_03] IS NULL 
							OR  NOT [info_04] IS NULL 
							OR  NOT [info_05] IS NULL 
							OR  NOT [info_06] IS NULL 
							OR  NOT [info_07] IS NULL 
							OR  NOT [info_08] IS NULL 
							OR  NOT [info_09] IS NULL 
							THEN CONCAT(char(13), char(10), ',') 
						END
					, char(13), char(10), '--logging parameters'
					, char(13), char(10), ' @execution_instance_guid = @execution_instance_guid'
					, char(13), char(10), ' , @ssis_execution_id = @ssis_execution_id'
					, char(13), char(10), ' , @sub_execution_id = @sub_execution_id'
					, char(13), char(10), ' , @parent_execution_log_id = @current_execution_log_id'
					)
				END
			, char(13), char(10)
			)
		WHEN [is_condition] = 1 THEN 
			--no logging
			CONCAT('IF ', [Statement])
		ELSE
			--other statements
			CONCAT(''
				, [Statement]
				--logging depending on parameter @usp_has_logging
				, CASE WHEN @usp_has_logging = 1 AND [has_logging] = 1 THEN
					CONCAT(''
						, char(13), char(10)
						, char(13), char(10), '-- Logging START --'
						, char(13), char(10), 'SET @rows = @@ROWCOUNT'
						, char(13), char(10), 'SET @step_id = @step_id + 1'
						--, char(13), char(10), 'SET @step_name = ''', [Name], ''''
						, char(13), char(10), 'SET @step_name = ', CASE WHEN NOT [Name] IS NULL THEN '''' + [Name] + '''' ELSE 'NULL' END
						, char(13), char(10), 'SET @source_object = ', CASE WHEN NOT [log_source_object] IS NULL THEN '''' + [log_source_object] + '''' ELSE 'NULL' END
						, char(13), char(10), 'SET @target_object = ', CASE WHEN NOT [log_target_object] IS NULL THEN '''' + [log_target_object] + '''' ELSE 'NULL' END
						, char(13), char(10)
						, char(13), char(10), 'EXEC repo.usp_ExecutionLog_insert '
						, char(13), char(10), ' @execution_instance_guid = @execution_instance_guid'
						, char(13), char(10), ' , @ssis_execution_id = @ssis_execution_id'
						, char(13), char(10), ' , @sub_execution_id = @sub_execution_id'
						, char(13), char(10), ' , @parent_execution_log_id = @parent_execution_log_id'
						, char(13), char(10), ' , @current_execution_guid = @current_execution_guid'
						, char(13), char(10), ' , @proc_id = @proc_id'
						, char(13), char(10), ' , @proc_schema_name = @proc_schema_name'
						, char(13), char(10), ' , @proc_name = @proc_name'
						, char(13), char(10), ' , @event_info = @event_info'
						, char(13), char(10), ' , @step_id = @step_id'
						, char(13), char(10), ' , @step_name = @step_name'
						, char(13), char(10), ' , @source_object = @source_object'
						, char(13), char(10), ' , @target_object = @target_object'
						, char(13), char(10)
						, CASE [log_flag_InsertUpdateDelete]
							WHEN 'I' THEN ' , @inserted = @rows'
							WHEN 'U' THEN ' , @updated = @rows'
							WHEN 'D' THEN ' , @deleted = @rows'
							END
						, CASE WHEN NOT [info_01] IS NULL THEN CONCAT(char(13), char(10), ' , @info_01 = ''', [info_01], '''') end
						, CASE WHEN NOT [info_02] IS NULL THEN CONCAT(char(13), char(10), ' , @info_01 = ''', [info_02], '''') end
						, CASE WHEN NOT [info_03] IS NULL THEN CONCAT(char(13), char(10), ' , @info_01 = ''', [info_03], '''') end
						, CASE WHEN NOT [info_04] IS NULL THEN CONCAT(char(13), char(10), ' , @info_01 = ''', [info_04], '''') end
						, CASE WHEN NOT [info_05] IS NULL THEN CONCAT(char(13), char(10), ' , @info_01 = ''', [info_05], '''') end
						, CASE WHEN NOT [info_06] IS NULL THEN CONCAT(char(13), char(10), ' , @info_01 = ''', [info_06], '''') end
						, CASE WHEN NOT [info_07] IS NULL THEN CONCAT(char(13), char(10), ' , @info_01 = ''', [info_07], '''') end
						, CASE WHEN NOT [info_08] IS NULL THEN CONCAT(char(13), char(10), ' , @info_01 = ''', [info_08], '''') end
						, CASE WHEN NOT [info_09] IS NULL THEN CONCAT(char(13), char(10), ' , @info_01 = ''', [info_09], '''') end
						, char(13), char(10), '-- Logging END --'
						--, char(13), char(10)
						)
					END
			)
		END
		, REPLICATE ( char(13) + char(10) + 'END;', @required_End_count )
		, char(13), char(10)
	  )
	, Number
	, [Statement]
	FROM [repo].[GeneratorUspStep] s
	WHERE s.[Usp_id] = @Usp_id
		AND s.Number = @number
)