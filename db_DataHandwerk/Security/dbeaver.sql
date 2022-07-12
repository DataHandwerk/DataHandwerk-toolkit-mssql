CREATE SCHEMA [dbeaver]
    AUTHORIZATION [dbo];














GO
EXECUTE sp_addextendedproperty @name = N'RepoSchema_guid', @value = '1c99d297-86a3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'dbeaver';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'contains some testing to prepare JSON files to be used in https://dbeaver.com/[DBeaver] for virtual PK and virtual references

development is on hold', @level0type = N'SCHEMA', @level0name = N'dbeaver';

