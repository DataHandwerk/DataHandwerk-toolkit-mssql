


CREATE View [docs].[ssis_ParameterList]
As
Select
    AntoraModule
  , PackageName
  , ParameterList =
  --
  String_Agg (
                 Concat (
                            Cast(N'' As NVarchar(Max))
                          , '[#parameter-'
                          , docs.fs_cleanStringForAnchorId ( ParameterName )
                          , ']'
                          , Char ( 13 ) + Char ( 10 )
                          , '=== '
                          , docs.fs_cleanStringForHeader ( ParameterName )
                          , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )

                          --table start
                          , '[cols="1,4l"]' + Char ( 13 ) + Char ( 10 )
                          , '|===' + Char ( 13 ) + Char ( 10 )
                          , Char ( 13 ) + Char ( 10 )

                          --table content
                          --https://docs.microsoft.com/en-us/dotnet/api/microsoft.sqlserver.dts.runtime.wrapper.datatype?view=sqlserver-2019
                          , '|' + 'ParameterDataType' + Char ( 13 ) + Char ( 10 ) + '|' + ParameterDataType
                            + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'ParameterValue' + Char ( 13 ) + Char ( 10 ) + '|' + ParameterValue + Char ( 13 )
                            + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'ExpressionValue' + Char ( 13 ) + Char ( 10 ) + '|' + ExpressionValue + Char ( 13 )
                            + Char ( 10 ) + Char ( 13 ) + Char ( 10 )

                          --table end
                          , '|===' + Char ( 13 ) + Char ( 10 )
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                ParameterName)
From
    ssis.PackageParameter
Group By
    AntoraModule
  , PackageName
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4fddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_ParameterList', @level2type = N'COLUMN', @level2name = N'ParameterList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4eddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_ParameterList', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4dddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_ParameterList', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '869a07f7-c23c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_ParameterList';

