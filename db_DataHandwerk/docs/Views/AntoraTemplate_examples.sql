

/*
<<property_start>>MS_Description
* generates the content for the 'partial$template/master-page-examples.adoc[]'
* uses all properties with prefix 'example' (here: exampleAbc)

====
....
	ifdef::ExistsProperty--exampleabc[]

	.Abc
	====
	[source,sql]
	----
	include::partial${docname}.adoc[tag=exampleabc]
	----
	====

	endif::ExistsProperty--exampleabc[]
....
====
<<property_end>>
*/
CREATE View [docs].[AntoraTemplate_examples]
As
Select
    page_content = Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 ) + '== Examples'
                   --
                   + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                   + String_Agg (
                                    Concat (
                                               Cast(N'' As Varchar(Max))
                                             , 'ifdef::ExistsProperty--' + Lower ( property_name ) + '[]'
                                             , Char ( 13 ) + Char ( 10 )
                                             , Char ( 13 ) + Char ( 10 )
                                             , '.' + Substring ( property_name, 8, Len ( property_name ))
                                             , Char ( 13 ) + Char ( 10 )
                                             , '===='
                                             , Char ( 13 ) + Char ( 10 )
                                             , '[source,sql]'
                                             , Char ( 13 ) + Char ( 10 )
                                             , '----'
                                             , Char ( 13 ) + Char ( 10 )
                                             , 'include::partial${docname}.adoc[tag=' + Lower ( property_name ) + ']'
                                             , Char ( 13 ) + Char ( 10 )
                                             , '----'
                                             , Char ( 13 ) + Char ( 10 )
                                             , '===='
                                             , Char ( 13 ) + Char ( 10 )
                                             , Char ( 13 ) + Char ( 10 )
                                             , 'endif::ExistsProperty--' + Lower ( property_name ) + '[]'
                                             , Char ( 13 ) + Char ( 10 )
                                           )
                                  , Char ( 13 ) + Char ( 10 )
                                ) Within Group(Order By
                                                   property_name)
From
    [property].PropertyName_RepoObject
Where
    property_name Like 'example%';
Go

Execute sp_addextendedproperty
    @name = N'RepoObjectColumn_guid'
  , @value = 'f530c24a-759b-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraTemplate_examples'
  , @level2type = N'COLUMN'
  , @level2name = N'page_content';
Go

Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'f430c24a-759b-eb11-84f5-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'docs'
  , @level1type = N'VIEW'
  , @level1name = N'AntoraTemplate_examples';

GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [property].[PropertyName_RepoObject]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraTemplate_examples';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'
* generates the content for the ''partial$template/master-page-examples.adoc[]''
* uses all properties with prefix ''example'' (here: exampleAbc)

====
....
	ifdef::ExistsProperty--exampleabc[]

	.Abc
	====
	[source,sql]
	----
	include::partial${docname}.adoc[tag=exampleabc]
	----
	====

	endif::ExistsProperty--exampleabc[]
....
====', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraTemplate_examples';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:property.PropertyName_RepoObject.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'AntoraTemplate_examples';

