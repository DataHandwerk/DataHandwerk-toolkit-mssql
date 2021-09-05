

/*
model.bim normally is in UTF8

Idea how to import UTF-8 data ''as it is into SQL-Server is based on +
https://stackoverflow.com/questions/54626404/convert-utf-8-encoded-varbinarymax-data-to-nvarcharmax-string[]

When importing, we use `Single_Blob`, which generates varbinary(max) +
it is converted into UTF-8, when inserting into a UTF-8 column

That's why the target column has an UTF-8 collation, for example `Latin1_General_100_CI_AS_SC_UTF8`

CAUTION: the default SSMS options doesn't include the collation in the `CREATE TABLE` scripts.

*/
CREATE View [ssas].[model_json_ImportModelSql]
As
Select
    databasename
  , model_filename
  , model_utf8
  , isModelJson

  /*
Update ssas.model_json Set model_json =
(
Select BulkColumn 
From 
OpenRowset ( Bulk 'D:\aaa\bbb\ccc\Model.bim', Single_Clob )
As j
)
Where databasename = 'MySsasDatabase'
GO
*/
  , ImportModelSql = Concat (
                                'Update ssas.model_json Set model_utf8 = '
                              , Char ( 13 ) + Char ( 10 )
                              , '('
                              , Char ( 13 ) + Char ( 10 )
                              , 'Select BulkColumn '
                              , Char ( 13 ) + Char ( 10 )
                              , 'From '
                              , Char ( 13 ) + Char ( 10 )
                              , 'OpenRowset ( Bulk '''
                              , model_filename
                              , ''', Single_Blob )'
                              , Char ( 13 ) + Char ( 10 )
                              , 'As j'
                              , Char ( 13 ) + Char ( 10 )
                              , ')'
                              , Char ( 13 ) + Char ( 10 )
                              , 'Where databasename = '''
                              , databasename
                              , ''''
                              , Char ( 13 ) + Char ( 10 )
                              , 'GO'
                              , Char ( 13 ) + Char ( 10 )
                            )
From
    ssas.model_json
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2660d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_ImportModelSql', @level2type = N'COLUMN', @level2name = N'ImportModelSql';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2560d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_ImportModelSql', @level2type = N'COLUMN', @level2name = N'isModelJson';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '28064fc7-110b-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_ImportModelSql', @level2type = N'COLUMN', @level2name = N'model_utf8';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2360d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_ImportModelSql', @level2type = N'COLUMN', @level2name = N'model_filename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2260d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_ImportModelSql', @level2type = N'COLUMN', @level2name = N'databasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '0760d8ee-e90a-ec11-8516-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_ImportModelSql';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [ssas].[model_json]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_ImportModelSql';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_ImportModelSql';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_ImportModelSql';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:ssas.model_json.adoc[]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_ImportModelSql';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json].[model_utf8]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_ImportModelSql', @level2type = N'COLUMN', @level2name = N'model_utf8';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json].[model_filename]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_ImportModelSql', @level2type = N'COLUMN', @level2name = N'model_filename';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json].[isModelJson]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_ImportModelSql', @level2type = N'COLUMN', @level2name = N'isModelJson';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'(isjson([model_json]))', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_ImportModelSql', @level2type = N'COLUMN', @level2name = N'isModelJson';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [ssas].[model_json].[databasename]', @level0type = N'SCHEMA', @level0name = N'ssas', @level1type = N'VIEW', @level1name = N'model_json_ImportModelSql', @level2type = N'COLUMN', @level2name = N'databasename';

