CREATE PROCEDURE [docs].[usp_AntoraExport]
AS
--exec [repo].[usp_main]
EXEC [repo].[usp_RepoObjectProperty_insert_update]

EXEC [docs].[usp_AntoraExport_navigation]

EXEC [docs].[usp_AntoraExport_ObjectPage]

EXEC [docs].[usp_AntoraExport_ObjectPageTemplate]

EXEC [docs].[usp_AntoraExport_ObjectPartialProperties]

EXEC [docs].[usp_AntoraExport_ObjectPuml]

EXEC [docs].[usp_AntoraExport_Page_IndexSemanticGroup]
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'c51b7592-0397-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport';

