CREATE SCHEMA [test]
    AUTHORIZATION [dbo];




GO
EXECUTE sp_addextendedproperty @name = N'RepoSchema_guid', @value = '1e99d297-86a3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'test';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'test description', @level0type = N'SCHEMA', @level0name = N'test';

