﻿/*
code of this procedure is managed in the dhw repository. Do not modify manually.
Use [uspgenerator].[GeneratorUsp], [uspgenerator].[GeneratorUspParameter], [uspgenerator].[GeneratorUspStep], [uspgenerator].[GeneratorUsp_SqlUsp]
*/
CREATE   PROCEDURE [docs].[usp_AntoraExport]
@isExecuteCommand BIT = 0 /* specify whether the commands, collected in [docs].[command], should be executed using "Exec sys.xp_cmdshell" */
,
----keep the code between logging parameters and "START" unchanged!
---- parameters, used for logging; you don't need to care about them, but you can use them, wenn calling from SSIS or in your workflow to log the context of the procedure call
  @execution_instance_guid UNIQUEIDENTIFIER = NULL --SSIS system variable ExecutionInstanceGUID could be used, any other unique guid is also fine. If NULL, then NEWID() is used to create one
, @ssis_execution_id BIGINT = NULL --only SSIS system variable ServerExecutionID should be used, or any other consistent number system, do not mix different number systems
, @sub_execution_id INT = NULL --in case you log some sub_executions, for example in SSIS loops or sub packages
, @parent_execution_log_id BIGINT = NULL --in case a sup procedure is called, the @current_execution_log_id of the parent procedure should be propagated here. It allowes call stack analyzing

AS
BEGIN
DECLARE
 --
   @current_execution_log_id BIGINT --this variable should be filled only once per procedure call, it contains the first logging call for the step 'start'.
 , @current_execution_guid UNIQUEIDENTIFIER = NEWID() --a unique guid for any procedure call. It should be propagated to sub procedures using "@parent_execution_log_id = @current_execution_log_id"
 , @source_object NVARCHAR(261) = NULL --use it like '[schema].[object]', this allows data flow vizualizatiuon (include square brackets)
 , @target_object NVARCHAR(261) = NULL --use it like '[schema].[object]', this allows data flow vizualizatiuon (include square brackets)
 , @proc_id INT = @@procid
 , @proc_schema_name NVARCHAR(128) = OBJECT_SCHEMA_NAME(@@procid) --schema ande name of the current procedure should be automatically logged
 , @proc_name NVARCHAR(128) = OBJECT_NAME(@@procid)               --schema ande name of the current procedure should be automatically logged
 , @event_info NVARCHAR(MAX)
 , @step_id INT = 0
 , @step_name NVARCHAR(1000) = NULL
 , @rows INT

--[event_info] get's only the information about the "outer" calling process
--wenn the procedure calls sub procedures, the [event_info] will not change
SET @event_info = (
  SELECT TOP 1 [event_info]
  FROM sys.dm_exec_input_buffer(@@spid, CURRENT_REQUEST_ID())
  ORDER BY [event_info]
  )

IF @execution_instance_guid IS NULL
 SET @execution_instance_guid = NEWID();
--
--SET @rows = @@ROWCOUNT;
SET @step_id = @step_id + 1
SET @step_name = 'start'
SET @source_object = NULL
SET @target_object = NULL

EXEC logs.usp_ExecutionLog_insert
 --these parameters should be the same for all logging execution
   @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @parent_execution_log_id
 , @current_execution_guid = @current_execution_guid
 , @proc_id = @proc_id
 , @proc_schema_name = @proc_schema_name
 , @proc_name = @proc_name
 , @event_info = @event_info
 --the following parameters are individual for each call
 , @step_id = @step_id --@step_id should be incremented before each call
 , @step_name = @step_name --assign individual step names for each call
 --only the "start" step should return the log id into @current_execution_log_id
 --all other calls should not overwrite @current_execution_log_id
 , @execution_log_id = @current_execution_log_id OUTPUT
----you can log the content of your own parameters, do this only in the start-step
----data type is sql_variant
 , @parameter_01 = @isExecuteCommand
