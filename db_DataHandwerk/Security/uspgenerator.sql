﻿CREATE SCHEMA [uspgenerator]
    AUTHORIZATION [dbo];


















GO
EXECUTE sp_addextendedproperty @name = N'RepoSchema_guid', @value = '2399d297-86a3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'uspgenerator';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'usp (userdefined stored procedures) can be generated in a formalized way: containing optional logging and some workflow elements (sub procedures, conditions, parent-child logic)', @level0type = N'SCHEMA', @level0name = N'uspgenerator';

