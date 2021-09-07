Create View docs.Unit_3
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
  --file:///D:/Repos/GitHub/DataHandwerk/datahandwerk.github.io/local/dhw/0.1.0/sqldb/repo.RepoObject.html#column-InheritanceType
  , Unit_Url = Concat (
                          AntoraSiteUrl
                        , '/' + AntoraComponent
                        , '/' + AntoraVersion
                        , '/' + AntoraModule
                        , '/' + AntoraPage + '.html' + '#' + AntoraSectionId
                      )
From
    docs.Unit_2
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '32609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3', @level2type = N'COLUMN', @level2name = N'Unit_Url';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '31609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3', @level2type = N'COLUMN', @level2name = N'AntoraSectionId';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '30609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3', @level2type = N'COLUMN', @level2name = N'AntoraPage';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2f609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2e609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3', @level2type = N'COLUMN', @level2name = N'AntoraVersion';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2d609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3', @level2type = N'COLUMN', @level2name = N'AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2c609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3', @level2type = N'COLUMN', @level2name = N'AntoraSiteUrl';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2b609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3', @level2type = N'COLUMN', @level2name = N'Object_Type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2a609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3', @level2type = N'COLUMN', @level2name = N'Object_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '29609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3', @level2type = N'COLUMN', @level2name = N'Unit_SummarizeBy';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '28609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3', @level2type = N'COLUMN', @level2name = N'Unit_IsUnique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '27609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3', @level2type = N'COLUMN', @level2name = N'Unit_IsKey';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '26609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3', @level2type = N'COLUMN', @level2name = N'Unit_FormatString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '25609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3', @level2type = N'COLUMN', @level2name = N'Unit_Expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '24609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3', @level2type = N'COLUMN', @level2name = N'Unit_DisplayFolder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '23609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3', @level2type = N'COLUMN', @level2name = N'Unit_Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '22609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3', @level2type = N'COLUMN', @level2name = N'Unit_IsSsas';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '21609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3', @level2type = N'COLUMN', @level2name = N'Unit_isHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '20609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3', @level2type = N'COLUMN', @level2name = N'Unit_TypeName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1f609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3', @level2type = N'COLUMN', @level2name = N'Unit_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1e609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3', @level2type = N'COLUMN', @level2name = N'Unit_Name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1d609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3', @level2type = N'COLUMN', @level2name = N'Unit_Schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1c609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3', @level2type = N'COLUMN', @level2name = N'Unit_Metatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1b609573-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3', @level2type = N'COLUMN', @level2name = N'Unit_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e5f27b65-9d0f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Unit_3';

