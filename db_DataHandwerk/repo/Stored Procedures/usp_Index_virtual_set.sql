
/*
<<property_start>>MS_Description
* Index will be inserted (or updated) into xref:sqldb:repo.index_virtual.adoc[]
* but it will not be visible in xref:sqldb:repo.index_gross.adoc[] until it was also included into xref:sqldb:repo.index_settings.adoc[]
* and after inserting a new index there could be duplicates for the same columns which needs to be removed again

That's why it is required run the folowing procedure (this also happens in xref:sqldb:repo.usp_main.adoc[])

[source,sql]
------
EXEC [repo].[usp_Index_finish]
------

index_type:

......
Type of index:
0 = Heap
1 = Clustered
2 = Nonclustered
3 = XML
4 = Spatial
5 = Clustered columnstore index. Applies to: SQL Server 2014 (12.x) and later.
6 = Nonclustered columnstore index. Applies to: SQL Server 2012 (11.x) and later.
7 = Nonclustered hash index. Applies to: SQL Server 2014 (12.x) and later.
......

<<property_end>>

<<property_start>>exampleUsage
--ensure existing guid

Exec repo.usp_sync_guid

--use @RepoObject_fullname with square brackets
--use @RepoObject_fullname2 without square brackets
--@IndexPatternColumnName can be used only without square brackets

EXEC repo.usp_Index_virtual_set
    @RepoObject_fullname2 = 'SchemaName.EntityName'
  , @IndexPatternColumnName = 'aaa,bbb'
  , @is_index_primary_key = 1
  , @IndexSemanticGroup = 'OptionalSemanticGroup';

EXEC [repo].[usp_Index_finish];
<<property_end>>

<<property_start>>exampleUsage_2
--ensure existing guid

Exec repo.usp_sync_guid

--set multiple indexes and finish them

EXEC repo.usp_Index_virtual_set
    @RepoObject_fullname = '[SchemaName].[EntityName]'
  , @IndexPatternColumnName = 'ccc'
  , @is_index_primary_key = 1;

EXEC repo.usp_Index_virtual_set
    @RepoObject_fullname2 = 'SchemaName.EntityName2'
  , @IndexPatternColumnName = 'ccc'
  , @is_index_primary_key = 0
  , @is_index_unique = 1
  , @IndexSemanticGroup = 'OptionalSemanticGroup';


EXEC [repo].[usp_Index_finish];
<<property_end>>

*/
CREATE Procedure [repo].[usp_Index_virtual_set]
    @RepoObject_guid         UniqueIdentifier = Null --if @RepoObject_guid is NULL, then @RepoObject_fullname is used
  , @RepoObject_fullname     NVarchar(261)    = Null --will be used to find matching @RepoObject_guid, if @RepoObject_guid is NULL; use [schema].[TableOrView]
  , @RepoObject_fullname2    NVarchar(257)    = Null --will be used to find matching @RepoObject_guid, if @RepoObject_guid is NULL; use schema.TableOrView
  , @IndexPatternColumnName  NVarchar(4000)   = Null --a semicolon separated list to define the Index, for example 'aaa;bbb;ccc'
  , @index_name              NVarchar(128)    = Null
  , @index_type              TinyInt          = 2    --1 Clustered, 2 Nonclustered
  , @is_index_disabled       Bit              = 0
  , @is_index_primary_key    Bit              = 0
  , @is_index_unique         Bit              = 0
  , @IndexSemanticGroup      NVarchar(512)    = Null --optional IndexSemanticGroup
                                                     -- some optional parameters, used for logging
  , @execution_instance_guid UniqueIdentifier = Null --SSIS system variable ExecutionInstanceGUID could be used, but other any other guid
  , @ssis_execution_id       BigInt           = Null --only SSIS system variable ServerExecutionID should be used, or any other consistent number system, do not mix
  , @sub_execution_id        Int              = Null
  , @parent_execution_log_id BigInt           = Null
