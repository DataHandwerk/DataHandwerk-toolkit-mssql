import configargparse

p = configargparse.ArgParser(default_config_files=['SqlParser.ini'])
p.add('--server', required=True, help='sql server instance. Examples: localhost localhost\sql2019')  # this option can be set in a config file because it starts with '--'
p.add('--database', required=True, help='database name. Examples: dhw_master')  # this option can be set in a config file because it starts with '--'
p.add('-c', '--my-config', is_config_file=True, help='config file path')
# p.add('-c', '--my-config', required=True, is_config_file=True, help='config file path')
p.add('-v', help='verbose', action='store_true')

# p.add('-d', '--dbsnp', help='known variants .vcf', env_var='DBSNP_PATH')  # this option can be set in a config file because it starts with '--'
# p.add('--genome', required=True, help='path to genome file')  # this option can be set in a config file because it starts with '--'
# p.add('vcf', nargs='+', help='variant file(s)')


options = p.parse_args()
print(options)
print("----------")
print(p.format_help())
print("----------")
print(p.format_values())    # useful for logging where different settings came from

# config = configparser.ConfigParser()
# config.read('SqlParser.ini')
# config.sections()
# print(config['mssql']['server'])
# print(config['mssql']['database'])

server = options.server
database = options.database
print(server)
print(database)
