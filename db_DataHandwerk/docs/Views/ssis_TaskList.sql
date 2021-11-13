CREATE View [docs].[ssis_TaskList]
As
Select
    task.AntoraModule
  , task.PackageName
  , TaskList =
  --
  String_Agg (
                 Concat (
                            Cast(N'' As NVarchar(Max))
                          , '[#task-'
                          , docs.fs_cleanStringForAnchorId ( task.TaskPath )
                          , ']'
                          , Char ( 13 ) + Char ( 10 )
                          , '=== '
                          , docs.fs_cleanStringForHeader ( task.TaskPath )
                          , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )

                          --table start
                          , '[cols="1,4l"]' + Char ( 13 ) + Char ( 10 )
                          , '|===' + Char ( 13 ) + Char ( 10 )
                          , Char ( 13 ) + Char ( 10 )

                          --table content
                          , '|' + 'Task Path' + Char ( 13 ) + Char ( 10 ) + '|' + task.TaskPath + Char ( 13 )
                            + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'Task Name' + Char ( 13 ) + Char ( 10 ) + '|' + task.TaskName + Char ( 13 )
                            + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'Task Description' + Char ( 13 ) + Char ( 10 ) + '|' + task.TaskDescription
                            + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'Task Type' + Char ( 13 ) + Char ( 10 ) + '|' + task.TaskType + Char ( 13 )
                            + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'Is Disabled' + Char ( 13 ) + Char ( 10 ) + '|' + task.IsDisabled + Char ( 13 )
                            + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'DelayValidationPropertyValue' + Char ( 13 ) + Char ( 10 ) + '|'
                            + task.DelayValidationPropertyValue + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'Expression Value' + Char ( 13 ) + Char ( 10 ) + '|' + task.ExpressionValue
                            + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'Script' + Char ( 13 ) + Char ( 10 )
                            --
                            ---- 'a' - AsciiDoc style, to overwrite the columns style 'l' - Literal
                            + 'a|'
                            --
                            + '[%collapsible]' + Char ( 13 ) + Char ( 10 ) + '=======' + Char ( 13 ) + Char ( 10 )
                            + '[source,c,numbered]' + Char ( 13 ) + Char ( 10 ) + '----' + Char ( 13 ) + Char ( 10 )
                            --
                            + task.Script
                            --
                            + Char ( 13 ) + Char ( 10 ) + '----' + Char ( 13 ) + Char ( 10 ) + '=======' + Char ( 13 )
                            + Char ( 10 )
                            --
                            + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'Sql Connection' + Char ( 13 ) + Char ( 10 ) + '|'
                            + Cast(task.SqlConnection As NVarchar(50)) + Char ( 13 ) + Char ( 10 ) + Char ( 13 )
                            + Char ( 10 )
                          , '|' + 'Sql Project Connection' + Char ( 13 ) + Char ( 10 ) + 'a|' + +' <<connection-'
                            + docs.fs_cleanStringForAnchorId ( projcon.ConnectionManagerName ) + '>>' + Char ( 13 )
                            + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'Sql Package Connection' + Char ( 13 ) + Char ( 10 ) + 'a|' + ' <<connection-'
                            + docs.fs_cleanStringForAnchorId ( packcon.ConnectionManagerName ) + '>>' + Char ( 13 )
                            + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'Sql Statement' + Char ( 13 ) + Char ( 10 )
                            --
                            ---- 'a' - AsciiDoc style, to overwrite the columns style 'l' - Literal
                            + 'a|'
                            --
                            + '[%collapsible]' + Char ( 13 ) + Char ( 10 ) + '=======' + Char ( 13 ) + Char ( 10 )
                            + '[source,sql,numbered]' + Char ( 13 ) + Char ( 10 ) + '----' + Char ( 13 ) + Char ( 10 )
                            --
                            + task.SqlStatementSource
                            --
                            + Char ( 13 ) + Char ( 10 ) + '----' + Char ( 13 ) + Char ( 10 ) + '=======' + Char ( 13 )
                            + Char ( 10 )
                            --
                            + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'Parameters' + Char ( 13 ) + Char ( 10 ) + 'a|' + sqlpit.SqlTaskParameterInnerTable
                            + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )

                          --
                          , '|' + 'Execute PackageExpression' + Char ( 13 ) + Char ( 10 ) + '|'
                            + task.ExecutePackageExpression + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'Executed PackageName' + Char ( 13 ) + Char ( 10 ) + 'a|' + 'xref:'
                            + docs.fs_cleanStringForFilename ( Replace ( task.ExecutedPackageName, '.dtsx', '' ))
                            + '.adoc[]' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'Execute Package Connection' + Char ( 13 ) + Char ( 10 ) + '|'
                            + task.ExecutePackageConnection + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )

                          --table end
                          , '|===' + Char ( 13 ) + Char ( 10 )
                          ---- only Data Flow Task
                          , Iif(dfttsl.TaskPath <> ''
                              , Concat (   '
[plantuml, entity-{docname}, svg, subs=macros]
....
'
                                         --
                                         , pumldft.PumlDftTask + Char ( 13 ) + Char ( 10 )
                                         --
                                         , '
....
'
                                         --
                                         , dfttsl.DftTaskComponentList + Char ( 13 ) + Char ( 10 )
                                       )
                              , '')
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                task.TaskPath)
From
    ssis.PackageTask                         As task
    Left Join
        ssis.PackageConnection               As packcon
            On
            packcon.AntoraModule            = task.AntoraModule
            And packcon.PackageName         = task.PackageName
            And packcon.ConnectionManagerID = task.SqlConnection

    Left Join
        ssis.ProjectConnection               As projcon
            On
            projcon.AntoraModule            = task.AntoraModule
            And projcon.ConnectionManagerID = task.SqlConnection

    Left Join
        docs.ssis_SqlTaskParameterInnerTable As sqlpit
            On
            sqlpit.AntoraModule             = task.AntoraModule
            And sqlpit.PackageName          = task.PackageName
            And sqlpit.TaskPath             = task.TaskPath

    Left Join
        docs.ssis_DftTaskComponentList       As dfttsl
            On
            dfttsl.AntoraModule             = task.AntoraModule
            And dfttsl.PackageName          = task.PackageName
            And dfttsl.TaskPath             = task.TaskPath

    Left Join
        docs.ssis_PumlDftTask                As pumldft
            On
            pumldft.AntoraModule            = task.AntoraModule
            And pumldft.PackageName         = task.PackageName
            And pumldft.TaskPath            = task.TaskPath
Group By
    task.AntoraModule
  , task.PackageName
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7dddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_TaskList', @level2type = N'COLUMN', @level2name = N'TaskList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7cddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_TaskList', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7bddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_TaskList', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '879a07f7-c23c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_TaskList';

