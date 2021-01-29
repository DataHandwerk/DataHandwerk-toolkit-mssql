
CREATE FUNCTION [repo].[ftv_GeneratorUspStep_sql] (
 @usp_id INT
 , @number INT
 , @usp_has_logging TINYINT = 0
 , @required_Begin_count INT = 0 --how many "BEGIN" should be added in front of statement (required in condition blocks)
 , @required_End_count INT = 0 --how many "END" should be added at the of statement (required in condition blocks)
 , @is_required_ELSE TINYINT = 0 --"ELSE" should be added in front of statement (required in condition blocks)
 )
RETURNS TABLE
AS
RETURN (
  SELECT
   --
   SqlStep =
   --
   CONCAT (
    CAST('' AS NVARCHAR(max))
    , '/*'
    , (
     SELECT [Number]
      , [Parent_Number]
      , [Name]
      , [has_logging]
      , [is_condition]
      , [is_inactive]
      , [is_SubProcedure]
      , [log_source_object]
      , [log_target_object]
      , [log_flag_InsertUpdateDelete]
      , [info_01]
      , [info_02]
      , [info_03]
      , [info_04]
      , [info_05]
      , [info_06]
      , [info_07]
      , [info_08]
      , [info_09]
     FOR json path
      , ROOT('ReportUspStep')
     )
    , '*/'
    , CHAR(13)
    , CHAR(10)
    , CASE @is_required_ELSE
     WHEN 1
      THEN 'ELSE' + CHAR(13) + CHAR(10)
     END
    , REPLICATE('BEGIN' + CHAR(13) + CHAR(10), @required_Begin_count)
    , CASE 
     WHEN [is_SubProcedure] = 1
      THEN
       --no logging
       CONCAT (
        'EXEC '
        , [Statement]
        , CHAR(13)
        , CHAR(10)
        , '--add your own parameters'
        , CASE 
         WHEN NOT [info_01] IS NULL
          THEN CONCAT (
            CHAR(13)
            , CHAR(10)
            , '  '
            , '@'
            , [info_01]
            )
         END
        , CASE 
         WHEN NOT [info_02] IS NULL
          THEN CONCAT (
            CHAR(13)
            , CHAR(10)
            , '  '
            , ','
            , '@'
            , [info_02]
            )
         END
        , CASE 
         WHEN NOT [info_03] IS NULL
          THEN CONCAT (
            CHAR(13)
            , CHAR(10)
            , '  '
            , ','
            , '@'
            , [info_03]
            )
         END
        , CASE 
         WHEN NOT [info_04] IS NULL
          THEN CONCAT (
            CHAR(13)
            , CHAR(10)
            , '  '
            , ','
            , '@'
            , [info_04]
            )
         END
        , CASE 
         WHEN NOT [info_05] IS NULL
          THEN CONCAT (
            CHAR(13)
            , CHAR(10)
            , '  '
            , ','
            , '@'
            , [info_05]
            )
         END
        , CASE 
         WHEN NOT [info_06] IS NULL
          THEN CONCAT (
            CHAR(13)
            , CHAR(10)
            , '  '
            , ','
            , '@'
            , [info_06]
            )
         END
        , CASE 
         WHEN NOT [info_07] IS NULL
          THEN CONCAT (
            CHAR(13)
            , CHAR(10)
            , '  '
            , ','
            , '@'
            , [info_07]
            )
         END
        , CASE 
         WHEN NOT [info_08] IS NULL
          THEN CONCAT (
            CHAR(13)
            , CHAR(10)
            , '  '
            , ','
            , '@'
            , [info_08]
            )
         END
        , CASE 
         WHEN NOT [info_09] IS NULL
          THEN CONCAT (
            CHAR(13)
            , CHAR(10)
            , '  '
            , ','
            , '@'
            , [info_09]
            )
         END
        , CASE 
         WHEN @usp_has_logging = 1
          THEN CONCAT (
            ''
            , CASE 
             WHEN NOT [info_01] IS NULL
              OR NOT [info_02] IS NULL
              OR NOT [info_03] IS NULL
              OR NOT [info_04] IS NULL
              OR NOT [info_05] IS NULL
              OR NOT [info_06] IS NULL
              OR NOT [info_07] IS NULL
              OR NOT [info_08] IS NULL
              OR NOT [info_09] IS NULL
              THEN CONCAT (
                CHAR(13)
                , CHAR(10)
                , ','
                )
             END
            , CHAR(13)
            , CHAR(10)
            , '--logging parameters'
            , CHAR(13)
            , CHAR(10)
            , ' @execution_instance_guid = @execution_instance_guid'
            , CHAR(13)
            , CHAR(10)
            , ' , @ssis_execution_id = @ssis_execution_id'
            , CHAR(13)
            , CHAR(10)
            , ' , @sub_execution_id = @sub_execution_id'
            , CHAR(13)
            , CHAR(10)
            , ' , @parent_execution_log_id = @current_execution_log_id'
            )
         END
        , CHAR(13)
        , CHAR(10)
        )
     WHEN [is_condition] = 1
      THEN
       --no logging
       CONCAT (
        'IF '
        , [Statement]
        )
     ELSE
      --other statements
      CONCAT (
       ''
       , [Statement]
       --logging depending on parameter @usp_has_logging
       , CASE 
        WHEN @usp_has_logging = 1
         AND [has_logging] = 1
         THEN CONCAT (
           ''
           , CHAR(13)
           , CHAR(10)
           , CHAR(13)
           , CHAR(10)
           , '-- Logging START --'
           , CHAR(13)
           , CHAR(10)
           , 'SET @rows = @@ROWCOUNT'
           , CHAR(13)
           , CHAR(10)
           , 'SET @step_id = @step_id + 1'
           --, char(13), char(10), 'SET @step_name = ''', [Name], ''''
           , CHAR(13)
           , CHAR(10)
           , 'SET @step_name = '
           , CASE 
            WHEN NOT [Name] IS NULL
             THEN '''' + [Name] + ''''
            ELSE 'NULL'
            END
           , CHAR(13)
           , CHAR(10)
           , 'SET @source_object = '
           , CASE 
            WHEN NOT [log_source_object] IS NULL
             THEN '''' + [log_source_object] + ''''
            ELSE 'NULL'
            END
           , CHAR(13)
           , CHAR(10)
           , 'SET @target_object = '
           , CASE 
            WHEN NOT [log_target_object] IS NULL
             THEN '''' + [log_target_object] + ''''
            ELSE 'NULL'
            END
           , CHAR(13)
           , CHAR(10)
           , CHAR(13)
           , CHAR(10)
           , 'EXEC repo.usp_ExecutionLog_insert '
           , CHAR(13)
           , CHAR(10)
           , ' @execution_instance_guid = @execution_instance_guid'
           , CHAR(13)
           , CHAR(10)
           , ' , @ssis_execution_id = @ssis_execution_id'
           , CHAR(13)
           , CHAR(10)
           , ' , @sub_execution_id = @sub_execution_id'
           , CHAR(13)
           , CHAR(10)
           , ' , @parent_execution_log_id = @parent_execution_log_id'
           , CHAR(13)
           , CHAR(10)
           , ' , @current_execution_guid = @current_execution_guid'
           , CHAR(13)
           , CHAR(10)
           , ' , @proc_id = @proc_id'
           , CHAR(13)
           , CHAR(10)
           , ' , @proc_schema_name = @proc_schema_name'
           , CHAR(13)
           , CHAR(10)
           , ' , @proc_name = @proc_name'
           , CHAR(13)
           , CHAR(10)
           , ' , @event_info = @event_info'
           , CHAR(13)
           , CHAR(10)
           , ' , @step_id = @step_id'
           , CHAR(13)
           , CHAR(10)
           , ' , @step_name = @step_name'
           , CHAR(13)
           , CHAR(10)
           , ' , @source_object = @source_object'
           , CHAR(13)
           , CHAR(10)
           , ' , @target_object = @target_object'
           , CHAR(13)
           , CHAR(10)
           , CASE [log_flag_InsertUpdateDelete]
            WHEN 'I'
             THEN ' , @inserted = @rows'
            WHEN 'U'
             THEN ' , @updated = @rows'
            WHEN 'D'
             THEN ' , @deleted = @rows'
            END
           , CASE 
            WHEN NOT [info_01] IS NULL
             THEN CONCAT (
               CHAR(13)
               , CHAR(10)
               , ' , @info_01 = '''
               , [info_01]
               , ''''
               )
            END
           , CASE 
            WHEN NOT [info_02] IS NULL
             THEN CONCAT (
               CHAR(13)
               , CHAR(10)
               , ' , @info_01 = '''
               , [info_02]
               , ''''
               )
            END
           , CASE 
            WHEN NOT [info_03] IS NULL
             THEN CONCAT (
               CHAR(13)
               , CHAR(10)
               , ' , @info_01 = '''
               , [info_03]
               , ''''
               )
            END
           , CASE 
            WHEN NOT [info_04] IS NULL
             THEN CONCAT (
               CHAR(13)
               , CHAR(10)
               , ' , @info_01 = '''
               , [info_04]
               , ''''
               )
            END
           , CASE 
            WHEN NOT [info_05] IS NULL
             THEN CONCAT (
               CHAR(13)
               , CHAR(10)
               , ' , @info_01 = '''
               , [info_05]
               , ''''
               )
            END
           , CASE 
            WHEN NOT [info_06] IS NULL
             THEN CONCAT (
               CHAR(13)
               , CHAR(10)
               , ' , @info_01 = '''
               , [info_06]
               , ''''
               )
            END
           , CASE 
            WHEN NOT [info_07] IS NULL
             THEN CONCAT (
               CHAR(13)
               , CHAR(10)
               , ' , @info_01 = '''
               , [info_07]
               , ''''
               )
            END
           , CASE 
            WHEN NOT [info_08] IS NULL
             THEN CONCAT (
               CHAR(13)
               , CHAR(10)
               , ' , @info_01 = '''
               , [info_08]
               , ''''
               )
            END
           , CASE 
            WHEN NOT [info_09] IS NULL
             THEN CONCAT (
               CHAR(13)
               , CHAR(10)
               , ' , @info_01 = '''
               , [info_09]
               , ''''
               )
            END
           , CHAR(13)
           , CHAR(10)
           , '-- Logging END --'
           --, char(13), char(10)
           )
        END
       )
     END
    , REPLICATE(CHAR(13) + CHAR(10) + 'END;', @required_End_count)
    , CHAR(13)
    , CHAR(10)
    )
   , Number
   , [Statement]
  FROM [repo].[GeneratorUspStep] s
  WHERE s.[usp_id] = @usp_id
   AND s.Number = @number
  )
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3590291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'FUNCTION', @level1name = N'ftv_GeneratorUspStep_sql';