--
PRINT '[docs].[usp_AntoraExport]'
--keep the code between logging parameters and "START" unchanged!
--
----START
--
----- start here with your own code
--
/*{"ReportUspStep":[{"Number":210,"Name":"declare variables","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":0}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',27,';',210,';',NULL);

DECLARE @command NVARCHAR(4000)
DECLARE @cultures_name NVARCHAR(10)
Declare @AntoraModule Varchar(50)



/*{"ReportUspStep":[{"Number":220,"Name":"Truncate Table [docs].[command]","has_logging":0,"is_condition":0,"is_inactive":0,"is_SubProcedure":0}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',27,';',220,';',NULL);

Truncate Table [docs].[command]


/*{"ReportUspStep":[{"Number":300,"Name":"check Parameter AntoraDeleteFilesInModuleFolders","has_logging":0,"is_condition":1,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[config].[Parameter]"}]}*/
IF [config].[fs_get_parameter_value]('AntoraDeleteFilesInModuleFolders','') = 1

/*{"ReportUspStep":[{"Number":310,"Parent_Number":300,"Name":"Delete Files but not folder in AntoraModule pages and partials - by cultures_name","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_flag_InsertUpdateDelete":"I"}]}*/
BEGIN
PRINT CONCAT('usp_id;Number;Parent_Number: ',27,';',310,';',300);

Declare module_cursor Cursor Local Fast_Forward For
Select
    cultures_name
From
    docs.culture
Order By
    cultures_name

Open module_cursor

Fetch Next From module_cursor
Into
    @cultures_name

While @@Fetch_Status = 0
Begin

    /*
FORFILES /p "D:\Repos\gitlab\DataHandwerk\dhw-antora-sqldb\docs\modules\sqldb\partials" /s /m *.* /c "cmd /c if @isdir==FALSE del @path"
*/
    Set @command
        = N'FORFILES /p "'
          --
          --
          + docs.fs_AntoraModuleFolder ( @cultures_name )
          + '\partials'
          --
          + N'" /s /m *.* /c "cmd /c if @isdir==FALSE del @path"'

    Print @command
    
    INSERT Into [docs].[command]
    (command)
    VALUES(@command)

    ----Execute the BCP command
    --Exec sys.xp_cmdshell @command, no_output

    Set @command
        = N'FORFILES /p "'
          --
          --
          + docs.fs_AntoraModuleFolder ( @cultures_name )
          + '\pages'
          --
          + N'" /s /m *.* /c "cmd /c if @isdir==FALSE del @path"'

    Print @command

    INSERT Into [docs].[command]
    (command)
    VALUES(@command)

    ----Execute the BCP command
    --Exec sys.xp_cmdshell @command, no_output

    Fetch Next From module_cursor
    Into
        @cultures_name
End

Close module_cursor
Deallocate module_cursor

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'Delete Files but not folder in AntoraModule pages and partials - by cultures_name'
SET @source_object = NULL
SET @target_object = NULL

EXEC logs.usp_ExecutionLog_insert 
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @parent_execution_log_id
 , @current_execution_guid = @current_execution_guid
 , @proc_id = @proc_id
 , @proc_schema_name = @proc_schema_name
 , @proc_name = @proc_name
 , @event_info = @event_info
 , @step_id = @step_id
 , @step_name = @step_name
 , @source_object = @source_object
 , @target_object = @target_object
 , @inserted = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":320,"Parent_Number":310,"Name":"Delete Files but not folder in AntoraModule pages and partials - by SSIS AntoraModule","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_flag_InsertUpdateDelete":"I"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',27,';',320,';',310);

Declare module_cursor Cursor Local Fast_Forward For
Select
    AntoraModule
From
    ssis.Project
Order By
    AntoraModule

Open module_cursor

Fetch Next From module_cursor
Into
    @AntoraModule

