
CREATE View property.RepoObjectColumnProperty_external_tgt
As
Select
    --pk: RepoObjectColumn_guid, property_name
    rop.RepoObjectColumn_guid
  , rop.property_name
  , rop.property_value
  , rop.RepoObjectColumnProperty_id
  , rop.inheritance
From
    property.RepoObjectColumnProperty As rop
Where
    Exists
(
    Select
        1
    From
        repo.RepoObjectColumn As roc
        Left Join
            repo.RepoObject   As ro
                On
                ro.RepoObject_guid = roc.RepoObject_guid
    Where
        roc.RepoObjectColumn_guid = rop.RepoObjectColumn_guid
        And ro.is_external        = 1
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
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e46d1c4e-d31b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_external_tgt', @level2type = N'COLUMN', @level2name = N'inheritance';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e36d1c4e-d31b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_external_tgt', @level2type = N'COLUMN', @level2name = N'RepoObjectColumnProperty_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e26d1c4e-d31b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_external_tgt', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e16d1c4e-d31b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_external_tgt', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'e06d1c4e-d31b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_external_tgt', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'c93dcf42-d31b-ec11-8521-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_external_tgt';

