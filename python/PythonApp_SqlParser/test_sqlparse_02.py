#!/usr/bin/env python3
import json

import sqlparse

STATEMENT = """\
CREATE VIEW a.c AS
SELECT distinct
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
            "class": token.__class__.__name__,
            # "children": list(map(serialise, token)) if token.is_group else [],
            "children": (
                [serialise(child)
                 for child in token if not child.is_whitespace]
                if token.is_group
                else []
            ),
        }


def main():
    statement = sqlparse.format(
        STATEMENT, strip_comments=True, strip_whitespace=True
    )
    print(statement)
    print(json.dumps(serialise(sqlparse.parse(statement)[0]), indent=2))


if __name__ == "__main__":
    main()
