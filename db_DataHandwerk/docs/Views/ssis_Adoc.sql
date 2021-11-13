CREATE View docs.ssis_Adoc
As
Select
    p.AntoraModule
  , p.PackageBasename
  --,[PackageName]
  --,[PackageDTSID]
  --,[PackageCreationDate]
  --,[PackageCreatorComputerName]
  --,[PackageCreatorName]
  --,[PackageDescription]
  --,[PackageLastModifiedProductVersion]
  --,[PackageLocaleID]
  --,[PackageObjectName]
  --,[PackagePath]
  --,[PackageProtectionLevel]
  --,[PackageProtectionLevelName]
  --,[PackageVersionGUID]
  --,[ProjectPath]
  --,[RowID]
  , AdocContent =
  --
  Concat (
             ''
           , '// tag::HeaderFullDisplayName[]'
           , Char ( 13 ) + Char ( 10 )
           , '= ' + p.PackageName
           , Char ( 13 ) + Char ( 10 )
           , '// end::HeaderFullDisplayName[]'
           , Char ( 13 ) + Char ( 10 )

           --
           --
           , Char ( 13 ) + Char ( 10 )
           , '== GeneralList'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// tag::GeneralList[]'
           , Char ( 13 ) + Char ( 10 )
           , gl.GeneralList
           , Char ( 13 ) + Char ( 10 )
           , '// end::GeneralList[]'
           , Char ( 13 ) + Char ( 10 )
           --
           --
           , Char ( 13 ) + Char ( 10 )
           , '== PumlPackageControlFlows'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// tag::PumlPackageControlFlows[]'
           , Char ( 13 ) + Char ( 10 )
           , '[plantuml, ssis-{docname}, svg, subs=macros]'
           , Char ( 13 ) + Char ( 10 )
           , '....'
           , Char ( 13 ) + Char ( 10 )
           , puml.PumlPackageControlFlows
           , Char ( 13 ) + Char ( 10 )
           , '....'
           , Char ( 13 ) + Char ( 10 )
           , '// end::PumlPackageControlFlows[]'
           , Char ( 13 ) + Char ( 10 )
           --
           --
           , Char ( 13 ) + Char ( 10 )
           , '== ConnectionList'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// tag::ConnectionList[]'
           , Char ( 13 ) + Char ( 10 )
           , cl.ConnectionList
           , Char ( 13 ) + Char ( 10 )
           , '// end::ConnectionList[]'
           , Char ( 13 ) + Char ( 10 )
           --
           --
           , Char ( 13 ) + Char ( 10 )
           , '== ProjectConnectionList'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// tag::ProjectConnectionList[]'
           , Char ( 13 ) + Char ( 10 )
           , pcl.ProjectConnectionList
           , Char ( 13 ) + Char ( 10 )
           , '// end::ProjectConnectionList[]'
           , Char ( 13 ) + Char ( 10 )
           --
           --
           , Char ( 13 ) + Char ( 10 )
           , '== ParameterList'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// tag::ParameterList[]'
           , Char ( 13 ) + Char ( 10 )
           , pl.ParameterList
           , Char ( 13 ) + Char ( 10 )
           , '// end::ParameterList[]'
           , Char ( 13 ) + Char ( 10 )
           --
           --
           , Char ( 13 ) + Char ( 10 )
           , '== VariableList'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// tag::VariableList[]'
           , Char ( 13 ) + Char ( 10 )
           , vl.VariableList
           , Char ( 13 ) + Char ( 10 )
           , '// end::VariableList[]'
           , Char ( 13 ) + Char ( 10 )
           --
           --
           , Char ( 13 ) + Char ( 10 )
           , '== TaskList'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// tag::TaskList[]'
           , Char ( 13 ) + Char ( 10 )
           , tl.TaskList
           , Char ( 13 ) + Char ( 10 )
           , '// end::TaskList[]'
           , Char ( 13 ) + Char ( 10 )

           --
           --
           --
           --
           , Char ( 13 ) + Char ( 10 )
           , '== PackageDTSID'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// tag::PackageDTSID[]'
           , Char ( 13 ) + Char ( 10 )
           , p.PackageDTSID
           , Char ( 13 ) + Char ( 10 )
           , '// end::PackageDTSID[]'
           , Char ( 13 ) + Char ( 10 )
           --
           , Char ( 13 ) + Char ( 10 )
           , '== PackageCreationDate'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// tag::PackageCreationDate[]'
           , Char ( 13 ) + Char ( 10 )
           , p.PackageCreationDate
           , Char ( 13 ) + Char ( 10 )
           , '// end::PackageCreationDate[]'
           , Char ( 13 ) + Char ( 10 )

           --
           , Char ( 13 ) + Char ( 10 )
           , '== PackageCreatorComputerName'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// tag::PackageCreatorComputerName[]'
           , Char ( 13 ) + Char ( 10 )
           , p.PackageCreatorComputerName
           , Char ( 13 ) + Char ( 10 )
           , '// end::PackageCreatorComputerName[]'
           , Char ( 13 ) + Char ( 10 )

           --
           , Char ( 13 ) + Char ( 10 )
           , '== PackageCreatorName'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// tag::PackageCreatorName[]'
           , Char ( 13 ) + Char ( 10 )
           , p.PackageCreatorName
           , Char ( 13 ) + Char ( 10 )
           , '// end::PackageCreatorName[]'
           , Char ( 13 ) + Char ( 10 )

           --
           , Char ( 13 ) + Char ( 10 )
           , '== PackageDescription'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// tag::PackageDescription[]'
           , Char ( 13 ) + Char ( 10 )
           , p.PackageDescription
           , Char ( 13 ) + Char ( 10 )
           , '// end::PackageDescription[]'
           , Char ( 13 ) + Char ( 10 )

           --
           , Char ( 13 ) + Char ( 10 )
           , '== PackageLastModifiedProductVersion'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// tag::PackageLastModifiedProductVersion[]'
           , Char ( 13 ) + Char ( 10 )
           , p.PackageLastModifiedProductVersion
           , Char ( 13 ) + Char ( 10 )
           , '// end::PackageLastModifiedProductVersion[]'
           , Char ( 13 ) + Char ( 10 )

           --
           , Char ( 13 ) + Char ( 10 )
           , '== PackageLocaleID'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// tag::PackageLocaleID[]'
           , Char ( 13 ) + Char ( 10 )
           , p.PackageLocaleID
           , Char ( 13 ) + Char ( 10 )
           , '// end::PackageLocaleID[]'
           , Char ( 13 ) + Char ( 10 )

           --
           , Char ( 13 ) + Char ( 10 )
           , '== PackageObjectName'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// tag::PackageObjectName[]'
           , Char ( 13 ) + Char ( 10 )
           , p.PackageObjectName
           , Char ( 13 ) + Char ( 10 )
           , '// end::PackageObjectName[]'
           , Char ( 13 ) + Char ( 10 )

           --
           , Char ( 13 ) + Char ( 10 )
           , '== PackagePath'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// tag::PackagePath[]'
           , Char ( 13 ) + Char ( 10 )
           , p.PackagePath
           , Char ( 13 ) + Char ( 10 )
           , '// end::PackagePath[]'
           , Char ( 13 ) + Char ( 10 )

           --
           , Char ( 13 ) + Char ( 10 )
           , '== PackageProtectionLevel'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// tag::PackageProtectionLevel[]'
           , Char ( 13 ) + Char ( 10 )
           , p.PackageProtectionLevel
           , Char ( 13 ) + Char ( 10 )
           , '// end::PackageProtectionLevel[]'
           , Char ( 13 ) + Char ( 10 )

           --
           , Char ( 13 ) + Char ( 10 )
           , '== PackageProtectionLevelName'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// tag::PackageProtectionLevelName[]'
           , Char ( 13 ) + Char ( 10 )
           , p.PackageProtectionLevelName
           , Char ( 13 ) + Char ( 10 )
           , '// end::PackageProtectionLevelName[]'
           , Char ( 13 ) + Char ( 10 )

           --
           , Char ( 13 ) + Char ( 10 )
           , '== PackageVersionGUID'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// tag::PackageVersionGUID[]'
           , Char ( 13 ) + Char ( 10 )
           , p.PackageVersionGUID
           , Char ( 13 ) + Char ( 10 )
           , '// end::PackageVersionGUID[]'
           , Char ( 13 ) + Char ( 10 )

           --
           , Char ( 13 ) + Char ( 10 )
           , '== ProjectPath'
           , Char ( 13 ) + Char ( 10 )
           , Char ( 13 ) + Char ( 10 )
           , '// tag::ProjectPath[]'
           , Char ( 13 ) + Char ( 10 )
           , p.ProjectPath
           , Char ( 13 ) + Char ( 10 )
           , '// end::ProjectPath[]'
           , Char ( 13 ) + Char ( 10 )
         )
