
/*
--creates one file per RepoObject (filtered by type)
--uses the same content for all files from 
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

EXEC [docs].[usp_RepoObject_AntoraPages_export]
@outputDir = 'D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\pages\'

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
CREATE PROCEDURE [docs].[usp_RepoObject_AntoraPages_export]
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
   ) + 'pages\')

--Declare variables 
DECLARE @command NVARCHAR(4000);
DECLARE @Object_fullname NVARCHAR(261);
DECLARE @Object_fullname2 NVARCHAR(257);
DECLARE @instanceName NVARCHAR(500) = @@servername --example: 'ACER-F17\SQL2019', '.\SQL2019', localhost\SQL2019
DECLARE @databaseName NVARCHAR(128) = DB_NAME()
DECLARE @TrustedUserPassword NVARCHAR(1000)

IF @isTrustedConnection = 1
 SET @TrustedUserPassword = ' -T'
ELSE
 SET @TrustedUserPassword = ' -U ' + @userName + ' -P ' + @password

DECLARE db_cursor CURSOR
FOR
SELECT RepoObject_fullname
 , RepoObject_fullname2
FROM docs.RepoObject_AntoraSource
ORDER BY RepoObject_fullname

OPEN db_cursor

FETCH NEXT
FROM db_cursor
INTO @Object_fullname
 , @Object_fullname2

WHILE @@FETCH_STATUS = 0
BEGIN
 --Dynamically construct the BCP command
 --
 --bcp "SELECT [repo].[fs_get_parameter_value]('Adoc_AntoraPageTemplate', N'')" queryout D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\pages\[config].[type].adoc -S localhost\sql2019 -d dhw_self -c -T
 --
 SET @command = 'bcp "SELECT [repo].[fs_get_parameter_value](''Adoc_AntoraPageTemplate'', N'''')" queryout ' + @outputDir + @Object_fullname2 + '.adoc'
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
 FROM db_cursor
 INTO @Object_fullname
  , @Object_fullname2
END

CLOSE db_cursor

DEALLOCATE db_cursor
GO
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = 'eb5bf6c2-0593-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_RepoObject_AntoraPages_export';

