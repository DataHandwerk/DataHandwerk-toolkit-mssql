
/*
Msg 8624, Level 16, State 1, Line 19
Internal Query Processor Error: The query processor could not produce a query plan. For more information, contact Customer Support Services.

=> we need to persist [repo].[RepoObject_referenced_level_T] and [repo].[RepoObject_referencing_level_T]

remember to persist the source before:

EXEC [repo].[usp_PERSIST_RepoObject_referenced_level_T]
EXEC [repo].[usp_PERSIST_RepoObject_referencing_level_T]

check:

SELECT * from [repo].[ftv_RepoObject_ReferencedReferencing]('69CE8EB8-5F62-EB11-84DC-A81E8446D5B0', 1, 1)

SELECT ro.RepoObject_guid
 , ro.RepoObject_fullname2
-- , ro_p.*
FROM repo.RepoObject as ro
CROSS APPLY [repo].[ftv_RepoObject_ReferencedReferencing](ro.RepoObject_guid, 1, 1) as ro_p
ORDER BY ro.RepoObject_fullname2



*/
CREATE FUNCTION [repo].[ftv_RepoObject_ReferencedReferencing] (
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
    FROM repo.RepoObject
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
   , Node_guid
   , Node_fullname2
   , Referenced_Depth = @Referenced_Depth
   , Referencing_Depth = @Referencing_Depth
  --, Referenced_Depth 
  --, Referencing_Depth 
  FROM ro
  )
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'dc7d598b-7d95-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'FUNCTION', @level1name = N'ftv_RepoObject_ReferencedReferencing';

