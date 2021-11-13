
CREATE VIEW [ssis_t].[TblTask_Script_src]
As
Select
    cf.RowID
  , cf.ControlFlowDetailsRowID
  , Script = cfnodes1.x.value ( './ProjectItem[@Name=''ScriptMain.cs''][1]', 'varchar(max)' )
From
    ssis_t.TblControlFlow               As cf
    Cross Apply Cf.ScriptTaskQry.nodes ( '.' ) As cfnodes1(x)
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8ef9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Script_src', @level2type = N'COLUMN', @level2name = N'Script';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8df9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Script_src', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8cf9d5ee-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Script_src', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8d64fbe4-113b-ec11-852c-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Script_src';

