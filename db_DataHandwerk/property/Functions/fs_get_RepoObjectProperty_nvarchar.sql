﻿
CREATE Function property.fs_get_RepoObjectProperty_nvarchar
(
    @RepoObject_guid UniqueIdentifier
  , @property_name   NVarchar(128)
)
Returns NVarchar(4000)
As
Begin
    Return
    (
        Select
            property_value
        From
            property.RepoObjectProperty
        Where
            RepoObject_guid   = @RepoObject_guid
            And property_name = @property_name
    );
End;
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = '67b33a4a-426d-eb11-84e2-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'property'
  , @level1type = N'FUNCTION'
  , @level1name = N'fs_get_RepoObjectProperty_nvarchar';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [property].[RepoObjectProperty]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'FUNCTION', @level1name = N'fs_get_RepoObjectProperty_nvarchar';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.RepoObject_gross.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'FUNCTION', @level1name = N'fs_get_RepoObjectProperty_nvarchar';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:property.RepoObjectProperty.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'FUNCTION', @level1name = N'fs_get_RepoObjectProperty_nvarchar';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'FUNCTION', @level1name = N'fs_get_RepoObjectProperty_nvarchar';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'FUNCTION', @level1name = N'fs_get_RepoObjectProperty_nvarchar';

