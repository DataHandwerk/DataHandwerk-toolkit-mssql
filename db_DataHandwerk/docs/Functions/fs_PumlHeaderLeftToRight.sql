
create Function docs.fs_PumlHeaderLeftToRight
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