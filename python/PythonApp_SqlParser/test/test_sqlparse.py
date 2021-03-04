# https://github.com/andialbrecht/sqlparse
# import jsonpickle
# import pickle
import sqlparse

# # https://docs.python.org/3/library/json.html
# import json

# required for iterable_as_array=True
import simplejson as json


def serialise(token):
    if not token.is_whitespace:
        return {
            "ttype": token.ttype,
            "str": str(token),
            "normalized": token.normalized,
            "is_group": token.is_group,
            "is_keyword": token.is_keyword,
            "is_whitespace": token.is_whitespace,
            # "<class 'sqlparse.sql.Identifier'>"
            # How to get only 'sqlparse.sql.Identifier'?
            # substring or are there other ways?
            "class": str(token.__class__)[7:-2],
            # https://www.geeksforgeeks.org/python-map-function/
            # map() function returns a map object(which is an iterator) of the results after applying the given function to each item of a given iterable (list, tuple etc.)
            "children": list(map(serialise, token)) if token.is_group else [],
        }

# def serialise(tokens):
#     for token in tokens:
#         children = serialise(token.tokens) if token.is_group else None
#         if not token.is_whitespace:
#             yield {
#                 "ttype": token.ttype,
#                 "str": str(token),
#                 "normalized": token.normalized,
#                 "is_group": token.is_group,
#                 "is_keyword": token.is_keyword,
#                 "is_whitespace": token.is_whitespace,
#                 "__class__": str(token.__class__),
#                 "__doc__": token.__doc__,
#                 "children": children,
#             }


# def serialise(tokens):
#     return(
#         {
#             "ttype": token.ttype,
#             "str": str(token),
#             "normalized": token.normalized,
#             "is_group": token.is_group,
#             "is_keyword": token.is_keyword,
#             "is_whitespace": token.is_whitespace,
#             "children": serialise(token.tokens) if token.is_group else None,
#         }
#         for token in tokens
#     )


# https://github.com/jsonpickle/jsonpickle
# https://jsonpickle.github.io/
# https://jsonpickle.readthedocs.io/en/latest/api.html

# Split a string containing two SQL statements:
# raw = 'select * from foo; select * from bar;'
# statements = sqlparse.split(raw)
# print(statements)
# # Get the first statement
# stmt = statements[0]
stmt = """
CREATE VIEW a.c AS
SELECT DISTINCT
[Date] = [T1].[Date],
aaa = /*Comment line 1
Comment line 2*/
bbb,
ccc as ccc1,
ddd as ddd1,
eee = /*Comment line 1
Comment line 2*/
eee,
fff = fff
FROM
a.b T1 (NOLOCK)
LEFT JOIN c.d T2
ON T1.jjj = T2.jjj
"""

stmt_format1 = sqlparse.format(stmt, strip_comments=False, use_space_around_operators=False,
                               comma_first=True, reindent=True, keyword_case='upper')
# remove block comments in the first step, otherwise some unwanted indents are created
stmt_format2 = sqlparse.format(stmt_format1, strip_comments=True,
                               use_space_around_operators=False, comma_first=True, reindent=True, keyword_case='upper')
# reformat the statement with removed comments to get results without unwanted indents
stmt_format3 = sqlparse.format(stmt_format2, strip_comments=True,
                               use_space_around_operators=False, comma_first=True, reindent=True, keyword_case='upper')

print(stmt_format3)

# Parsing a SQL statement:
# the result is fine and nested, there is an IdentifierList which I would like to keep as one group
parsed = sqlparse.parse(stmt_format3)[0]
parsed_tokens = (parsed.tokens)

# serialized = serialise(parsed_tokens)
# print(type(serialized))
# # <class 'generator'>

# print(serialized)

# for i in serialized:
#     print(i)

# # simplejson
# # Changed in version 3.8.0: iterable_as_array is new in 3.8.0.
# jsonStr = json.dumps(serialise(parsed_tokens),
#                      iterable_as_array=True, indent=1)

jsonStr = json.dumps(serialise(parsed_tokens),
                     iterable_as_array=True, indent=1)

print(jsonStr)

# # I found jsonpickle
# # it can convert also complex objects into json
# frozen = jsonpickle.encode(parsed.tokens, keys=True, indent=1)

# print(frozen)

# # # the object is not restored as the original because the json represenation lost information
# # thawed = jsonpickle.decode(frozen)

# # # I dont get nested tokens exported into json, instead I get only the token type, but not the content:

# #  {
# #   "py/object": "sqlparse.sql.IdentifierList"
# #  },

# #  {
# #   "py/object": "sqlparse.sql.Identifier"
# #  },


# # to get all tokens with content, I can flatten the "parsed" and convert to json
# flattened = list(parsed.flatten())

# print(flattened)

# frozen2 = jsonpickle.encode(flattened, keys=True, indent=1)

# print(frozen2)

# # But now they are in a flat list and I lost information about parents and nested structures

# # print(parsed.tokens)
