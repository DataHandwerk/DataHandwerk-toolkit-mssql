/*
<<property_start>>Description
* extract multiple substrings between two tags from @string
* each part between @pattern1 and @pattern2 resultes in one row
* split the extracted substring_net into the parts for and after the first EOL (end of line)
** substring_netPreEol
** substring_netPostEol
<<property_end>>


<<property_start>>exampleUsage
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

<<property_start>>exampleUsage_2
SELECT
 --
 [RepoObject_guid]
 , [sql_modules_definition]
 , es.*
FROM [repo].[RepoObject_SqlModules_Repo_Sys]
CROSS APPLY tool.[ftv_extract_substrings]([sql_modules_definition], CHAR(13) + CHAR(10) + '<<property_start>>', CHAR(13) + CHAR(10) + '<<property_end>>') es
<<property_end>>


*/
CREATE Function [tool].[ftv_extract_substrings]
(
    @string   NVarchar(Max)
  , @pattern1 NVarchar(1000)
  , @pattern2 NVarchar(1000)
)
Returns Table
As
Return
(
    With
    positions
    As
        (
        Select
            pos1
          , pos2
          , string
        From
        (
            Select
                PatIndex ( '%' + @pattern1 + '%', @string ) pos1
              , PatIndex ( '%' + @pattern2 + '%', @string ) pos2
              , @string                                     As string
        ) firstpattern
        --WHERE pos2 > pos1
        Union All
        Select
            pos1 + PatIndex ( '%' + @pattern1 + '%', Substring ( @string, pos1 + 1, Len ( @string ))) pos1
          , pos2 + PatIndex ( '%' + @pattern2 + '%', Substring ( @string, pos2 + 1, Len ( @string ))) pos2
          , @string
        From
            positions
        Where
            --
            PatIndex ( '%' + @pattern1 + '%', Substring ( @string, pos1 + 1, Len ( @string )))    > 0
            Or PatIndex ( '%' + @pattern2 + '%', Substring ( @string, pos2 + 1, Len ( @string ))) > 0
        )
  ,
    result1
    As
        (
        Select
            --
            pos1
          , pos2
          , substring_gross   = Iif(pos2 > pos1, Substring ( @string, pos1, pos2 - pos1 ), Null)
          , substring_net     = Iif(pos2 > pos1 + Len ( @pattern1 )
                                , Substring ( @string, pos1 + Len ( @pattern1 ), pos2 - pos1 - Len ( @pattern1 ))
                                , Null)
          , Len ( @pattern1 ) As len1
          , Len ( @pattern2 ) As len2
        From
            positions
        )
    Select
        --
        pos1
      , pos2
      , substring_gross
      , substring_net
      , substring_netPreEol  = Substring (
                                             substring_net
                                           , 0
                                           , PatIndex ( '%' + Char ( 13 ) + Char ( 10 ) + '%', substring_net )
                                         )
      , substring_netPostEol = Substring (
                                             substring_net
                                           , PatIndex ( '%' + Char ( 13 ) + Char ( 10 ) + '%', substring_net )
                                           , Len ( substring_net )
                                         )
      , pos1eol              = PatIndex ( '%' + Char ( 13 ) + Char ( 10 ) + '%', substring_net )
      , len1
      , len2
    From
        result1
);
--, substring_netToEol = iif(pos2 > pos1 + len(@pattern1), substring(@string, pos1 + len(@pattern1), pos2 - pos1 - len(@pattern1)), NULL)
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'a1e4202c-e299-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'tool'
  , @level1type = N'FUNCTION'
  , @level1name = N'ftv_extract_substrings';

GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'
* extract multiple substrings between two tags from @string
* each part between @pattern1 and @pattern2 resultes in one row
* split the extracted substring_net into the parts for and after the first EOL (end of line)
** substring_netPreEol
** substring_netPostEol', @level0type = N'SCHEMA', @level0name = N'tool', @level1type = N'FUNCTION', @level1name = N'ftv_extract_substrings';


GO
EXECUTE sp_addextendedproperty @name = N'exampleUsage_2', @value = N'
SELECT
 --
 [RepoObject_guid]
 , [sql_modules_definition]
 , es.*
FROM [repo].[RepoObject_SqlModules_Repo_Sys]
CROSS APPLY tool.[ftv_extract_substrings]([sql_modules_definition], CHAR(13) + CHAR(10) + ''<<property_start>>'', CHAR(13) + CHAR(10) + ''<<property_end>>'') es', @level0type = N'SCHEMA', @level0name = N'tool', @level1type = N'FUNCTION', @level1name = N'ftv_extract_substrings';


GO
EXECUTE sp_addextendedproperty @name = N'exampleUsage', @value = N'
DECLARE 
 @string NVARCHAR(max)
 , @pattern1 NVARCHAR(1000)
 , @pattern2 NVARCHAR(1000)

SET @string = ''
<<tag-marker_start>>bbb
row 1 of bbb
row 2 of bbb
<<tag-marker_end>>
<<tag-marker_start>>ccc
row 1 of ccc
row 2 of 222
<<tag-marker_end>>
''
SET @pattern1 = CHAR(13) + CHAR(10) + ''<<tag-marker_start>>''
SET @pattern2 = CHAR(13) + CHAR(10) + ''<<tag-marker_end>>''

SELECT *
FROM tool.[ftv_extract_substrings](@string, @pattern1, @pattern2)', @level0type = N'SCHEMA', @level0name = N'tool', @level1type = N'FUNCTION', @level1name = N'ftv_extract_substrings';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:property.RepoObjectProperty_Collect_source_sql_modules_definition.adoc[]', @level0type = N'SCHEMA', @level0name = N'tool', @level1type = N'FUNCTION', @level1name = N'ftv_extract_substrings';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'tool', @level1type = N'FUNCTION', @level1name = N'ftv_extract_substrings';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'tool', @level1type = N'FUNCTION', @level1name = N'ftv_extract_substrings';

