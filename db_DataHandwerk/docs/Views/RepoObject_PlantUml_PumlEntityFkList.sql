create VIEW docs.RepoObject_PlantUml_PumlEntityFkList
AS
SELECT ro.RepoObject_guid
 , MAX(RepoObject_fullname2) AS RepoObject_fullname2
 , PumlEntityFkList = String_Agg(rop.[RepoObject_PumlOnlyIndex], CHAR(13) + CHAR(10)) WITHIN
GROUP (
  ORDER BY ro.included_RepoObject_fullname2
  )
FROM repo.RepoObject_related_FK_union ro
INNER JOIN [docs].[RepoObject_Plantuml_Entity_T] rop
 ON rop.RepoObject_guid = ro.included_RepoObject_guid
GROUP BY ro.RepoObject_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '25224606-439a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_PlantUml_PumlEntityFkList', @level2type = N'COLUMN', @level2name = N'PumlEntityFkList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '24224606-439a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_PlantUml_PumlEntityFkList', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '23224606-439a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_PlantUml_PumlEntityFkList', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1d224606-439a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_PlantUml_PumlEntityFkList';

