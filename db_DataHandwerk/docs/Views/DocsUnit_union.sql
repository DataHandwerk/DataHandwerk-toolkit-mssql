﻿Create   View docs.DocsUnit_union
As
Select
    Unit_guid          = roc.RepoObjectColumn_guid
  , Unit_Metatype      = 'column'
  , Unit_Schema        = rof.RepoObject_schema_name
  , Unit_Name          = roc.RepoObjectColumn_name
  , Unit_fullname2     = roc.RepoObjectColumn_fullname2
  , Unit_TypeName      = roc.Repo_user_type_fullname
  , Unit_isHidden      = roc.tabcol_IsHidden
  , Unit_IsSsas        = rof.is_ssas
  , Unit_Description   = roc.Description
  , Unit_DisplayFolder = roc.tabcol_DisplayFolder
  , Unit_Expression    = roc.tabcol_Expression
  , Unit_FormatString  = roc.tabcol_FormatString
  , Unit_IsKey         = roc.tabcol_IsKey
  , Unit_IsUnique      = roc.tabcol_IsUnique
  , Unit_SummarizeBy   = roc.tabcol_SummarizeBy
  , Object_fullname2   = rof.RepoObject_fullname2
  , Object_Type        = rof.SysObject_type
From
    docs.RepoObject_OutputFilter    As rof
    Inner Join
        repo.RepoObjectColumn_gross As roc
            On
            roc.RepoObject_guid = rof.RepoObject_guid
Union All
Select
    Unit_guid          = rof.RepoObject_guid
  , Unit_Metatype      = 'object'
  , Unit_Schema        = rof.RepoObject_schema_name
  , Unit_Name          = rof.RepoObject_name
  , Unit_fullname2     = rof.RepoObject_fullname2
  , Unit_TypeName      = rof.SysObject_type_name
  , Unit_isHidden      = ro.tables_isHidden
  , Unit_IsSsas        = rof.is_ssas
  , Unit_Description   = ro.Description
  , Unit_DisplayFolder = Null
  , Unit_Expression    = Null
  , Unit_FormatString  = Null
  , Unit_IsKey         = Null
  , Unit_IsUnique      = Null
  , Unit_SummarizeBy   = Null
  , Object_fullname2   = rof.RepoObject_fullname2
  , Object_Type        = rof.SysObject_type
From
    docs.RepoObject_OutputFilter As rof
    Inner Join
        repo.RepoObject_gross    As ro
            On
            ro.RepoObject_guid = rof.RepoObject_guid
Union All
Select
    Unit_guid          = rs.RepoSchema_guid
  , Unit_Metatype      = 'schema'
  , Unit_Schema        = rs.RepoSchema_name
  , Unit_Name          = rs.RepoSchema_name
  , Unit_fullname2     = rs.RepoSchema_name
  , Unit_TypeName      = Null
  , Unit_isHidden      = Null
  , Unit_IsSsas        = rs.is_ssas
  , Unit_Description   = rs.RepoSchema_ms_description
  , Unit_DisplayFolder = Null
  , Unit_Expression    = Null
  , Unit_FormatString  = Null
  , Unit_IsKey         = Null
  , Unit_IsUnique      = Null
  , Unit_SummarizeBy   = Null
  , Object_fullname2   = Null
  , Object_Type        = Null
From
    repo.RepoSchema As rs
Union All
Select
    Unit_guid          = m.Measure_guid
  , Unit_Metatype      = 'measure'
  , Unit_Schema        = m.RepoSchema_name
  , Unit_Name          = m.measures_name
  , Unit_fullname2     = m.measures_fullname2
  , Unit_TypeName      = Null
  , Unit_isHidden      = m.measures_isHidden
  , Unit_IsSsas        = m.is_ssas
  , Unit_Description   = m.Description
  , Unit_DisplayFolder = m.measures_displayFolder
  , Unit_Expression    = m.Expression
  , Unit_FormatString  = m.measures_formatString
  , Unit_IsKey         = Null
  , Unit_IsUnique      = Null
  , Unit_SummarizeBy   = Null
  , Object_fullname2   = m.RepoObject_fullname2
  , Object_Type        = 'U'
From
    repo.Measures As m
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2b208663-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'DocsUnit_union', @level2type = N'COLUMN', @level2name = N'Object_Type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2a208663-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'DocsUnit_union', @level2type = N'COLUMN', @level2name = N'Object_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '29208663-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'DocsUnit_union', @level2type = N'COLUMN', @level2name = N'Unit_Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '28208663-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'DocsUnit_union', @level2type = N'COLUMN', @level2name = N'Unit_IsSsas';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '27208663-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'DocsUnit_union', @level2type = N'COLUMN', @level2name = N'Unit_TypeName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '26208663-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'DocsUnit_union', @level2type = N'COLUMN', @level2name = N'Unit_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '25208663-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'DocsUnit_union', @level2type = N'COLUMN', @level2name = N'Unit_Name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '24208663-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'DocsUnit_union', @level2type = N'COLUMN', @level2name = N'Unit_Schema';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '23208663-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'DocsUnit_union', @level2type = N'COLUMN', @level2name = N'Unit_Metatype';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '22208663-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'DocsUnit_union', @level2type = N'COLUMN', @level2name = N'Unit_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b4051757-370f-ec11-8518-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'DocsUnit_union';

