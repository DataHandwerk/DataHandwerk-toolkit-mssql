CREATE View docs.ssis_PumlPartialControlFlows
As
Select
    pf.AntoraModule
  , pf.PackageName
  , PumlPartialControlFlows =
  --
  String_Agg (
                 Cast(N'' As NVarchar(Max)) + docs.fs_cleanStringForAnchorId ( pf.TaskFrom )
                 + Iif(pf.LogicalAnd = 1, ' --> ', ' ..> ') + docs.fs_cleanStringForAnchorId ( pf.Taskto )
                 + Iif(pf.Expression <> '', ' : ' + pf.Expression, '')
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                pf.TaskFrom
                              , pf.Taskto)
From
    ssis.PackageFlow As pf
Where
    pf.FlowType = 'Control Flow'
Group By
    pf.AntoraModule
  , pf.PackageName
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '659b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialControlFlows', @level2type = N'COLUMN', @level2name = N'PumlPartialControlFlows';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '649b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialControlFlows', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '639b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialControlFlows', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'acdcad7f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_PumlPartialControlFlows';