As
Declare
    @current_execution_log_id BigInt
  , @current_execution_guid   UniqueIdentifier = NewId ()
  , @source_object            NVarchar(261)    = Null
  , @target_object            NVarchar(261)    = Null
  , @proc_id                  Int              = @@ProcId
  , @proc_schema_name         NVarchar(128)    = Object_Schema_Name ( @@ProcId )
  , @proc_name                NVarchar(128)    = Object_Name ( @@ProcId )
  , @event_info               NVarchar(Max)
  , @step_id                  Int              = 0
  , @step_name                NVarchar(1000)   = Null
  , @rows                     Int;

Set @event_info =
(
    Select
        event_info
    From
        sys.dm_exec_input_buffer ( @@Spid, Current_Request_Id ())
);

If @execution_instance_guid Is Null
    Set @execution_instance_guid = NewId ();

--SET @rows = @@ROWCOUNT;
Set @step_id = @step_id + 1;
Set @step_name = N'start';
Set @source_object = Null;
Set @target_object = Null;

Exec logs.usp_ExecutionLog_insert
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
  , @inserted = Null
  , @updated = Null
  , @deleted = Null
  , @info_01 = Null
  , @info_02 = Null
  , @info_03 = Null
  , @info_04 = Null
  , @info_05 = Null
  , @info_06 = Null
  , @info_07 = Null
  , @info_08 = Null
  , @info_09 = Null
  , @execution_log_id = @current_execution_log_id Output
  , @parameter_01 = @RepoObject_guid
  , @parameter_02 = @RepoObject_fullname
  , @parameter_03 = @RepoObject_fullname2
  , @parameter_04 = @IndexPatternColumnName
  , @parameter_05 = @index_name
  , @parameter_06 = @index_type
  , @parameter_07 = @is_index_disabled
  , @parameter_08 = @is_index_primary_key
  , @parameter_09 = @is_index_unique
  , @parameter_10 = @IndexSemanticGroup;

--
----START
--
Declare @index_guid UniqueIdentifier;

If @RepoObject_guid Is Null
    Set @RepoObject_guid =
(
    Select
        RepoObject_guid
    From
        repo.RepoObject
    Where
        RepoObject_fullname = @RepoObject_fullname
)   ;

If @RepoObject_guid Is Null
    Set @RepoObject_guid =
(
    Select
        RepoObject_guid
    From
        repo.RepoObject
    Where
        RepoObject_fullname2 = @RepoObject_fullname2
)   ;

--check existence of @RepoObject_guid
If Not Exists
(
    Select
        1
    From
        repo.RepoObject
    Where
        RepoObject_guid = @RepoObject_guid
)
Begin
    Set @step_name = Concat ( 'RepoObject_guid does not exist;', @RepoObject_guid, ';', @RepoObject_fullname );

    Throw 51001, @step_name, 1;
End;

--try to find existing index
Set @index_guid =
(
    Select
        index_guid
    From
        repo.Index_gross
    Where
        parent_RepoObject_guid     = @RepoObject_guid
        And IndexPatternColumnName = @IndexPatternColumnName
);

--update existing [Index_virtual]
--Attention, a new inserted index into repo.[Index_virtual] will be available only after `EXEC [repo].[usp_Index_finish]`
If Not @index_guid Is Null
Begin
    Print 'Update existing Index';

    Update
        iv
    Set
        index_name = IsNull ( @index_name, iv.index_name )
      , index_type = @index_type
      , is_index_disabled = @is_index_disabled
      , is_index_primary_key = @is_index_primary_key
      , is_index_unique = Iif(@is_index_primary_key = 1, 1, @is_index_unique)
    From
        repo.Index_virtual iv
    Where
        iv.index_guid = @index_guid;
