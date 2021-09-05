

CREATE View workflow.Workflow_SqlUsp
As
Select
    T1.Workflow_id
  , T1.Workflow_Name
  , SqlUsp =
  --
  Concat (
             'USE  ['
           , dwhdb.dwh_database_name
           , ']'
           , Char ( 13 ) + Char ( 10 )
           , 'GO'
           , Char ( 13 ) + Char ( 10 )
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
           , Char ( 13 ) + Char ( 10 )
           , 'GO'
         )
  , T1.UspList
From
    workflow.Workflow_UspList             As T1
    Cross Join config.ftv_dwh_database () As dwhdb
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'bc0bc0eb-b301-ec11-8510-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_SqlUsp';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dc2861f5-b301-ec11-8510-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_SqlUsp', @level2type = N'COLUMN', @level2name = N'Workflow_Name';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'db2861f5-b301-ec11-8510-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_SqlUsp', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'de2861f5-b301-ec11-8510-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_SqlUsp', @level2type = N'COLUMN', @level2name = N'UspList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'dd2861f5-b301-ec11-8510-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_SqlUsp', @level2type = N'COLUMN', @level2name = N'SqlUsp';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [config].[ftv_dwh_database]
* [workflow].[Workflow_UspList]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_SqlUsp';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_SqlUsp';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_SqlUsp';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:config.ftv_dwh_database.adoc[]
* xref:workflow.Workflow_UspList.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_SqlUsp';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow_UspList].[Workflow_Name]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_SqlUsp', @level2type = N'COLUMN', @level2name = N'Workflow_Name';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow_UspList].[Workflow_id]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_SqlUsp', @level2type = N'COLUMN', @level2name = N'Workflow_id';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectColumnList', @value = N'* [workflow].[Workflow_UspList].[UspList]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Workflow_SqlUsp', @level2type = N'COLUMN', @level2name = N'UspList';

