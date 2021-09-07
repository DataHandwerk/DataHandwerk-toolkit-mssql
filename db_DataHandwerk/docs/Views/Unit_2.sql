
CREATE View docs.Unit_2
As
Select
    T1.Unit_guid
  , T1.Unit_Metatype
  , T1.Unit_Schema
  , T1.Unit_Name
  , T1.Unit_fullname2
  , T1.Unit_TypeName
  , T1.Unit_isHidden
  , T1.Unit_IsSsas
  , T1.Unit_Description
  , T1.Unit_DisplayFolder
  , T1.Unit_Expression
  , T1.Unit_FormatString
  , T1.Unit_IsKey
  , T1.Unit_IsUnique
  , T1.Unit_SummarizeBy
  , T1.Object_fullname2
  , T1.Object_Type
  , AntoraSiteUrl   = AntoraSiteUrl.Parameter_value_result
  , AntoraComponent = AntoraComponent.Parameter_value_result
  , AntoraVersion   = AntoraVersion.Parameter_value_result
  , AntoraModule    = AntoraModule.Parameter_value_result
  , AntoraPage      = Case
                          When T1.Unit_Metatype = 'schema'
                              Then
                              'nav-schema-' + T1.Unit_Schema
                          Else
                              --( 'object', 'column', 'measure' )
                              T1.Object_fullname2
                      End
  , AntoraSectionId = Case
                          When T1.Unit_Metatype In
                          ( 'column', 'measure' )
                              Then
                              T1.Unit_Metatype + '-' + T1.Unit_Name
                      End
From
    docs.Unit_1_union                                                 As T1
    Cross Join config.ftv_get_parameter_value ( 'AntoraSiteUrl', '' ) As AntoraSiteUrl
    Cross Join config.ftv_get_parameter_value ( 'AntoraVersion', '' ) As AntoraVersion
    Cross Join config.ftv_get_parameter_value ( 'AntoraComponent', '' ) As AntoraComponent
    Cross Join config.ftv_get_parameter_value ( 'AntoraModule', '' ) As AntoraModule
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1a609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_2', @level2type = N'COLUMN', @level2name = N'AntoraSectionId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '19609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_2', @level2type = N'COLUMN', @level2name = N'AntoraPage';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '18609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_2', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '17609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_2', @level2type = N'COLUMN', @level2name = N'AntoraVersion';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '16609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_2', @level2type = N'COLUMN', @level2name = N'AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '15609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_2', @level2type = N'COLUMN', @level2name = N'AntoraSiteUrl';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '14609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_2', @level2type = N'COLUMN', @level2name = N'Object_Type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '13609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_2', @level2type = N'COLUMN', @level2name = N'Object_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '12609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_2', @level2type = N'COLUMN', @level2name = N'Unit_SummarizeBy';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '11609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_2', @level2type = N'COLUMN', @level2name = N'Unit_IsUnique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '10609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_2', @level2type = N'COLUMN', @level2name = N'Unit_IsKey';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0f609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_2', @level2type = N'COLUMN', @level2name = N'Unit_FormatString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0e609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_2', @level2type = N'COLUMN', @level2name = N'Unit_Expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0d609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_2', @level2type = N'COLUMN', @level2name = N'Unit_DisplayFolder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0c609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_2', @level2type = N'COLUMN', @level2name = N'Unit_Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0b609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_2', @level2type = N'COLUMN', @level2name = N'Unit_IsSsas';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '0a609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_2', @level2type = N'COLUMN', @level2name = N'Unit_isHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '09609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_2', @level2type = N'COLUMN', @level2name = N'Unit_TypeName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '08609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_2', @level2type = N'COLUMN', @level2name = N'Unit_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '07609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_2', @level2type = N'COLUMN', @level2name = N'Unit_Name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '06609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_2', @level2type = N'COLUMN', @level2name = N'Unit_Schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '05609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_2', @level2type = N'COLUMN', @level2name = N'Unit_Metatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '04609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_2', @level2type = N'COLUMN', @level2name = N'Unit_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e4f27b65-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_2';

