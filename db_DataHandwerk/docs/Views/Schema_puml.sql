
/*
all objects of a schema

currently only usable: PumlSchemaSsasEr
because in ssas tabular there are no composed keys in relations
*/
CREATE View docs.Schema_puml
As
Select
    rs.RepoSchema_guid
  , rs.RepoSchema_name
  --todo, how to draw relations between composed keys?
  , PumlSchemaEr      =
  --
  Concat (
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
           , sel.EntityList_PumlOnlyPkOrIndex
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
         ----we still need an idea, how to show releations containing composite keys
         --, ssas_rl.SsasRelationList_PumlRelation
         --, Char ( 13 ) + Char ( 10 )
         --, Char ( 13 ) + Char ( 10 )
         )
  --it doesn't look very nice, we need wait for a solution to draw PumlSchemaEr
  , PumlSchemaIndexEr =
  --
  Concat (
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
           , sel.EntityList_PumlOnlyIndex
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , fklist.FkRefList
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
         )
  , PumlSchemaSsasEr  =
  --
  Case
      When rs.is_ssas = 1
          Then
          Concat (
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
                   , sel.EntityList_PumlOnlyPkOrIndex
                   , Char ( 13 ) + Char ( 10 )
                   , Char ( 13 ) + Char ( 10 )
                   , ssas_rl.SsasRelationList_PumlRelation
                   , Char ( 13 ) + Char ( 10 )
                   , Char ( 13 ) + Char ( 10 )
                 )
  End
From
    repo.RepoSchema                                                          As rs
    Left Join
        docs.Schema_EntityList                                               As sel
            On
            sel.RepoObject_schema_name = rs.RepoSchema_name

    Left Join
        docs.Schema_PlantUml_FkRefList                                       As fklist
            On
            fklist.SchemaName = rs.RepoSchema_name

    Left Join
        docs.Schema_SsasRelationList                                         As ssas_rl
            On
            ssas_rl.SchemaName = rs.RepoSchema_name
    Cross Join config.ftv_get_parameter_value ( 'puml_skinparam_class', '' ) As skin