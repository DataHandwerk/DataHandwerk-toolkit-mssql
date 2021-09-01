
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
             docs.fs_PumlHeaderLeftToRight ()
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
             docs.fs_PumlHeaderLeftToRight ()
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
                     docs.fs_PumlHeaderLeftToRight ()
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
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0b60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_puml';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1860d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_puml', @level2type = N'COLUMN', @level2name = N'RepoSchema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1760d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_puml', @level2type = N'COLUMN', @level2name = N'RepoSchema_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1b60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_puml', @level2type = N'COLUMN', @level2name = N'PumlSchemaSsasEr';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1a60d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_puml', @level2type = N'COLUMN', @level2name = N'PumlSchemaIndexEr';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '1960d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'Schema_puml', @level2type = N'COLUMN', @level2name = N'PumlSchemaEr';

