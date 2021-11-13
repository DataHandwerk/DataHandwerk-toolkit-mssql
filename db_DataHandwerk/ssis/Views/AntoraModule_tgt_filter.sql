
CREATE VIEW [ssis].[AntoraModule_tgt_filter]
As
Select
    Distinct
    AntoraModule
From
    ssis.Package_src
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ebfad5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'AntoraModule_tgt_filter', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '5164fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'AntoraModule_tgt_filter';

