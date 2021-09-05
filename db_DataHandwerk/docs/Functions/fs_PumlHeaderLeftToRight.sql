
CREATE Function docs.fs_PumlHeaderLeftToRight
()
Returns NVarchar(4000)
As
Begin
    Return
    (
        Select
            PumlHeaderLeftToRight = Concat (
                                               'left to right direction'
                                             , Char ( 13 ) + Char ( 10 )
                                             , '''top to bottom direction'
                                             , Char ( 13 ) + Char ( 10 )
                                             , 'hide circle'
                                             , Char ( 13 ) + Char ( 10 )
                                             , '''avoide "." issues:'
                                             , Char ( 13 ) + Char ( 10 )
                                             , 'set namespaceSeparator none'
                                             , Char ( 13 ) + Char ( 10 )
                                             , Char ( 13 ) + Char ( 10 )
                                             , skin.Parameter_value_result
                                             , Char ( 13 ) + Char ( 10 )
                                             , Char ( 13 ) + Char ( 10 )
                                           )
        From
            config.ftv_get_parameter_value ( 'puml_skinparam_class', '' ) As skin
    )
End
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ec5fd8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'fs_PumlHeaderLeftToRight';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[ftv_get_parameter_value]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'fs_PumlHeaderLeftToRight';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'fs_PumlHeaderLeftToRight';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'fs_PumlHeaderLeftToRight';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:docs.RepoObject_Plantuml.adoc[]
* xref:docs.Schema_puml.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'fs_PumlHeaderLeftToRight';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.ftv_get_parameter_value.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'fs_PumlHeaderLeftToRight';

