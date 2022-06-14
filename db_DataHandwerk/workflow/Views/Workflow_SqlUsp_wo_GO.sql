Create   View [workflow].[Workflow_SqlUsp_wo_GO]
As
Select
    T1.Workflow_id
  , T1.Workflow_Name
  , SqlUsp =
  --
  Concat (
           --  'USE  ['
           --, dwhdb.dwh_database_name
           --, ']'
           --, Char ( 13 ) + Char ( 10 )
           --, 'GO'
           --, Char ( 13 ) + Char ( 10 )
           ''
           , 'CREATE OR ALTER PROCEDURE '
           , 'dbo'
           , '.'
           , 'usp_'
           , T1.Workflow_Name
           , Char ( 13 ) + Char ( 10 )
           , '@execution_instance_guid UNIQUEIDENTIFIER = NULL --SSIS system variable ExecutionInstanceGUID could be used, any other unique guid is also fine. If NULL, then NEWID() is used to create one'
           , Char ( 13 ) + Char ( 10 )
           , 'AS'
           , Char ( 13 ) + Char ( 10 )
           , 'Begin'
           , Char ( 13 ) + Char ( 10 )
           , 'IF @execution_instance_guid IS Null SET @execution_instance_guid = NEWID();'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , T1.UspList
           , Char ( 13 ) + Char ( 10 )
           , 'End'
           --, Char ( 13 ) + Char ( 10 )
           --, 'GO'
         )
  , T1.UspList
From
    workflow.Workflow_UspList             As T1
    Cross Join config.ftv_dwh_database () As dwhdb
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9569cc39-c2eb-ec11-8568-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_SqlUsp_wo_GO', @level2type = N'COLUMN', @level2name = N'UspList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9469cc39-c2eb-ec11-8568-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_SqlUsp_wo_GO', @level2type = N'COLUMN', @level2name = N'SqlUsp';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9369cc39-c2eb-ec11-8568-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_SqlUsp_wo_GO', @level2type = N'COLUMN', @level2name = N'Workflow_Name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '9269cc39-c2eb-ec11-8568-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_SqlUsp_wo_GO', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '72d4ae2c-c2eb-ec11-8568-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_SqlUsp_wo_GO';

