how to create the dacpac of the dhw_repository containing data

https://docs.microsoft.com/de-de/sql/tools/sqlpackage/sqlpackage?view=sql-server-ver15

```
"C:\Program Files (x86)\Microsoft Visual Studio\2019\Community\Common7\IDE\Extensions\Microsoft\SQLDB\DAC\150\sqlpackage.exe" /TargetFile:"D:\Repos\gitlab\DataHandwerk\DataHandwerk-toolkit-mssql\dhw_dacpac\dhw_self.dacpac" /Action:Extract /SourceServerName:"localhost\sql2019" /SourceDatabaseName:"dhw_self" /p:ExtractAllTableData=TRUE /p:IgnorePermissions=TRUE /p:IgnoreUserLoginMappings=TRUE
```