End;
Else
Begin
    Print 'Insert new Index';

    Declare @table Table
    (
        guid UniqueIdentifier
    );

    ----make sure the @table table is empty
    --DELETE @table
    Insert Into repo.Index_virtual
    (
        parent_RepoObject_guid
      , index_name
      , index_type
      , is_index_disabled
      , is_index_primary_key
      , is_index_unique
    )
    Output
        INSERTED.index_guid
    Into @table
    Select
        @RepoObject_guid
      , @index_name
      , @index_type
      , @is_index_disabled
      , @is_index_primary_key
      , Iif(@is_index_primary_key = 1, 1, @is_index_unique);

    Set @index_guid =
    (
        Select guid From @table
    );

    /*
--test to get the string_split in the right order:

DECLARE @IndexPatternColumnName NVARCHAR(max) = 'z; y; aaa;bbb;ccc ddd; eee;fff ;ggg'

--there is no garantee to get the strings in the right order, but "normally" it works
--the result for ASC or DESC is the same
--https://feedback.azure.com/forums/908035-sql-server/suggestions/32902852-add-row-position-column-to-string-split
SELECT TRIM(value) AS index_column_name
 , row_number() OVER (
  ORDER BY (
    SELECT NULL
    )
  ) AS [index_column_id]
FROM STRING_SPLIT(@IndexPatternColumnName, ',')

*/
    --todo: concept to insert [is_descending_key]
    --or update manually if required
    Insert Into repo.IndexColumn_virtual
    (
        index_guid
      , index_column_id
      , RepoObjectColumn_guid
      , is_descending_key
    )
    Select
        @index_guid
      , ColTable.index_column_id
      , roc.RepoObjectColumn_guid
      , 0
    From
    (
        Select
            Trim ( value )                                 As index_column_name
          , Row_Number () Over ( Order By ( Select Null )) As index_column_id
        From
            String_Split(@IndexPatternColumnName, ',')
    )                             As ColTable
        Left Join
            repo.RepoObjectColumn As roc
                On
                roc.RepoObject_guid           = @RepoObject_guid
                And roc.RepoObjectColumn_name = index_column_name;

    Set @rows = @@RowCount;
    Set @step_id = @step_id + 1;
    Set @step_name = N'INSERT Index Columns';
    Set @source_object = N'[repo].[RepoObjectColumn]';
    Set @target_object = N'[repo].[IndexColumn_virtual]';

    Exec logs.usp_ExecutionLog_insert
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
      , @updated = Null
      , @deleted = Null
      , @info_01 = Null
      , @info_02 = Null
      , @info_03 = Null
      , @info_04 = Null
      , @info_05 = Null
      , @info_06 = Null
      , @info_07 = Null
      , @info_08 = Null
      , @info_09 = Null;
End;

--if @is_index_primary_key = 1 then mark other indexes as is_index_primary_key = 0
If @is_index_primary_key = 1
Begin
    Print 'set [is_index_primary_key] = 0 (for other index of same [parent_RepoObject_guid])';

    Update
        iv
    Set
        is_index_primary_key = 0
    From
        repo.Index_virtual   iv
        Inner Join
            repo.Index_gross ig
                On
                ig.index_guid = iv.index_guid
    Where
        iv.is_index_primary_key       = 1
        And iv.parent_RepoObject_guid = @RepoObject_guid
        And ig.IndexPatternColumnName <> @IndexPatternColumnName;
End;

If Not @IndexSemanticGroup Is Null
    Merge Into [repo].[Index_Settings] As target
    Using
    (
        Select
            @index_guid
          , @IndexSemanticGroup
    ) As source
    ( index_guid, IndexSemanticGroup )
    On target.index_guid = source.index_guid
    When Matched
        Then Update Set
                 IndexSemanticGroup = source.IndexSemanticGroup
    When Not Matched
        Then Insert
             (
                 index_guid
               , IndexSemanticGroup
             )
             Values
                 (
                     source.index_guid
                   , source.IndexSemanticGroup
                 )
    Output
        $action
      , inserted.*;

--
--
--END
--
--SET @rows = @@ROWCOUNT;
Set @step_id = @step_id + 1;
Set @step_name = N'end';
Set @source_object = Null;
Set @target_object = Null;

