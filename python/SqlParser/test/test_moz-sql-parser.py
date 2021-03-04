from moz_sql_parser import parse
import json
s = "select a = b, c as d from jobs"
# print(json.dumps(parse("select a = b, c as d from jobs")))

# j = json.dumps(parse("select a = b, c as d from jobs"))
j = json.dumps(parse(s))
print (j)