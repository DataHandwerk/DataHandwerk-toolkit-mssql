
CREATE View docs.ssis_PumlPartialDataFlow
As
Select
    pf.AntoraModule
  , pf.PackageName
  , pf.TaskFromParent
  , PumlPartialDataFlow =
  --
  String_Agg (
                 Cast(N'' As NVarchar(Max)) + docs.fs_cleanStringForAnchorId ( pf.TaskFrom ) + ' --> '
                 + docs.fs_cleanStringForAnchorId ( pf.Taskto ) + Iif(pf.Expression <> '', ' : ' + pf.Expression, '')
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                pf.TaskFrom
                              , pf.Taskto)
From
    ssis.PackageFlow As pf
Where
    pf.FlowType = 'Data Flow'
Group By
    pf.AntoraModule
  , pf.PackageName
  , pf.TaskFromParent
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '699b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialDataFlow', @level2type = N'COLUMN', @level2name = N'PumlPartialDataFlow';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '689b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialDataFlow', @level2type = N'COLUMN', @level2name = N'TaskFromParent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '679b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialDataFlow', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '669b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialDataFlow', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'addcad7f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialDataFlow';

