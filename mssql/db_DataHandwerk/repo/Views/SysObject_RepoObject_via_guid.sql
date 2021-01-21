-- Alter View SysObject_RepoObject_via_guid
-- Alter View SysObject_RepoObject_via_guid


-- Alter View SysObject_RepoObject_via_guid
-- Alter View SysObject_RepoObject_via_guid

CREATE VIEW [repo].[SysObject_RepoObject_via_guid]
AS
--
SELECT
       [so].[SysObject_id]
     , [so].[SysObject_schema_name]
     , [so].[SysObject_name]
     , [so].[type] AS                       [SysObject_type]
     , [so].[modify_date] AS                [modify_date]
     , [so].[parent_object_id] AS           [parent_object_id]
     , [so].[SysObject_RepoObject_guid] AS  [SysObject_RepoObject_guid]
     --, [so].[temporal_type] AS              [SysObject_temporal_type]
     --, [so].[history_table_id] AS           [SysObject_history_table_id]
     --, [so].[max_column_id_used] AS         [SysObject_max_column_id_used]
     , [ro].[RepoObject_guid] AS            [RepoObject_guid]
     , [ro].[RepoObject_schema_name]
     , [ro].[RepoObject_name]
     , [ro].[RepoObject_type]
     , [ro].[SysObject_id] AS               [RepoObject_SysObject_id]
     , [ro].[SysObject_schema_name] AS      [RepoObject_SysObject_schema_name]
     , [ro].[SysObject_name] AS             [RepoObject_SysObject_name]
     , [ro].[SysObject_type] AS             [RepoObject_SysObject_type]
     , [ro].[SysObject_modify_date] AS      [RepoObject_SysObject_modify_date]
     , [ro].[SysObject_parent_object_id] AS [RepoObject_SysObject_parent_object_id]
     , [ro].[is_SysObject_missing] AS       [RepoObject_is_SysObject_missing]
     , [ro].[is_RepoObject_name_uniqueidentifier]
     , [ro].[is_SysObject_name_uniqueidentifier]
--, [ro].SysObject_parent_object_id AS          [RepoObject_parent_SysObject_id]
--, [ro].[SysObject_temporal_type] AS      [RepoObject_SysObject_temporal_type]
--, [ro].[SysObject_history_table_id] AS   [RepoObject_SysObject_history_table_id]
--, [ro].[SysObject_max_column_id_used] AS [RepoObject_SysObject_max_column_id_used]
FROM
     repo_sys.SysObject AS so
     LEFT OUTER JOIN
     repo.RepoObject AS ro
     ON so.SysObject_RepoObject_guid = ro.RepoObject_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'62ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'is_SysObject_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'61ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'is_RepoObject_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'63ea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObject_is_SysObject_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'784a6024-ae4a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObject_SysObject_modify_date';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'ff28ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObject_SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'fd28ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObject_SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'fe28ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObject_SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'fc28ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObject_SysObject_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0029ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'fa28ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'fb28ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'f928ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0329ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'SysObject_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'2e00226b-9a4e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'parent_object_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'794a6024-ae4a-eb11-84d2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'modify_date';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0529ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0229ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0429ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'0129ece1-5747-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid', @level2type = N'COLUMN', @level2name = N'SysObject_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'eb968530-e846-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysObject_RepoObject_via_guid';

