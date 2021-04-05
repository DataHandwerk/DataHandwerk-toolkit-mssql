﻿

/*
PlantUML definition per RepoObject
to be used in composed PlantUML diagrams

you need to persist:
EXEC [docs].[usp_PERSIST_RepoObject_Plantuml_Entity_T]
*/
CREATE VIEW [docs].[RepoObject_Plantuml_Entity]
AS
SELECT ro.[RepoObject_guid]
 , RepoObject_Plantuml = CONCAT (
  --iif(ro.[SysObject_type] IN (
  --  'U'
  --  , 'V'
  --  , 'IF'
  --  ), 'entity ', 'class ')
  'entity '
  , ro.[RepoObject_fullname2]
  , ' << ' + TRIM(ro.[SysObject_type]) + ' >>'
  --, ' as '
  ----, REPLACE(ro.[RepoObject_fullname2], '.', '___')
  --, ro.[RepoObject_fullname2]
  , ' {'
  , CHAR(13) + CHAR(10)
  , collist.[PlantumlPkEntityColumns]
  , '  --'
  , CHAR(13) + CHAR(10)
  , collist.[PlantumlNonPkEntityColumns]
  , '}'
  , CHAR(13) + CHAR(10)
  )
FROM [docs].[RepoObject_OutputFilter] AS ro
LEFT JOIN [docs].[RepoObject_ColumnList] collist
 ON collist.[RepoObject_guid] = ro.[RepoObject_guid]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c2d49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity', @level2type = N'COLUMN', @level2name = N'RepoObject_Plantuml';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c1d49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'bcd49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Plantuml_Entity';

