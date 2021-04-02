
CREATE VIEW [docs].[RepoObject_AntoraSource]
AS
SELECT [roa].[RepoObject_guid]
 , [roa].[SysObject_type]
 , [roa].[SysObject_type_name]
 , [roa].[RepoObject_fullname]
 , [roa].[RepoObject_fullname2]
 , [roa].[RepoObject_schema_name]
FROM [docs].[RepoObject_Adoc] AS roa
WHERE [SysObject_type] IN (
  'U'
  , 'V'
  , 'FN'
  , 'FS'
  , 'FT'
  , 'IF'
  , 'IS'
  , 'P'
  , 'PC'
  , 'SN'
  , 'SO'
  , 'TF'
  , 'TR'
  , 'X'
  )
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'ed5bf6c2-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_AntoraSource';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '721254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_AntoraSource', @level2type = N'COLUMN', @level2name = N'SysObject_type_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '711254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_AntoraSource', @level2type = N'COLUMN', @level2name = N'SysObject_type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '607fb592-1293-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_AntoraSource', @level2type = N'COLUMN', @level2name = N'RepoObject_schema_name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '701254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_AntoraSource', @level2type = N'COLUMN', @level2name = N'RepoObject_guid';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '741254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_AntoraSource', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname2';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '731254dc-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'RepoObject_AntoraSource', @level2type = N'COLUMN', @level2name = N'RepoObject_fullname';

