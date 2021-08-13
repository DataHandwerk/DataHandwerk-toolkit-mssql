
/*
mögliche redundante Referenzen

wir dürfen nicht alle gleichzeitig entfernen, da sich einige gegenseitig als redundant erkennen. +
Daher passiert die Markierung als `is_redundant` nach und nach für immer nur eine Referenz per referencing_Procedure_RepoObject_guid

*/
CREATE View [workflow].[Workflow_ProcedureDependency_T_redundant]
As
Select
    T1.Workflow_id
  , T1.referenced_Procedure_RepoObject_guid
  , T1.referencing_Procedure_RepoObject_guid
  , RownrPerReferencing = Row_Number () Over ( Partition By
                                                   T1.Workflow_id
                                                 , T1.referencing_Procedure_RepoObject_guid
                                               Order By
                                                   T1.referenced_Procedure_RepoObject_guid
                                             )
From
    [workflow].[Workflow_ProcedureDependency_T]     As T1
    Inner Join
        [workflow].[Workflow_ProcedureDependency_T] As T2
            On
            T1.Workflow_id                               = T2.Workflow_id
            And T1.referenced_Procedure_RepoObject_guid  = T2.referenced_Procedure_RepoObject_guid

    Inner Join
        [workflow].[Workflow_ProcedureDependency_T] As T3
            On
            T1.Workflow_id                               = T3.Workflow_id
            And T1.referencing_Procedure_RepoObject_guid = T3.referencing_Procedure_RepoObject_guid
            And T2.referencing_Procedure_RepoObject_guid = T3.referenced_Procedure_RepoObject_guid
Where
    T1.[is_redundant]     = 0
    And T2.[is_redundant] = 0
    And T3.[is_redundant] = 0;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a1bcd983-91fa-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_redundant';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '72448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_redundant', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '74448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_redundant', @level2type = N'COLUMN', @level2name = N'referencing_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '73448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_redundant', @level2type = N'COLUMN', @level2name = N'referenced_Procedure_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e3adfba7-40fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_ProcedureDependency_T_redundant', @level2type = N'COLUMN', @level2name = N'RownrPerReferencing';