While @@Fetch_Status = 0
Begin

    /*
FORFILES /p "D:\Repos\gitlab\DataHandwerk\dhw-antora-sqldb\docs\modules\sqldb\partials" /s /m *.* /c "cmd /c if @isdir==FALSE del @path"
*/
    Set @command = N'FORFILES /p "'
                   --
                   --
                   + config.fs_get_parameter_value ( 'AntoraComponentFolder', '' ) + '\modules\' + @AntoraModule
                   --
                   + '\partials'
                   --
                   + N'" /s /m *.* /c "cmd /c if @isdir==FALSE del @path"'

    Print @command

    INSERT Into [docs].[command]
    (command)
    VALUES(@command)

    ----Execute the BCP command
    --Exec sys.xp_cmdshell @command, no_output

    Set @command = N'FORFILES /p "'
                   --
                   --
                   + config.fs_get_parameter_value ( 'AntoraComponentFolder', '' ) + '\modules\' + @AntoraModule
                   --
                   + '\pages'
                   --
                   + N'" /s /m *.* /c "cmd /c if @isdir==FALSE del @path"'

    Print @command

    INSERT Into [docs].[command]
    (command)
    VALUES(@command)

    ----Execute the BCP command
    --Exec sys.xp_cmdshell @command, no_output

    Fetch Next From module_cursor
    Into
        @AntoraModule
End

Close module_cursor
Deallocate module_cursor

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'Delete Files but not folder in AntoraModule pages and partials - by SSIS AntoraModule'
SET @source_object = NULL
SET @target_object = NULL

EXEC logs.usp_ExecutionLog_insert 
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @parent_execution_log_id
 , @current_execution_guid = @current_execution_guid
 , @proc_id = @proc_id
 , @proc_schema_name = @proc_schema_name
 , @proc_name = @proc_name
 , @event_info = @event_info
 , @step_id = @step_id
 , @step_name = @step_name
 , @source_object = @source_object
 , @target_object = @target_object
 , @inserted = @rows
-- Logging END --
END;

/*{"ReportUspStep":[{"Number":400,"Name":"[docs].[usp_PERSIST_RepoObject_OutputFilter_T]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [docs].[usp_PERSIST_RepoObject_OutputFilter_T]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":440,"Name":"[docs].[usp_AntoraExport_ObjectNavigation]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [docs].[usp_AntoraExport_ObjectNavigation]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":500,"Name":"[docs].[usp_AntoraExport_ObjectPage]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [docs].[usp_AntoraExport_ObjectPage]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":600,"Name":"[docs].[usp_AntoraExport_ObjectPageTemplate]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [docs].[usp_AntoraExport_ObjectPageTemplate]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":800,"Name":"[docs].[usp_AntoraExport_ObjectPuml]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [docs].[usp_AntoraExport_ObjectPuml]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":850,"Name":"[docs].[usp_AntoraExport_ObjectPartialsContent]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [docs].[usp_AntoraExport_ObjectPartialsContent]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":910,"Name":"[docs].[usp_AntoraExport_Page_IndexSemanticGroup]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [docs].[usp_AntoraExport_Page_IndexSemanticGroup]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":920,"Name":"[docs].[usp_AntoraExport_ObjectRefCyclic]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [docs].[usp_AntoraExport_ObjectRefCyclic]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":1440,"Name":"[docs].[usp_AntoraExport_SsisNavigation]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [docs].[usp_AntoraExport_SsisNavigation]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":1500,"Name":"[docs].[usp_AntoraExport_SsisPage]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [docs].[usp_AntoraExport_SsisPage]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":1600,"Name":"[docs].[usp_AntoraExport_SsisPageTemplate]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [docs].[usp_AntoraExport_SsisPageTemplate]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":1800,"Name":"[docs].[usp_AntoraExport_SsisPuml]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [docs].[usp_AntoraExport_SsisPuml]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":1850,"Name":"[docs].[usp_AntoraExport_SsisPartialsContent]","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":1}]}*/
EXEC [docs].[usp_AntoraExport_SsisPartialsContent]
--add your own parameters
--logging parameters
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @current_execution_log_id


/*{"ReportUspStep":[{"Number":2000,"Name":"INSERT Into [docs].[command] empty line","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_flag_InsertUpdateDelete":"I"}]}*/
PRINT CONCAT('usp_id;Number;Parent_Number: ',27,';',2000,';',NULL);

    Set @command
        = N''
    INSERT Into [docs].[command]
    (command)
    VALUES(@command)


-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'INSERT Into [docs].[command] empty line'
SET @source_object = NULL
SET @target_object = NULL

