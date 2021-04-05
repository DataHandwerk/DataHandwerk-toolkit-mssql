
/*
Msg 8624, Level 16, State 1, Line 19
Internal Query Processor Error: The query processor could not produce a query plan. For more information, contact Customer Support Services.

=> we need to persist [repo].[RepoObject_referenced_level_T] and [repo].[RepoObject_referencing_level_T]

remember to persist the source before:

EXEC [repo].[usp_PERSIST_RepoObject_referenced_level_T]
EXEC [repo].[usp_PERSIST_RepoObject_referencing_level_T]
EXEC [docs].[usp_PERSIST_RepoObject_Plantuml_Entity_T]

check:

SELECT * from [docs].[ftv_RepoObject_Reference_PlantUml_EntityRefList]('69CE8EB8-5F62-EB11-84DC-A81E8446D5B0', 1, 1)

SELECT ro.RepoObject_guid
 , ro.RepoObject_fullname2
 , ro_p.PlantumlEntityList
FROM repo.RepoObject ro
CROSS APPLY [docs].[ftv_RepoObject_Reference_PlantUml_EntityRefList](ro.RepoObject_guid, 1, 1) ro_p
ORDER BY ro.RepoObject_fullname2



*/
CREATE FUNCTION [docs].[ftv_RepoObject_Reference_PlantUml_EntityRefList] (
 @RepoObject_guid UNIQUEIDENTIFIER
 , @Referenced_Depth INT = 1
 , @Referencing_Depth INT = 1
 )
RETURNS TABLE
AS
RETURN (
  WITH ro AS (
    SELECT ro_guid = @RepoObject_guid
     , Node_guid = @RepoObject_guid
	 , Node_fullname2 = RepoObject_fullname2
	 from repo.RepoObject
	 WHERE RepoObject_guid = @RepoObject_guid
    
    UNION
    
    SELECT [StartingNode_guid]
     , [LastNode_guid]
     , [LastNode_fullname2]
    FROM [repo].[RepoObject_referenced_level_T]
    WHERE [StartingNode_guid] = @RepoObject_guid
     AND [referenced_level] <= @Referenced_Depth
    
    UNION
    
    SELECT [StartingNode_guid]
     , [LastNode_guid]
     , [LastNode_fullname2]
    FROM [repo].[RepoObject_referencing_level_T]
    WHERE [StartingNode_guid] = @RepoObject_guid
     AND [referencing_level] <= @Referencing_Depth
    )
  SELECT ro_guid
   , Referenced_Depth = @Referenced_Depth
   , Referencing_Depth = @Referencing_Depth
   , PlantumlEntityList = String_Agg([RepoObject_Plantuml], CHAR(13) + CHAR(10)) WITHIN
  GROUP (
    ORDER BY Node_fullname2
    )
  FROM ro
  inner JOIN [docs].[RepoObject_Plantuml_Entity_T] rop
   ON rop.RepoObject_guid = ro.Node_guid
  GROUP BY ro_guid
  )
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '2be63abf-9395-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_Reference_PlantUml_EntityRefList';

