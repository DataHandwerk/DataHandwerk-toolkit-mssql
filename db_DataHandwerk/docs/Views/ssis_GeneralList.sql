
CREATE View docs.ssis_GeneralList
As
Select
    AntoraModule
  , PackageName
  , GeneralList =
  --
  Concat (
             Cast(N'' As NVarchar(Max))

           --table start
           , '[cols="1,4l"]' + Char ( 13 ) + Char ( 10 )
           , '|===' + Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )

           --table content
           , '|' + 'PackageCreationDate' + Char ( 13 ) + Char ( 10 ) + '|'
             + Convert ( NVarchar(50), PackageCreationDate, 120 ) + Char ( 13 ) + Char ( 10 ) + Char ( 13 )
             + Char ( 10 )
           , '|' + 'PackageCreatorComputerName' + Char ( 13 ) + Char ( 10 ) + '|' + PackageCreatorComputerName
             + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '|' + 'PackageCreatorName' + Char ( 13 ) + Char ( 10 ) + '|' + PackageCreatorName + Char ( 13 )
             + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '|' + 'PackageDTSID' + Char ( 13 ) + Char ( 10 ) + '|' + Cast(PackageDTSID As NVarchar(50)) + Char ( 13 )
             + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '|' + 'PackageLastModifiedProductVersion' + Char ( 13 ) + Char ( 10 ) + '|'
             + PackageLastModifiedProductVersion + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '|' + 'PackageLocaleID' + Char ( 13 ) + Char ( 10 ) + '|' + Cast(PackageLocaleID As NVarchar(50))
             + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           --, '|' + 'PackagePath' + Char ( 13 ) + Char ( 10 ) + '|' + PackagePath + Char ( 13 ) + Char ( 10 )
           --  + Char ( 13 ) + Char ( 10 )
           , '|' + 'PackageProtectionLevel' + Char ( 13 ) + Char ( 10 ) + '|' + PackageProtectionLevel + Char ( 13 )
             + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '|' + 'PackageProtectionLevelName' + Char ( 13 ) + Char ( 10 ) + '|' + PackageProtectionLevelName
             + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '|' + 'PackageVersionGUID' + Char ( 13 ) + Char ( 10 ) + '|' + Cast(PackageVersionGUID As NVarchar(50))
             + Char ( 13 ) + Char ( 10 ) + Char ( 13 ) + Char ( 10 )
           , '|' + 'ProjectPath' + Char ( 13 ) + Char ( 10 ) + '|' + ProjectPath + Char ( 13 ) + Char ( 10 )
             + Char ( 13 ) + Char ( 10 )

           --table end
           , '|===' + Char ( 13 ) + Char ( 10 )
         )
From
    ssis.Package
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'ce77139a-483d-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_GeneralList', @level2type = N'COLUMN', @level2name = N'GeneralList';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cd77139a-483d-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_GeneralList', @level2type = N'COLUMN', @level2name = N'PackageName';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = 'cc77139a-483d-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_GeneralList', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '58be5c8f-483d-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_GeneralList';

