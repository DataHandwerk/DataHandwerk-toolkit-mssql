Create View docs.DocsUnit
As
Select
    Unit_guid
  , Unit_Metatype
  , Unit_Schema
  , Unit_Name
  , Unit_fullname2
  , Unit_TypeName
  , Unit_isHidden
  , Unit_IsSsas
  , Unit_Description
  , Unit_DisplayFolder
  , Unit_Expression
  , Unit_FormatString
  , Unit_IsKey
  , Unit_IsUnique
  , Unit_SummarizeBy
  , Object_fullname2
  , Object_Type
  , AntoraComponent = AntoraComponent.Parameter_value_result
  , AntoraModule    = AntoraModule.Parameter_value_result
--, AntoraPage
From
    docs.DocsUnit_union                                                 As T1
    Cross Join config.ftv_get_parameter_value ( 'AntoraComponent', '' ) As AntoraComponent
    Cross Join config.ftv_get_parameter_value ( 'AntoraModule', '' ) As AntoraModule