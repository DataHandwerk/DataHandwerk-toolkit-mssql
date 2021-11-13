
CREATE View [ssis].[PackageTask_Dft_Component_src]
As
Select
    p.AntoraModule
  , p.PackageName
  , Component_refId                       = T3.refId
  , Component_name                        = T3.name
  , Component_componentClassID            = T3.componentClassID
  , Component_description                 = T3.description
  , Component_ContactInfo                 = T3.ContactInfo
  , Component_CommandTimeout              = T3.CommandTimeout
  , Component_OpenRowset                  = T3.[OpenRowset]
  , Component_OpenRowsetVariable          = T3.OpenRowsetVariable
  , Component_SqlCommand                  = T3.SqlCommand
  , Component_SqlCommandVariable          = T3.SqlCommandVariable
  , Component_DefaultCodePage             = T3.DefaultCodePage
  , Component_AlwaysUseDefaultCodePage    = T3.AlwaysUseDefaultCodePage
  , Component_AccessMode                  = T3.AccessMode
  , Component_ParameterMapping            = T3.ParameterMapping
  , Component_FastLoadKeepIdentity        = T3.FastLoadKeepIdentity
  , Component_FastLoadKeepNulls           = T3.FastLoadKeepNulls
  , Component_FastLoadOptions             = T3.FastLoadOptions
  , Component_FastLoadMaxInsertCommitSize = T3.FastLoadMaxInsertCommitSize
  , Component_VariableName                = T3.VariableName
  , Component_Connection_refId            = T3.Connection_refId
  , Component_connectionManagerID         = T3.connectionManagerID
  , Component_connectionManagerRefId      = T3.connectionManagerRefId
  , Component_Connection_description      = T3.Connection_description
  , Component_Connection_name             = T3.Connection_name
  , Component_IsSortedProperty            = T3.IsSortedProperty
  , T2.TaskPath
  , T2.ControlFlowDetailsRowID
From
    ssis.Package_src                 As p
    Inner Join
        ssis_t.TblControlFlow        As T2
            On
            p.RowID                    = T2.RowID

    Inner Join
        ssis_t.TblTask_Dft_Component As T3
            On
            T3.ControlFlowDetailsRowID = T2.ControlFlowDetailsRowID
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '419c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '409c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'TaskPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3f9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_IsSortedProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3e9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_Connection_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3d9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_Connection_description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3c9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_connectionManagerRefId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3b9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_connectionManagerID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3a9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_Connection_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '399c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_VariableName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '389c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_FastLoadMaxInsertCommitSize';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '379c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_FastLoadOptions';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '369c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_FastLoadKeepNulls';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '359c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_FastLoadKeepIdentity';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '349c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_ParameterMapping';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '339c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_AccessMode';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '329c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_AlwaysUseDefaultCodePage';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '319c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_DefaultCodePage';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '309c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_SqlCommandVariable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2f9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_SqlCommand';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2e9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_OpenRowsetVariable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2d9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_OpenRowset';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2c9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_CommandTimeout';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2b9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_ContactInfo';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2a9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '299c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_componentClassID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '289c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '279c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Component_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '269c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '259c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b7dcad7f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_src';

