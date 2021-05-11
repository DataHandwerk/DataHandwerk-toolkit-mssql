
CREATE Function [uspgenerator].[ftv_GeneratorUspStep_sql]
(
    @usp_id               Int
  , @number               Int
  , @usp_has_logging      TinyInt = 0
  , @required_Begin_count Int     = 0 --how many "BEGIN" should be added in front of statement (required in condition blocks)
  , @required_End_count   Int     = 0 --how many "END" should be added at the of statement (required in condition blocks)
  , @is_required_ELSE     TinyInt = 0 --"ELSE" should be added in front of statement (required in condition blocks)
)
Returns Table
As
Return
(
    Select
        --
        SqlStep =
        --
        Concat (
                   Cast('' As NVarchar(Max))
                 , '/*'
                 , (
                       Select
                           Number
                         , Parent_Number
                         , Name
                         , has_logging
                         , is_condition
                         , is_inactive
                         , is_SubProcedure
                         , log_source_object
                         , log_target_object
                         , log_flag_InsertUpdateDelete
                         , info_01
                         , info_02
                         , info_03
                         , info_04
                         , info_05
                         , info_06
                         , info_07
                         , info_08
                         , info_09
                       For Json Path, Root('ReportUspStep')
                   )
                 , '*/'
                 , Char ( 13 ) + Char ( 10 )
                 , Case @is_required_ELSE
                       When 1
                           Then
                           'ELSE' + Char ( 13 ) + Char ( 10 )
                   End
                 , Replicate ( 'BEGIN' + Char ( 13 ) + Char ( 10 ), @required_Begin_count )
                 , Case
                       When is_SubProcedure = 1
                           Then
                           --no logging
                           Concat (
                                      'EXEC '
                                    , Statement
                                    , Char ( 13 ) + Char ( 10 )
                                    , '--add your own parameters'
                                    , Case
                                          When Not info_01 Is Null
                                              Then
                                              Concat ( Char ( 13 ) + Char ( 10 ), '  ', '@', info_01 )
                                      End
                                    , Case
                                          When Not info_02 Is Null
                                              Then
                                              Concat ( Char ( 13 ) + Char ( 10 ), '  ', ',', '@', info_02 )
                                      End
                                    , Case
                                          When Not info_03 Is Null
                                              Then
                                              Concat ( Char ( 13 ) + Char ( 10 ), '  ', ',', '@', info_03 )
                                      End
                                    , Case
                                          When Not info_04 Is Null
                                              Then
                                              Concat ( Char ( 13 ) + Char ( 10 ), '  ', ',', '@', info_04 )
                                      End
                                    , Case
                                          When Not info_05 Is Null
                                              Then
                                              Concat ( Char ( 13 ) + Char ( 10 ), '  ', ',', '@', info_05 )
                                      End
                                    , Case
                                          When Not info_06 Is Null
                                              Then
                                              Concat ( Char ( 13 ) + Char ( 10 ), '  ', ',', '@', info_06 )
                                      End
                                    , Case
                                          When Not info_07 Is Null
                                              Then
                                              Concat ( Char ( 13 ) + Char ( 10 ), '  ', ',', '@', info_07 )
                                      End
                                    , Case
                                          When Not info_08 Is Null
                                              Then
                                              Concat ( Char ( 13 ) + Char ( 10 ), '  ', ',', '@', info_08 )
                                      End
                                    , Case
                                          When Not info_09 Is Null
                                              Then
                                              Concat ( Char ( 13 ) + Char ( 10 ), '  ', ',', '@', info_09 )
                                      End
                                    , Case
                                          When @usp_has_logging = 1
                                              Then
                                              Concat (
                                                         ''
                                                       , Case
                                                             When Not info_01 Is Null
                                                                  Or Not info_02 Is Null
                                                                  Or Not info_03 Is Null
                                                                  Or Not info_04 Is Null
                                                                  Or Not info_05 Is Null
                                                                  Or Not info_06 Is Null
                                                                  Or Not info_07 Is Null
                                                                  Or Not info_08 Is Null
                                                                  Or Not info_09 Is Null
                                                                 Then
                                                                 Concat ( Char ( 13 ) + Char ( 10 ), ',' )
                                                         End
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , '--logging parameters'
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , ' @execution_instance_guid = @execution_instance_guid'
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , ' , @ssis_execution_id = @ssis_execution_id'
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , ' , @sub_execution_id = @sub_execution_id'
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , ' , @parent_execution_log_id = @current_execution_log_id'
                                                     )
                                      End
                                    , Char ( 13 ) + Char ( 10 )
                                  )
                       When is_condition = 1
                           Then
                           --no logging
                           Concat ( 'IF ', Statement )
                       Else
                           --other statements
                           Concat (
                                      ''
                                    , 'PRINT CONCAT(''usp_id;Number;Parent_Number: '','
                                    , usp_id
                                    , ','';'','
                                    , Number
                                    , ','';'','
                                    , Case
                                          When Not Parent_Number Is Null
                                              Then
                                              Cast(Parent_Number As Varchar(50))
                                          Else
                                              'NULL'
                                      End
                                    , ');'
                                    , Char ( 13 ) + Char ( 10 )
                                    , Char ( 13 ) + Char ( 10 )
                                    , '/*' + Char ( 13 ) + Char ( 10 ) + Description + Char ( 13 ) + Char ( 10 ) + '*/'
                                      + Char ( 13 ) + Char ( 10 )
                                    , Statement
                                    --logging depending on parameter @usp_has_logging
                                    , Case
                                          When @usp_has_logging = 1
                                               And has_logging = 1
                                              Then
                                              Concat (
                                                         ''
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , '-- Logging START --'
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , 'SET @rows = @@ROWCOUNT'
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , 'SET @step_id = @step_id + 1'
                                                       --, char(13), char(10), 'SET @step_name = ''', [Name], ''''
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , 'SET @step_name = '
                                                       , Case
                                                             When Not Name Is Null
                                                                 Then
                                                                 '''' + Replace ( Name, '''', '''''' ) + ''''
                                                             Else
                                                                 'NULL'
                                                         End
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , 'SET @source_object = '
                                                       , Case
                                                             When Not log_source_object Is Null
                                                                 Then
                                                                 '''' + log_source_object + ''''
                                                             Else
                                                                 'NULL'
                                                         End
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , 'SET @target_object = '
                                                       , Case
                                                             When Not log_target_object Is Null
                                                                 Then
                                                                 '''' + log_target_object + ''''
                                                             Else
                                                                 'NULL'
                                                         End
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , 'EXEC logs.usp_ExecutionLog_insert '
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , ' @execution_instance_guid = @execution_instance_guid'
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , ' , @ssis_execution_id = @ssis_execution_id'
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , ' , @sub_execution_id = @sub_execution_id'
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , ' , @parent_execution_log_id = @parent_execution_log_id'
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , ' , @current_execution_guid = @current_execution_guid'
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , ' , @proc_id = @proc_id'
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , ' , @proc_schema_name = @proc_schema_name'
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , ' , @proc_name = @proc_name'
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , ' , @event_info = @event_info'
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , ' , @step_id = @step_id'
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , ' , @step_name = @step_name'
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , ' , @source_object = @source_object'
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , ' , @target_object = @target_object'
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , Case log_flag_InsertUpdateDelete
                                                             When 'I'
                                                                 Then
                                                                 ' , @inserted = @rows'
                                                             When 'U'
                                                                 Then
                                                                 ' , @updated = @rows'
                                                             When 'D'
                                                                 Then
                                                                 ' , @deleted = @rows'
                                                         End
                                                       , Case
                                                             When Not info_01 Is Null
                                                                 Then
                                                                 Concat (
                                                                            Char ( 13 ) + Char ( 10 )
                                                                          , ' , @info_01 = '''
                                                                          , info_01
                                                                          , ''''
                                                                        )
                                                         End
                                                       , Case
                                                             When Not info_02 Is Null
                                                                 Then
                                                                 Concat (
                                                                            Char ( 13 ) + Char ( 10 )
                                                                          , ' , @info_01 = '''
                                                                          , info_02
                                                                          , ''''
                                                                        )
                                                         End
                                                       , Case
                                                             When Not info_03 Is Null
                                                                 Then
                                                                 Concat (
                                                                            Char ( 13 ) + Char ( 10 )
                                                                          , ' , @info_01 = '''
                                                                          , info_03
                                                                          , ''''
                                                                        )
                                                         End
                                                       , Case
                                                             When Not info_04 Is Null
                                                                 Then
                                                                 Concat (
                                                                            Char ( 13 ) + Char ( 10 )
                                                                          , ' , @info_01 = '''
                                                                          , info_04
                                                                          , ''''
                                                                        )
                                                         End
                                                       , Case
                                                             When Not info_05 Is Null
                                                                 Then
                                                                 Concat (
                                                                            Char ( 13 ) + Char ( 10 )
                                                                          , ' , @info_01 = '''
                                                                          , info_05
                                                                          , ''''
                                                                        )
                                                         End
                                                       , Case
                                                             When Not info_06 Is Null
                                                                 Then
                                                                 Concat (
                                                                            Char ( 13 ) + Char ( 10 )
                                                                          , ' , @info_01 = '''
                                                                          , info_06
                                                                          , ''''
                                                                        )
                                                         End
                                                       , Case
                                                             When Not info_07 Is Null
                                                                 Then
                                                                 Concat (
                                                                            Char ( 13 ) + Char ( 10 )
                                                                          , ' , @info_01 = '''
                                                                          , info_07
                                                                          , ''''
                                                                        )
                                                         End
                                                       , Case
                                                             When Not info_08 Is Null
                                                                 Then
                                                                 Concat (
                                                                            Char ( 13 ) + Char ( 10 )
                                                                          , ' , @info_01 = '''
                                                                          , info_08
                                                                          , ''''
                                                                        )
                                                         End
                                                       , Case
                                                             When Not info_09 Is Null
                                                                 Then
                                                                 Concat (
                                                                            Char ( 13 ) + Char ( 10 )
                                                                          , ' , @info_01 = '''
                                                                          , info_09
                                                                          , ''''
                                                                        )
                                                         End
                                                       , Char ( 13 ) + Char ( 10 )
                                                       , '-- Logging END --'
                                                     --, char(13), char(10)
                                                     )
                                      End
                                  )
                   End
                 , Replicate ( Char ( 13 ) + Char ( 10 ) + 'END;', @required_End_count )
                 , Char ( 13 ) + Char ( 10 )
               )
      , Number
      , Statement
    From
        [uspgenerator].GeneratorUspStep s
    Where
        s.usp_id     = @usp_id
        And s.Number = @number
);
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '3590291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'uspgenerator'
  , @level1type = N'FUNCTION'
  , @level1name = N'ftv_GeneratorUspStep_sql';
Go