From
    ssis.Package                        As p
    Left Join
        docs.ssis_GeneralList           As gl
            On
            gl.AntoraModule      = p.AntoraModule
            And gl.PackageName   = p.PackageName

    Left Join
        docs.ssis_ConnectionList        As cl
            On
            cl.AntoraModule      = p.AntoraModule
            And cl.PackageName   = p.PackageName

    Left Join
        docs.ssis_ProjectConnectionList As pcl
            On
            pcl.AntoraModule     = p.AntoraModule

    Left Join
        docs.ssis_ParameterList         As pl
            On
            pl.AntoraModule      = p.AntoraModule
            And pl.PackageName   = p.PackageName

    Left Join
        docs.ssis_VariableList          As vl
            On
            vl.AntoraModule      = p.AntoraModule
            And vl.PackageName   = p.PackageName

    Left Join
        docs.ssis_TaskList              As tl
            On
            tl.AntoraModule      = p.AntoraModule
            And tl.PackageName   = p.PackageName

    Left Join
        docs.ssis_PumlPackage           As puml
            On
            puml.AntoraModule    = p.AntoraModule
            And puml.PackageName = p.PackageName
GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '49ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_Adoc', @level2type = N'COLUMN', @level2name = N'AdocContent';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '48ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_Adoc', @level2type = N'COLUMN', @level2name = N'PackageBasename';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObjectColumn_guid', @value = '47ddc905-c33c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_Adoc', @level2type = N'COLUMN', @level2name = N'AntoraModule';


GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '849a07f7-c23c-ec11-852d-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'VIEW', @level1name = N'ssis_Adoc';

