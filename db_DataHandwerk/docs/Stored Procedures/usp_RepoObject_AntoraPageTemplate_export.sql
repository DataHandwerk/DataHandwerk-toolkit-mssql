
/*
--exportes the template file used in each Antora page file per RepoObject (filtered by type)
--the file contains includes and uses the instrinsic paramater {docname} to get content from different files

--before executing the procedure:
--Temporarily enable xp_cmdshell
sp_configure 'show advanced options'
 , 1;

RECONFIGURE
GO

sp_configure 'xp_cmdshell'
 , 1;

RECONFIGURE
GO

EXEC [docs].[usp_RepoObject_AntoraPageTemplate_export]
@outputDir = 'D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\template\'

--you can also disable later again:
--Disable xp_cmdshell
sp_configure 'xp_cmdshell'
 , 0

RECONFIGURE
GO

sp_configure 'show advanced options'
 , 0

RECONFIGURE
GO

*/
CREATE PROCEDURE [docs].[usp_RepoObject_AntoraPageTemplate_export]
 --output directory for the files to be created
 @outputDir NVARCHAR(1000) = NULL -- example: 'D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\tempalte\'
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
   ) + 'partials\template\')

--Declare variables 
DECLARE @command NVARCHAR(4000);
DECLARE @sub_parameter NVARCHAR(128);
DECLARE @BaseFileName NVARCHAR(128) = 'master-page-'
DECLARE @Object_fullname NVARCHAR(261);
DECLARE @Object_fullname2 NVARCHAR(257);
DECLARE @instanceName NVARCHAR(500) = @@servername --example: 'ACER-F17\SQL2019', '.\SQL2019', localhost\SQL2019
DECLARE @databaseName NVARCHAR(128) = DB_NAME()
DECLARE @TrustedUserPassword NVARCHAR(1000)

IF @isTrustedConnection = 1
 SET @TrustedUserPassword = ' -T'
ELSE
 SET @TrustedUserPassword = ' -U ' + @userName + ' -P ' + @password

DECLARE template_cursor CURSOR
FOR
SELECT [sub_Parameter]
--,[Parameter_value__result_nvarchar]
FROM [repo].[Parameter]
WHERE [Parameter_name] = 'Adoc_AntoraPageTemplate'
 AND [sub_Parameter] <> ''
ORDER BY [sub_Parameter]

OPEN template_cursor

FETCH NEXT
FROM template_cursor
INTO @sub_parameter

WHILE @@FETCH_STATUS = 0
BEGIN
 --Dynamically construct the BCP command
 --
 --bcp "SELECT [repo].[fs_get_parameter_value]('Adoc_AntoraPageTemplate', N'1')" queryout D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\template\master-page-1.adoc -S localhost\sql2019 -d dhw_self -c -T
 --
 SET @command = 'bcp "SELECT [repo].[fs_get_parameter_value](''Adoc_AntoraPageTemplate'', N''' + @sub_parameter + ''')" queryout ' + @outputDir + @BaseFileName + @sub_parameter + '.adoc'
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

 FETCH NEXT
 FROM template_cursor
 INTO @sub_parameter
END

CLOSE template_cursor

DEALLOCATE template_cursor
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'c0d49d8d-4595-eb11-84f4-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObject_AntoraPageTemplate_export';

