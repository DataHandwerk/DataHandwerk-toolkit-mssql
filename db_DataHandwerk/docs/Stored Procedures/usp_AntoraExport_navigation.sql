
CREATE PROCEDURE [docs].[usp_AntoraExport_navigation]
 --output directory for the files to be created
 @outputDirPartNav NVARCHAR(1000) = NULL -- example: 'D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\navlist\'
 , @outputDirPageNav NVARCHAR(1000) = NULL -- example: 'D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\pages\nav\'
 --SQL instance from which the data will be exported
 --specify whether you are connecting to the SQL instance with a trusted connection (Windows Authentication) or not
 , @isTrustedConnection BIT = 1
 --If isTrustedConnection is set to 0 then you will need to add username and password for connecting to the SQL Server instance
 , @userName NVARCHAR(250) = 'loginName'
 , @password NVARCHAR(250) = 'password'
 --
AS
SET @outputDirPartNav = ISNULL(@outputDirPartNav, (
   SELECT [repo].[fs_get_parameter_value]('Adoc_AntoraDocModulFolder', '')
   ) + 'partials\navlist\')
SET @outputDirPageNav = ISNULL(@outputDirPartNav, (
   SELECT [repo].[fs_get_parameter_value]('Adoc_AntoraDocModulFolder', '')
   ) + 'pages\nav\')

--Declare variables 
DECLARE @instanceName NVARCHAR(500) = @@servername --example: 'ACER-F17\SQL2019', '.\SQL2019', localhost\SQL2019
DECLARE @databaseName NVARCHAR(128) = DB_NAME()
DECLARE @TrustedUserPassword NVARCHAR(1000)

IF @isTrustedConnection = 1
 SET @TrustedUserPassword = ' -T'
ELSE
 SET @TrustedUserPassword = ' -U ' + @userName + ' -P ' + @password

DECLARE @schema_name NVARCHAR(128)
DECLARE @type VARCHAR(2)
--declare @nav_list nvarchar(max)
DECLARE @command NVARCHAR(4000)

-- FROM [docs].[AntoraNavListRepoObject_by_schema]
DECLARE page_cursor CURSOR
FOR
SELECT [RepoObject_schema_name]
FROM [docs].[AntoraNavListRepoObject_by_schema]
ORDER BY [RepoObject_schema_name]

OPEN page_cursor

FETCH NEXT
FROM page_cursor
INTO @schema_name

--, @nav_list
WHILE @@FETCH_STATUS = 0
BEGIN
 --Dynamically construct the BCP command
 --
 --bcp "SELECT [nav_list] FROM [docs].[AntoraNavListRepoObject_by_schema] WHERE [RepoObject_schema_name] = 'dbo'" queryout D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\navlist-schema-dbo.adoc -S localhost\sql2019 -d dhw_self -c -T
 --
 SET @command = 'bcp "SELECT [nav_list] FROM [docs].[AntoraNavListRepoObject_by_schema] WHERE [RepoObject_schema_name] = ''' + @schema_name + '''"  queryout ' + @outputDirPartNav + 'navlist-schema-' + @schema_name + '.adoc'
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
 FROM page_cursor
 INTO @schema_name
END

CLOSE page_cursor

DEALLOCATE page_cursor

-- FROM [docs].[AntoraNavListRepoObject_by_type]
DECLARE part2_cursor CURSOR
FOR
SELECT TRIM([type])
--, [nav_list]
FROM [docs].[AntoraNavListRepoObject_by_type]
ORDER BY [type]

OPEN part2_cursor

FETCH NEXT
FROM part2_cursor
INTO @type

WHILE @@FETCH_STATUS = 0
BEGIN
 --Dynamically construct the BCP command
 --
 --bcp "SELECT [nav_list] FROM [docs].[AntoraNavListRepoObject_by_type] WHERE [type] = 'u'" queryout D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\navlist-type-u.adoc -S localhost\sql2019 -d dhw_self -c -T
 --
 SET @command = 'bcp "SELECT [nav_list] FROM [docs].[AntoraNavListRepoObject_by_type] WHERE [type] = ''' + @type + '''"  queryout ' + @outputDirPartNav + 'navlist-type-' + @type + '.adoc'
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
 FROM part2_cursor
 INTO @type
END

CLOSE part2_cursor

DEALLOCATE part2_cursor

-- FROM [docs].[AntoraNavListRepoObject_by_schema_type]
DECLARE part3_cursor CURSOR
FOR
SELECT [RepoObject_schema_name]
 , TRIM([type])
--, [nav_list]
FROM [docs].[AntoraNavListRepoObject_by_schema_type]
ORDER BY [type]

OPEN part3_cursor

FETCH NEXT
FROM part3_cursor
INTO @schema_name
 , @type

WHILE @@FETCH_STATUS = 0
BEGIN
 --Dynamically construct the BCP command
 --
 --bcp "SELECT [nav_list] FROM [docs].[AntoraNavListRepoObject_by_schema_type] WHERE [RepoObject_schema_name] = 'dbo' and [type] = 'u'" queryout D:\Repos\GitHub\DataHandwerk\DataHandwerk-docs\docs\modules\sqldb\partials\navlist-type-u.adoc -S localhost\sql2019 -d dhw_self -c -T
 --
 SET @command = 'bcp "SELECT [nav_list] FROM [docs].[AntoraNavListRepoObject_by_schema_type] WHERE [RepoObject_schema_name] = ''' + @schema_name + ''' AND [type] = ''' + @type + '''"  queryout ' + @outputDirPartNav + 'navlist-schema-type-' + @type + '.adoc'
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
 FROM part3_cursor
 INTO @schema_name
  , @type
END

CLOSE part3_cursor

DEALLOCATE part3_cursor

DECLARE page_cursor CURSOR
FOR
SELECT type
FROM config.type
WHERE (is_DocsOutput = 1)
ORDER BY type

SELECT [RepoObject_schema_name]
FROM [docs].[AntoraNavListRepoObject_by_schema]
ORDER BY [RepoObject_schema_name]

OPEN page_cursor

FETCH NEXT
FROM page_cursor
INTO @type

--, @nav_list
WHILE @@FETCH_STATUS = 0
BEGIN
 --Dynamically construct the BCP command
 --
 SET @command = 'bcp "SELECT [nav_list] FROM [docs].[AntoraNavListPage_by_type] WHERE [type] = ''' + @type + '''"  queryout ' + @outputDirPageNav + 'nav-type-' + @type + '.adoc'
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
 FROM page_cursor
 INTO @type
END

CLOSE page_cursor

DEALLOCATE page_cursor

--nav-by-type.adoc
SET @command = 'bcp "SELECT [partial_content] FROM [docs].[AntoraNav_by_type]"  queryout ' + @outputDirPartNav + 'nav-by-type.adoc'
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
EXECUTE sp_addextendedproperty @name = N'RepoObject_guid', @value = '9e8b79d5-b993-eb11-84f2-a81e8446d5b0', @level0type = N'SCHEMA', @level0name = N'docs', @level1type = N'PROCEDURE', @level1name = N'usp_AntoraExport_navigation';

