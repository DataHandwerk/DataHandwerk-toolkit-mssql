﻿CREATE Function [config].fs_dwh_database_name
()
Returns NVarchar(128)
As
Begin
    Return
    (
        Select
            Cast([Parameter_value_result] As NVarchar(128)) As dwh_database_name
        From
            [config].Parameter
        Where
            Parameter_name    = 'dwh_database_name'
            And sub_Parameter = ''
    );
End;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'e78f291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'config'
  , @level1type = N'FUNCTION'
  , @level1name = N'fs_dwh_database_name';
Go
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[Parameter]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'FUNCTION', @level1name = N'fs_dwh_database_name';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo_sys.usp_AddOrUpdateExtendedProperty.adoc[]
* xref:repo_sys.usp_dropextendedproperty_level_1.adoc[]
* xref:repo_sys.usp_dropextendedproperty_level_2.adoc[]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'FUNCTION', @level1name = N'fs_dwh_database_name';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.Parameter.adoc[]', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'FUNCTION', @level1name = N'fs_dwh_database_name';

