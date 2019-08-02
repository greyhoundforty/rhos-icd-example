require 'elasticsearch'

client = Elasticsearch::Client.new url: 'https://admin:PASSWORDb@RANDOM_STRING.databases.appdomain.cloud:31772', 
                                   log: true,
                                   transport_options: { ssl: { ca_file: 'cacert.pem' } }

client.transport.reload_connections!

client.cluster.health

client.search q: 'test'