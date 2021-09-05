


CREATE View workflow.Biml_Connection
As
Select
    ConnectionName_Biml   = String_Agg (
                                           '<Connection ConnectionName="' + T1.ConnectionName + '" />'
                                         , Char ( 13 ) + Char ( 10 )
                                       ) Within Group(Order By
                                                          T1.ConnectionName)
  , ConnectionString_Biml = String_Agg (
                                           Cast('<Connection Name="' As NVarchar(Max)) + T1.ConnectionName
                                           + '" ConnectionString="' + T1.ConnectionString + '" />'
                                         , Char ( 13 ) + Char ( 10 )
                                       ) Within Group(Order By
                                                          T1.ConnectionName)
From
    workflow.Connection As T1
Where
    T1.is_active = 1
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'b066a0a8-e3fa-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Connection';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8b448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Connection', @level2type = N'COLUMN', @level2name = N'ConnectionString_Biml';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '8a448fa7-00fb-eb11-850e-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Connection', @level2type = N'COLUMN', @level2name = N'ConnectionName_Biml';


GO
EXECUTE sp_addextendedproperty @name = N'ReferencedObjectList', @value = N'* [workflow].[Connection]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Connection';


GO
EXECUTE sp_addextendedproperty @name = N'is_ssas', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Connection';


GO
EXECUTE sp_addextendedproperty @name = N'is_repo_managed', @value = N'0', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Connection';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencingList', @value = N'* xref:workflow.Biml_Project.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Connection';


GO
EXECUTE sp_addextendedproperty @name = N'AntoraReferencedList', @value = N'* xref:workflow.Connection.adoc[]', @level0type = N'SCHEMA', @level0name = N'workflow', @level1type = N'VIEW', @level1name = N'Biml_Connection';

