/*
<<property_start>>MS_Description
* extract multiple substrings between two tags from @string
* each part between @pattern1 and @pattern2 resultes in one row
* split the extracted substring_net into the parts for and after the first EOL (end of line)
** substring_netPreEol
** substring_netPostEol
<<property_end>>


<<property_start>>example1
DECLARE 
 @string NVARCHAR(max)
 , @pattern1 NVARCHAR(1000)
 , @pattern2 NVARCHAR(1000)

SET @string = '
<<tag-marker_start>>bbb
row 1 of bbb
row 2 of bbb
<<tag-marker_end>>
<<tag-marker_start>>ccc
row 1 of ccc
row 2 of 222
<<tag-marker_end>>
'
SET @pattern1 = CHAR(13) + CHAR(10) + '<<tag-marker_start>>'
SET @pattern2 = CHAR(13) + CHAR(10) + '<<tag-marker_end>>'

SELECT *
FROM tool.[ftv_extract_substrings](@string, @pattern1, @pattern2)
<<property_end>>

<<property_start>>example2
SELECT
 --
 [RepoObject_guid]
 , [sql_modules_definition]
 , es.*
FROM [repo].[RepoObject_SqlModules_Repo_Sys]
CROSS APPLY tool.[ftv_extract_substrings]([sql_modules_definition], CHAR(13) + CHAR(10) + '<<property_start>>', CHAR(13) + CHAR(10) + '<<property_end>>') es
<<property_end>>


*/
CREATE FUNCTION [tool].[ftv_extract_substrings] (
 @string NVARCHAR(max)
 , @pattern1 NVARCHAR(1000)
 , @pattern2 NVARCHAR(1000)
 )
RETURNS TABLE
AS
RETURN (
  WITH positions AS (
    SELECT pos1
     , pos2
     , string
    FROM (
     SELECT patindex('%' + @pattern1 + '%', @string) pos1
      , patindex('%' + @pattern2 + '%', @string) pos2
      , @string AS string
     ) firstpattern
    --WHERE pos2 > pos1
    
    UNION ALL
    
    SELECT pos1 + patindex('%' + @pattern1 + '%', substring(@string, pos1 + 1, len(@string))) pos1
     , pos2 + patindex('%' + @pattern2 + '%', substring(@string, pos2 + 1, len(@string))) pos2
     , @string
    FROM positions
    WHERE
     --
     patindex('%' + @pattern1 + '%', substring(@string, pos1 + 1, len(@string))) > 0
     OR patindex('%' + @pattern2 + '%', substring(@string, pos2 + 1, len(@string))) > 0
    )
   , result1 AS (
    SELECT
     --
     pos1
     , pos2
     , substring_gross = iif(pos2 > pos1, substring(@string, pos1, pos2 - pos1), NULL)
     , substring_net = iif(pos2 > pos1 + len(@pattern1), substring(@string, pos1 + len(@pattern1), pos2 - pos1 - len(@pattern1)), NULL)
     , len(@pattern1) AS len1
     , len(@pattern2) AS len2
    FROM positions
    )
  SELECT
   --
   pos1
   , pos2
   , substring_gross
   , substring_net
   , substring_netPreEol = substring(substring_net, 0, patindex('%' + CHAR(13) + CHAR(10) + '%', substring_net))
   , substring_netPostEol = substring(substring_net, patindex('%' + CHAR(13) + CHAR(10) + '%', substring_net), len(substring_net))
   , pos1eol = patindex('%' + CHAR(13) + CHAR(10) + '%', substring_net)
   , len1
   , len2
  FROM result1
  )
 --, substring_netToEol = iif(pos2 > pos1 + len(@pattern1), substring(@string, pos1 + len(@pattern1), pos2 - pos1 - len(@pattern1)), NULL)
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'a1e4202c-e299-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'tool', @level1type = N'FUNCTION', @level1name = N'ftv_extract_substrings';

