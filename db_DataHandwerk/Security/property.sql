CREATE SCHEMA [property]
    AUTHORIZATION [dbo];
















































GO
EXECUTE sp_addextendedproperty @name = N'RepoSchema_guid', @value = '2499d297-86a3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Inheritance or determination of extended properties for RepoObjects or RepoObject columns, based on references', @level0type = N'SCHEMA', @level0name = N'property';

