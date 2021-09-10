﻿
CREATE View property.RepoObjectColumnProperty_ForUpdate
As
Select
    rocp.RepoObjectColumnProperty_id
  , rocp.RepoObjectColumn_guid
  , rocp.property_name
  , rocp.property_value
  , rocp.inheritance
  --, rocp.[property_basetype]
  , rocg.RepoObjectColumn_fullname
  , rocg.RepoObjectColumn_fullname2
  , rocg.RepoObjectColumn_name
  , rocg.RepoObject_fullname
  , rocg.RepoObject_fullname2
  , rocg.RepoObject_guid
  , rocg.RepoObject_schema_name
  , rocg.RepoObject_name
  , rocg.RepoObject_type
  , rocg.Repo_user_type_fullname
From
    property.RepoObjectColumnProperty As rocp
    Inner Join
        repo.RepoObjectColumn_gross   As rocg
            On
            rocg.RepoObjectColumn_guid = rocp.RepoObjectColumn_guid
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3c12ce32-0e9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3b12ce32-0e9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3a12ce32-0e9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3912ce32-0e9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3812ce32-0e9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3712ce32-0e9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_fullname';


GO



GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3512ce32-0e9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'inheritance';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3412ce32-0e9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3312ce32-0e9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3212ce32-0e9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '3112ce32-0e9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObjectColumnProperty_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '3012ce32-0e9d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b37159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'b47159e3-27e6-eb11-8507-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [property].[RepoObjectColumnProperty]
* [repo].[RepoObjectColumn_gross]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexSemanticGroup', @value = N'RepoObjectColumnProperty_id', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnName', @value = N'RepoObjectColumnProperty_id', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'pk_IndexPatternColumnDatatype', @value = N'int', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'pk_index_guid', @value = 'bffb2d18-119d-eb11-84f6-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:property.RepoObjectColumnProperty.adoc[]
* xref:repo.RepoObjectColumn_gross.adoc[]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectColumnProperty].[RepoObjectColumnProperty_id]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObjectColumnProperty_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[RepoObjectColumn_name]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'Name of the column. Is unique within the object.', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectColumnProperty].[RepoObjectColumn_guid]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[RepoObjectColumn_fullname2]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[RepoObjectColumn_fullname]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObjectColumn_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[RepoObject_guid]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[RepoObject_fullname2]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat([RepoObject_schema_name],''.'',[RepoObject_name]))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[RepoObject_fullname]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(concat(''['',[RepoObject_schema_name],''].['',[RepoObject_name],'']''))', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectColumnProperty].[property_value]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'datatype of property_value is `sql_variant`, because it should be possible to synchronize the property_value in the repository with property_value in extended properties in the dwh database, which is `sql_variant` +
therefore the maximum content is nvarchar(4000) or varchar(8000)', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'property_value';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectColumnProperty].[property_name]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'property_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [property].[RepoObjectColumnProperty].[inheritance]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'inheritance';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[RepoObject_schema_name]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [repo].[RepoObjectColumn_gross].[RepoObject_name]', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'bf2c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'RepoObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c02c2877-c111-ec11-8519-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'property', @level1type = N'VIEW', @level1name = N'RepoObjectColumnProperty_ForUpdate', @level2type = N'COLUMN', @level2name = N'Repo_user_type_fullname';

