--maybe we need some persistence for better performance
--[repo].[ForeignKey_Index_guid_union]
--but where in the workflow?
CREATE VIEW docs.RepoObject_PlantUml_FkRefList
AS
SELECT ro.RepoObject_guid
 , MAX(ro.RepoObject_fullname2) AS RepoObject_fullname2
 , FkRefList = String_agg(CONCAT (
   cast(N'' AS NVARCHAR(max))
   , fk.[referenced_RepoObject_fullname2]
   , ' <-- '
   , fk.[referencing_RepoObject_fullname2]
   ), CHAR(13) + CHAR(10)) WITHIN
GROUP (
  ORDER BY fk.[referenced_RepoObject_fullname2]
   , fk.[referencing_RepoObject_fullname2]
  )
FROM [repo].[ForeignKey_Indexes_union] fk
INNER JOIN repo.RepoObject_related_FK_union ro
 ON ro.RepoObject_guid = fk.[referenced_RepoObject_guid]
  AND ro.[included_RepoObject_guid] = fk.referencing_RepoObject_guid
GROUP BY ro.RepoObject_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '28224606-439a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_PlantUml_FkRefList', @level2type = N'COLUMN', @level2name = N'FkRefList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '27224606-439a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_PlantUml_FkRefList', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '26224606-439a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_PlantUml_FkRefList', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '1e224606-439a-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_PlantUml_FkRefList';

