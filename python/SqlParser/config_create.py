#execute
#py config_create.py

import configparser
config = configparser.ConfigParser()

config['mssql'] = {}
config['mssql']['server'] = 'localhost\sql2019'
config['mssql']['database'] = 'dhw_PerformanceAnalytics'

# mssql = config['mssql']
# mssql['server'] = 'localhost\sql2019'

# config['DEFAULT'] = {'ServerAliveInterval': '45',
#                      'Compression': 'yes',
#                      'CompressionLevel': '9'}
# config['bitbucket.org'] = {}
# config['bitbucket.org']['User'] = 'hg'
# config['topsecret.server.com'] = {}
# topsecret = config['topsecret.server.com']
# topsecret['Port'] = '50022'     # mutates the parser
# topsecret['ForwardX11'] = 'no'  # same here
# config['DEFAULT']['ForwardX11'] = 'yes'

with open('SqlParser.ini', 'w') as configfile:
  config.write(configfile)