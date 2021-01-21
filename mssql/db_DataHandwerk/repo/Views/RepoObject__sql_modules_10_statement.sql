
/*extract class Statement, it should be the one and only node on first level*/

CREATE VIEW [repo].[RepoObject__sql_modules_10_statement]
AS
--
SELECT
       [T1].[RepoObject_guid]
     , [ro].[SysObject_fullname]
     , [T1].[sql_modules_json]
     , [j2].*
FROM
     [repo].[RepoObject__sql_modules] AS T1
     CROSS APPLY
     OPENJSON(T1.[sql_modules_json]) 
	 WITH(
	 class NVARCHAR(500) N'$.class' 
	 , is_group BIT N'$.is_group' 
	 , is_keyword BIT N'$.is_keyword' 
	 , is_whitespace BIT N'$.is_whitespace' 
	 , normalized NVARCHAR(MAX) N'$.normalized' 
	 , children NVARCHAR(MAX) N'$.children' AS JSON
	 ) AS j2
     LEFT JOIN
     [repo].[RepoObject] AS ro
     ON ro.[RepoObject_guid] = T1.[RepoObject_guid]
WHERE  [T1].[is_json_sql_modules_json] = 1
       AND [j2].[class] = 'Statement'