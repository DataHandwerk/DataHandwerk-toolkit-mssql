
CREATE View [ssis].[PackageTask_Dft_Component_tgt]
As
Select
    tgt.AntoraModule
  , tgt.PackageName
  , tgt.Component_refId
  , tgt.Component_name
  , tgt.Component_componentClassID
  , tgt.Component_description
  , tgt.Component_ContactInfo
  , tgt.Component_CommandTimeout
  , tgt.Component_OpenRowset
  , tgt.Component_OpenRowsetVariable
  , tgt.Component_SqlCommand
  , tgt.Component_SqlCommandVariable
  , tgt.Component_DefaultCodePage
  , tgt.Component_AlwaysUseDefaultCodePage
  , tgt.Component_AccessMode
  , tgt.Component_ParameterMapping
  , tgt.Component_FastLoadKeepIdentity
  , tgt.Component_FastLoadKeepNulls
  , tgt.Component_FastLoadOptions
  , tgt.Component_FastLoadMaxInsertCommitSize
  , tgt.Component_VariableName
  , tgt.Component_Connection_refId
  , tgt.Component_connectionManagerID
  , tgt.Component_connectionManagerRefId
  , tgt.Component_Connection_description
  , tgt.Component_Connection_name
  , tgt.Component_IsSortedProperty
  , tgt.TaskPath
  , tgt.ControlFlowDetailsRowID
From
    ssis.PackageTask_Dft_Component As tgt
Where
    Exists
(
    Select
        1
    From
        ssis.AntoraModule_tgt_filter As f
    Where
        tgt.AntoraModule = f.AntoraModule
)
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5e9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5d9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'TaskPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5c9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_IsSortedProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5b9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_Connection_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5a9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_Connection_description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '599c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_connectionManagerRefId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '589c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_connectionManagerID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '579c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_Connection_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '569c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_VariableName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '559c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_FastLoadMaxInsertCommitSize';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '549c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_FastLoadOptions';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '539c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_FastLoadKeepNulls';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '529c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_FastLoadKeepIdentity';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '519c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_ParameterMapping';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '509c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_AccessMode';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4f9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_AlwaysUseDefaultCodePage';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4e9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_DefaultCodePage';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4d9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_SqlCommandVariable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4c9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_SqlCommand';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4b9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_OpenRowsetVariable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4a9c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_OpenRowset';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '499c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_CommandTimeout';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '489c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_ContactInfo';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '479c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '469c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_componentClassID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '459c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '449c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'Component_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '439c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '429c458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b8dcad7f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'PackageTask_Dft_Component_tgt';

