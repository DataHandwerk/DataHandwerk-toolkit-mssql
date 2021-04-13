/*
create the procedure sp_generate_merge in master database
details: https://github.com/readyroll/generate-sql-merge

issue in orignal procedure with sql_variant content!

this will create sql statements to merge data into a target table
these scrpits can be included in database projects to use in post deployment scripts in DACPAC

https://documentation.red-gate.com/rr1/key-concepts/data-population/static-data#StaticData-offline

ATTENTION:
for sql_variant type the procedure generates wrong code:
[repo].[Parameter]
[repo].[RepoObjectColumnProperty]
[repo].[RepoObjectProperty]

*/

Create Procedure [config].usp_generate_merge
As

--issues with sql_variant
Exec sp_generate_merge
    @table_name = 'Parameter'
  , @schema = 'repo'
  , @debug_mode = 1;

Exec sp_generate_merge
    @table_name = 'GeneratorUsp'
  , @schema = 'repo'
  , @debug_mode = 1;
Exec sp_generate_merge
    @table_name = 'GeneratorUspParameter'
  , @schema = 'repo'
  , @debug_mode = 1;
Exec sp_generate_merge
    @table_name = 'GeneratorUspStep'
  , @schema = 'repo'
  , @debug_mode = 1;

--todo: store and get all columns in extended properties
/*
TITLE: Microsoft SQL Server Management Studio
------------------------------

Unable to show XML. The following error happened:
Unexpected end of file while parsing PI has occurred. Line 162, position 154777.

One solution is to increase the number of characters retrieved from the server for XML data. To change this setting, on the Tools menu, click Options.

------------------------------
BUTTONS:

OK
------------------------------


Menu > Tools > Options > Query Results > Results to Grid > XML Data
default is 2 MB, set to unlimited

But this can crash SSMS

*/
Exec sp_generate_merge
    @table_name = 'RepoObject'
  , @schema = 'repo'
  , @debug_mode = 1;
--todo: store and get all columns in extended properties
Exec sp_generate_merge
    @table_name = 'RepoObject_persistence'
  , @schema = 'repo'
  , @debug_mode = 1;
-- RepoObject_SqlModules can be easy restored using the python script SqlParser.py
Exec sp_generate_merge
    @table_name = 'RepoObject_SqlModules'
  , @schema = 'repo'
  , @debug_mode = 1;

----not required, get properties using [repo].[usp_sync_ExtendedProperties_Sys2Repo_InsertUpdate]
----issues with sql_variant
--EXEC sp_generate_merge @table_name = 'RepoObjectProperty', @schema = 'repo', @debug_mode = 1

Exec sp_generate_merge
    @table_name = 'RepoObjectColumn'
  , @schema = 'repo'
  , @debug_mode = 1;
----not required, get properties using [repo].[usp_sync_ExtendedProperties_Sys2Repo_InsertUpdate]
----issues with sql_variant
--EXEC sp_generate_merge @table_name = 'RepoObjectColumnProperty', @schema = 'repo', @debug_mode = 1

----currently only the SqlParser data is used
--EXEC sp_generate_merge @table_name = 'RepoObjectSource_FirstResultSet', @schema = 'repo', @debug_mode = 1
--EXEC sp_generate_merge @table_name = 'RepoObjectSource_QueryPlan', @schema = 'repo', @debug_mode = 1

Exec sp_generate_merge
    @table_name = 'Index_virtual'
  , @schema = 'repo'
  , @debug_mode = 1;
Exec sp_generate_merge
    @table_name = 'IndexColumn_virtual'
  , @schema = 'repo'
  , @debug_mode = 1;
Exec sp_generate_merge
    @table_name = 'Index_Settings'
  , @schema = 'repo'
  , @debug_mode = 1;

Exec sp_generate_merge
    @table_name = 'ProcedureInstance'
  , @schema = 'repo'
  , @debug_mode = 1;
Exec sp_generate_merge
    @table_name = 'ProcedureInstanceDependency'
  , @schema = 'repo'
  , @debug_mode = 1;
Exec sp_generate_merge
    @table_name = 'Workflow'
  , @schema = 'repo'
  , @debug_mode = 1;
Exec sp_generate_merge
    @table_name = 'WorkflowStep'
  , @schema = 'repo'
  , @debug_mode = 1;
Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'fcafba8c-ad72-eb11-84e3-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'config'
  , @level1type = N'PROCEDURE'
  , @level1name = N'usp_generate_merge';

