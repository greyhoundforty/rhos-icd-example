require 'elasticsearch'

#client = Elasticsearch::Client.new log: true

# if you specify Elasticsearch host
client = Elasticsearch::Client.new url: 'https://admin:PASSWORDb@cf3c49fc-e1c1-41cd-96c9-c844c92aef46.66c11f9786bc40cfa3a0086f6582f2e7.databases.appdomain.cloud:31772', 
                                   log: true,
                                   transport_options: { ssl: { ca_file: 'cacert.pem' } }

client.transport.reload_connections!

client.cluster.health

client.search q: 'test'