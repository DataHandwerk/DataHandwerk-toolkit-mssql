
/*
<<property_start>>Description
* extract repository and relevant table data to dacpac
* default @TargetFolder: config.fs_get_parameter_value ( 'sqlpackage', 'TargetFolder' )
* default @TargetFileBaseName: @TargetFileBaseName, Db_Name () + '.dacpac'
* folder containing sqlpackage.exe should be defined in config.fs_get_parameter_value ( 'sqlpackage', 'ProgrammFolder' )
* issues with xp_cmdshell executing the prepared command
** copy the prepared command and execute it in a command prompt or power shell
* see details in xref:user-guide:backup-repo-db.adoc[]
<<property_end>>

<<property_start>>exampleUsage
--if you store the @TargetFolder in config.fs_get_parameter_value ( 'sqlpackage', 'TargetFolder' )
Exec config.usp_extract_dacpac

Exec config.usp_extract_dacpac
    @TargetFolder = 'D:\Repos\gitlab\DataHandwerk\DataHandwerk-toolkit-mssql\dhw_dacpac'

Exec config.usp_extract_dacpac
    @TargetFolder = 'D:\Repos\gitlab\DataHandwerk\DataHandwerk-toolkit-mssql\dhw_dacpac'
  , @TargetFileBaseName = 'ddd.dacpac'
<<property_end>>
*/
CREATE Procedure [config].[usp_extract_dacpac]
(
    @TargetFolder       NVarchar(4000) = Null
  , @TargetFileBaseName NVarchar(1000) = Null
)
As
Begin
    Set @TargetFolder = IsNull ( @TargetFolder, config.fs_get_parameter_value ( 'sqlpackage', 'TargetFolder' ))
    Set @TargetFileBaseName = IsNull ( @TargetFileBaseName, Db_Name () + '.dacpac' )

    Declare @TargetFile NVarchar(4000) = @TargetFolder + N'\' + @TargetFileBaseName
    Declare @instanceName NVarchar(500) = @@ServerName --example: 'ACER-F17\SQL2019', '.\SQL2019', localhost\SQL2019
    Declare @databaseName NVarchar(128) = Db_Name ()
    Declare @command NVarchar(max)

    Set @command
        = Concat (
                     '"'
                   , config.fs_get_parameter_value ( 'sqlpackage', 'ProgrammFolder' )
                   , '\sqlpackage.exe'
                   , '"'
                   , ' /TargetFile:"'
                   , @TargetFile
                   , '"'
                   , ' /Action:Extract'
                   , ' /SourceServerName:"'
                   , @instanceName
                   , '"'
                   , ' /SourceDatabaseName:"'
                   , @databaseName
                   , '"'
                   , ' /p:IgnorePermissions=TRUE /p:IgnoreUserLoginMappings=TRUE'
                   , ' /p:TableData=[config].[Parameter]'
                   , ' /p:TableData=[config].[SsasDatabasename]'
                   , ' /p:TableData=[configT].[spt_values]'
                   , ' /p:TableData=[property].[external_RepoObjectColumnProperty]'
                   , ' /p:TableData=[property].[external_RepoObjectProperty]'
                   , ' /p:TableData=[property].[MeasureProperty]'
                   , ' /p:TableData=[property].[PropertyName_Measure_T]'
                   , ' /p:TableData=[property].[PropertyName_RepoObject_T]'
                   , ' /p:TableData=[property].[PropertyName_RepoObjectColumn_T]'
                   , ' /p:TableData=[property].[RepoObjectColumnProperty]'
                   , ' /p:TableData=[property].[RepoObjectProperty]'
                   , ' /p:TableData=[property].[RepoSchemaProperty]'
                   , ' /p:TableData=[reference].[additional_Reference]'
                   , ' /p:TableData=[reference].[additional_Reference_database_T]'
                   , ' /p:TableData=[reference].[additional_Reference_Object_T]'
                   , ' /p:TableData=[reference].[additional_Reference_ObjectColumn_T]'
                   , ' /p:TableData=[reference].[RepoObject_QueryPlan]'
                   , ' /p:TableData=[reference].[RepoObject_reference_T]'
                   , ' /p:TableData=[reference].[RepoObject_ReferenceTree]'
                   --, ' /p:TableData=[reference].[RepoObject_ReferenceTree_0_30_T]'
                   --, ' /p:TableData=[reference].[RepoObject_ReferenceTree_30_0_T]'
                   , ' /p:TableData=[reference].[RepoObjectColumn_reference_T]'
                   , ' /p:TableData=[reference].[RepoObjectColumnSource_virtual]'
                   , ' /p:TableData=[reference].[RepoObjectSource_FirstResultSet]'
                   , ' /p:TableData=[reference].[RepoObjectSource_QueryPlan]'
                   , ' /p:TableData=[reference].[RepoObjectSource_virtual]'
                   , ' /p:TableData=[repo].[ForeignKey_Indexes_union_T]'
                   , ' /p:TableData=[repo].[ForeignKey_virtual]'
                   , ' /p:TableData=[repo].[Index_ColumList_T]'
                   , ' /p:TableData=[repo].[Index_Settings]'
                   , ' /p:TableData=[repo].[Index_ssas_T]'
                   , ' /p:TableData=[repo].[Index_virtual]'
                   --, ' /p:TableData=[repo].[IndexColumn_ReferencedReferencing_HasFullColumnsInReferencing_T]'
                   , ' /p:TableData=[repo].[IndexColumn_ssas_T]'
                   , ' /p:TableData=[repo].[IndexColumn_union_T]'
                   , ' /p:TableData=[repo].[IndexColumn_virtual]'
                   , ' /p:TableData=[repo].[RepoObject]'
                   , ' /p:TableData=[repo].[RepoObject_persistence]'
                   , ' /p:TableData=[repo].[RepoObjectColumn]'
                   , ' /p:TableData=[repo].[RepoSchema]'
                   , ' /p:TableData=[sqlparse].[RepoObject_SqlModules]'
                   , ' /p:TableData=[sqlparse].[RepoObject_SqlModules_41_from_T]'
                   , ' /p:TableData=[sqlparse].[RepoObject_SqlModules_61_SelectIdentifier_Union_T]'
                   , ' /p:TableData=[ssas].[Measures_translation_T]'
                   , ' /p:TableData=[ssas].[model_json]'
                   , ' /p:TableData=[ssas].[model_json_31_tables_T]'
                   , ' /p:TableData=[ssas].[model_json_311_tables_columns_T]'
                   , ' /p:TableData=[ssas].[model_json_312_tables_measures_T]'
                   , ' /p:TableData=[ssas].[model_json_32_relationships_T]'
                   , ' /p:TableData=[ssas].[model_json_33_dataSources_T]'
                   , ' /p:TableData=[ssas].[model_json_3411_cultures_translations_model_T]'
                   , ' /p:TableData=[ssas].[RepoObjectColumn_translation_T]'
                   , ' /p:TableData=[ssis].[Package]'
                   , ' /p:TableData=[ssis].[PackageConnection]'
                   , ' /p:TableData=[ssis].[PackageFlow]'
                   , ' /p:TableData=[ssis].[PackageParameter]'
                   , ' /p:TableData=[ssis].[PackageTask]'
                   , ' /p:TableData=[ssis].[PackageTask_Dft_Component]'
                   , ' /p:TableData=[ssis].[PackageTask_Dft_Component_input]'
                   , ' /p:TableData=[ssis].[PackageTask_Dft_Component_input_externalMetadataColumn]'
                   , ' /p:TableData=[ssis].[PackageTask_Dft_Component_input_inputColumn]'
                   , ' /p:TableData=[ssis].[PackageTask_Dft_Component_output]'
                   , ' /p:TableData=[ssis].[PackageTask_Dft_Component_output_externalMetadataColumn]'
                   , ' /p:TableData=[ssis].[PackageTask_Dft_Component_output_outputcolumn]'
                   , ' /p:TableData=[ssis].[PackageTask_Dft_SrcDest]'
                   , ' /p:TableData=[ssis].[PackageTask_Sql_Parameter]'
                   , ' /p:TableData=[ssis].[PackageVariable]'
                   , ' /p:TableData=[ssis].[Project]'
                   , ' /p:TableData=[ssis].[ProjectConnection]'
                   , ' /p:TableData=[uspgenerator].[GeneratorUsp]'
                   , ' /p:TableData=[uspgenerator].[GeneratorUspParameter]'
                   , ' /p:TableData=[uspgenerator].[GeneratorUspStep]'
                   , ' /p:TableData=[workflow].[Connection]'
                   , ' /p:TableData=[workflow].[ProcedureDependency]'
                   , ' /p:TableData=[workflow].[Workflow]'
                   , ' /p:TableData=[workflow].[Workflow_ProcedureDependency_T]'
                   , ' /p:TableData=[workflow].[Workflow_ProcedureDependency_T_bidirectional_T]'
                   , ' /p:TableData=[workflow].[WorkflowStep]'
                   , ' /p:TableData=[workflow].[WorkflowStep_Sortorder]'
                 )

    Print @command

    Select
        @command

--issues with xp_cmdshell and multiple pairs of "
--replacing by ' will not solve, because this will be a wrong syntax for sqlpackage.exe
--Set @command = Replace ( @command, '"', '''' )
--Exec sys.xp_cmdshell @command
End;
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'f01ea651-464d-ec11-8531-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'config', @level1type = N'PROCEDURE', @level1name = N'usp_extract_dacpac';

