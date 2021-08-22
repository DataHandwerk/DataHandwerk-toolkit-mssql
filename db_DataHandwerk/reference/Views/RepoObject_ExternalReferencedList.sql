
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