EXEC logs.usp_ExecutionLog_insert 
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @parent_execution_log_id
 , @current_execution_guid = @current_execution_guid
 , @proc_id = @proc_id
 , @proc_schema_name = @proc_schema_name
 , @proc_name = @proc_name
 , @event_info = @event_info
 , @step_id = @step_id
 , @step_name = @step_name
 , @source_object = @source_object
 , @target_object = @target_object
 , @inserted = @rows
-- Logging END --

/*{"ReportUspStep":[{"Number":3000,"Name":"check Parameter isExecuteCommand","has_logging":0,"is_condition":1,"is_inactive":0,"is_SubProcedure":0,"log_source_object":"[config].[Parameter]"}]}*/
IF @isExecuteCommand = 1

/*{"ReportUspStep":[{"Number":3010,"Parent_Number":3000,"Name":"Execute commands, collected in [docs].[command], using \"Exec sys.xp_cmdshell\"","has_logging":1,"is_condition":0,"is_inactive":0,"is_SubProcedure":0,"log_flag_InsertUpdateDelete":"I"}]}*/
BEGIN
PRINT CONCAT('usp_id;Number;Parent_Number: ',27,';',3010,';',3000);

Declare command_cursor Cursor Local Fast_Forward For
Select
    command
From
    docs.command
Order By
    id

Open command_cursor

Fetch Next From command_cursor
Into
    @command

While @@Fetch_Status = 0
Begin

    Print @command

    --Execute the BCP command
    Exec sys.xp_cmdshell @command, no_output

    Fetch Next From command_cursor
    Into
        @command
End

Close command_cursor
Deallocate command_cursor

-- Logging START --
SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'Execute commands, collected in [docs].[command], using "Exec sys.xp_cmdshell"'
SET @source_object = NULL
SET @target_object = NULL

EXEC logs.usp_ExecutionLog_insert 
 @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @parent_execution_log_id
 , @current_execution_guid = @current_execution_guid
 , @proc_id = @proc_id
 , @proc_schema_name = @proc_schema_name
 , @proc_name = @proc_name
 , @event_info = @event_info
 , @step_id = @step_id
 , @step_name = @step_name
 , @source_object = @source_object
 , @target_object = @target_object
 , @inserted = @rows
-- Logging END --
END;

--
--finish your own code here
--keep the code between "END" and the end of the procedure unchanged!
--
--END
--
--SET @rows = @@ROWCOUNT
SET @step_id = @step_id + 1
SET @step_name = 'end'
SET @source_object = NULL
SET @target_object = NULL

EXEC logs.usp_ExecutionLog_insert
   @execution_instance_guid = @execution_instance_guid
 , @ssis_execution_id = @ssis_execution_id
 , @sub_execution_id = @sub_execution_id
 , @parent_execution_log_id = @parent_execution_log_id
 , @current_execution_guid = @current_execution_guid
 , @proc_id = @proc_id
 , @proc_schema_name = @proc_schema_name
 , @proc_name = @proc_name
 , @event_info = @event_info
 , @step_id = @step_id
 , @step_name = @step_name
 , @source_object = @source_object
 , @target_object = @target_object

END
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'c51b7592-0397-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [docs].[usp_AntoraExport_DocSnippet]
* [docs].[usp_AntoraExport_navigation]
* [docs].[usp_AntoraExport_ObjectPage]
* [docs].[usp_AntoraExport_ObjectPageTemplate]
* [docs].[usp_AntoraExport_ObjectPartialProperties]
* [docs].[usp_AntoraExport_ObjectPuml]
* [docs].[usp_AntoraExport_ObjectRefCyclic]
* [docs].[usp_AntoraExport_Page_IndexSemanticGroup]
* [logs].[usp_ExecutionLog_insert]
* [property].[usp_RepoObjectProperty_collect]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport';




GO











GO
EXECUTE sp_addextendedproperty @name = N'ExampleUsage', @value = N'--ensure consistent and existing repository guid before sql parsing:
--call repo.usp_sync_guid (quick and minimal) or repo.usp_main (takes more time)
Exec repo.usp_sync_guid;

