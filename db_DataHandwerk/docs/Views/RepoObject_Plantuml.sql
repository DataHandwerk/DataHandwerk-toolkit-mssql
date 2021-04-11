
CREATE VIEW [docs].[RepoObject_Plantuml]
AS
SELECT [ro].[RepoObject_guid]
 , [ro].[RepoObject_fullname2]
 , [elist].PumlEntityList
 , [clist].[ColRefList]
 , [olist].[ObjectRefList]
 , [PlantumlEntity_1_1_ColRef] = CONCAT (
  'left to right direction'
  , CHAR(13) + CHAR(10)
  , 'hide circle'
  , CHAR(13) + CHAR(10)
  , '''avoide "." issues:'
  , CHAR(13) + CHAR(10)
  , 'set namespaceSeparator none'
  , CHAR(13) + CHAR(10)
  , CHAR(13) + CHAR(10)
  , [repo].[fs_get_parameter_value]('puml_skinparam_class', '')
  , CHAR(13) + CHAR(10)
  , CHAR(13) + CHAR(10)
  , [elist].PumlEntityList
  , CHAR(13) + CHAR(10)
  , [olist].[ObjectRefList]
  , CHAR(13) + CHAR(10)
  , [clist].[ColRefList]
  )
 , [PlantumlEntity_1_1_ObjectRef] = CONCAT (
  'left to right direction'
  , CHAR(13) + CHAR(10)
  , 'hide circle'
  , CHAR(13) + CHAR(10)
  , '''avoide "." issues:'
  , CHAR(13) + CHAR(10)
  , 'set namespaceSeparator none'
  , CHAR(13) + CHAR(10)
  , CHAR(13) + CHAR(10)
  , [repo].[fs_get_parameter_value]('puml_skinparam_class', '')
  , CHAR(13) + CHAR(10)
  , CHAR(13) + CHAR(10)
  , [elist].PumlEntityOnlyPkList
  , CHAR(13) + CHAR(10)
  , [olist].[ObjectRefList]
  )
 --todo: needs to be implemented, this is only a placeholder
 --other lists are required: PumlEntityFkList, FkList
 , [PlantumlEntity_1_1_FkRef] = CONCAT (
  'left to right direction'
  , CHAR(13) + CHAR(10)
  , 'hide circle'
  , CHAR(13) + CHAR(10)
  , '''avoide "." issues:'
  , CHAR(13) + CHAR(10)
  , 'set namespaceSeparator none'
  , CHAR(13) + CHAR(10)
  , CHAR(13) + CHAR(10)
  , [repo].[fs_get_parameter_value]('puml_skinparam_class', '')
  , CHAR(13) + CHAR(10)
  , CHAR(13) + CHAR(10)
  , EntityFkList.PumlEntityFkList
  , CHAR(13) + CHAR(10)
  , FkRefList.FkRefList
  )
FROM [repo].[RepoObject_gross] AS ro
LEFT JOIN [docs].[RepoObject_Plantuml_ColRefList] AS clist
 ON clist.RepoObject_guid = ro.RepoObject_guid
LEFT JOIN [docs].[RepoObject_Plantuml_ObjectRefList] AS olist
 ON olist.RepoObject_guid = ro.RepoObject_guid
CROSS APPLY [docs].[ftv_RepoObject_Reference_PlantUml_EntityRefList](ro.RepoObject_guid, 1, 1) AS elist
LEFT JOIN docs.RepoObject_PlantUml_PumlEntityFkList EntityFkList
 ON EntityFkList.RepoObject_guid = ro.RepoObject_guid
LEFT JOIN docs.RepoObject_PlantUml_FkRefList FkRefList
 ON FkRefList.RepoObject_guid = ro.RepoObject_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fb0b29c2-e595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml', @level2type = N'COLUMN', @level2name = N'PlantumlEntity_1_1_ColRef';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fa0b29c2-e595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml', @level2type = N'COLUMN', @level2name = N'ObjectRefList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f90b29c2-e595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml', @level2type = N'COLUMN', @level2name = N'ColRefList';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f70b29c2-e595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f60b29c2-e595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f20b29c2-e595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '95c4873b-8a98-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml', @level2type = N'COLUMN', @level2name = N'PumlEntityList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '96c4873b-8a98-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml', @level2type = N'COLUMN', @level2name = N'PlantumlEntity_1_1_ObjectRef';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '97c4873b-8a98-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml', @level2type = N'COLUMN', @level2name = N'PlantumlEntity_1_1_FkRef';

