﻿
/*
bi-directional relations between procedures
they needs to be excluded to avoid circular references in SSIS packages or in procedure calls
we need to exclude one of them in earlier steps to make this view here empty
*/
CREATE View [workflow].[Workflow_ProcedureDependency_T_bidirectional]
As
Select
    T1.Workflow_id
  , T1.referenced_Procedure_RepoObject_guid
  , T1.referencing_Procedure_RepoObject_guid
  , ro2.RepoObject_fullname As referenced_RepoObject_fullname
  , ro1.RepoObject_fullname As referencing_RepoObject_fullname
From
    workflow.Workflow_ProcedureDependency_T     As T1
    Inner Join
        workflow.Workflow_ProcedureDependency_T As T2
            On
            T1.Workflow_id                               = T2.Workflow_id
            And T1.referencing_Procedure_RepoObject_guid = T2.referenced_Procedure_RepoObject_guid
            And T1.referenced_Procedure_RepoObject_guid  = T2.referencing_Procedure_RepoObject_guid

    Inner Join
        repo.RepoObject                         As ro1
            On
            T1.referencing_Procedure_RepoObject_guid     = ro1.RepoObject_guid

    Inner Join
        repo.RepoObject                         As ro2
            On
            T1.referenced_Procedure_RepoObject_guid      = ro2.RepoObject_guid;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '7fe72f09-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_bidirectional';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a36d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_bidirectional', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a76d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_bidirectional', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a56d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_bidirectional', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a66d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_bidirectional', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'a46d2d0f-c5fd-eb11-850f-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_bidirectional', @level2type = N'COLUMN', @level2name = N'referenced_Procedure_RepoObject_guid';

