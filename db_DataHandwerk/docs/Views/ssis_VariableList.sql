
CREATE View [docs].[ssis_VariableList]
As
Select
    AntoraModule
  , PackageName
  , VariableList =
  --
  String_Agg (
                 Concat (
                            Cast(N'' As NVarchar(Max))
                          , '[#variable-'
                          , docs.fs_cleanStringForAnchorId ( VariableName )
                          , ']'
                          , Char ( 13 ) + Char ( 10 )
                          , '=== '
                          , docs.fs_cleanStringForHeader ( VariableName )
                          , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )

                          --table start
                          , '[cols="1,4l"]' + Char ( 13 ) + Char ( 10 )
                          , '|===' + Char ( 13 ) + Char ( 10 )
                          , Char ( 13 ) + Char ( 10 )

                          --table content
                          --https://docs.microsoft.com/en-us/dotnet/api/microsoft.sqlserver.dts.runtime.wrapper.datatype?view=sqlserver-2019
                          , '|' + 'VariableDataType' + Char ( 13 ) + Char ( 10 ) + '|' + VariableDataType + Char ( 13 )
                            + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'VariableValue' + Char ( 13 ) + Char ( 10 ) + '|' + VariableValue + Char ( 13 )
                            + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'ExpressionValue' + Char ( 13 ) + Char ( 10 ) + '|' + ExpressionValue + Char ( 13 )
                            + Char ( 10 ) + Char ( 13 ) + Char ( 10 )

                          --table end
                          , '|===' + Char ( 13 ) + Char ( 10 )
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                VariableName)
From
    ssis.PackageVariable
Group By
    AntoraModule
  , PackageName
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '52ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_VariableList', @level2type = N'COLUMN', @level2name = N'VariableList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '51ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_VariableList', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '50ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_VariableList', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '889a07f7-c23c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_VariableList';

