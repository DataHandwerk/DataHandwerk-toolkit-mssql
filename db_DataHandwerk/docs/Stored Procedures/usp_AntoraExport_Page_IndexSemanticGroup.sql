/*
target folder should exist
*/
CREATE PROCEDURE [docs].[usp_AntoraExport_Page_IndexSemanticGroup]
 --output directory for the files to be created
 @outputDir NVARCHAR(1000) = NULL -- example: 'D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\pages\'
 --SQL instance from which the data will be exported
 --specify whether you are connecting to the SQL instance with a trusted connection (Windows Authentication) or not
 , @isTrustedConnection BIT = 1
 --If isTrustedConnection is set to 0 then you will need to add username and password for connecting to the SQL Server instance
 , @userName NVARCHAR(250) = 'loginName'
 , @password NVARCHAR(250) = 'password'
 --
AS
SET @outputDir = ISNULL(@outputDir, (
   SELECT [repo].[fs_get_parameter_value]('Adoc_AntoraDocModulFolder', '')
   ) + 'pages\index\')

--Declare variables 
DECLARE @instanceName NVARCHAR(500) = @@servername --example: 'ACER-F17\SQL2019', '.\SQL2019', localhost\SQL2019
DECLARE @databaseName NVARCHAR(128) = DB_NAME()
DECLARE @TrustedUserPassword NVARCHAR(1000)

IF @isTrustedConnection = 1
 SET @TrustedUserPassword = ' -T'
ELSE
 SET @TrustedUserPassword = ' -U ' + @userName + ' -P ' + @password

DECLARE @command NVARCHAR(4000)

--nav-by-type.adoc
SET @command = 'bcp "SELECT [page_content] FROM [docs].[AntoraPage_IndexSemanticGroup]"  queryout ' + @outputDir + 'IndexSemanticGroup.adoc'
 --
 + ' -S ' + @instanceName
 --
 + ' -d ' + ' dhw_self'
 --
 + ' -c'
 --
 + @TrustedUserPassword

PRINT @command

--Execute the BCP command
EXEC xp_cmdshell @command
 , no_output
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '8b1293b9-de96-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_Page_IndexSemanticGroup';

