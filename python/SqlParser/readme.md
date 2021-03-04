The Python Script SqlParser.py can be executed with parameters or with an ini-file (default is SqlParser.ini in the same directory)

2 parameters are required

- server
- database

In case Python is not installed the generated windows executable can be used

```
D:\Repos\GitHub\DataHandwerk\DataHandwerk-toolkit-mssql\python\SqlParser\dist\SqlParser>SqlParser.exe
usage: SqlParser.exe [-h] --server SERVER --database DATABASE [-c MY_CONFIG] [-v]
SqlParser.exe: error: the following arguments are required: --server, --database
```

example:

`SqlParser --server localhost\sql2019 --database dhw_master`

This query is used to read the [sql_modules_definition], but only in case it was changed since last parsing

```sql
SELECT
    [RepoObject_guid]
    , [sql_modules_definition]
FROM
    [repo].[RepoObject_SqlModules_Repo_Sys]
WHERE
    is_outdated = 1
    AND sysobject_type = 'V'
```

This sqlparser is used to parse the create view statements:

https://github.com/andialbrecht/sqlparse

the results are written into [repo].[RepoObject_SqlModules]

```sql
INSERT INTO [repo].[RepoObject_SqlModules]
([RepoObject_guid]
,[sql_modules_formatted]
,[sql_modules_formatted2]
,[sql_modules_json])
VALUES
(?, ?, ?, ?)
```

---

How to freeze the script (create exe executable):

https://pyinstaller.readthedocs.io/en/stable/usage.html

`pyinstaller SqlParser.py`

this will create one-folder-executable in
>.\dist\SqlParser

It is also possible to create a onefile-executable, but the "Bundling to One Folder" has some advantages (read the usage documentation)

`pyinstaller --onefile --windowed SqlParser.py`
