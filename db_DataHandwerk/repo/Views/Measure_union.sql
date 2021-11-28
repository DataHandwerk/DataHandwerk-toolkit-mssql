
/*
<<property_start>>Description
Measures should assigned twice to two different tables

* original table
* virtual table '_measures' +
  the guid and name of this table are defined in xref:sqldb:repo.reposchema.adoc[]
<<property_end>>
*/
CREATE View repo.Measure_union
As
Select
    Measure_guid
  , RepoSchema_name
  , Description
  , Expression
  , is_ssas
  , measures_name
  , measures_description
  , measures_description_ja
  , measures_displayFolder
  , measures_expression
  , measures_expression_ja
  , measures_formatString
  , measures_isHidden
  , Measure_fullname2
  , Measure_fullname
  , RepoObject_fullname2
  , RepoObject_guid
  , RepoObject_name
From
    repo.Measure
Union All
Select
    Measure_guid
  , RepoSchema_name
  , Description
  , Expression
  , is_ssas
  , measures_name
  , measures_description
  , measures_description_ja
  , measures_displayFolder
  , measures_expression
  , measures_expression_ja
  , measures_formatString
  , measures_isHidden
  , Measure_fullname2
  , Measure_fullname
  , RepoObject_fullname2
  , RepoObject_guid = MeasuresRepoObjekt_guid
  , RepoObject_name = MeasuresRepoObjekt_name
From
    repo.Measure
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd1fb2238-8d19-ec11-851e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measure_union', @level2type = N'COLUMN', @level2name = N'RepoObject_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd0fb2238-8d19-ec11-851e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measure_union', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cffb2238-8d19-ec11-851e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measure_union', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '887f7d5a-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measure_union', @level2type = N'COLUMN', @level2name = N'Measure_fullname';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '877f7d5a-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measure_union', @level2type = N'COLUMN', @level2name = N'Measure_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ccfb2238-8d19-ec11-851e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measure_union', @level2type = N'COLUMN', @level2name = N'measures_isHidden';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cbfb2238-8d19-ec11-851e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measure_union', @level2type = N'COLUMN', @level2name = N'measures_formatString';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cafb2238-8d19-ec11-851e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measure_union', @level2type = N'COLUMN', @level2name = N'measures_expression_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c9fb2238-8d19-ec11-851e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measure_union', @level2type = N'COLUMN', @level2name = N'measures_expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c8fb2238-8d19-ec11-851e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measure_union', @level2type = N'COLUMN', @level2name = N'measures_displayFolder';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c7fb2238-8d19-ec11-851e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measure_union', @level2type = N'COLUMN', @level2name = N'measures_description_ja';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c6fb2238-8d19-ec11-851e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measure_union', @level2type = N'COLUMN', @level2name = N'measures_description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c5fb2238-8d19-ec11-851e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measure_union', @level2type = N'COLUMN', @level2name = N'measures_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c4fb2238-8d19-ec11-851e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measure_union', @level2type = N'COLUMN', @level2name = N'is_ssas';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c3fb2238-8d19-ec11-851e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measure_union', @level2type = N'COLUMN', @level2name = N'Expression';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c2fb2238-8d19-ec11-851e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measure_union', @level2type = N'COLUMN', @level2name = N'Description';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c1fb2238-8d19-ec11-851e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measure_union', @level2type = N'COLUMN', @level2name = N'RepoSchema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'c0fb2238-8d19-ec11-851e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measure_union', @level2type = N'COLUMN', @level2name = N'Measure_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a1622931-8d19-ec11-851e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'VIEW', @level1name = N'Measure_union';

