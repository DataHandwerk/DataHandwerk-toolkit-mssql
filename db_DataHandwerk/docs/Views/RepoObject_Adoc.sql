


/*
todo - direkt oder über extended properties
- Index List
- referencing
- referenced
*/
CREATE VIEW [docs].[RepoObject_Adoc]
AS
SELECT ro.[RepoObject_guid]
 , [is_DocsOutput] = MAX(ro.[is_DocsOutput])
 , RepoObject_fullname = MAX(ro.RepoObject_fullname)
 , RepoObject_fullname2 = MAX(ro.RepoObject_fullname2)
 , [RepoObject_schema_name] = MAX([RepoObject_schema_name])
 , SysObject_fullname = MAX(ro.SysObject_fullname)
 , SysObject_fullname2 = MAX(ro.SysObject_fullname2)
 , [SysObject_schema_name] = MAX([SysObject_schema_name])
 , SysObject_type = MAX(ro.SysObject_type)
 , SysObject_type_name = MAX(ro.SysObject_type_name)
 , AdocContent = CONCAT (
  '= '
  , MAX(ro.SysObject_fullname)
  , CHAR(13)
  , CHAR(10)
  --
  , CHAR(13)
  , CHAR(10)
  , '== existing_properties'
  , CHAR(13)
  , CHAR(10)
  , CHAR(13)
  , CHAR(10)
  , '// tag::existing_properties[]'
  , CHAR(13)
  , CHAR(10)
  , STRING_AGG(CONCAT (
    CAST('' AS NVARCHAR(max))
    , CASE 
     WHEN NOT rop.[property_nvarchar] IS NULL
      THEN ':ExistsProperty--' + rop.[property_name] + ':' + CHAR(13) + CHAR(10)
     ELSE ''
     END
    ), '') WITHIN GROUP (
    ORDER BY rop.[property_name]
    )
   , CASE 
    WHEN max(ro.sql_modules_antora) <> ''
     THEN ':ExistsProperty--sql_modules_definition:' + CHAR(13) + CHAR(10)
    END
   , CASE 
    WHEN max(ilist.AntoraIndexList) <> ''
     THEN ':ExistsProperty--AntoraIndexList:' + CHAR(13) + CHAR(10)
    END
   , CASE 
    WHEN max(parlist.AntoraParameterList) <> ''
     THEN ':ExistsProperty--AntoraParameterList:' + CHAR(13) + CHAR(10)
    END
   , CASE 
    WHEN max(ro.SysObject_type) IN (
      'U'
      , 'V'
      , 'IF'
      )
     THEN ':ExistsProperty--Columns:' + CHAR(13) + CHAR(10)
    END
   , '// end::existing_properties[]'
   , CHAR(13)
   , CHAR(10)
   --
   , CHAR(13)
   , CHAR(10)
   , '== RepoObject_guid'
   , CHAR(13)
   , CHAR(10)
   , CHAR(13)
   , CHAR(10)
   , '// tag::RepoObject_guid[]'
   , CHAR(13)
   , CHAR(10)
   , ro.[RepoObject_guid]
   , CHAR(13)
   , CHAR(10)
   , '// end::RepoObject_guid[]'
   , CHAR(13)
   , CHAR(10)
   --
   , CHAR(13)
   , CHAR(10)
   , '== SysObject_type'
   , CHAR(13)
   , CHAR(10)
   , CHAR(13)
   , CHAR(10)
   , '// tag::SysObject_type[]'
   , CHAR(13)
   , CHAR(10)
   , MAX(ro.SysObject_type)
   , CHAR(13)
   , CHAR(10)
   , '// end::SysObject_type[]'
   , CHAR(13)
   , CHAR(10)
   --
   , CHAR(13)
   , CHAR(10)
   , '== SysObject_type_name'
   , CHAR(13)
   , CHAR(10)
   , CHAR(13)
   , CHAR(10)
   , '// tag::SysObject_type_name[]'
   , CHAR(13)
   , CHAR(10)
   , MAX(ro.SysObject_type_name)
   , CHAR(13)
   , CHAR(10)
   , '// end::SysObject_type_name[]'
   , CHAR(13)
   , CHAR(10)
   --
   , CHAR(13)
   , CHAR(10)
   , '== SysObject_id'
   , CHAR(13)
   , CHAR(10)
   , CHAR(13)
   , CHAR(10)
   , '// tag::SysObject_id[]'
   , CHAR(13)
   , CHAR(10)
   , max(ro.SysObject_id)
   , CHAR(13)
   , CHAR(10)
   , '// end::SysObject_id[]'
   , CHAR(13)
   , CHAR(10)
   --
   , CHAR(13)
   , CHAR(10)
   , '== SysObject_modify_date'
   , CHAR(13)
   , CHAR(10)
   , CHAR(13)
   , CHAR(10)
   , '// tag::SysObject_modify_date[]'
   , CHAR(13)
   , CHAR(10)
   , CONVERT(NVARCHAR(20), max(ro.SysObject_modify_date), 120)
   , CHAR(13)
   , CHAR(10)
   , '// end::SysObject_modify_date[]'
   , CHAR(13)
   , CHAR(10)
   --
   , CHAR(13)
   , CHAR(10)
   , '== AntoraColumnDetails'
   , CHAR(13)
   , CHAR(10)
   , CHAR(13)
   , CHAR(10)
   , '// tag::AntoraColumnDetails[]'
   , CHAR(13)
   , CHAR(10)
   , max(clist.AntoraColumnDetails)
   , CHAR(13)
   , CHAR(10)
   , '// end::AntoraColumnDetails[]'
   , CHAR(13)
   , CHAR(10)
   --
   , CHAR(13)
   , CHAR(10)
   , '== AntoraPkColumnTableRows'
   , CHAR(13)
   , CHAR(10)
   , CHAR(13)
   , CHAR(10)
   , '// tag::AntoraPkColumnTableRows[]'
   , CHAR(13)
   , CHAR(10)
   , max(clist.AntoraPkColumnTableRows)
   , CHAR(13)
   , CHAR(10)
   , '// end::AntoraPkColumnTableRows[]'
   , CHAR(13)
   , CHAR(10)
   --
   , CHAR(13)
   , CHAR(10)
   , '== AntoraNonPkColumnTableRows'
   , CHAR(13)
   , CHAR(10)
   , CHAR(13)
   , CHAR(10)
   , '// tag::AntoraNonPkColumnTableRows[]'
   , CHAR(13)
   , CHAR(10)
   , max(clist.AntoraNonPkColumnTableRows)
   , CHAR(13)
   , CHAR(10)
   , '// end::AntoraNonPkColumnTableRows[]'
   , CHAR(13)
   , CHAR(10)
   --
   , CHAR(13)
   , CHAR(10)
   , '== AntoraIndexList'
   , CHAR(13)
   , CHAR(10)
   , CHAR(13)
   , CHAR(10)
   , '// tag::AntoraIndexList[]'
   , CHAR(13)
   , CHAR(10)
   , max(ilist.AntoraIndexList)
   , CHAR(13)
   , CHAR(10)
   , '// end::AntoraIndexList[]'
   , CHAR(13)
   , CHAR(10)
   --
   , CHAR(13)
   , CHAR(10)
   , '== AntoraParameterList'
   , CHAR(13)
   , CHAR(10)
   , CHAR(13)
   , CHAR(10)
   , '// tag::AntoraParameterList[]'
   , CHAR(13)
   , CHAR(10)
   , max(parlist.AntoraParameterList)
   , CHAR(13)
   , CHAR(10)
   , '// end::AntoraParameterList[]'
   , CHAR(13)
   , CHAR(10)
   ----
   --, CHAR(13)
   --, CHAR(10)
   --, '== pk_index_guid'
   --, CHAR(13)
   --, CHAR(10)
   --, CHAR(13)
   --, CHAR(10)
   --, '// tag::pk_index_guid[]'
   --, CHAR(13)
   --, CHAR(10)
   --, max(ro.pk_index_guid)
   --, CHAR(13)
   --, CHAR(10)
   --, '// end::pk_index_guid[]'
   --, CHAR(13)
   --, CHAR(10)
   ----
   --, CHAR(13)
   --, CHAR(10)
   --, '== pk_IndexPatternColumnDatatype'
   --, CHAR(13)
   --, CHAR(10)
   --, CHAR(13)
   --, CHAR(10)
   --, '// tag::pk_IndexPatternColumnDatatype[]'
   --, CHAR(13)
   --, CHAR(10)
   --, max(ro.pk_IndexPatternColumnDatatype)
   --, CHAR(13)
   --, CHAR(10)
   --, '// end::pk_IndexPatternColumnDatatype[]'
   --, CHAR(13)
   --, CHAR(10)
   ----
   --, CHAR(13)
   --, CHAR(10)
   --, '== pk_IndexPatternColumnName'
   --, CHAR(13)
   --, CHAR(10)
   --, CHAR(13)
   --, CHAR(10)
   --, '// tag::pk_IndexPatternColumnName[]'
   --, CHAR(13)
   --, CHAR(10)
   --, max(ro.pk_IndexPatternColumnName)
   --, CHAR(13)
   --, CHAR(10)
   --, '// end::pk_IndexPatternColumnName[]'
   --, CHAR(13)
   --, CHAR(10)
   ----
   --, CHAR(13)
   --, CHAR(10)
   --, '== pk_IndexSemanticGroup'
   --, CHAR(13)
   --, CHAR(10)
   --, CHAR(13)
   --, CHAR(10)
   --, '// tag::pk_IndexSemanticGroup[]'
   --, CHAR(13)
   --, CHAR(10)
   --, max(ro.pk_IndexSemanticGroup)
   --, CHAR(13)
   --, CHAR(10)
   --, '// end::pk_IndexSemanticGroup[]'
   --, CHAR(13)
   --, CHAR(10)
   --
   --
   --
   --, CHAR(13)
   --, CHAR(10)
   --, '== CreateColumnList'
   --, CHAR(13)
   --, CHAR(10)
   --, CHAR(13)
   --, CHAR(10)
   --, '// tag::CreateColumnList[]'
   --, CHAR(13)
   --, CHAR(10)
   --, max(ro.CreateColumnList)
   --, CHAR(13)
   --, CHAR(10)
   --, '// end::CreateColumnList[]'
   --, CHAR(13)
   --, CHAR(10)
   ----
   --, CHAR(13)
   --, CHAR(10)
   --, '== DbmlColumnList'
   --, CHAR(13)
   --, CHAR(10)
   --, CHAR(13)
   --, CHAR(10)
   --, '// tag::DbmlColumnList[]'
   --, CHAR(13)
   --, CHAR(10)
   --, max(ro.DbmlColumnList)
   --, CHAR(13)
   --, CHAR(10)
   --, '// end::DbmlColumnList[]'
   --, CHAR(13)
   --, CHAR(10)
   --
   ,
   --CASE 
   -- WHEN COUNT(DISTINCT rop.property_name) > 1
   --  THEN 
   STRING_AGG(CONCAT (
     CAST('' AS NVARCHAR(max))
     , CHAR(13)
     , CHAR(10)
     , '== '
     , rop_cross.[property_name]
     , CHAR(13)
     , CHAR(10)
     , CHAR(13)
     , CHAR(10)
     , '// tag::'
     , rop_cross.[property_name]
     , '[]'
     , CHAR(13)
     , CHAR(10)
     , rop.[property_nvarchar]
     , CHAR(13)
     , CHAR(10)
     , '// end::'
     , rop_cross.[property_name]
     , '[]'
     , CHAR(13)
     , CHAR(10)
     ), CHAR(13) + CHAR(10)) WITHIN
  GROUP (
    ORDER BY rop.[property_name]
    )
   --END
   --
   , CHAR(13)
   , CHAR(10)
   --
   , CHAR(13)
   , CHAR(10)
   , '== sql_modules_definition'
   , CHAR(13)
   , CHAR(10)
   , CHAR(13)
   , CHAR(10)
   , '// tag::sql_modules_definition[]'
   , CHAR(13)
   , CHAR(10)
   , '[source,sql]'
   , CHAR(13)
   , CHAR(10)
   , '----'
   , CHAR(13)
   , CHAR(10)
   , max(ro.sql_modules_antora)
   , CHAR(13)
   , CHAR(10)
   , '----'
   , CHAR(13)
   , CHAR(10)
   , '// end::sql_modules_definition[]'
   , CHAR(13)
   , CHAR(10)
   --
   , CHAR(13)
   , CHAR(10)
  )
 , PropertyCount = COUNT(DISTINCT rop.property_name)
