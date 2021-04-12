
/*
<<property_start>>MS_Description
* generates the content for the 'partial$template/master-page-examples.adoc[]'
* uses all properties with prefix 'example'

====
....
	ifdef::ExistsProperty--example1[]

	.1
	====
	[source,sql]
	----
	include::partial${docname}.adoc[tag=example1]
	----
	====

	endif::ExistsProperty--example1[]
....
====
<<property_end>>
*/
CREATE VIEW [docs].[AntoraTemplate_examples]
AS
SELECT [page_content] = string_agg(CONCAT (
   CAST(N'' AS VARCHAR(max))
   , 'ifdef::ExistsProperty--' + [property_name] + '[]'
   , CHAR(13) + CHAR(10)
   , CHAR(13) + CHAR(10)
   , '.' + SUBSTRING([property_name], 8, LEN([property_name]))
   , CHAR(13) + CHAR(10)
   , '===='
   , CHAR(13) + CHAR(10)
   , '[source,sql]'
   , CHAR(13) + CHAR(10)
   , '----'
   , CHAR(13) + CHAR(10)
   , 'include::partial${docname}.adoc[tag=' + [property_name] + ']'
   , CHAR(13) + CHAR(10)
   , '----'
   , CHAR(13) + CHAR(10)
   , '===='
   , CHAR(13) + CHAR(10)
   , CHAR(13) + CHAR(10)
   , 'endif::ExistsProperty--' + [property_name] + '[]'
   , CHAR(13) + CHAR(10)
   ), CHAR(13) + CHAR(10)) within
GROUP (
  ORDER BY [property_name]
  )
FROM [repo].[PropertyName_RepoObject]
WHERE [property_name] LIKE 'example%'
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'f530c24a-759b-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraTemplate_examples', @level2type = N'COLUMN', @level2name = N'page_content';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f430c24a-759b-eb11-84f5-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraTemplate_examples';

