CREATE SCHEMA [sqlparse]
    AUTHORIZATION [dbo];


























GO
EXECUTE sp_addextendedproperty @name = N'RepoSchema_guid', @value = '2199d297-86a3-eb11-84fa-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'sqlparse';


GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'contains objects around xref:manual:sqlparser.adoc[]

include::manual:page$sqlparser.adoc[tag=shortdescription]

see also: xref:manual:sqlparse-to-get-col-references.adoc[]
', @level0type = N'SCHEMA', @level0name = N'sqlparse';