--use sqlparser to parse sql definitions for views and import parsing results
--for example in the folder containing the sqlparser.py call
--py sqlparser.py --server localhost\sql2019 --database dhw_mydatabase

--persist sql parsing results:
Exec sqlparse.usp_sqlparse

--ensure consistent repository after sql parsing:
Exec repo.usp_main;

--export Antora documentation sources
Exec docs.usp_AntoraExport;', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport';




GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:docs.usp_AntoraExport_DocSnippet.adoc[]
* xref:docs.usp_AntoraExport_navigation.adoc[]
* xref:docs.usp_AntoraExport_ObjectPage.adoc[]
* xref:docs.usp_AntoraExport_ObjectPageTemplate.adoc[]
* xref:docs.usp_AntoraExport_ObjectPartialProperties.adoc[]
* xref:docs.usp_AntoraExport_ObjectPuml.adoc[]
* xref:docs.usp_AntoraExport_ObjectRefCyclic.adoc[]
* xref:docs.usp_AntoraExport_Page_IndexSemanticGroup.adoc[]
* xref:logs.usp_ExecutionLog_insert.adoc[]
* xref:property.usp_RepoObjectProperty_collect.adoc[]', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport';




GO
EXECUTE sp_addextendedproperty @name = N'AdocUspSteps', @value = N'.Steps in [docs].[usp_AntoraExport]
[cols="d,15a,d"]
|===
|Number|Name (Action, Source, Target)|Parent

|300
|
*[repo].[usp_RepoObjectProperty_collect]*

* `EXEC [property].[usp_RepoObjectProperty_collect]`


.Statement
[%collapsible]
=====
[source,sql]
----
[property].[usp_RepoObjectProperty_collect]
----
=====

|


|400
|
*[docs].[usp_AntoraExport_navigation]*

* `EXEC [docs].[usp_AntoraExport_navigation]`


.Statement
[%collapsible]
=====
[source,sql]
----
[docs].[usp_AntoraExport_navigation]
----
=====

|


|410
|
*[docs].[usp_AntoraExport_DocSnippet]*

* `EXEC [docs].[usp_AntoraExport_DocSnippet]`


.Statement
[%collapsible]
=====
[source,sql]
----
[docs].[usp_AntoraExport_DocSnippet]
----
=====

|


|500
|
*[docs].[usp_AntoraExport_ObjectPage]*

* `EXEC [docs].[usp_AntoraExport_ObjectPage]`


.Statement
[%collapsible]
=====
[source,sql]
----
[docs].[usp_AntoraExport_ObjectPage]
----
=====

|


|600
|
*[docs].[usp_AntoraExport_ObjectPageTemplate]*

* `EXEC [docs].[usp_AntoraExport_ObjectPageTemplate]`


.Statement
[%collapsible]
=====
[source,sql]
----
[docs].[usp_AntoraExport_ObjectPageTemplate]
----
=====

|


|750
|
*[docs].[usp_AntoraExport_ObjectPartialProperties]*

* `EXEC [docs].[usp_AntoraExport_ObjectPartialProperties]`


.Statement
[%collapsible]
=====
[source,sql]
----
[docs].[usp_AntoraExport_ObjectPartialProperties]
----
=====

|


|800
|
*[docs].[usp_AntoraExport_ObjectPuml]*

* `EXEC [docs].[usp_AntoraExport_ObjectPuml]`


.Statement
[%collapsible]
=====
[source,sql]
----
[docs].[usp_AntoraExport_ObjectPuml]
----
=====

|


|910
|
*[docs].[usp_AntoraExport_Page_IndexSemanticGroup]*

* `EXEC [docs].[usp_AntoraExport_Page_IndexSemanticGroup]`


.Statement
[%collapsible]
=====
[source,sql]
----
[docs].[usp_AntoraExport_Page_IndexSemanticGroup]
----
=====

|


|920
|
*[docs].[usp_AntoraExport_ObjectRefCyclic]*

* `EXEC [docs].[usp_AntoraExport_ObjectRefCyclic]`


.Statement
[%collapsible]
=====
[source,sql]
----
[docs].[usp_AntoraExport_ObjectRefCyclic]
----
=====

|

|===
', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport';






GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport';

