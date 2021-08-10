﻿CREATE SCHEMA [repo]
    AUTHORIZATION [dbo];






































































































































































































































































GO
EXECUTE sp_addextendedproperty @name = N'RepoSchema_guid', @value = '1699d297-86a3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'main schema containing objects and logic around RepoSchema, RepoObject, RepoObjectColumn

RepoObject:: Central construct to represent objects (tables, views, procedures, functions, index, ...) and their subunits (columns, index columns, procedure parameters, ...), their properties and relationships between them.', @level0type = N'SCHEMA', @level0name = N'repo';

