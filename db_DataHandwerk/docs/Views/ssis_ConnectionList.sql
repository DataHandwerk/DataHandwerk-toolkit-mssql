

CREATE View [docs].[ssis_ConnectionList]
As
Select
    AntoraModule
  , PackageName
  , ConnectionList =
  --
  String_Agg (
                 Concat (
                            Cast(N'' As NVarchar(Max))
                          , '[#connection-'
                          , docs.fs_cleanStringForAnchorId ( ConnectionManagerName )
                          , ']'
                          , Char ( 13 ) + Char ( 10 )
                          , '=== '
                          , docs.fs_cleanStringForHeader ( ConnectionManagerName )
                          , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )

                          --table start
                          , '[cols="1,4l"]' + Char ( 13 ) + Char ( 10 )
                          , '|===' + Char ( 13 ) + Char ( 10 )
                          , Char ( 13 ) + Char ( 10 )

                          --table content
                          , '|' + 'ConnectionManagerType' + Char ( 13 ) + Char ( 10 ) + '|' + ConnectionManagerType
                            + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'ConnectionString' + Char ( 13 ) + Char ( 10 ) + '|' + ConnectionString + Char ( 13 )
                            + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'ConnectionManagerID' + Char ( 13 ) + Char ( 10 ) + '|'
                            + Cast(ConnectionManagerID As NVarchar(50)) + Char ( 13 ) + Char ( 10 ) + Char ( 13 )
                            + Char ( 10 )
                          , '|' + 'ExpressionValue' + Char ( 13 ) + Char ( 10 ) + '|' + ExpressionValue + Char ( 13 )
                            + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'RetainSameConnectionProperty' + Char ( 13 ) + Char ( 10 ) + '|'
                            + RetainSameConnectionProperty + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )

                          --table end
                          , '|===' + Char ( 13 ) + Char ( 10 )
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                ConnectionManagerName)
From
    ssis.PackageConnection
Group By
    AntoraModule
  , PackageName
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4cddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_ConnectionList', @level2type = N'COLUMN', @level2name = N'ConnectionList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4bddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_ConnectionList', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '4addc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_ConnectionList', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '859a07f7-c23c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_ConnectionList';

