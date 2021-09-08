Create View dmdocs.unit
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
  , AntoraSiteUrl
  , AntoraComponent
  , AntoraVersion
  , AntoraModule
  , AntoraPage
  , AntoraSectionId
  , Unit_Url
From
    docs.Unit_3