FROM [repo].[RepoObject_gross] ro
LEFT JOIN [repo].[RepoObjectProperty_cross] rop_cross
 ON rop_cross.RepoObject_guid = ro.RepoObject_guid
LEFT JOIN [repo].[RepoObjectProperty] rop
 ON rop.RepoObject_guid = rop_cross.RepoObject_guid
  AND rop.[property_name] = rop_cross.[property_name]
--AND NOT rop.[property_nvarchar] IS NULL
LEFT JOIN [docs].[RepoObject_ColumnList] clist
 ON clist.RepoObject_guid = ro.RepoObject_guid
LEFT JOIN [docs].[RepoObject_IndexList_T] ilist
 ON ilist.RepoObject_guid = ro.RepoObject_guid
LEFT JOIN [docs].[RepoObject_ParameterList] parlist
 ON parlist.RepoObject_guid = ro.RepoObject_guid
GROUP BY ro.[RepoObject_guid]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'd5e0b563-4291-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5a1254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc', @level2type = N'COLUMN', @level2name = N'SysObject_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dae0b563-4291-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '5a5c44d7-1193-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc', @level2type = N'COLUMN', @level2name = N'SysObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '591254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc', @level2type = N'COLUMN', @level2name = N'SysObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd9e0b563-4291-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc', @level2type = N'COLUMN', @level2name = N'SysObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '595c44d7-1193-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd7e0b563-4291-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '581254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd8e0b563-4291-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dce0b563-4291-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc', @level2type = N'COLUMN', @level2name = N'PropertyCount';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dbe0b563-4291-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc', @level2type = N'COLUMN', @level2name = N'AdocContent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '43e90a1e-7495-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_Adoc', @level2type = N'COLUMN', @level2name = N'is_DocsOutput';

