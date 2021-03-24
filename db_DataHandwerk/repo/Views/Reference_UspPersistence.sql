CREATE VIEW [repo].[Reference_UspPersistence]
AS
SELECT [Last_usp_persistence_RepoObject_guid] AS [referenced_usp_RepoObject_guid]
 , [First_usp_persistence_RepoObject_guid] AS [referencing_usp_RepoObject_guid]
 , [Last_usp_persistence_name] AS [referenced_usp_persistence_name]
 , [First_usp_persistence_name] AS [referencing_usp_persistence_name]
FROM [repo].[Match_RepoObject_referenced_UspPersistence]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '00bf898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Reference_UspPersistence', @level2type = N'COLUMN', @level2name = N'referencing_usp_persistence_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ffbe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Reference_UspPersistence', @level2type = N'COLUMN', @level2name = N'referenced_usp_persistence_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'febe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Reference_UspPersistence', @level2type = N'COLUMN', @level2name = N'referencing_usp_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'fdbe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Reference_UspPersistence', @level2type = N'COLUMN', @level2name = N'referenced_usp_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9cbe898f-9381-eb11-84e9-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Reference_UspPersistence';

