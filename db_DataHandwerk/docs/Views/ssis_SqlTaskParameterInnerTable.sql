
CREATE View docs.ssis_SqlTaskParameterInnerTable
As
Select
    T1.AntoraModule
  , T1.PackageName
  , T1.TaskPath
  , SqlTaskParameterInnerTable =
  --
  Concat (
             Cast(N'' As NVarchar(Max))
           , Char ( 13 ) + Char ( 10 )

           --table start
           , '[cols="1l,1l"]' + Char ( 13 ) + Char ( 10 )
           --, '[cols="1l,1l,1l"]' + Char ( 13 ) + Char ( 10 )
           , '!===' + Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )

           --table content
           , String_Agg (
                            Concat (
                                       Cast(N'' As NVarchar(Max))
                                     , '!' + T1.ParameterBindingSequence + Char ( 13 ) + Char ( 10 )
                                     , '!' + IsNull ( T1.ParameterBindingParameterName, '' ) + Char ( 13 )
                                       + Char ( 10 )
                                   ----use this, if we have ssis examples containing ResultSetParameterName
                                   --, '!' + IsNull ( T1.ResultSetParameterName, '' ) + Char ( 13 ) + Char ( 10 )
                                   )
                          , Char ( 13 ) + Char ( 10 )
                        ) Within Group(Order By
                                           T1.ParameterBindingSequence)

           --table end
           , '!===' + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
         )
From
    ssis.PackageTask_Sql_Parameter As T1
Group By
    T1.AntoraModule
  , T1.PackageName
  , T1.TaskPath
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '879c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_SqlTaskParameterInnerTable', @level2type = N'COLUMN', @level2name = N'SqlTaskParameterInnerTable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '869c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_SqlTaskParameterInnerTable', @level2type = N'COLUMN', @level2name = N'TaskPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '859c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_SqlTaskParameterInnerTable', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '849c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_SqlTaskParameterInnerTable', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'bbdcad7f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_SqlTaskParameterInnerTable';

