
CREATE VIEW [repo].[IndexColumn__virtual_gross]
AS
--
SELECT
       [icv].[index_guid]
     , [icv].[index_column_id]
     , [icv].[is_descending_key]
     , [sc_roc].[RepoObjectColumn_guid] --could by empty for new Objects, execute [repo].[usp_sync_guid]
     , [iv].[parent_RepoObject_guid]
     , [iv].[index_name]
     , [parent_schema_name] = [sc_roc].[SysObject_schema_name]
     , [parent_SysObject_name] = [sc_roc].[SysObject_name]
     , [sc_roc].[SysObject_column_name]
     , [sc_roc].[user_type_fullname] AS [SysObject_column_user_type_fullname]
     , [iv].[is_index_unique]
     , [iv].[is_index_primary_key]
     , [parent_SysObject_fullname] = [sc_roc].[SysObject_fullname]
     , [is_index_real] = CAST(0 AS BIT)
FROM
     repo.IndexColumn__virtual AS icv
     INNER JOIN
     repo.Index__virtual AS iv
     ON icv.index_guid = iv.index_guid
     INNER JOIN
     repo.SysColumn_RepoObjectColumn_via_guid AS sc_roc
     ON icv.RepoObjectColumn_guid = sc_roc.RepoObjectColumn_guid
     LEFT JOIN
     repo.SysObject_RepoObject_via_guid AS sc_ro
     ON sc_ro.RepoObject_guid = iv.parent_RepoObject_guid

--WHERE  [iv].[is_index_unique] = 1
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd181875a-724f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_gross', @level2type = N'COLUMN', @level2name = N'is_index_real';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1fed08c3-304f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_gross', @level2type = N'COLUMN', @level2name = N'parent_SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1bed08c3-304f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_gross', @level2type = N'COLUMN', @level2name = N'is_index_primary_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1ced08c3-304f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_gross', @level2type = N'COLUMN', @level2name = N'is_index_unique';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'23ed08c3-304f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_gross', @level2type = N'COLUMN', @level2name = N'SysObject_column_user_type_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'22ed08c3-304f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_gross', @level2type = N'COLUMN', @level2name = N'SysObject_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'20ed08c3-304f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_gross', @level2type = N'COLUMN', @level2name = N'parent_SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1eed08c3-304f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_gross', @level2type = N'COLUMN', @level2name = N'parent_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1aed08c3-304f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_gross', @level2type = N'COLUMN', @level2name = N'index_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'1ded08c3-304f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_gross', @level2type = N'COLUMN', @level2name = N'parent_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'21ed08c3-304f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_gross', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b4a4188b-0352-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_gross', @level2type = N'COLUMN', @level2name = N'is_descending_key';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'18ed08c3-304f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_gross', @level2type = N'COLUMN', @level2name = N'index_column_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'19ed08c3-304f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_gross', @level2type = N'COLUMN', @level2name = N'index_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'16ed08c3-304f-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'IndexColumn__virtual_gross';

