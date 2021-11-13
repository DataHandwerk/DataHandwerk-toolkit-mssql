Create   View ssis_t.TblTask_Dft_Component_src
As
Select
    pkglvl.ControlFlowDetailsRowID
  , pkglvl.RowID
  , refId                       = dftnodes.x.value ( '@refId[1]', 'varchar(max)' )
  , name                        = dftnodes.x.value ( '@name[1]', 'varchar(max)' )
  , componentClassID            = dftnodes.x.value ( '@componentClassID[1]', 'varchar(max)' )
  , description                 = dftnodes.x.value ( '@description[1]', 'varchar(max)' )
  , ContactInfo                 = dftnodes.x.value ( '@contactInfo[1]', 'varchar(max)' )
  --properties
  , CommandTimeout              = dftnodes.x.value ( 'data(./properties/property[@name=''CommandTimeout'']	)[1]' , 'int' )
  , [OpenRowset]                = dftnodes.x.value ( 'data(./properties/property[@name=''OpenRowset'']	)[1]', 'varchar(max)' )
  , OpenRowsetVariable          = dftnodes.x.value (
                                                       'data(./properties/property[@name=''OpenRowsetVariable'']	)[1]'
                                                     , 'varchar(max)'
                                                   )
  , SqlCommand                  = dftnodes.x.value ( 'data(./properties/property[@name=''SqlCommand'']	)[1]' , 'varchar(max)' )
  , SqlCommandVariable          = dftnodes.x.value (
                                                       'data(./properties/property[@name=''SqlCommandVariable'']	)[1]'
                                                     , 'varchar(max)'
                                                   )
  , DefaultCodePage             = dftnodes.x.value ( 'data(./properties/property[@name=''DefaultCodePage'']	)[1]', 'int' )
  , AlwaysUseDefaultCodePage    = dftnodes.x.value (
                                                       'data(./properties/property[@name=''AlwaysUseDefaultCodePage'']	)[1]'
                                                     , 'varchar(max)'
                                                   )
  , AccessMode                  = dftnodes.x.value ( 'data(./properties/property[@name=''AccessMode'']	)[1]' , 'varchar(max)' )
  , ParameterMapping            = dftnodes.x.value (
                                                       'data(./properties/property[@name=''ParameterMapping'']	)[1]'
                                                     , 'varchar(max)'
                                                   )
  , FastLoadKeepIdentity        = dftnodes.x.value (
                                                       'data(./properties/property[@name=''FastLoadKeepIdentity'']	)[1]'
                                                     , 'bit'
                                                   )
  , FastLoadKeepNulls           = dftnodes.x.value ( 'data(./properties/property[@name=''FastLoadKeepNulls'']	)[1]', 'bit' )
  , FastLoadOptions             = dftnodes.x.value ( 'data(./properties/property[@name=''FastLoadOptions'']	)[1]', 'varchar(max)' )
  , FastLoadMaxInsertCommitSize = dftnodes.x.value (
                                                       'data(./properties/property[@name=''FastLoadMaxInsertCommitSize'']	)[1]'
                                                     , 'int'
                                                   )
  , VariableName                = dftnodes.x.value ( 'data(./properties/property[@name=''VariableName'']	)[1]', 'varchar(max)' )
  , Connection_refId            = dftnodes.x.value ( 'data(./connections/connection/@refId)[1]', 'varchar(max)' )
  , connectionManagerID         = dftnodes.x.value ( 'data(./connections/connection/@connectionManagerID)[1]', 'varchar(max)' )
  , connectionManagerRefId      = dftnodes.x.value (
                                                       'data(./connections/connection/@connectionManagerRefId)[1]'
                                                     , 'varchar(max)'
                                                   )
  , Connection_description      = dftnodes.x.value ( 'data(./connections/connection/@description)[1]', 'varchar(max)' )
  , Connection_name             = dftnodes.x.value ( 'data(./connections/connection/@name)[1]', 'varchar(max)' )
  , IsSortedProperty            = dftnodes.x.value ( 'data(./outputs/output/@isSorted)[1]', 'varchar(10)' )
  , outputsQry                  = dftnodes.x.query ( './outputs' )
  , inputsQry                   = dftnodes.x.query ( './inputs' )
From
    ssis_t.TblControlFlow                       As pkglvl
    Cross Apply pkglvl.DFTQuery.nodes ( './*' ) As dftnodes(x)
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '909b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'inputsQry';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8f9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'outputsQry';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8e9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'IsSortedProperty';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8d9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Connection_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8c9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Connection_description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8b9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'connectionManagerRefId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8a9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'connectionManagerID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '899b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'Connection_refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '889b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'VariableName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '879b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'FastLoadMaxInsertCommitSize';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '869b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'FastLoadOptions';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '859b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'FastLoadKeepNulls';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '849b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'FastLoadKeepIdentity';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '839b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'ParameterMapping';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '829b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'AccessMode';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '819b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'AlwaysUseDefaultCodePage';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '809b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'DefaultCodePage';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7f9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'SqlCommandVariable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7e9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'SqlCommand';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7d9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'OpenRowsetVariable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7c9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'OpenRowset';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7b9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'CommandTimeout';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7a9b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'ContactInfo';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '799b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '789b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'componentClassID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '779b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '769b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'refId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '759b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'RowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '749b458f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src', @level2type = N'COLUMN', @level2name = N'ControlFlowDetailsRowID';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'afdcad7f-f73e-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssis_t', @level1type = N'VIEW', @level1name = N'TblTask_Dft_Component_src';

