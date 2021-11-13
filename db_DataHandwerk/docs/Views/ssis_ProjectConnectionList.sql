CREATE View docs.ssis_ProjectConnectionList
As
Select
    projcon.AntoraModule
  , ProjectConnectionList =
  --
  String_Agg (
                 Concat (
                            Cast(N'' As NVarchar(Max))
                          , '[#connection-'
                          , docs.fs_cleanStringForAnchorId ( projcon.ConnectionManagerName )
                          , ']'
                          , Char ( 13 ) + Char ( 10 )
                          , '=== '
                          , docs.fs_cleanStringForHeader ( projcon.ConnectionManagerName )
                          , Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )

                          --table start
                          , '[cols="1,4l"]' + Char ( 13 ) + Char ( 10 )
                          , '|===' + Char ( 13 ) + Char ( 10 )
                          , Char ( 13 ) + Char ( 10 )

                          --table content
                          , '|' + 'ConnectionManagerType' + Char ( 13 ) + Char ( 10 ) + '|'
                            + projcon.ConnectionManagerType + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'ConnectionString' + Char ( 13 ) + Char ( 10 ) + '|' + projcon.ConnectionString
                            + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , '|' + 'ConnectionManagerID' + Char ( 13 ) + Char ( 10 ) + '|'
                            + Cast(projcon.ConnectionManagerID As NVarchar(50)) + Char ( 13 ) + Char ( 10 )
                            + Char ( 13 ) + Char ( 10 )
                          , '|' + 'ConnectionPath' + Char ( 13 ) + Char ( 10 ) + '|' + projcon.ConnectionPath
                            + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                          , Iif(projcon.ExpressionValue <> ''
                              , '|' + 'ExpressionValue' + Char ( 13 ) + Char ( 10 ) + '|' + projcon.ExpressionValue
                                + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
                              , '')
                          --, '|' + 'RetainSameConnectionProperty' + Char ( 13 ) + Char ( 10 ) + '|'
                          --  + RetainSameConnectionProperty + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )

                          --table end
                          , '|===' + Char ( 13 ) + Char ( 10 )
                        )
               , Char ( 13 ) + Char ( 10 )
             ) Within Group(Order By
                                projcon.ConnectionManagerName)
From
    ssis.ProjectConnection As projcon
Group By
    projcon.AntoraModule
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'd077139a-483d-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_ProjectConnectionList', @level2type = N'COLUMN', @level2name = N'ProjectConnectionList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cf77139a-483d-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_ProjectConnectionList', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '59be5c8f-483d-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_ProjectConnectionList';

