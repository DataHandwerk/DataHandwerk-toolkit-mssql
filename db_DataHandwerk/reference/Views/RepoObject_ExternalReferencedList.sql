
Create View reference.RepoObject_ExternalReferencedList
As
Select
    T1.RepoObject_guid
  , AntoraExternalReferencedList =
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
    T1.isReferenced = 1
Group By
    T1.RepoObject_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'e835c571-8103-ec11-8513-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ExternalReferencedList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f035c571-8103-ec11-8513-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ExternalReferencedList', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f135c571-8103-ec11-8513-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'RepoObject_ExternalReferencedList', @level2type = N'COLUMN', @level2name = N'AntoraExternalReferencedList';

