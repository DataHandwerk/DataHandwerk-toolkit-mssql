

/*
<<property_start>>MS_Description
* based on master.dbo.spt_values, which  is an undocumemted hidden view or table, containing useful entries 
* master.dbo.spt_values content is available as copy in xref:sqldb:config.spt_values.adoc[]
<<property_end>>
*/
CREATE VIEW [config].[type]
AS
--
SELECT [type] = TRIM([type])
 , [type_desc] = TRIM([type_desc])
 , is_DocsOutput = CASE 
  WHEN [type] IN (
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
   THEN 1
  ELSE 0
  END
FROM (
 SELECT PARSENAME(REPLACE([name], ':', '.'), 2) AS [type]
  , TRIM(PARSENAME(REPLACE([name], ':', '.'), 1)) AS [type_desc]
 FROM [config].spt_values
 WHERE [type] = 'O9T'
  AND [number] = - 1
 ) T1

GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'd98f291c-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'VIEW', @level1name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7df17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'VIEW', @level1name = N'type', @level2type = N'COLUMN', @level2name = N'type_desc';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '7cf17926-9d61-eb11-84dc-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'VIEW', @level1name = N'type', @level2type = N'COLUMN', @level2name = N'type';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '2ae90a1e-7495-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'VIEW', @level1name = N'type', @level2type = N'COLUMN', @level2name = N'is_DocsOutput';