Exec logs.usp_ExecutionLog_insert
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
  , @inserted = Null
  , @updated = Null
  , @deleted = Null
  , @info_01 = Null
  , @info_02 = Null
  , @info_03 = Null
  , @info_04 = Null
  , @info_05 = Null
  , @info_06 = Null
  , @info_07 = Null
  , @info_08 = Null
  , @info_09 = Null;
Go
Execute sp_addextendedproperty
    @name = N'RepoObject_guid'
  , @value = 'a190291c-9d61-eb11-84dc-a81e8446d5b0'
  , @level0type = N'SCHEMA'
  , @level0name = N'repo'
  , @level1type = N'PROCEDURE'
  , @level1name = N'usp_Index_virtual_set';


Go
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [logs].[usp_ExecutionLog_insert]
* [repo].[Index_gross]
* [repo].[Index_Settings]
* [repo].[Index_virtual]
* [repo].[IndexColumn_virtual]
* [repo].[RepoObject]
* [repo].[RepoObjectColumn]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_Index_virtual_set';




GO
EXECUTE sp_addextendedproperty @name = N'MS_Description', @value = N'
* Index will be inserted (or updated) into xref:sqldb:repo.Index_virtual.adoc[]
* but it will not be visible in xref:sqldb:repo.Index_gross.adoc[] until it was also included into xref:sqldb:repo.Index_Settings.adoc[]
* and after inserting a new index there could be duplicates for the same columns which needs to be removed again

That''s why it is required run the folowing procedure (this also happens in xref:sqldb:repo.usp_main.adoc[])

[source,sql]
------
EXEC [repo].[usp_Index_finish]
------

index_type:

......
Type of index:
0 = Heap
1 = Clustered
2 = Nonclustered
3 = XML
4 = Spatial
5 = Clustered columnstore index. Applies to: SQL Server 2014 (12.x) and later.
6 = Nonclustered columnstore index. Applies to: SQL Server 2012 (11.x) and later.
7 = Nonclustered hash index. Applies to: SQL Server 2014 (12.x) and later.
......
', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_Index_virtual_set';




GO
EXECUTE sp_addextendedproperty @name = N'exampleUsage_2', @value = N'
--ensure existing guid

Exec repo.usp_sync_guid

--set multiple indexes and finish them

EXEC repo.usp_Index_virtual_set
    @RepoObject_fullname = ''[SchemaName].[EntityName]''
  , @IndexPatternColumnName = ''ccc''
  , @is_index_primary_key = 1;

EXEC repo.usp_Index_virtual_set
    @RepoObject_fullname2 = ''SchemaName.EntityName2''
  , @IndexPatternColumnName = ''ccc''
  , @is_index_primary_key = 0
  , @is_index_unique = 1
  , @IndexSemanticGroup = ''OptionalSemanticGroup'';


EXEC [repo].[usp_Index_finish];', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_Index_virtual_set';




GO
EXECUTE sp_addextendedproperty @name = N'exampleUsage', @value = N'
--ensure existing guid

Exec repo.usp_sync_guid

--use @RepoObject_fullname with square brackets
--use @RepoObject_fullname2 without square brackets
--@IndexPatternColumnName can be used only without square brackets

EXEC repo.usp_Index_virtual_set
    @RepoObject_fullname2 = ''SchemaName.EntityName''
  , @IndexPatternColumnName = ''aaa,bbb''
  , @is_index_primary_key = 1
  , @IndexSemanticGroup = ''OptionalSemanticGroup'';

EXEC [repo].[usp_Index_finish];', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_Index_virtual_set';




GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:repo.usp_Index_ForeignKey.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_Index_virtual_set';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:logs.usp_ExecutionLog_insert.adoc[]
* xref:repo.Index_gross.adoc[]
* xref:repo.Index_Settings.adoc[]
* xref:repo.Index_virtual.adoc[]
* xref:repo.IndexColumn_virtual.adoc[]
* xref:repo.RepoObject.adoc[]
* xref:repo.RepoObjectColumn.adoc[]', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_Index_virtual_set';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_Index_virtual_set';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'repo', @level1type = N'PROCEDURE', @level1name = N'usp_Index_virtual_set';

