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
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '74e1c56a-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'db2c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit', @level2type = N'COLUMN', @level2name = N'Unit_Url';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c92c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit', @level2type = N'COLUMN', @level2name = N'Unit_TypeName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd22c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit', @level2type = N'COLUMN', @level2name = N'Unit_SummarizeBy';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c62c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit', @level2type = N'COLUMN', @level2name = N'Unit_Schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c72c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit', @level2type = N'COLUMN', @level2name = N'Unit_Name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c52c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit', @level2type = N'COLUMN', @level2name = N'Unit_Metatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd12c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit', @level2type = N'COLUMN', @level2name = N'Unit_IsUnique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cb2c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit', @level2type = N'COLUMN', @level2name = N'Unit_IsSsas';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd02c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit', @level2type = N'COLUMN', @level2name = N'Unit_IsKey';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ca2c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit', @level2type = N'COLUMN', @level2name = N'Unit_isHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c42c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit', @level2type = N'COLUMN', @level2name = N'Unit_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c82c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit', @level2type = N'COLUMN', @level2name = N'Unit_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cf2c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit', @level2type = N'COLUMN', @level2name = N'Unit_FormatString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ce2c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit', @level2type = N'COLUMN', @level2name = N'Unit_Expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cd2c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit', @level2type = N'COLUMN', @level2name = N'Unit_DisplayFolder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cc2c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit', @level2type = N'COLUMN', @level2name = N'Unit_Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd42c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit', @level2type = N'COLUMN', @level2name = N'Object_Type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd32c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit', @level2type = N'COLUMN', @level2name = N'Object_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd72c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit', @level2type = N'COLUMN', @level2name = N'AntoraVersion';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd52c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit', @level2type = N'COLUMN', @level2name = N'AntoraSiteUrl';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'da2c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit', @level2type = N'COLUMN', @level2name = N'AntoraSectionId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd92c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit', @level2type = N'COLUMN', @level2name = N'AntoraPage';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd82c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd62c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dmdocs', @level1type = N'VIEW', @level1name = N'unit', @level2type = N'COLUMN', @level2name = N'AntoraComponent';

