


--todo:
--hier fehlt das eigentliche Skipt
--ssis_t.TblSQLTaskDetails enthält nur die n:1 Details wie ParameterBinding
--es gibt noch die Daten zum eigentlichen SQL Task XML [SqlTaskQry]
--das muss noch separat bestimmt werden
--entweder in der Granularität von ssis_t.TblControlFlowDetails
--oder als separate Sicht ssis.PackageTaskSql_src
CREATE View [ssis].[PackageTask_Sql_Parameter_src]
As
Select
    p.AntoraModule
  , p.PackageName
  , T2.TaskPath
  , T3.ParameterBindingSequence
  , T3.ResultSetParameterName
  , T3.ParameterBindingParameterName
  , T2.ControlFlowDetailsRowID
From
    ssis.Package_src                 As p
    Inner Join
        ssis_t.TblControlFlow        As T2
            On
            p.RowID                    = T2.RowID

    Inner Join
        ssis_t.TblTask_Sql_Parameter As T3
            On
            T3.ControlFlowDetailsRowID = T2.ControlFlowDetailsRowID
Where
    Not T3.ParameterBindingSequence Is Null
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f7f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Sql_Parameter_src', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'faf8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Sql_Parameter_src', @level2type = N'COLUMN', @level2name = N'ParameterBindingParameterName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f8f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Sql_Parameter_src', @level2type = N'COLUMN', @level2name = N'ResultSetParameterName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f9f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Sql_Parameter_src', @level2type = N'COLUMN', @level2name = N'ParameterBindingSequence';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f5f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Sql_Parameter_src', @level2type = N'COLUMN', @level2name = N'TaskPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e6e3c11b-183b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Sql_Parameter_src', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f2f8d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Sql_Parameter_src', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '6a64fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Sql_Parameter_src';

