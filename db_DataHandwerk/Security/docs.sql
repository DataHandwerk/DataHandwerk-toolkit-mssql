﻿CREATE SCHEMA [docs]
    AUTHORIZATION [dbo];























GO
EXECUTE sp_addextendedproperty @name = N'RepoSchema_guid', @value = '1b99d297-86a3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'objects related to the xref:user-guide:documentation-generator.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs';

