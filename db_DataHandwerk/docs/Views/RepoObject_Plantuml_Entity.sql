





/*
PlantUML definition per RepoObject
to be used in composed PlantUML diagrams

you need to persist:
EXEC [docs].[usp_PERSIST_RepoObject_Plantuml_Entity_T]
*/
CREATE VIEW [docs].[RepoObject_Plantuml_Entity]
AS
SELECT ro.[RepoObject_guid]
 , RepoObject_Puml = CONCAT (
  'entity '
  , ro.[RepoObject_fullname2]
  , ' << ' + TRIM(ro.[SysObject_type]) + ' >>'
  , ' {'
  , CHAR(13) + CHAR(10)
  , collist.[PlantumlPkEntityColumns]
  , '  --'
  , CHAR(13) + CHAR(10)
  , collist.[PlantumlNonPkEntityColumns]
  , '}'
  , CHAR(13) + CHAR(10)
  )
 , RepoObject_PumlOnlyPK = CONCAT (
  'entity '
  , ro.[RepoObject_fullname2]
  , ' << ' + TRIM(ro.[SysObject_type]) + ' >>'
  , ' {'
  , CHAR(13) + CHAR(10)
  , collist.[PlantumlPkEntityColumns]
  , '}'
  , CHAR(13) + CHAR(10)
  )
 , RepoObject_PumlOnlyIndex = CONCAT (
  'entity '
  , ro.[RepoObject_fullname2]
  , ' << ' + TRIM(ro.[SysObject_type]) + ' >>'
  , ' {'
  , CHAR(13) + CHAR(10)
  , indexlist.PumlIndexList
  , CHAR(13) + CHAR(10)
  , '}'
  , CHAR(13) + CHAR(10)
  )
FROM [docs].[RepoObject_OutputFilter] AS ro
LEFT JOIN [docs].[RepoObject_ColumnList] collist
 ON collist.[RepoObject_guid] = ro.[RepoObject_guid]
LEFT JOIN [docs].[RepoObject_IndexList_T] indexlist
 ON indexlist.[RepoObject_guid] = ro.[RepoObject_guid]
GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c1d49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'bcd49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c9c9519a-6298-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity', @level2type = N'COLUMN', @level2name = N'RepoObject_PumlOnlyPK';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cac9519a-6298-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity', @level2type = N'COLUMN', @level2name = N'RepoObject_PumlOnlyIndex';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b94f3dbd-7098-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity', @level2type = N'COLUMN', @level2name = N'RepoObject_Puml';

