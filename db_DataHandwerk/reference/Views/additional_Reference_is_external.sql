Create View reference.additional_Reference_is_external
As
Select
    T1.referenced_AntoraComponent
  , T1.referenced_AntoraModule
  , T1.referenced_Schema
  , T1.referenced_Object
  , T1.referenced_Column
  , referenced_is_external   = Case
                                   When T1.referenced_AntoraComponent = AntoraComponent.Parameter_value_result
                                        And T1.referenced_AntoraModule = AntoraModule.Parameter_value_result
                                       Then
                                       0
                                   Else
                                       1
                               End
  , T1.referencing_AntoraComponent
  , T1.referencing_AntoraModule
  , T1.referencing_Schema
  , T1.referencing_Object
  , T1.referencing_Column
  , referencing_is_external  = Case
                                   When T1.referencing_AntoraComponent = AntoraComponent.Parameter_value_result
                                        And T1.referencing_AntoraModule = AntoraModule.Parameter_value_result
                                       Then
                                       0
                                   Else
                                       1
                               End
  , internal_AntoraComponent = AntoraComponent.Parameter_value_result
  , internal_AntoraModule    = AntoraModule.Parameter_value_result
From
    reference.additional_Reference                                      As T1
    Cross Join config.ftv_get_parameter_value ( 'AntoraComponent', '' ) As AntoraComponent
    Cross Join config.ftv_get_parameter_value ( 'AntoraModule', '' ) As AntoraModule
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9ee80294-161b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_is_external', @level2type = N'COLUMN', @level2name = N'internal_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9de80294-161b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_is_external', @level2type = N'COLUMN', @level2name = N'internal_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9ce80294-161b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_is_external', @level2type = N'COLUMN', @level2name = N'referencing_is_external';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9be80294-161b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_is_external', @level2type = N'COLUMN', @level2name = N'referencing_Column';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9ae80294-161b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_is_external', @level2type = N'COLUMN', @level2name = N'referencing_Object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '99e80294-161b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_is_external', @level2type = N'COLUMN', @level2name = N'referencing_Schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '98e80294-161b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_is_external', @level2type = N'COLUMN', @level2name = N'referencing_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '97e80294-161b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_is_external', @level2type = N'COLUMN', @level2name = N'referencing_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '96e80294-161b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_is_external', @level2type = N'COLUMN', @level2name = N'referenced_is_external';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '95e80294-161b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_is_external', @level2type = N'COLUMN', @level2name = N'referenced_Column';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '94e80294-161b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_is_external', @level2type = N'COLUMN', @level2name = N'referenced_Object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '93e80294-161b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_is_external', @level2type = N'COLUMN', @level2name = N'referenced_Schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '92e80294-161b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_is_external', @level2type = N'COLUMN', @level2name = N'referenced_AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '91e80294-161b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_is_external', @level2type = N'COLUMN', @level2name = N'referenced_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'c130c78c-161b-ec11-8520-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_is_external';

