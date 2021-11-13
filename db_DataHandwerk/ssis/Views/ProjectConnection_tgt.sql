

CREATE View ssis.ProjectConnection_tgt
As
Select
    tgt.AntoraModule
  , tgt.ConnectionManagerID
  , tgt.ConnectionManagerName AS ConnectionManagerName
  , tgt.ConnectionManagerType
  , tgt.ConnectionPath
  , tgt.ConnectionString
  , tgt.ExpressionValue
From
    ssis.ProjectConnection As tgt
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
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '72ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'ProjectConnection_tgt', @level2type = N'COLUMN', @level2name = N'ExpressionValue';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '71ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'ProjectConnection_tgt', @level2type = N'COLUMN', @level2name = N'ConnectionString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '70ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'ProjectConnection_tgt', @level2type = N'COLUMN', @level2name = N'ConnectionPath';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6fddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'ProjectConnection_tgt', @level2type = N'COLUMN', @level2name = N'ConnectionManagerType';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6dddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'ProjectConnection_tgt', @level2type = N'COLUMN', @level2name = N'ConnectionManagerName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6eddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'ProjectConnection_tgt', @level2type = N'COLUMN', @level2name = N'ConnectionManagerID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '6cddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'ProjectConnection_tgt', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '839a07f7-c23c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis', @level1type = N'VIEW', @level1name = N'ProjectConnection_tgt';

