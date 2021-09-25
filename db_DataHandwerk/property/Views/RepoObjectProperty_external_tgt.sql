
CREATE View property.RepoObjectProperty_external_tgt
As
Select
    --pk: RepoObject_guid, property_name
    rop.RepoObject_guid
  , rop.property_name
  , rop.property_value
  , rop.RepoObjectProperty_id
  , rop.inheritance
From
    property.RepoObjectProperty As rop
Where
    Exists
(
    Select
        1
    From
        repo.RepoObject As ro
    Where
        ro.RepoObject_guid = rop.RepoObject_guid
        And ro.is_external = 1
)
    And Exists
(
    Select
        1
    From
        property.PropertyName_RepoObject_T As pn
    Where
        pn.property_name       = rop.property_name
        --only property_name which are used in inheritance
        And pn.has_inheritance = 1
)
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '07557e28-d01b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_external_tgt', @level2type = N'COLUMN', @level2name = N'inheritance';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '05557e28-d01b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_external_tgt', @level2type = N'COLUMN', @level2name = N'RepoObjectProperty_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '06557e28-d01b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_external_tgt', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '04557e28-d01b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_external_tgt', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '03557e28-d01b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_external_tgt', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '47948d1f-d01b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectProperty_external_tgt';

