
-- Alter View SysColumn_RepoObjectColumn_via_guid
-- Alter View SysColumn_RepoObjectColumn_guid

CREATE VIEW [repo].[SysColumn_RepoObjectColumn_via_guid]
AS
--
SELECT
       [sc].[SysObject_id]
     , [sc].[SysObject_column_id]
     , [ro].[is_repo_managed]
     , [ro].[RepoObject_fullname]
     , [ro].[SysObject_fullname]
     , [roc].[has_different_sys_names]
     , [roc].[is_query_plan_expression]
     , [roc].[is_RepoObjectColumn_name_uniqueidentifier]
     , [roc].[is_SysObjectColumn_missing]
     , [roc].[is_SysObjectColumn_name_uniqueidentifier]
     , [roc].[persistence_source_RepoObjectColumn_guid]
     , [roc].[Referencing_Count]
     , [roc].[Repo_default_definition]
     , [roc].[Repo_default_name]
     , [roc].[Repo_default_is_system_named]
     , [roc].[Repo_definition]
     , [roc].[Repo_generated_always_type]
     , [roc].[Repo_graph_type]
     , [roc].[Repo_is_computed]
     , [roc].[Repo_is_identity]
     , [roc].[Repo_is_nullable]
     , [roc].[Repo_is_persisted]
     , [roc].[Repo_seed_value]
     , [roc].[Repo_increment_value]
     , [roc].[Repo_user_type_fullname]
     , [roc].[Repo_user_type_name]
     , [roc].[Repo_uses_database_collation]
     , [roc].[RepoObject_guid]
     , [roc].[RepoObjectColumn_guid]
     , [roc].[RepoObjectColumn_name]
     , [roc].[SysObjectColumn_column_id]
     , [roc].[SysObjectColumn_name]
     , [sc].[default_definition]
     , [sc].[default_is_system_named]
     , [sc].[default_name]
     , [sc].[definition]
     , [sc].[generated_always_type]
     , [sc].[graph_type]
     , [sc].[is_computed]
     , [sc].[is_identity]
     , [sc].[is_nullable]
     , [sc].[is_persisted]
     , [sc].[seed_value]
     , [sc].[increment_value]
     , [sc].[SysObject_column_name]
     , [sc].[SysObject_name]
     , [sc].[SysObject_RepoObject_guid]
     , [sc].[SysObject_RepoObjectColumn_guid]
     , [sc].[SysObject_schema_name]
     , [sc].[SysObject_type]
     , [sc].[user_type_fullname]
     , [sc].[user_type_name]
     , [sc].[uses_database_collation]
       --sometimes by error we have same named columns in repo.RepoObjectColumn, additinal columns should be deleted in [repo].[usp_sync_guid_RepoObjectColumn]
     , [RowNumberOverName] = ROW_NUMBER() OVER(PARTITION BY [sc].[SysObject_RepoObject_guid]
                                                          , [sc].[SysObject_column_name]
       ORDER BY
                [roc].[RepoObjectColumn_guid])
FROM
     repo_sys.SysColumn AS sc
     LEFT OUTER JOIN
     repo.RepoObjectColumn AS roc
     ON sc.SysObject_RepoObjectColumn_guid = roc.RepoObjectColumn_guid
     LEFT OUTER JOIN
     repo.RepoObject AS ro
     ON roc.RepoObject_guid = ro.RepoObject_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'6b30f219-d751-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'RowNumberOverName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'94771e59-d051-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'uses_database_collation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'69bc3bb1-a451-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'user_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'c0cffd4a-a94e-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'user_type_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'30e67602-5b47-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'2fe67602-5b47-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'2ee67602-5b47-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'SysObject_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'2de67602-5b47-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'SysObject_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'2ce67602-5b47-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'SysObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'2ae67602-5b47-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'SysObject_column_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'92771e59-d051-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'is_persisted';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'aba4188b-0352-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'is_nullable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'91771e59-d051-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'graph_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'90771e59-d051-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'definition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'8f771e59-d051-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'default_is_system_named';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'8e771e59-d051-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'default_definition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'32e67602-5b47-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'SysObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'31e67602-5b47-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'SysObjectColumn_column_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'28e67602-5b47-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'27e67602-5b47-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'26e67602-5b47-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'8d771e59-d051-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'Repo_uses_database_collation';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'66bc3bb1-a451-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'Repo_user_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'68bc3bb1-a451-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'Repo_user_type_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'8b771e59-d051-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'Repo_is_persisted';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'aaa4188b-0352-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'Repo_is_nullable';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'8a771e59-d051-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'Repo_graph_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'89771e59-d051-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'Repo_definition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'88771e59-d051-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'Repo_default_is_system_named';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'87771e59-d051-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'Repo_default_definition';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'86771e59-d051-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'Referencing_Count';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'85771e59-d051-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'persistence_source_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'3dea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'is_SysObjectColumn_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'3cea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'is_SysObjectColumn_missing';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'3bea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'is_RepoObjectColumn_name_uniqueidentifier';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'84771e59-d051-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'is_query_plan_expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'83771e59-d051-eb11-84d5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'has_different_sys_names';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'3fea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'3eea94ca-054d-eb11-84d4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'25e67602-5b47-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'is_repo_managed';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'29e67602-5b47-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'SysObject_column_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = N'2be67602-5b47-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid', @level2type = N'COLUMN', @level2name = N'SysObject_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = N'21e67602-5b47-eb11-84d1-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'SysColumn_RepoObjectColumn_via_guid';

