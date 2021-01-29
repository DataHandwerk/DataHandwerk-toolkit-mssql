# https://docs.python.org/3/library/configparser.html
# configparser — Configuration file parser
# read configuration from ini file
import configparser

# #required for sys.exit(1) und sys.argv
# import sys

# to connect with database
# https://docs.microsoft.com/de-de/sql/connect/python/pyodbc/python-sql-driver-pyodbc?view=sql-server-ver15
# https://github.com/mkleehammer/pyodbc/wiki
import pyodbc

# https://github.com/andialbrecht/sqlparse
import sqlparse

# # https://github.com/mozilla/moz-sql-parser
# from moz_sql_parser import parse
# https://docs.python.org/3/library/json.html
import json

# # https://github.com/jsonpickle/jsonpickle
# # https://jsonpickle.github.io/
# # https://jsonpickle.readthedocs.io/en/latest/api.html
# import jsonpickle

# # https://docs.python.org/3/library/datetime.html
# # datetime — Basic date and time types
# import datetime


def serialise(token):
    if not token.is_whitespace:
        return {
            "class": token.__class__.__name__,
            "ttype": token.ttype,
            "is_group": token.is_group,
            "str": str(token),
            "normalized": token.normalized,
            "is_keyword": token.is_keyword,
            "is_whitespace": token.is_whitespace,
            # "children": list(map(serialise, token)) if token.is_group else [],
            "children": (
                [serialise(child)
                 for child in token if not child.is_whitespace]
                if token.is_group
                else []
            ),
        }


def main():
    config = configparser.ConfigParser()
    config.read('SqlParser.ini')
    # config.sections()
    # print(config['mssql']['server'])
    # print(config['mssql']['database'])
    server = config['mssql']['server']
    database = config['mssql']['database']
    print(server)
    print(database)

    cnxn = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=' +
                          server+';DATABASE='+database+';Trusted_Connection=yes;')
    cursor = cnxn.cursor()

    cnxn2 = pyodbc.connect('DRIVER={ODBC Driver 17 for SQL Server};SERVER=' +
                           server+';DATABASE='+database+';Trusted_Connection=yes;')
    cursor2 = cnxn2.cursor()

    # # Select Query
    # print('Reading data from table')
    # # # issues with datatype sql_variant
    # # tsql = "SELECT * FROM [repo].[Parameter];"
    # tsql = """
    # SELECT
    #        [Parameter_name]
    #      , [sub_Parameter]
    #      , [Parameter_desciption]
    #        --,[Parameter_default_value]
    #        --,[Parameter_value]
    #      , [Parameter_value__result_nvarchar]
    # FROM
    #      [repo].[Parameter]
    # """
    # a = datetime.datetime.now()
    # with cursor.execute(tsql):
    #     row = cursor.fetchone()
    #     while row:
    #         print(str(row[0]) + " " + str(row[1]))
    #         row = cursor.fetchone()
    #     b = datetime.datetime.now()
    #     c = b - a
    #     print('QueryAndPrintTime:', c.microseconds, 'microseconds')
    #     print('QueryAndPrintTime:', c.seconds, 'seconds')

    # Select Query
    # # issues with datatype sql_variant
    # tsql = "SELECT * FROM [repo].[Parameter];"

    print('Reading sql_modules_definition')
    tsql = """\
    SELECT
        [RepoObject_guid]
        , [sql_modules_definition]
    FROM
        [repo].[RepoObject_SqlModules_Repo_Sys]
    WHERE
        is_outdated = 1
        AND sysobject_type = 'V'
    """
    with cursor.execute(tsql):
        row = cursor.fetchone()
        while row:
            # # print(str(row[0]) + " " + str(row[1]))
            # print(str(row[0]))
            RepoObject_guid = row[0]
            statements = sqlparse.split(row[1])
            # Format the first statement and print it out:
            sql_modules_definition = statements[0]
            # indent_width=0 - not valid, only > 0
            sql_modules_formatted = sqlparse.format(
                sql_modules_definition, strip_comments=False, use_space_around_operators=True, comma_first=True, reindent=True, keyword_case='upper')
            # First remove comments because block commands could generate additional indents
            sql_modules_formatted1 = sqlparse.format(
                sql_modules_formatted, strip_comments=True, use_space_around_operators=False, comma_first=True, reindent=True, keyword_case='upper')
            # Reformat after removing comments, now we get better lists, use_space_around_operators=False to get shorter flattened list
            sql_modules_formatted2 = sqlparse.format(
                sql_modules_formatted1, strip_comments=True, use_space_around_operators=False, comma_first=True, reindent=True, keyword_case='upper')
            # print(sql_modules_formatted)

            # # Test to parse with moz_sql_parser => fail
            # # error on string like CREATE VIEW, can only handle some simple SQL
            # sql_modules_json = json.dumps(parse(sql_modules_definition))
            # # print (sql_modules_json)

            # # parse with sqlparse
            # # first we try to parse the original statement with comments
            # # if the results are not as required, we can parse sql_modules_formatted2 instead, where comments are removed
            # sql_modules_for_parse = sqlparse.format(
            #     sql_modules_definition, strip_comments=False, use_space_around_operators=True, comma_first=True, reindent=True, keyword_case='upper')

            # => it is hard to parse json from statements containing comments
            # for the beginning we will parse statement with removed comments
            # sql_modules_json = json.dumps(serialise(sqlparse.parse(sql_modules_formatted2)[0]), indent=2)
            sql_modules_json = json.dumps(
                serialise(sqlparse.parse(sql_modules_formatted2)[0]))

            # # test to flatten the statement and to convert into json as flat list
            # # Parsing a SQL statement:
            # parsed = sqlparse.parse(sql_modules_formatted2)[0]
            # # flatten the list because I don't get the nested object exported to JSON
            # flattened = list(parsed.flatten())
            # # We try to convert the parsing result into JSON using jsonpickle
            # # because the following doesn't work because the object is too complicated
            # # jsonStr = json.dumps(flattened)
            # sql_modules_json = jsonpickle.encode(flattened, keys=True, indent=1)

            tsqldelete = "DELETE [repo].[RepoObject_SqlModules] WHERE RepoObject_guid = ?"
            with cursor2.execute(tsqldelete, RepoObject_guid):
                print('Successfully deleted: ' + RepoObject_guid)
            tsqlinsert = """\
            INSERT INTO [repo].[RepoObject_SqlModules]
            ([RepoObject_guid]
            ,[sql_modules_formatted]
            ,[sql_modules_formatted2]
            ,[sql_modules_json])
            VALUES
            (?, ?, ?, ?)
            """
            with cursor2.execute(tsqlinsert, RepoObject_guid, sql_modules_formatted, sql_modules_formatted2, sql_modules_json):
                print('Successfully Inserted: ' + RepoObject_guid)
            # tsqlupdate = "UPDATE [repo].[RepoObject] SET sql_modules_formatted = ?, sql_modules_formatted2 = ?, sql_modules_json = ?, sql_modules_dt = getdate() WHERE RepoObject_guid = ?"
            # with cursor2.execute(tsqlupdate, sql_modules_formatted, sql_modules_formatted2, sql_modules_json, RepoObject_guid):
            #     print('Successfully Updated: ' + RepoObject_guid)

            # # Parsing a SQL statement:
            # parsed = sqlparse.parse(first)[0]
            # print(parsed.tokens)
            row = cursor.fetchone()


if __name__ == "__main__":
    main()
