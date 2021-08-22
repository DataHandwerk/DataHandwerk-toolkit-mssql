
Create View reference.RepoObject_ExternalReferencingList
As
Select
    T1.RepoObject_guid
  , AntoraExternalReferencingList =
  --
  String_Agg (
                 Concat (
                            --* xref:AntoraModulName:target-page-filename.adoc[link text]
                            --we need to convert to first argument nvarchar(max) to avoid the limit of 8000 byte
                            Cast('* xref:' As NVarchar(Max))
                          , T1.external_AntoraModulName
                          , ':'
                          , T1.external_SchemaName
                          , '.'
                          , T1.external_ObjectName
                          , '.adoc[]'
                          , ' ('
                          , T1.external_Type
                          , ')'
                          , ' xref:'
                          , T1.external_AntoraModulName
                          , ':other/index.adoc[]'
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                T1.external_AntoraModulName
                              , T1.external_SchemaName
                              , T1.external_ObjectName)
From
    reference.external_object As T1
Where
    T1.isReferenced = 0
Group By
    T1.RepoObject_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e935c571-8103-ec11-8513-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ExternalReferencingList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f235c571-8103-ec11-8513-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ExternalReferencingList', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f335c571-8103-ec11-8513-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ExternalReferencingList', @level2type = N'COLUMN', @level2name = N'AntoraExternalReferencingList';

