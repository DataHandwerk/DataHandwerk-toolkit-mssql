﻿CREATE SCHEMA [tool]
    AUTHORIZATION [dbo];










GO
EXECUTE sp_addextendedproperty @name = N'RepoSchema_guid', @value = '1f99d297-86a3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'tool';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Tools that can also be used outside and independently of DataHandwerk', @level0type = N'SCHEMA', @level0name = N'tool';

