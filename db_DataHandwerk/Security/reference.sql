﻿CREATE SCHEMA [reference]
    AUTHORIZATION [dbo];






















GO
EXECUTE sp_addextendedproperty @name = N'RepoSchema_guid', @value = '2599d297-86a3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Determination and management of references (dependencies) between RepoObjects or RepoObject columns', @level0type = N'SCHEMA', @level0name = N'reference';

