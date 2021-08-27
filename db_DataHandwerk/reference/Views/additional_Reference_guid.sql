
CREATE View reference.additional_Reference_guid
As
Select
    T1.referenced_AntoraComponent
  , T1.referenced_AntoraModul
  , T1.referenced_Schema
  , T1.referenced_Object
  , T1.referenced_Column
  , referenced_fullname               = ro1.RepoObject_fullname
  , referenced_id                     = ro1.SysObject_id
  , referenced_RepoObject_guid        = ro1.RepoObject_guid
  , referenced_RepoObjectColumn_guid  = rol1.RepoObjectColumn_guid
  , referenced_type                   = ro1.RepoObject_type
  , T1.referencing_AntoraComponent
  , T1.referencing_AntoraModul
  , T1.referencing_Schema
  , T1.referencing_Object
  , T1.referencing_Column
  , referencing_fullname              = ro2.RepoObject_fullname
  , referencing_id                    = ro2.SysObject_id
  , referencing_RepoObject_guid       = ro2.RepoObject_guid
  , referencing_RepoObjectColumn_guid = rol2.RepoObjectColumn_guid
  , referencing_type                  = ro2.RepoObject_type
  , is_internal                       = Case
                                            When T1.referenced_AntoraComponent = T1.referencing_AntoraComponent
                                                 And T1.referenced_AntoraModul = T1.referencing_AntoraModul
                                                Then
                                                1
                                            Else
                                                0
                                        End
--, T1.Id
--, T1.tik
--, T1.tik_hash
From
    reference.additional_Reference As T1
    Left Outer Join
        repo.RepoObject            As ro1
            On
            T1.referenced_Schema               = ro1.RepoObject_schema_name
            And T1.referenced_Object           = ro1.RepoObject_name
            And T1.referenced_AntoraComponent  = config.fs_get_parameter_value ( 'AntoraComponent', '' )
            And T1.referenced_AntoraModul      = config.fs_get_parameter_value ( 'AntoraModul', '' )

    Left Outer Join
        repo.RepoObject            As ro2
            On
            T1.referencing_Schema              = ro2.RepoObject_schema_name
            And T1.referencing_Object          = ro2.RepoObject_name
            And T1.referencing_AntoraComponent = config.fs_get_parameter_value ( 'AntoraComponent', '' )
            And T1.referencing_AntoraModul     = config.fs_get_parameter_value ( 'AntoraModul', '' )

    Left Outer Join
        repo.RepoObjectColumn      As rol1
            On
            rol1.RepoObject_guid               = ro1.RepoObject_guid
            And rol1.Column_name               = T1.referenced_Column

    Left Outer Join
        repo.RepoObjectColumn      As rol2
            On
            rol1.RepoObject_guid               = ro2.RepoObject_guid
            And rol1.Column_name               = T1.referencing_Column
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5508fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_guid', @level2type = N'COLUMN', @level2name = N'is_internal';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5408fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_guid', @level2type = N'COLUMN', @level2name = N'referencing_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5308fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_guid', @level2type = N'COLUMN', @level2name = N'referencing_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5208fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_guid', @level2type = N'COLUMN', @level2name = N'referencing_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5108fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_guid', @level2type = N'COLUMN', @level2name = N'referencing_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5008fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_guid', @level2type = N'COLUMN', @level2name = N'referencing_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4f08fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_guid', @level2type = N'COLUMN', @level2name = N'referencing_Column';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4e08fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_guid', @level2type = N'COLUMN', @level2name = N'referencing_Object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4d08fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_guid', @level2type = N'COLUMN', @level2name = N'referencing_Schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4c08fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_guid', @level2type = N'COLUMN', @level2name = N'referencing_AntoraModul';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4b08fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_guid', @level2type = N'COLUMN', @level2name = N'referenced_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4a08fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_guid', @level2type = N'COLUMN', @level2name = N'referenced_RepoObjectColumn_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4908fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_guid', @level2type = N'COLUMN', @level2name = N'referenced_RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4808fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_guid', @level2type = N'COLUMN', @level2name = N'referenced_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4708fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_guid', @level2type = N'COLUMN', @level2name = N'referenced_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4608fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_guid', @level2type = N'COLUMN', @level2name = N'referenced_Column';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4508fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_guid', @level2type = N'COLUMN', @level2name = N'referenced_Object';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4408fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_guid', @level2type = N'COLUMN', @level2name = N'referenced_Schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4308fcfd-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_guid', @level2type = N'COLUMN', @level2name = N'referenced_AntoraModul';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9db0b5f7-b004-ec11-8514-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f6f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_guid', @level2type = N'COLUMN', @level2name = N'referencing_AntoraComponent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f5f5bbfc-0807-ec11-8515-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'reference', @level1type = N'VIEW', @level1name = N'additional_Reference_guid', @level2type = N'COLUMN', @level2name = N'referenced_AntoraComponent';

